# Bazel Build System

This project uses Bazel with fully hermetic toolchains for reproducible builds.

## Quick Start

```bash
./setup.sh                # Install Bazelisk
bazel build //...         # Build all targets
bazel test //test:all     # Run tests
bazel run //bench:bench   # Run benchmarks
```

No system compiler or development packages required.

## Toolchain Setup

### toolchains_llvm_bootstrapped (Primary)

Used for all C/C++ compilation:
- Downloads minimal LLVM distribution (clang, lld)
- Builds libc++ from source for full hermeticity
- Provides hermetic glibc headers, kernel headers, and CRT objects
- Provides hermetic glibc runtime libraries (libc.so, libpthread.so, etc.)

### toolchains_llvm (Extra Tools)

Used for extra LLVM tools not in the minimal distribution:
- `lli` — LLVM interpreter for JIT execution
- `llvm-link` — LLVM bitcode linker

Access via: `@llvm_tools_llvm//:bin/lli`, etc.

Note: `libclang_rt.builtins.a` (for 128-bit math) is available in both toolchains.
The benchmarks use the copy from `toolchains_llvm` since `lli` needs it as an explicit file path.

### Hermetic Koka Toolchain

Koka interpreters (`koka.bzl`):
- Downloads Koka v3.2.2 automatically
- Creates a clang wrapper with hermetic header/library paths
- Uses hermetic glibc/kernel headers and CRT objects
- Compiles C code (not C++), so excludes libc++ headers

## Targets

```bash
# Interpreters
bazel run //src:e1 -- examples/factorial.e1      # C++ interpreter
bazel run //src:e1peg -- examples/factorial.e1   # Koka PEG interpreter

# Compiled examples
bazel run //examples:factorial_cpp               # C++ backend
bazel run //examples:factorial_llvm              # LLVM backend

# Tests and benchmarks
bazel test //test:all
bazel run //bench:bench                          # Full benchmark suite
bazel run //bench:llvmjit                        # LLVM JIT only
```

## Platform Support

Currently supported: Linux x86_64

Platform-specific components:
- `koka.bzl`: Only linux-x64 Koka binary configured
