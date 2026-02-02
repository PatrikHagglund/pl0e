"""Koka compilation provider."""

KokaInfo = provider(
    doc = "Information about Koka sources for dependency tracking",
    fields = {
        "srcs": "depset of source .koka files",
        "transitive_srcs": "depset of all transitive source files",
    },
)
