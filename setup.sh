#!/bin/sh

# Detect if script is being sourced or executed
(return 0 2>/dev/null) && SOURCED=1 || SOURCED=0

# Only set -e if not sourced (so it doesn't exit the user's shell on error)
if [ "$SOURCED" -eq 0 ]; then
    set -e
fi

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Print colored output
print_info() { echo -e "${BLUE}ℹ ${NC}$1"; }
print_success() { echo -e "${GREEN}✓${NC} $1"; }
print_warning() { echo -e "${YELLOW}⚠${NC} $1"; }
print_error() { echo -e "${RED}✗${NC} $1"; }

# Portable read single char (works in bash and zsh)
read_char() {
    if [ -n "$ZSH_VERSION" ]; then
        read -k 1 REPLY
    else
        read -n 1 -r REPLY
    fi
}

# Safe exit/return function - uses return when sourced, exit when executed
safe_exit() {
    local exit_code=${1:-0}
    if [ "$SOURCED" -eq 1 ]; then
        return "$exit_code"
    else
        exit "$exit_code"
    fi
}

# Handle --detect flag (for Makefile integration)
if [ "$1" = "--detect" ]; then
    # Quick detection mode - just output recommended BUILD_MODE
    # Check for clang with C++26 support (clang 18+)
    has_native_tools=false
    if command -v clang++ &> /dev/null && command -v llvm-link &> /dev/null; then
        clang_major=$(clang++ --version | grep -oP 'clang version \K\d+' | head -1)
        if [ "$clang_major" -ge 18 ] 2>/dev/null; then
            has_native_tools=true
        fi
    fi

    # Determine and output recommended mode
    if [ "$has_native_tools" = true ]; then
        echo "native"
    elif command -v podman &> /dev/null; then
        echo "podman"
    elif command -v docker &> /dev/null; then
        echo "docker"
    else
        echo "auto"
    fi
    safe_exit 0
fi

echo "================="
echo "Environment Setup"
echo "================="
echo ""

# Detect package manager
PACKAGE_MANAGER=""
INSTALL_CMD=""

if command -v apt &> /dev/null; then
    PACKAGE_MANAGER="apt"
    INSTALL_CMD="apt install -y"
    print_info "Detected package manager: apt (Debian/Ubuntu)"
elif command -v dnf &> /dev/null; then
    PACKAGE_MANAGER="dnf"
    INSTALL_CMD="dnf install -y"
    print_info "Detected package manager: dnf (Fedora/RHEL)"
elif command -v brew &> /dev/null; then
    PACKAGE_MANAGER="brew"
    INSTALL_CMD="brew install"
    print_info "Detected package manager: brew (macOS)"
else
    print_warning "No supported package manager detected (apt/dnf/brew)"
    PACKAGE_MANAGER="none"
fi

echo ""

# Check what's already installed
check_tool() {
    local tool=$1
    local min_version=$2

    if command -v "$tool" &> /dev/null; then
        local version
        case "$tool" in
            g++|gcc)
                version=$(g++ --version | head -n1 | grep -oP '\d+\.\d+\.\d+' | head -n1 || echo "unknown")
                ;;
            clang++|clang)
                version=$(clang++ --version | head -n1 | grep -oP '\d+\.\d+\.\d+' | head -n1 || echo "unknown")
                ;;
            llvm-link|lli)
                # LLVM tools print version on line 2: "  LLVM version X.Y.Z"
                version=$($tool --version 2>/dev/null | sed -n '2p' | grep -oP '\d+\.\d+\.\d+' | head -n1 || echo "unknown")
                ;;
            koka)
                version=$(koka --version 2>/dev/null | grep -oP 'v\d+\.\d+\.\d+' | head -n1 || echo "unknown")
                ;;
            podman|docker)
                version=$($tool --version | head -n1 | grep -oP '\d+\.\d+\.\d+' | head -n1 || echo "unknown")
                ;;
            *)
                version="unknown"
                ;;
        esac
        printf "%s" "$version"
        return 0
    else
        printf "not found"
        return 0
    fi
}

print_info "Checking installed tools..."
echo ""

