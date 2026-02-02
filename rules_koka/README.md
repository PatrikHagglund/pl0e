# rules_koka

Bazel rules for the [Koka](https://koka-lang.github.io/) programming language.

## Setup

Add to your `MODULE.bazel`:

```python
bazel_dep(name = "rules_koka", version = "0.1.0")

koka_ext = use_extension("@rules_koka//:extensions.bzl", "koka_ext")
koka_ext.toolchain()  # optional: version = "3.2.2"
use_repo(koka_ext, "koka")
register_toolchains("@koka//:toolchain")
```

## Rules

### `koka_library`

Collects Koka sources for use as dependencies.

```python
load("@rules_koka//koka:defs.bzl", "koka_library")

koka_library(
    name = "mylib",
    srcs = ["mylib.koka"],
    deps = [":other_lib"],
)
```

### `koka_binary`

Compiles a Koka executable.

```python
load("@rules_koka//koka:defs.bzl", "koka_binary")

koka_binary(
    name = "myapp",
    main = "main.koka",
    srcs = ["main.koka"],
    deps = [":mylib"],
    data = ["config.txt"],  # runtime files
)
```

## Notes

- Requires `toolchains_llvm_bootstrapped` for hermetic C compilation
- Koka's module system requires source files for imports; `koka_library` passes sources to dependents rather than pre-compiled artifacts
- Currently supports Linux x86_64 only
- Build warnings like `interface src/foo found but no corresponding source module` are expected and harmless — they occur because dependencies are compiled as libraries before the main module
