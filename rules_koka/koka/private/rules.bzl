"""Koka build rules.

Koka recompiles every imported module (the whole stdlib plus any library
deps) on each invocation, in whatever build dir it is given. To avoid
recompiling shared libraries once per dependent, koka_library compiles its
sources into a build-dir tree artifact, and dependents (libraries or
binaries) seed that tree into their own build dir so Koka finds the
.kki/.o already present and only compiles the new modules.

Reuse across actions requires a stable build variant. Koka names the
variant <ccName>-<buildtype>[-<hash>] where the hash includes the absolute
--cc path; we pass --no-buildhash to drop it and always write the clang
wrapper to the same basename, so every action shares one variant
(clang_wrapper-release) and the seeded .kki/.o match.
"""

load(":providers.bzl", "KokaInfo")

def _get_toolchain(ctx):
    return ctx.toolchains["@rules_koka//koka:toolchain_type"].koka_info

def _make_clang_wrapper(ctx, clang):
    """Clang wrapper script for hermetic builds (fixed basename: see module doc)."""
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
# Koka invokes the C compiler both for compile-only steps (-c) and the
# final link. Pass linker flags only when linking; on compile steps they
# only produce "-Wunused-command-line-argument" warnings.
linkflags=(-fuse-ld=lld -rtlib=compiler-rt \\
    -B"$EXECROOT/{crt}" \\
    -L"$EXECROOT/{glibc_lib}" \\
    -Wl,--push-state -Wl,--as-needed -lpthread -ldl -Wl,--pop-state)
for arg in "\\$@"; do
  if [ "\\$arg" = "-c" ]; then linkflags=(); break; fi
done
exec "$CLANG_BIN" \\
    -target x86_64-linux-gnu \\
    --sysroot=/dev/null \\
    -nostdlibinc \\
    -isystem "$BUILTIN_INCLUDE" \\
    -isystem "$EXECROOT/{kernel}" \\
    -isystem "$EXECROOT/{glibc}" \\
    -resource-dir "$EXECROOT/{resource}" \\
    "\\${{linkflags[@]}}" \\
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

def _toolchain_inputs(ctx, tc, clang):
    return ([tc.koka, clang] + tc.koka_files +
            ctx.files._glibc_headers + ctx.files._kernel_headers +
            ctx.files._crt_objects + ctx.files._glibc_libs +
            ctx.files._resource_dir)

def _dep_info(deps):
    """Merge transitive sources and build-dir artifacts from deps."""
    srcs = []
    bds = []
    for dep in deps:
        if KokaInfo in dep:
            srcs.append(dep[KokaInfo].transitive_srcs)
            bds.append(dep[KokaInfo].transitive_builddirs)
    return depset(transitive = srcs), depset(transitive = bds)

# Shell: copy all sources (for -i. module resolution), then seed dep build
# dirs LAST so the prebuilt .kki/.o are newer than the copied sources and
# Koka treats them as up to date (otherwise it recompiles them).
def _stage_cmds(all_srcs, dep_bds):
    cmds = ['mkdir -p "$TMPDIR/build/BD"']
    for f in all_srcs:
        cmds.append('mkdir -p "$TMPDIR/build/$(dirname {0})" && cp "$EXECROOT/{0}" "$TMPDIR/build/{0}"'.format(f.path))
    # Seed each dep build dir, making files writable after each copy: the
    # tree artifacts are read-only, and overlapping files (e.g. the stdlib,
    # present in every dep's build dir) would otherwise fail to overwrite.
    for bd in dep_bds:
        cmds.append('cp -a "$EXECROOT/{}/." "$TMPDIR/build/BD/" && chmod -R u+w "$TMPDIR/build/BD"'.format(bd.path))
    return "\n".join(cmds)

def _koka_library_impl(ctx):
    tc = _get_toolchain(ctx)
    clang = ctx.executable._clang
    out_bd = ctx.actions.declare_directory(ctx.label.name + "_bd")

    dep_srcs, dep_bds = _dep_info(ctx.attr.deps)
    all_srcs = depset(ctx.files.srcs, transitive = [dep_srcs]).to_list()
    dep_bds_list = dep_bds.to_list()

    # Compile each of this library's own modules into the (seeded) build dir.
    lib_compiles = "\n".join(['$KOKA --library "{}"'.format(f.path) for f in ctx.files.srcs])

    script = """
set -e
EXECROOT="$(pwd)"
TMPDIR=$(mktemp -d)
trap "rm -rf $TMPDIR" EXIT
{stage}
{wrapper}
KOKA="$EXECROOT/{koka} -O3 --no-buildhash -i. --builddir=$TMPDIR/build/BD --cc=$TMPDIR/clang_wrapper.sh"
cd $TMPDIR/build
{lib_compiles}
cp -a $TMPDIR/build/BD/. "$EXECROOT/{out}/"
""".format(
        stage = _stage_cmds(all_srcs, dep_bds_list),
        wrapper = _make_clang_wrapper(ctx, clang),
        koka = tc.koka.path,
        lib_compiles = lib_compiles,
        out = out_bd.path,
    )

    ctx.actions.run_shell(
        outputs = [out_bd],
        inputs = all_srcs + dep_bds_list + _toolchain_inputs(ctx, tc, clang),
        command = script,
        mnemonic = "KokaLibrary",
        progress_message = "Compiling Koka library %s" % ctx.label.name,
        execution_requirements = {"no-sandbox": "1"},
    )

    return [
        DefaultInfo(files = depset(ctx.files.srcs)),
        KokaInfo(
            srcs = depset(ctx.files.srcs),
            transitive_srcs = depset(ctx.files.srcs, transitive = [dep_srcs]),
            transitive_builddirs = depset([out_bd], transitive = [dep_bds]),
        ),
    ]

def _koka_binary_impl(ctx):
    tc = _get_toolchain(ctx)
    clang = ctx.executable._clang
    out = ctx.actions.declare_file(ctx.label.name)

    dep_srcs, dep_bds = _dep_info(ctx.attr.deps)
    all_srcs = depset(ctx.files.srcs, transitive = [dep_srcs]).to_list()
    dep_bds_list = dep_bds.to_list()

    script = """
set -e
EXECROOT="$(pwd)"
TMPDIR=$(mktemp -d)
trap "rm -rf $TMPDIR" EXIT
{stage}
{wrapper}
KOKA="$EXECROOT/{koka} -O3 --no-buildhash {koka_opts} -i. --builddir=$TMPDIR/build/BD --cc=$TMPDIR/clang_wrapper.sh"
cd $TMPDIR/build
$KOKA -o "$EXECROOT/{out}" "{main}"
""".format(
        stage = _stage_cmds(all_srcs, dep_bds_list),
        wrapper = _make_clang_wrapper(ctx, clang),
        koka = tc.koka.path,
        koka_opts = " ".join(ctx.attr.koka_opts),
        out = out.path,
        main = ctx.file.main.path,
    )

    ctx.actions.run_shell(
        outputs = [out],
        inputs = all_srcs + dep_bds_list + _toolchain_inputs(ctx, tc, clang),
        command = script,
        mnemonic = "KokaBinary",
        progress_message = "Compiling Koka binary %s" % ctx.label.name,
        execution_requirements = {"no-sandbox": "1"},
    )

    return [DefaultInfo(
        executable = out,
        runfiles = ctx.runfiles(files = ctx.files.data),
    )]

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

_LIB_ATTRS = dict({
    "srcs": attr.label_list(allow_files = [".kk", ".koka"]),
    "deps": attr.label_list(providers = [[KokaInfo]]),
}, **_TOOLCHAIN_ATTRS)

koka_library = rule(
    implementation = _koka_library_impl,
    attrs = _LIB_ATTRS,
    toolchains = ["@rules_koka//koka:toolchain_type"],
)

koka_binary = rule(
    implementation = _koka_binary_impl,
    attrs = dict(_LIB_ATTRS, **{
        "main": attr.label(allow_single_file = [".kk", ".koka"], mandatory = True),
        "data": attr.label_list(allow_files = True),
        "koka_opts": attr.string_list(
            doc = "Extra options passed to the koka compiler (after -O3).",
        ),
    }),
    executable = True,
    toolchains = ["@rules_koka//koka:toolchain_type"],
)
