# Ledger

## Goal

Explore simple language design/implementation inspired by PL/0.

## Key decisions

- Keep languages small
- Erroneous-behavior category (2026-06-12, C++26-contracts-inspired,
  E3_SPEC.md): incorrect-but-bounded constructs (div0, unbound, nomatch,
  oob) have a spec'd fallback value; handling is a per-kind implementation
  option: enforce / observe / fallback (default) / unchecked. No-assumption
  rule in all modes except unchecked. Type confusion stays a hard runtime
  error (no principled fallback).
- Progressive complexity (e0–e6), each level *almost* a strict superset of
  the previous. Deliberate deviations (DESIGN.md "Superset deviations"):
  break_ifz dropped at e2+ (too ugly above e1); e3 comparisons yield
  true/false not 1/0 (semantic, not syntactic, break); e4 case requires a
  scrutinee
- Multiple implementation approaches (Koka interpreters, C++ interpreter/compiler)

## Next

- Implement e5peg interpreter (records, unit)
- Implement e6peg interpreter (static typing)
- Restructure directories by language level (e0/, e1/, ... + shared/)
- Explore efficient interpreters (Graal/Truffle, simple JIT)
- Standard library?
- Symbolic expressions (computer algebra)?
- efuzz Phases 3-4 (docs/FUZZING.md): e3/e4 generators (e3 only on e3peg;
  e4 only on e4peg — superset deviations, DESIGN.md), mutator/reducer,
  CI integration
- Explore using Zig/Koru, and Ocaml as implementation langagues.
- Explore Rascal and/or K Framework for specifications.
- Explore adding support for syntactic sugar (using rewrite rules in the PEG
  eval)
- Explore using Beads for task tracking (replacing this ledger).
- Explore using BuildStream/BuildGrid.

## Open questions

(none — unbound variables resolved 2026-06-12 via the erroneous-behavior
category: classified erroneous at e3+ with fallback 0, undefined at e1/e2;
the 0-default and an enforcing implementation are both conforming)

## Now

(No active task)

## Done (prune when exceeding 20 items)

- CI workflow (2026-06-12): .github/workflows/ci.yml — bazel test
  //test/... //fuzz/... + rolling 25-seed e1/e2 fuzz campaigns (seeds from
  run number; failures uploaded as artifacts). --config=ci in .bazelrc:
  jobs=2 (Koka OOM), -march=x86-64 (cache-portable), disk/repo caches.
  Commands validated locally; the workflow itself is UNCONFIRMED until
  first push to GitHub.
- Enforce-mode oracle in //fuzz:diff_e2 (2026-06-12): efuzz co-evaluation
  marks `// violations: none|div0`; driver asserts bidirectionally vs
  `e3peg --enforce` (clean program must not trip a violation; div0 program
  must halt with Violation (div0)). Tests the checking machinery itself.
- Erroneous behavior + handling modes (2026-06-12): violation ctl effect
  in e3peg/e4peg with kinds div0/unbound/nomatch/oob and per-kind modes
  via --enforce / --erroneous=MODE / --erroneous:KIND=MODE. Default
  (fallback) preserves prior behavior; observe diagnoses and continues;
  enforce halts. E3_SPEC.md "Erroneous Behavior and Handling Modes"
  documents the C++26 mapping (enforce/observe=P2900, fallback=EB P2795,
  unchecked=ignore) incl. that C++ ignore has NO fallback value. e4
  EIndex on non-array now a type error; OOB indexing erroneous. Mode
  tests in e3/e4 test scripts.
- Spec terminology (decision 2026-06-12): e1 spec stays minimal — "error"
  replaced by standard "undefined" (Error Handling section collapsed to one
  sentence, spec got simpler). Behavior categories (defined /
  implementation-defined / undefined / runtime error) introduced in
  E3_SPEC.md instead.
- E3_SPEC.md completed (merged into user's draft): behavior categories,
  type-error semantics, case-guard truthiness (only int-as-bool bridge),
  Euclidean div with /0 = 0, e2 deviation noted. Draft said &&/|| are
  short-circuiting but interpreters were eager — implemented short-circuit
  in e3peg/e4peg to match spec (observable via type errors); tests added.

- Runtime type errors in e3peg/e4peg (decision 2026-06-11): ill-typed ops
  (bool in arithmetic, ! on int, applying non-closure, mixed ==) print
  "Type error: ..." and halt, replacing silent VInt(0)/VBool(False)
  defaults. Bool == bool now works (was swallowed). Case-guard truthiness
  kept (e2 idiom). Implemented via type-error ctl effect + exec-safe
  returning maybe<env>. Negative tests in e3/e4 test scripts.
- Fix e4 grammar: (e) was a 1-element array, making grouping inexpressible
  (exposed by the type-error change: "(2 + 3) * 4" was garbage). Array
  literals now require a ";": (a) is grouping, (a;) an array.

- efuzz Phase 2 (docs/FUZZING.md): e2 differential fuzzing
  - efuzz [seed] [size] 2: case stmts (guard arms), * / % (Euclidean,
    /0 = %0 = 0 per pegeval), comparisons in guard position only,
    early-break loop arms, magnitude-guarded regeneration (cap 10^60)
  - fuzz/e2_diff.sh: //fuzz:diff_e2 diffs e2peg+e3peg vs expected;
    //fuzz:efuzz_e2_smoke sh_test
  - 350 e2 seeds + 100 e1 regression seeds: 0 mismatches
  - Found: e2→e3 syntactic-but-not-semantic superset (cmp → 1/0 vs
    true/false; added to DESIGN.md deviations); e3peg bool-in-arithmetic
    silently 0 (open question)

- Resolve superset question: claim revised to "almost a strict superset"
  (user decision 2026-06-11). break_ifz stays out of e2+ ("effective at e1,
  too ugly higher up"); e4 scrutinee-case found as second deviation (e2/e3
  guard-style `case { }` does not parse at e4; e2→e3 verified to hold).
  Documented in DESIGN.md "Superset deviations", README, FUZZING.md
- Env: container upgraded (125 GB RAM, 16 cores, git/diffutils/sudo);
  parallel Koka builds no longer OOM — --jobs=1 workaround obsolete

- efuzz Phase 1 (docs/FUZZING.md): e1 differential fuzzing
  - src/efuzz.koka: random well-defined e1 programs (counter-down loops,
    if-patterns, fully-parenthesized exprs since +/- associativity is
    implementation-defined) with co-evaluated expected output emitted as
    `// expect:` comments
  - fuzz/e1_diff.sh: //fuzz:diff runs e1, e1_koka, e1peg, LLVM-JIT (via
    hermetic lli) + e1_compile emit check vs expected; failures saved to
    fuzz-failures/. //fuzz:efuzz_smoke = 10-seed sh_test (passes in ~1s)
  - 180 seeds (sizes 15-40): 0 mismatches
  - Env note (Fedora Rawhide container): lacks git and diffutils; parallel
    Koka compiles get OOM-killed — use bazel build --jobs=1 for Koka targets

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
