"""Koka compilation provider."""

KokaInfo = provider(
    doc = "Information about Koka sources for dependency tracking",
    fields = {
        "srcs": "depset of source .kk files",
        "transitive_srcs": "depset of all transitive source files",
        "transitive_builddirs": "depset of compiled build-dir tree artifacts (this lib + transitive deps), seeded into dependents for reuse",
    },
)
