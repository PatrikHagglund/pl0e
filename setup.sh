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
    # Check for C++26 support
    cxx26_supported=false
    if command -v g++ &> /dev/null; then
        gcc_major=$(g++ -dumpversion | cut -d. -f1)
        if [ "$gcc_major" -ge 14 ] 2>/dev/null; then
            cxx26_supported=true
        fi
    fi

    # Check what's available
    has_native_tools=false
    if command -v g++ &> /dev/null && command -v clang++ &> /dev/null && command -v llvm-link &> /dev/null; then
        has_native_tools=true
    fi

    # Determine and output recommended mode
    if [ "$has_native_tools" = true ] && [ "$cxx26_supported" = true ]; then
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

# Check if boost is installed and get version
check_boost() {
    local boost_version_header=""
    # Check common locations for boost version.hpp
    for loc in /usr/include/boost/version.hpp /usr/local/include/boost/version.hpp /opt/homebrew/include/boost/version.hpp; do
        if [ -f "$loc" ]; then
            boost_version_header="$loc"
            break
        fi
    done

    if [ -n "$boost_version_header" ]; then
        # Extract version from BOOST_LIB_VERSION (e.g., "1_83")
        local version=$(grep -oP 'BOOST_LIB_VERSION\s+"\K[^"]+' "$boost_version_header" 2>/dev/null | tr '_' '.')
        if [ -n "$version" ]; then
            printf "%s" "$version"
        else
            printf "installed"
        fi
        return 0
    fi
    printf "not found"
    return 1
}

# Display current status
echo "Current status:"
printf "  %-15s %s\n" "g++:" "$(check_tool g++)"
printf "  %-15s %s\n" "clang++:" "$(check_tool clang++)"
printf "  %-15s %s\n" "llvm-link:" "$(check_tool llvm-link)"
printf "  %-15s %s\n" "lli:" "$(check_tool lli)"
printf "  %-15s %s\n" "boost:" "$(check_boost)"
printf "  %-15s %s\n" "koka:" "$(check_tool koka)"
printf "  %-15s %s\n" "podman:" "$(check_tool podman)"
printf "  %-15s %s\n" "docker:" "$(check_tool docker)"
echo ""

# Determine installation strategy
NEEDS_GCC=false
NEEDS_LLVM=false
NEEDS_BOOST=false
INSTALL_CONTAINER=false

if ! command -v g++ &> /dev/null; then
    NEEDS_GCC=true
fi

if ! command -v clang++ &> /dev/null || ! command -v llvm-link &> /dev/null; then
    NEEDS_LLVM=true
fi

if ! check_boost &> /dev/null; then
    NEEDS_BOOST=true
fi

HAS_CONTAINER=false
if command -v podman &> /dev/null || command -v docker &> /dev/null; then
    HAS_CONTAINER=true
fi

# Check for C++26 support (requires GCC 14+ or Clang 18+)
CXX26_SUPPORTED=false
if command -v g++ &> /dev/null; then
    GCC_MAJOR=$(g++ -dumpversion | cut -d. -f1)
    if [ "$GCC_MAJOR" -ge 14 ] 2>/dev/null; then
        CXX26_SUPPORTED=true
        print_success "g++ version $GCC_MAJOR supports C++26"
    else
        print_warning "g++ version $GCC_MAJOR detected - C++26 requires GCC 14+"
    fi
fi

echo ""

# Check if Koka needs to be installed (for native mode)
NEEDS_KOKA=false
if ! command -v koka &> /dev/null; then
    NEEDS_KOKA=true
fi

# Function to install Koka (same method as Containerfile)
install_koka() {
    print_info "Installing Koka compiler..."

    local arch=$(uname -m)
    case "$arch" in
        x86_64*|amd64*) arch="x64";;
        arm64*|aarch64*|armv8*) arch="arm64";;
        *) print_error "Unsupported architecture: $arch"; return 1;;
    esac

    local osname="linux"
    case "$(uname)" in
        [Dd]arwin) osname="macos";;
    esac

    local version="v3.2.2"
    local url="https://github.com/koka-lang/koka/releases/download/$version/koka-$version-$osname-$arch.tar.gz"

    print_info "Downloading Koka $version..."
    if ! curl -sSL "$url" | sudo tar xz -C /usr/local; then
        print_error "Failed to install Koka"
        return 1
    fi

    if command -v koka &> /dev/null; then
        print_success "Koka installed successfully: $(koka --version 2>&1 | head -n1)"
        return 0
    else
        print_error "Koka installation verification failed"
        return 1
    fi
}

# Ask user preference for build mode
PREFERRED_MODE=""

if [ "$NEEDS_GCC" = false ] && [ "$NEEDS_LLVM" = false ] && [ "$NEEDS_BOOST" = false ] && [ "$CXX26_SUPPORTED" = true ]; then
    # All native tools already installed with C++26 support
    print_success "Native build tools are fully configured!"

    # Check if Koka needs to be installed
    if [ "$NEEDS_KOKA" = true ]; then
        echo ""
        print_info "Koka compiler is optional but recommended for Koka-based interpreters"
        printf "Do you want to install Koka (installs to /usr/local)? (y/N): "
        read_char
        echo ""

        if [[ $REPLY =~ ^[Yy]$ ]]; then
            install_koka
            if [ $? -eq 0 ]; then
                print_success "Koka installation complete!"
            fi
        else
            print_info "Skipping Koka installation"
        fi
    fi

    PREFERRED_MODE="native"

    # Tools are already installed - skip to the end
    # Jump to the sourcing handler at the end of the script
    if [ "$SOURCED" -eq 1 ]; then
        RECOMMENDED_MODE="native"
        export BUILD_MODE="$RECOMMENDED_MODE"
        echo ""
        print_success "BUILD_MODE set to: $BUILD_MODE"
        echo ""
        echo "You can now run:"
        echo "  make test"
        echo ""
        echo "To make this permanent, add to your ~/.bashrc or ~/.zshrc:"
        echo "  export BUILD_MODE=$BUILD_MODE"
        return 0
    else
        safe_exit 0
    fi
elif [ "$NEEDS_GCC" = true ] || [ "$NEEDS_LLVM" = true ] || [ "$NEEDS_BOOST" = true ]; then
    # Need to install native tools
    if [ "$HAS_CONTAINER" = true ]; then
        # Container already available - ask preference
        echo "You have two options for building:"
        echo "  1) Native - Install build tools directly on this system"
        echo "  2) Container - Use existing $(command -v podman &>/dev/null && echo 'podman' || echo 'docker') (no installation needed)"
        echo ""
        printf "Which do you prefer? (1=native, 2=container, default=2): "
        read_char
        echo ""

        if [[ $REPLY =~ ^[1]$ ]]; then
            PREFERRED_MODE="native"
            print_info "Will install native build tools"
        else
            PREFERRED_MODE="container"
            print_info "Will use container mode (no installation needed)"
        fi
    else
        # No container, will need to install native or offer container installation
        echo "Native build tools need to be installed."
        echo ""
        echo "Options:"
        echo "  1) Install native tools (g++, clang, llvm, boost) - faster builds, ~500MB"
        echo "  2) Install podman for container-based builds - isolated, guaranteed C++26"
        echo ""
        printf "Which do you prefer? (1=native, 2=podman, default=1): "
        read_char
        echo ""

        if [[ $REPLY =~ ^[2]$ ]]; then
            PREFERRED_MODE="container"
            INSTALL_CONTAINER=true
            print_info "Will install podman for container-based builds"
        else
            PREFERRED_MODE="native"
            print_info "Will install native build tools"
        fi
    fi
fi

# Decide on installation strategy
if [ "$PACKAGE_MANAGER" = "none" ]; then
    print_warning "Cannot auto-install packages without a supported package manager"
    echo ""
    print_info "Checking for container runtime..."

    if command -v podman &> /dev/null; then
        print_success "Podman is available - you can use: BUILD_MODE=podman make"
        echo ""
        echo "Recommended: export BUILD_MODE=podman"
        safe_exit 0
    elif command -v docker &> /dev/null; then
        print_success "Docker is available - you can use: BUILD_MODE=docker make"
        echo ""
        echo "Recommended: export BUILD_MODE=docker"
        safe_exit 0
    else
        print_error "No container runtime found. Please install podman or docker manually."
        safe_exit 1
    fi
fi

# Prepare package lists based on package manager and user preference
declare -a PACKAGES_TO_INSTALL=()

if [ "$PREFERRED_MODE" = "native" ]; then
    # Install only native build tools
    if [ "$PACKAGE_MANAGER" = "apt" ]; then
        [ "$NEEDS_GCC" = true ] && PACKAGES_TO_INSTALL+=("g++")
        [ "$NEEDS_LLVM" = true ] && PACKAGES_TO_INSTALL+=("clang" "llvm")
        [ "$NEEDS_BOOST" = true ] && PACKAGES_TO_INSTALL+=("libboost-dev")
    elif [ "$PACKAGE_MANAGER" = "dnf" ]; then
        [ "$NEEDS_GCC" = true ] && PACKAGES_TO_INSTALL+=("gcc-c++")
        [ "$NEEDS_LLVM" = true ] && PACKAGES_TO_INSTALL+=("clang" "llvm")
        [ "$NEEDS_BOOST" = true ] && PACKAGES_TO_INSTALL+=("boost-devel")
    elif [ "$PACKAGE_MANAGER" = "brew" ]; then
        [ "$NEEDS_GCC" = true ] && PACKAGES_TO_INSTALL+=("gcc")
        [ "$NEEDS_LLVM" = true ] && PACKAGES_TO_INSTALL+=("llvm")
        [ "$NEEDS_BOOST" = true ] && PACKAGES_TO_INSTALL+=("boost")
    fi
elif [ "$PREFERRED_MODE" = "container" ] && [ "$INSTALL_CONTAINER" = true ]; then
    # Install only container runtime
    if [ "$PACKAGE_MANAGER" = "apt" ]; then
        PACKAGES_TO_INSTALL+=("podman")
    elif [ "$PACKAGE_MANAGER" = "dnf" ]; then
        PACKAGES_TO_INSTALL+=("podman")
    elif [ "$PACKAGE_MANAGER" = "brew" ]; then
        PACKAGES_TO_INSTALL+=("podman")
    fi
fi

# If nothing needs to be installed, check versions and recommend mode
if [ ${#PACKAGES_TO_INSTALL[@]} -eq 0 ]; then
    if [ "$PREFERRED_MODE" = "container" ]; then
        # User chose container mode, no installation needed
        print_success "Container mode ready - no installation needed!"
        echo ""

        if command -v podman &> /dev/null; then
            RECOMMENDED_MODE="podman"
        elif command -v docker &> /dev/null; then
            RECOMMENDED_MODE="docker"
        fi
        print_info "Recommended: export BUILD_MODE=$RECOMMENDED_MODE"

        if [ "$SOURCED" -eq 1 ]; then
            export BUILD_MODE="$RECOMMENDED_MODE"
            print_success "BUILD_MODE set to: $BUILD_MODE"
            return 0
        fi
        exit 0
    fi

    print_success "All required tools are already installed!"
    echo ""

    if [ "$CXX26_SUPPORTED" = true ]; then
        print_info "Recommended build mode: BUILD_MODE=native"
        echo ""
        echo "You can run:"
        echo "  export BUILD_MODE=native"
        echo "  make test"
    else
        print_warning "C++26 support may be limited with current compiler version"
        if command -v podman &> /dev/null || command -v docker &> /dev/null; then
            print_info "Recommended: Use container mode for guaranteed C++26 support"
            if command -v podman &> /dev/null; then
                echo "  export BUILD_MODE=podman"
            else
                echo "  export BUILD_MODE=docker"
            fi
        fi
    fi

    if [ "$SOURCED" -eq 1 ]; then
        return 0
    fi
    exit 0
fi

# Ask for permission to install
echo "The following packages need to be installed:"
for pkg in "${PACKAGES_TO_INSTALL[@]}"; do
    echo "  - $pkg"
done
echo ""

if [ "$PACKAGE_MANAGER" = "brew" ]; then
    print_info "This will run: $INSTALL_CMD ${PACKAGES_TO_INSTALL[*]}"
else
    print_info "This will run: sudo $INSTALL_CMD ${PACKAGES_TO_INSTALL[*]}"
fi

echo ""
printf "Do you want to proceed with installation? (y/N): "
read_char
echo ""

if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    print_warning "Installation cancelled by user"
    echo ""

    # Suggest container alternative
    if ! command -v podman &> /dev/null && ! command -v docker &> /dev/null; then
        print_info "Alternative: Install podman or docker for container-based builds"
        if [ "$PACKAGE_MANAGER" = "apt" ]; then
            echo "  sudo apt install podman"
        elif [ "$PACKAGE_MANAGER" = "dnf" ]; then
            echo "  sudo dnf install podman"
        fi
    else
        print_info "You can use container mode instead:"
        if command -v podman &> /dev/null; then
            echo "  export BUILD_MODE=podman"
        elif command -v docker &> /dev/null; then
            echo "  export BUILD_MODE=docker"
        fi
    fi

    safe_exit 1
fi

# Perform installation
echo ""
print_info "Installing packages..."
echo ""

if [ "$PACKAGE_MANAGER" = "brew" ]; then
    $INSTALL_CMD "${PACKAGES_TO_INSTALL[@]}"
else
    sudo $INSTALL_CMD "${PACKAGES_TO_INSTALL[@]}"
fi

# Install Koka if in native mode and not already installed
if [ "$PREFERRED_MODE" = "native" ] && [ "$NEEDS_KOKA" = true ]; then
    echo ""
    print_info "Koka compiler is optional but recommended for Koka-based interpreters"
    printf "Do you want to install Koka (installs to /usr/local)? (y/N): "
    read_char
    echo ""

    if [[ $REPLY =~ ^[Yy]$ ]]; then
        install_koka
        KOKA_INSTALLED=$?
    else
        print_info "Skipping Koka installation (you can install it later)"
        KOKA_INSTALLED=1
    fi
fi

# Verify installation
echo ""
print_info "Verifying installation..."
echo ""

ALL_GOOD=true

if [ "$PREFERRED_MODE" = "native" ]; then
    # Verify native tools
    for tool in g++ clang++ llvm-link lli; do
        if command -v "$tool" &> /dev/null; then
            version=$(check_tool "$tool")
            print_success "$tool is installed (version: $version)"
        else
            print_error "$tool is not available"
            ALL_GOOD=false
        fi
    done

    # Check Boost
    if check_boost &> /dev/null; then
        version=$(check_boost)
        print_success "boost is installed (version: $version)"
    else
        print_error "boost is not available"
        ALL_GOOD=false
    fi

    # Check Koka (optional)
    if command -v koka &> /dev/null; then
        version=$(check_tool koka)
        print_success "koka is installed (version: $version) [optional]"
    else
        print_warning "koka is not installed (optional, needed for Koka interpreters)"
    fi
elif [ "$PREFERRED_MODE" = "container" ]; then
    # Verify container runtime
    if command -v podman &> /dev/null; then
        version=$(check_tool podman)
        print_success "podman is installed (version: $version)"
    elif command -v docker &> /dev/null; then
        version=$(check_tool docker)
        print_success "docker is installed (version: $version)"
    else
        print_error "No container runtime available"
        ALL_GOOD=false
    fi
fi

echo ""

# Final recommendations
if [ "$ALL_GOOD" = true ] || [ "$PREFERRED_MODE" = "container" ]; then
    print_success "Setup complete!"
    echo ""

    if [ "$PREFERRED_MODE" = "container" ]; then
        # Container mode was installed/chosen
        if command -v podman &> /dev/null; then
            print_info "Recommended: export BUILD_MODE=podman"
            echo ""
            echo "Add to your shell profile (~/.bashrc or ~/.zshrc):"
            echo "  export BUILD_MODE=podman"
        elif command -v docker &> /dev/null; then
            print_info "Recommended: export BUILD_MODE=docker"
            echo ""
            echo "Add to your shell profile (~/.bashrc or ~/.zshrc):"
            echo "  export BUILD_MODE=docker"
        fi
    else
        # Native mode was installed/chosen
        # Re-check C++26 support after installation
        if command -v g++ &> /dev/null; then
            GCC_MAJOR=$(g++ -dumpversion | cut -d. -f1)
            if [ "$GCC_MAJOR" -ge 14 ] 2>/dev/null; then
                print_info "Recommended: export BUILD_MODE=native"
                echo ""
                echo "Add to your shell profile (~/.bashrc or ~/.zshrc):"
                echo "  export BUILD_MODE=native"
                echo ""
                echo "This will ensure the Makefile uses native tools instead of containers."

                # Note about Koka
                if ! command -v koka &> /dev/null; then
                    echo ""
                    print_info "Note: Koka is not installed (optional)"
                    echo "  Run ./setup.sh again to install Koka"
                    echo "  Or skip - C++ and LLVM backends will work without it"
                fi
            else
                print_warning "GCC version $GCC_MAJOR may not fully support C++26 (requires 14+)"
                echo ""
                print_info "You can try native mode, but consider installing a newer GCC or using containers"
                if command -v podman &> /dev/null; then
                    echo "  export BUILD_MODE=podman  # For guaranteed C++26 support"
                elif command -v docker &> /dev/null; then
                    echo "  export BUILD_MODE=docker  # For guaranteed C++26 support"
                fi
            fi
        fi
    fi

    echo ""
    echo "Quick start:"
    echo "  make        # Build all targets"
    echo "  make test   # Run tests"
    echo "  make help   # Show all options"
else
    print_error "Some tools failed to install"
    echo ""

    if command -v podman &> /dev/null || command -v docker &> /dev/null; then
        print_info "You can still use container mode:"
        if command -v podman &> /dev/null; then
            echo "  export BUILD_MODE=podman"
        else
            echo "  export BUILD_MODE=docker"
        fi
        echo "  make"
    fi

    safe_exit 1
fi

# If sourced, set BUILD_MODE in current shell
if [ "$SOURCED" -eq 1 ]; then
    # Detect recommended mode (same logic as --detect flag)
    if command -v g++ &> /dev/null && command -v clang++ &> /dev/null && command -v llvm-link &> /dev/null; then
        gcc_major=$(g++ -dumpversion | cut -d. -f1)
        if [ "$gcc_major" -ge 14 ] 2>/dev/null; then
            RECOMMENDED_MODE="native"
        elif command -v podman &> /dev/null; then
            RECOMMENDED_MODE="podman"
        elif command -v docker &> /dev/null; then
            RECOMMENDED_MODE="docker"
        else
            RECOMMENDED_MODE="native"
        fi
    elif command -v podman &> /dev/null; then
        RECOMMENDED_MODE="podman"
    elif command -v docker &> /dev/null; then
        RECOMMENDED_MODE="docker"
    else
        RECOMMENDED_MODE="native"
    fi
    export BUILD_MODE="$RECOMMENDED_MODE"
    echo ""
    print_success "BUILD_MODE set to: $BUILD_MODE"
    echo ""
    echo "You can now run:"
    echo "  make test"
    echo ""
    echo "To make this permanent, add to your ~/.bashrc or ~/.zshrc:"
    echo "  export BUILD_MODE=$BUILD_MODE"
fi
