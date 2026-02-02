"""Koka toolchain for Bazel."""

KOKA_VERSION = "3.2.2"

KOKA_PLATFORMS = {
    "linux-x64": {
        "url": "https://github.com/koka-lang/koka/releases/download/v{version}/koka-v{version}-linux-x64.tar.gz",
        "sha256": "484c56fdf4c1b4b3fd1dc7711f39141f1b3892d2f93e414d1d066887e7d0b3e2",
        "exec_compat": ["@platforms//os:linux", "@platforms//cpu:x86_64"],
    },
}

def _koka_repo_impl(rctx):
    platform = None
    for p, info in KOKA_PLATFORMS.items():
        if rctx.os.name.lower().startswith("linux") and rctx.os.arch == "amd64":
            platform = p
            break
    
    if not platform:
        fail("Unsupported platform: {} {}".format(rctx.os.name, rctx.os.arch))
    
    info = KOKA_PLATFORMS[platform]
    url = info["url"].format(version = KOKA_VERSION)
    
    rctx.download_and_extract(
        url = url,
        sha256 = info["sha256"],
    )
    
    rctx.file("BUILD.bazel", """
exports_files(["bin/koka"])

filegroup(
    name = "koka_files",
    srcs = glob(["bin/**", "lib/**", "share/**"]),
    visibility = ["//visibility:public"],
)
""")

koka_repo = repository_rule(
    implementation = _koka_repo_impl,
    attrs = {},
)

def _koka_ext_impl(mctx):
    koka_repo(name = "koka")

koka_ext = module_extension(
    implementation = _koka_ext_impl,
)

def _koka_binary_impl(ctx):
    out = ctx.actions.declare_file(ctx.label.name)
    koka = ctx.executable._koka
    clang = ctx.executable._clang
    
    # Get directory paths from filegroups
    glibc_hdrs = ctx.files._glibc_headers
    kernel_hdrs = ctx.files._kernel_headers
    crt_dir = ctx.files._crt_objects
    glibc_libs = ctx.files._glibc_libs
    resource_dir = ctx.files._resource_dir
    
    # Find directory paths - these targets output directories, not files
    def get_path(files):
        return files[0].path if files else ""
    
    glibc_include = get_path(glibc_hdrs)
    kernel_include = get_path(kernel_hdrs)
    crt_path = get_path(crt_dir)
    glibc_lib_path = get_path(glibc_libs)
    resource_path = get_path(resource_dir)
    
    srcs = ctx.files.srcs
    main = ctx.file.main
    
    # Build compile commands for deps
    compile_cmds = []
    for dep in ctx.files.deps:
        if dep.basename.startswith("e1-") or dep.basename.startswith("e2-") or dep.basename.startswith("e3-"):
            compile_cmds.append("$KOKA -l src/{}".format(dep.basename))
        else:
            compile_cmds.append("$KOKA --compile src/{}".format(dep.basename))
    compile_cmds.append("$KOKA -o $OUT src/{}".format(main.basename))
    
    # Clang wrapper mimics toolchains_llvm_bootstrapped setup
    # Derive builtin headers from clang path: .../bin/clang -> .../lib/clang/*/include
    # Note: Koka compiles C code, so we don't include C++ headers (libcxx/libcxxabi)
    script = """
set -e
TMPDIR=$(mktemp -d)
trap "rm -rf $TMPDIR" EXIT
mkdir -p $TMPDIR/src
cp {srcs} $TMPDIR/src/

EXECROOT="$(pwd)"
CLANG_BIN="$EXECROOT/{clang}"
LLVM_ROOT=$(dirname $(dirname "$CLANG_BIN"))
BUILTIN_INCLUDE=$(echo "$LLVM_ROOT"/lib/clang/*/include)

cat > $TMPDIR/clang_wrapper.sh <<WRAPPER_EOF
#!/bin/bash
exec "$CLANG_BIN" \\
    -target x86_64-linux-gnu \\
    --sysroot=/dev/null \\
    -nostdlibinc \\
    -isystem "$BUILTIN_INCLUDE" \\
    -isystem "$EXECROOT/{kernel_include}" \\
    -isystem "$EXECROOT/{glibc_include}" \\
    -fuse-ld=lld \\
    -rtlib=compiler-rt \\
    -resource-dir "$EXECROOT/{resource_dir}" \\
    -B"$EXECROOT/{crt_dir}" \\
    -L"$EXECROOT/{glibc_lib}" \\
    -Wl,--push-state -Wl,--as-needed -lpthread -ldl -Wl,--pop-state \\
    "\\$@"
WRAPPER_EOF
chmod +x $TMPDIR/clang_wrapper.sh

KOKA="$EXECROOT/{koka} -O3 --cc=$TMPDIR/clang_wrapper.sh --ccopt=-march=native"
OUT="$EXECROOT/{out}"
cd $TMPDIR
export KOKA OUT
{cmds}
""".format(
        srcs = " ".join([f.path for f in srcs]),
        koka = koka.path,
        clang = clang.path,
        glibc_include = glibc_include,
        kernel_include = kernel_include,
        crt_dir = crt_path,
        glibc_lib = glibc_lib_path,
        resource_dir = resource_path,
        out = out.path,
        cmds = "\n".join(compile_cmds),
    )
    
    all_inputs = (srcs + [koka, clang] + ctx.files._koka_files +
                  glibc_hdrs + kernel_hdrs + crt_dir + glibc_libs + resource_dir)
    
    ctx.actions.run_shell(
        outputs = [out],
        inputs = all_inputs,
        command = script,
        mnemonic = "KokaCompile",
        progress_message = "Compiling Koka binary %s" % ctx.label.name,
        execution_requirements = {"no-sandbox": "1"},
    )
    
    return [DefaultInfo(
        executable = out,
        runfiles = ctx.runfiles(files = ctx.files.data),
    )]

koka_binary = rule(
    implementation = _koka_binary_impl,
    attrs = {
        "main": attr.label(allow_single_file = [".koka"], mandatory = True),
        "srcs": attr.label_list(allow_files = [".koka"]),
        "deps": attr.label_list(allow_files = [".koka"]),
        "data": attr.label_list(allow_files = True),
        "_koka": attr.label(
            default = "@koka//:bin/koka",
            executable = True,
            cfg = "exec",
            allow_single_file = True,
        ),
        "_koka_files": attr.label(
            default = "@koka//:koka_files",
        ),
        "_clang": attr.label(
            default = "@toolchains_llvm_bootstrapped//tools:clang",
            executable = True,
            cfg = "exec",
            allow_single_file = True,
        ),
        "_glibc_headers": attr.label(
            default = "@toolchains_llvm_bootstrapped//runtimes/glibc:glibc_headers_include_search_directory",
        ),
        "_kernel_headers": attr.label(
            default = "@@toolchains_llvm_bootstrapped++kernel_headers+kernel_headers//:kernel_headers_directory",
        ),
        "_crt_objects": attr.label(
            default = "@toolchains_llvm_bootstrapped//runtimes:crt_objects_directory_linux",
        ),
        "_glibc_libs": attr.label(
            default = "@toolchains_llvm_bootstrapped//runtimes/glibc:glibc_library_search_directory",
        ),
        "_resource_dir": attr.label(
            default = "@toolchains_llvm_bootstrapped//runtimes:resource_directory",
        ),
    },
    executable = True,
)
