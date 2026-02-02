"""Koka build rules."""

load(":providers.bzl", "KokaInfo")

def _get_toolchain(ctx):
    return ctx.toolchains["@rules_koka//koka:toolchain_type"].koka_info

def _make_clang_wrapper(ctx, clang):
    """Create clang wrapper script for hermetic builds."""
    glibc_hdrs = ctx.files._glibc_headers[0].path if ctx.files._glibc_headers else ""
    kernel_hdrs = ctx.files._kernel_headers[0].path if ctx.files._kernel_headers else ""
    crt_dir = ctx.files._crt_objects[0].path if ctx.files._crt_objects else ""
    glibc_libs = ctx.files._glibc_libs[0].path if ctx.files._glibc_libs else ""
    resource_dir = ctx.files._resource_dir[0].path if ctx.files._resource_dir else ""

    return """
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
    -isystem "$EXECROOT/{kernel}" \\
    -isystem "$EXECROOT/{glibc}" \\
    -fuse-ld=lld \\
    -rtlib=compiler-rt \\
    -resource-dir "$EXECROOT/{resource}" \\
    -B"$EXECROOT/{crt}" \\
    -L"$EXECROOT/{glibc_lib}" \\
    -Wl,--push-state -Wl,--as-needed -lpthread -ldl -Wl,--pop-state \\
    "\\$@"
WRAPPER_EOF
chmod +x $TMPDIR/clang_wrapper.sh
""".format(
        clang = clang.path,
        kernel = kernel_hdrs,
        glibc = glibc_hdrs,
        crt = crt_dir,
        glibc_lib = glibc_libs,
        resource = resource_dir,
    )

def _collect_transitive_srcs(deps):
    """Collect all transitive sources from deps."""
    srcs = []
    for dep in deps:
        if KokaInfo in dep:
            srcs.append(dep[KokaInfo].transitive_srcs)
    return depset(transitive = srcs)

def _koka_library_impl(ctx):
    """Library rule - just collects sources for dependents."""
    transitive = _collect_transitive_srcs(ctx.attr.deps)
    return [
        DefaultInfo(files = depset(ctx.files.srcs)),
        KokaInfo(
            srcs = depset(ctx.files.srcs),
            transitive_srcs = depset(ctx.files.srcs, transitive = [transitive]),
        ),
    ]

def _koka_binary_impl(ctx):
    tc = _get_toolchain(ctx)
    clang = ctx.executable._clang
    out = ctx.actions.declare_file(ctx.label.name)

    # Collect all sources: deps + local srcs
    dep_srcs = _collect_transitive_srcs(ctx.attr.deps)
    all_srcs = depset(ctx.files.srcs, transitive = [dep_srcs]).to_list()

    wrapper_script = _make_clang_wrapper(ctx, clang)

    # Copy all sources preserving directory structure
    copy_cmds = []
    for f in all_srcs:
        copy_cmds.append('mkdir -p "$TMPDIR/build/$(dirname {})" && cp "$EXECROOT/{}" "$TMPDIR/build/{}"'.format(f.path, f.path, f.path))

    # Compile deps as libraries, then link main
    dep_srcs_list = dep_srcs.to_list()
    compile_cmds = "\n".join([
        '$KOKA --library "{}"'.format(f.path)
        for f in dep_srcs_list
    ])

    script = """
set -e
EXECROOT="$(pwd)"
TMPDIR=$(mktemp -d)
trap "rm -rf $TMPDIR" EXIT
mkdir -p $TMPDIR/build
{copy_cmds}
{wrapper}
KOKA="$EXECROOT/{koka} -O3 --cc=$TMPDIR/clang_wrapper.sh"
cd $TMPDIR/build
{compile_cmds}
$KOKA -o "$EXECROOT/{out}" "{main}"
""".format(
        copy_cmds = "\n".join(copy_cmds),
        wrapper = wrapper_script,
        koka = tc.koka.path,
        compile_cmds = compile_cmds,
        out = out.path,
        main = ctx.file.main.path,
    )

    inputs = (all_srcs + [tc.koka, clang] + tc.koka_files +
              ctx.files._glibc_headers + ctx.files._kernel_headers +
              ctx.files._crt_objects + ctx.files._glibc_libs +
              ctx.files._resource_dir)

    ctx.actions.run_shell(
        outputs = [out],
        inputs = inputs,
        command = script,
        mnemonic = "KokaBinary",
        progress_message = "Compiling Koka binary %s" % ctx.label.name,
        execution_requirements = {"no-sandbox": "1"},
    )

    return [DefaultInfo(
        executable = out,
        runfiles = ctx.runfiles(files = ctx.files.data),
    )]

_COMMON_ATTRS = {
    "srcs": attr.label_list(allow_files = [".koka"]),
    "deps": attr.label_list(providers = [[KokaInfo]]),
}

_TOOLCHAIN_ATTRS = {
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
}

koka_library = rule(
    implementation = _koka_library_impl,
    attrs = _COMMON_ATTRS,
)

koka_binary = rule(
    implementation = _koka_binary_impl,
    attrs = dict(_COMMON_ATTRS, **dict(_TOOLCHAIN_ATTRS, **{
        "main": attr.label(allow_single_file = [".koka"], mandatory = True),
        "data": attr.label_list(allow_files = True),
    })),
    executable = True,
    toolchains = ["@rules_koka//koka:toolchain_type"],
)
