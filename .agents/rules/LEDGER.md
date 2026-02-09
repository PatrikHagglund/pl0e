# Ledger

## Goal

Explore simple language design/implementation inspired by PL/0.

## Key decisions

- Keep languages small
- Progressive complexity (e0–e6), each level a superset of the previous
- Multiple implementation approaches (Koka interpreters, C++ interpreter/compiler)

## Next

- Implement e5peg interpreter (records, unit)
- Implement e6peg interpreter (static typing)
- Add CI workflow (GitHub Actions)
- Restructure directories by language level (e0/, e1/, ... + shared/)
- Explore efficient interpreters (Graal/Truffle, simple JIT)
- Standard library?
- Symbolic expressions (computer algebra)?
- Fuzzing with csmith-style tools
- Explore using Zig/Koru, and Ocaml as implementation langagues.
- Explore Rascal and/or K Framework for specifications.
- Explore adding support for syntactic sugar (using rewrite rules in the PEG
  eval)
- Explore using Beads for task tracking (replacing this ledger).
- Explore using BuildStream/BuildGrid.

## Now

(No active task)

## Done (prune when exceeding 20 items)

- Implement e4peg interpreter (arrays, pattern matching)
  - Arrays stored as Koka vectors for O(1) indexed access
  - Pattern matching: exact-length `(a; b;)` and prefix `(a; b; _)`
  - Fixed whitespace bug in apply_expr for e3 and e4 grammars
- Create proper `rules_koka` for Bazel
  - Standalone module in `rules_koka/` with own MODULE.bazel
  - `koka_library` rule for dependency tracking (collects sources)
  - `koka_binary` rule compiles all transitive sources together
  - Proper toolchain abstraction via `koka_toolchain` rule
  - Module extension for bzlmod (`koka_ext.toolchain()`)
  - Uses hermetic Clang from toolchains_llvm_bootstrapped
  - Note: Koka requires source files for imports, not just .kki files
- Left-factor e0/e1/e2 grammars (sum_expr, product, cmp_expr)
  - e2 sum_expr: 95k → 1.6k fuel (57x improvement)
  - Eliminates right-recursion warnings from static analysis
- PEG dynamic analysis: runtime statistics (`--stats` flag)
  - Per-rule call count, fuel consumption, backtrack count
  - Success% metric to identify inefficient rules
  - Complements static `--warn` analysis with empirical data
- PEG static analysis: warn about potential backtracking issues (`--warn` flag)
  - FIRST set computation using fixed-point iteration
  - Detect overlapping FIRST sets in choice alternatives
  - Warn about lookahead containing recursive rules
  - Flag right-recursive rules that could be left-factored
  - Tests in peg_test.koka, docs in PEG_SPEC.md
- Fix e3 grammar exponential backtracking
  - Changed lambda syntax from `(params) -> body` to `\params -> body` (Haskell-style)
  - Refactored grammar to left-factored form to avoid re-parsing in binary operators
  - Y combinator example now works
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
