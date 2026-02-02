#!/bin/sh
# Bazel setup: installs Bazelisk

set -e

# Colors
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
RED='\033[0;31m'
NC='\033[0m'

print_info() { echo -e "${BLUE}ℹ ${NC}$1"; }
print_success() { echo -e "${GREEN}✓${NC} $1"; }
print_warning() { echo -e "${YELLOW}⚠${NC} $1"; }
print_error() { echo -e "${RED}✗${NC} $1"; }

install_bazelisk() {
    print_info "Installing Bazelisk..."
    mkdir -p ~/.local/bin
    
    case "$(uname -s)-$(uname -m)" in
        Linux-x86_64)  BIN="bazelisk-linux-amd64" ;;
        Linux-aarch64) BIN="bazelisk-linux-arm64" ;;
        Darwin-x86_64) BIN="bazelisk-darwin-amd64" ;;
        Darwin-arm64)  BIN="bazelisk-darwin-arm64" ;;
        *)
            print_error "Unsupported platform: $(uname -s)-$(uname -m)"
            return 1
            ;;
    esac
    
    curl -fsSL "https://github.com/bazelbuild/bazelisk/releases/latest/download/$BIN" -o ~/.local/bin/bazel
    chmod +x ~/.local/bin/bazel
    print_success "Bazelisk installed to ~/.local/bin/bazel"
    
    case ":$PATH:" in
        *:$HOME/.local/bin:*) ;;
        *) print_warning "Add ~/.local/bin to your PATH" ;;
    esac
}

echo "============"
echo "Bazel Setup"
echo "============"
echo ""

if command -v bazel &>/dev/null; then
    print_success "Bazelisk already installed"
else
    install_bazelisk
fi

print_success "Done"
