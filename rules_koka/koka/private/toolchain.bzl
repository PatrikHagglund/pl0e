"""Koka toolchain provider and rule."""

KokaToolchainInfo = provider(
    doc = "Information about the Koka toolchain",
    fields = {
        "koka": "The koka compiler executable",
        "koka_files": "All koka distribution files (lib, share)",
        "version": "Koka version string",
    },
)

def _koka_toolchain_impl(ctx):
    return [platform_common.ToolchainInfo(
        koka_info = KokaToolchainInfo(
            koka = ctx.executable.koka,
            koka_files = ctx.files.koka_files,
            version = ctx.attr.version,
        ),
    )]

koka_toolchain = rule(
    implementation = _koka_toolchain_impl,
    attrs = {
        "koka": attr.label(
            mandatory = True,
            executable = True,
            cfg = "exec",
            allow_single_file = True,
        ),
        "koka_files": attr.label(mandatory = True),
        "version": attr.string(mandatory = True),
    },
)
