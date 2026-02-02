"""Public API for rules_koka."""

load("//koka/private:rules.bzl", _koka_binary = "koka_binary", _koka_library = "koka_library")
load("//koka/private:toolchain.bzl", _koka_toolchain = "koka_toolchain")
load("//koka/private:repo.bzl", _koka_register = "koka_register")

koka_library = _koka_library
koka_binary = _koka_binary
koka_toolchain = _koka_toolchain
koka_register = _koka_register
