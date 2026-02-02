"""Repository rules for Koka toolchain."""

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
    url = info["url"].format(version = rctx.attr.version)

    rctx.download_and_extract(url = url, sha256 = info["sha256"])

    rctx.file("BUILD.bazel", """
load("@rules_koka//koka:defs.bzl", "koka_toolchain")

exports_files(["bin/koka"])

filegroup(
    name = "koka_files",
    srcs = glob(["bin/**", "lib/**", "share/**"]),
    visibility = ["//visibility:public"],
)

koka_toolchain(
    name = "toolchain_impl",
    koka = "bin/koka",
    koka_files = ":koka_files",
    version = "{version}",
)

toolchain(
    name = "toolchain",
    toolchain = ":toolchain_impl",
    toolchain_type = "@rules_koka//koka:toolchain_type",
    exec_compatible_with = {exec_compat},
)
""".format(
        version = rctx.attr.version,
        exec_compat = info["exec_compat"],
    ))

_koka_repo = repository_rule(
    implementation = _koka_repo_impl,
    attrs = {"version": attr.string(default = KOKA_VERSION)},
)

def _koka_ext_impl(mctx):
    for mod in mctx.modules:
        for cfg in mod.tags.toolchain:
            _koka_repo(name = cfg.name, version = cfg.version)

_toolchain_tag = tag_class(attrs = {
    "name": attr.string(default = "koka"),
    "version": attr.string(default = KOKA_VERSION),
})

koka_ext = module_extension(
    implementation = _koka_ext_impl,
    tag_classes = {"toolchain": _toolchain_tag},
)

def koka_register(name = "koka", version = KOKA_VERSION):
    """Macro for WORKSPACE users (non-bzlmod)."""
    _koka_repo(name = name, version = version)
    native.register_toolchains("@{}//:toolchain".format(name))
