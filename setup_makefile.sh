#!/bin/sh
# Legacy Makefile setup: installs Clang/LLVM and Koka for native builds

# Detect if script is being sourced or executed
(return 0 2>/dev/null) && SOURCED=1 || SOURCED=0

if [ "$SOURCED" -eq 0 ]; then
    set -e
fi

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

print_info() { echo -e "${BLUE}ℹ ${NC}$1"; }
print_success() { echo -e "${GREEN}✓${NC} $1"; }
print_warning() { echo -e "${YELLOW}⚠${NC} $1"; }
print_error() { echo -e "${RED}✗${NC} $1"; }

read_char() {
    if [ -n "$ZSH_VERSION" ]; then
        read -k 1 REPLY
    else
        read -n 1 -r REPLY
    fi
}

safe_exit() {
    if [ "$SOURCED" -eq 1 ]; then return "${1:-0}"; else exit "${1:-0}"; fi
}

# Handle --detect flag (for Makefile integration)
if [ "$1" = "--detect" ]; then
    if command -v clang++ &>/dev/null && command -v llvm-link &>/dev/null; then
        clang_major=$(clang++ --version | grep -oP 'clang version \K\d+' | head -1)
        if [ "$clang_major" -ge 18 ] 2>/dev/null; then
            echo "native"
            safe_exit 0
        fi
    fi
    if command -v podman &>/dev/null; then echo "podman"
    elif command -v docker &>/dev/null; then echo "docker"
    else echo "auto"
    fi
    safe_exit 0
fi

check_tool() {
    local tool=$1
    if command -v "$tool" &>/dev/null; then
        case "$tool" in
            clang++|clang) clang++ --version | head -n1 | grep -oP '\d+\.\d+\.\d+' | head -n1 || echo "unknown" ;;
            llvm-link|lli) $tool --version 2>/dev/null | sed -n '2p' | grep -oP '\d+\.\d+\.\d+' | head -n1 || echo "unknown" ;;
            koka) koka --version 2>/dev/null | grep -oP 'v\d+\.\d+\.\d+' | head -n1 || echo "unknown" ;;
            podman|docker) $tool --version | head -n1 | grep -oP '\d+\.\d+\.\d+' | head -n1 || echo "unknown" ;;
            *) echo "unknown" ;;
        esac
    else
        echo "not found"
    fi
}

install_koka() {
    print_info "Installing Koka..."
    mkdir -p ~/.local/bin ~/.local/lib
    
    local arch=$(uname -m)
    case "$arch" in
        x86_64|amd64) arch="x64" ;;
        arm64|aarch64) arch="arm64" ;;
        *) print_error "Unsupported architecture: $arch"; return 1 ;;
    esac
    
    local os="linux"
    case "$(uname -s)" in Darwin) os="macos" ;; esac
    
    local version="v3.2.2"
    curl -fsSL "https://github.com/koka-lang/koka/releases/download/$version/koka-$version-$os-$arch.tar.gz" | tar -xz -C ~/.local
    chmod +x ~/.local/bin/koka
    print_success "Koka installed to ~/.local/bin/koka"
    
    case ":$PATH:" in
        *:$HOME/.local/bin:*) ;;
        *) print_warning "Add ~/.local/bin to your PATH" ;;
    esac
}

echo "===================="
echo "Makefile Environment"
echo "===================="
echo ""

print_info "Checking tools..."
echo ""
printf "  %-12s %s\n" "clang++" "$(check_tool clang++)"
printf "  %-12s %s\n" "llvm-link" "$(check_tool llvm-link)"
printf "  %-12s %s\n" "koka" "$(check_tool koka)"
printf "  %-12s %s\n" "podman" "$(check_tool podman)"
echo ""

if ! command -v koka &>/dev/null; then
    echo -n "Install Koka? [y/N] "
    read_char
    echo ""
    case "$REPLY" in
        [yY]) install_koka ;;
        *) print_info "Skipping Koka installation" ;;
    esac
fi

print_success "Done"
