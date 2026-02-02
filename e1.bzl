load("@rules_cc//cc:defs.bzl", "cc_binary")

# Macro for compiling e1 source to native binary via C++ backend.
def e1_cpp_binary(name, src):
    native.genrule(
        name = name + "_cpp_gen",
        srcs = [src],
        outs = [name + ".cpp"],
        cmd = "$(location //src:e1_compile) $< > $@",
        tools = ["//src:e1_compile"],
    )
    cc_binary(
        name = name,
        srcs = [name + ".cpp"],
        deps = ["//src:e1_hdrs"],
        includes = ["src"],  # For finding headers
        copts = ["-I.", "-Isrc"],  # Additional include paths
        visibility = ["//visibility:public"],
    )

# Macro for compiling e1 source to native binary via LLVM backend.
# Uses llvm-link to merge IR files before clang -O3, enabling cross-module optimization.
# Note: -march=native is used here (final link step), but NOT in e1_rt_bigint_ll (IR generation)
# because CPU-specific intrinsics in IR prevent optimization when linked (2x slowdown).
def e1_llvm_binary(name, src):
    native.genrule(
        name = name + "_ll_gen",
        srcs = [src],
        outs = [name + ".ll"],
        cmd = "$(location //src:e1_compile) --llvm $< > $@",
        tools = ["//src:e1_compile"],
        visibility = ["//visibility:public"],
    )
    native.genrule(
        name = name,
        srcs = [name + ".ll", "//src:e1_rt_bigint_ll"],
        outs = [name + "_bin"],
        cmd = """
            CLANG=$(execpath @llvm_tools_llvm//:bin/clang)
            LLVM_ROOT=$$(dirname $$(dirname $$CLANG))
            CRT_DIR=$(execpath @toolchains_llvm_bootstrapped//runtimes:crt_objects_directory_linux)
            GLIBC_LIB=$(execpath @toolchains_llvm_bootstrapped//runtimes/glibc:glibc_library_search_directory)
            RESOURCE_DIR=$(execpath @toolchains_llvm_bootstrapped//runtimes:resource_directory)
            $(execpath @llvm_tools_llvm//:bin/llvm-link) -S $(SRCS) -o $@.linked.ll
            $$CLANG -Wno-override-module -O3 -march=native \
                -target x86_64-linux-gnu \
                --sysroot=/dev/null \
                -fuse-ld=lld \
                -rtlib=compiler-rt \
                -resource-dir "$$RESOURCE_DIR" \
                -B"$$CRT_DIR" \
                -L"$$GLIBC_LIB" \
                -Wl,--push-state -Wl,--as-needed -lpthread -ldl -Wl,--pop-state \
                $@.linked.ll -o $@
            rm -f $@.linked.ll
        """,
        tools = [
            "@llvm_tools_llvm//:bin/llvm-link",
            "@llvm_tools_llvm//:bin/clang",
            "@toolchains_llvm_bootstrapped//runtimes:crt_objects_directory_linux",
            "@toolchains_llvm_bootstrapped//runtimes/glibc:glibc_library_search_directory",
            "@toolchains_llvm_bootstrapped//runtimes:resource_directory",
        ],
        executable = True,
        local = True,
        visibility = ["//visibility:public"],
    )
