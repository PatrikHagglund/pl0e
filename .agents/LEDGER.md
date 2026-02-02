# Ledger

## Goal

Explore simple language design/implementation inspired by PL/0.

## Key decisions

- Keep languages small
- Progressive complexity (e0–e6), each level a superset of the previous
- Multiple implementation approaches (Koka interpreters, C++ interpreter/compiler)
- Example files demonstrate: 1) new features, 2) encoding next-level features with current primitives

## Next

- Fix e3 grammar exponential backtracking on `((x) -> x) (1)` patterns
  - Memoization doesn't help (backtracking inside lookahead, not at rule boundaries)
  - Options: refactor grammar, memoize inside lookahead, different closure parsing
- Create proper `rules_koka` for Bazel (library rule, dependency tracking, toolchain abstraction)
- Restructure directories by language level (e0/, e1/, ... + shared/)
- Explore efficient interpreters (Graal/Truffle, simple JIT)
- Standard library?
- Symbolic expressions (computer algebra)?
- Fuzzing with csmith-style tools

## Now

(No active task)

## Done (prune when exceeding 20 items)

- Nullable loop detection in PEG (`e*`/`e+` where `e` can match empty)
  - Fixed-point iteration to compute nullable rules, then check for problematic patterns
- PEG hardening: progress checks, fuel counter, left recursion detection
- Memoization for PEG semantic actions (packrat-style, at rule boundaries)
- Fixed Bazel C++ builds (system deps, local genrules, `-fuse-ld=lld`)
- Hermetic Koka toolchain for Bazel (v3.2.2, uses hermetic Clang)
- Hermetic LLVM toolchain (toolchains_llvm_bootstrapped, Clang 21)
- e2/e3 PEG interpreters with case/comparisons/booleans/closures
- Inline PEG actions with expression language and named captures
- Unified C++/LLVM compiler (`e1_compile.cpp`)
- Stack-based bigint runtime (no heap, `alloca` + stacksave/restore)
- Bigint optimizations (uint32_t size, realloc doubling)
- Language rename: pl0_N → eN
- docs/E1_SPEC.md, docs/DESIGN.md
- Test suite (25 tests across 5 implementations)
- ARG_COUNT and INT_BITS configuration
- `arg1`/`arg2` built-ins, benchmark targets
