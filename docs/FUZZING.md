# Fuzzing: Adapting llvm-fuzzgen to eN

Status: Phase 1 implemented (e1 generator + diff driver). Phases 2-4 planned.

## Usage

```bash
bazel run //fuzz:diff                        # e1: 20 seeds, size 20
bazel run //fuzz:diff -- -- 100 1 40        # e1: 100 seeds starting at 1, size 40
bazel run //fuzz:diff_e2 -- -- 100 1 30     # e2: e2peg vs e3peg vs expected
bazel test //fuzz:efuzz_smoke //fuzz:efuzz_e2_smoke   # quick CI checks
bazel run //src:efuzz -- 42 20 2            # print one generated program (level 2)
```

`//src:efuzz` prints a random well-defined e1 program with its expected
output as trailing `// expect:` comments (the output is itself a valid e1
program). `//fuzz:diff` runs each program on the C++ interpreter, the Koka
AST interpreter, the Koka PEG interpreter, and the compiled-LLVM pipeline
(e1_compile --llvm → llvm-link with the bigint runtime → lli JIT), checks
the C++ backend emits without error, and compares every output against the
generator's prediction. Failing programs and outputs are saved to
`fuzz-failures/`.

## Findings so far

- **The level progression is "almost" a strict superset (resolved: claim
  revised).** Differential fuzzing surfaced two deviations, now documented
  as deliberate in [DESIGN.md](DESIGN.md):
  - e2/e3/e4 dropped `break_ifz` (superseded by `case` + `break`), so e1
    programs with loops do not parse at level 2+.
  - e4 `case` requires a scrutinee (for pattern matching), so e2/e3
    guard-style `case { ... }` programs do not parse at level 4.

  Resolution: the README/DESIGN claim was revised to "almost a strict
  superset" rather than changing the grammars (`break_ifz` is effective at
  the e1 level but too ugly to carry into higher levels). Consequence for
  the diff matrix: e1 programs run only on e1 implementations; Phase 2 e2
  programs can additionally run on e3peg (e2 → e3 holds: all e2 examples
  run unchanged) but not on e4peg.

- **e2 → e3 is a syntactic but not semantic superset** (found by Phase 2,
  17/20 first-run seeds diverged). Comparisons yield `1`/`0` at e2 but
  `true`/`false` at e3, so `print (a < b)` or arithmetic on a comparison
  result differs across the two levels. Comparisons used purely as `case`
  guards agree. The generator therefore emits comparisons only in guard
  position; now documented in DESIGN.md "Superset deviations".

- **e3peg evaluated booleans as 0 in arithmetic** instead of raising an
  error: `(3 < 5) + 1` was `2` at e2 but `0` at e3peg. Resolved (decision
  2026-06-11): ill-typed operations in e3peg/e4peg are now runtime type
  errors ("Type error: '+' on bool and int") that halt the program. Bool
  equality (`==`/`!=` on two bools), previously swallowed by the same
  catch-all, now works. Case guards still accept truthy ints (e2 idiom).
  Unbound variables still silently evaluate to 0 — separate open question.

- **e4 had no expression grouping**: `(e)` parsed as a 1-element array, so
  `print (2 + 3) * 4` computed garbage (silently, pre-type-errors). Exposed
  immediately by the type-error change. Fixed in e4.peg: an array literal
  now requires at least one `;` (`(a)` is grouping, `(a;)` a 1-element
  array), matching the grammar's own comment.

## Background

`llvm-fuzzgen` (llvm-project, branch `iso/uabpath/fuzzgen`,
`llvm/tools/llvm-fuzzgen/`) is a target-aware random program generator
for testing LLVM backends. Its core ideas transfer directly to this
repo; its LLVM-specific machinery does not.

### Ideas worth porting

1. **Generation by construction, not grammar inversion.** Programs are
   built from a small model (statements over tracked variables), not by
   randomly expanding the grammar. This makes well-definedness a
   construction invariant instead of a post-hoc filter.
2. **Co-evaluation (concrete value tracking).** The generator evaluates
   every expression as it emits it, so it always knows each variable's
   value. This gives:
   - UB-freedom: divisors are known non-zero, array indices known
     in-bounds, `break_ifz` conditions known to eventually fire.
   - A free **ground-truth oracle**: the generator knows the expected
     `print` output, so even a single implementation can be checked
     (catches "all implementations wrong the same way", which pure
     differential testing misses).
3. **Self-checking accumulator.** XOR/sum all generated values into one
   accumulator that is printed at the end, so every computation affects
   the observable output.
4. **Feature flags matching development phases.** fuzzgen's
   `--no-control-flow` / `--no-memory` / `--no-calls` map onto something
   we already have: the **language levels themselves**. `--level=eN` is
   the natural restriction flag.
5. **Determinism** (`--seed`), **batch mode** (`--count`, parallel
   workers), **auto-reduction** of failing cases.
6. **Mutator** (semantics-preserving transforms) — later phase.

### What does NOT transfer

- TargetLowering/DataLayout queries (no targets here; levels replace them).
- Fork-isolated in-process codegen (we run separate interpreter binaries).
- nuw/nsw, vectors, atomics, volatile (no such constructs in eN).

## Why this fits pl0e unusually well

- **Many executors per program.** An e1 program can run on the C++
  interpreter, the Koka AST interpreter, e1peg, the compiler's C++ and
  LLVM backends, and the LLVM JIT — and, because each level is a strict
  superset, also on e2peg/e3peg/e4peg. One generated e1 program ⇒ ~9
  independent results to compare. The superset property gives
  cross-level differential testing for free.
- **Arbitrary-precision integers.** Co-evaluation in Koka is exact for
  ℤ (no overflow modelling needed). It also exercises the bigint
  runtime and `INT_BITS` configurations in the compiled backends.
- **PEG performance fuzzing.** Generated programs are adversarial
  inputs for the PEG grammars: running them under `--stats` can flag
  pathological backtracking/fuel consumption that hand-written examples
  never trigger.

## UB surface per level (what the generator must guarantee)

| Level | Hazard | Guarantee by construction |
|-------|--------|---------------------------|
| e0+ | unbound variables | only reference already-assigned names |
| e1+ | non-terminating `loop` | counter-down loop pattern with tracked counter; `break_ifz` guaranteed to reach 0 |
| e2+ | `/` `%` by zero | divisor's tracked value ≠ 0 (else emit literal) |
| e2+ | nested `break` semantics | generate breaks only where the target loop is known |
| e3+ | unbounded recursion via callables | bounded call depth; closures capture tracked values |
| e4+ | out-of-bounds index | index expression's tracked value within tracked array length |
| e4+ | non-exhaustive `case` patterns | always include a catch-all `_` arm or cover the tracked value |

## Tool design: `efuzz`

A Koka program (`src/efuzz.koka`) plus a small driver (`fuzz/e1_diff.sh`).

```
efuzz [seed] [size]        # implemented (e1 only)
```

Future flags: `--level=e0..e4`, `--mode=emit|diff`.

- **Generator core**: statement list over an environment of tracked
  variables `(name, concrete value)`. Each step picks a construct legal
  at `--level`, emits source text, and updates tracked values.
  Accumulator variable summed/XORed throughout, `print acc` at the end.
- **emit mode**: print program to stdout; expected output as a trailing
  comment (`// expect: 12345`).
- **diff mode** (driver): run the program on every implementation valid
  for its level (and all higher-level PEG interpreters), compare all
  outputs against each other **and** against the generator's predicted
  value. Report mismatches, crashes, and non-zero exits with the seed.
- **Driver**: shell script or Bazel `sh_binary` (`//fuzz:diff`)
  following the pattern of `bench/`; takes `--count` and a seed range,
  loops seeds. Parallelism via `xargs -P` is sufficient (interpreter
  runtime dominates, not generation).
- **Reduction**: on mismatch, drop statements one at a time and
  re-co-evaluate (the generator recomputes the expected value for the
  reduced program); keep the drop if the mismatch persists. Far simpler
  than llvm-reduce because programs are flat statement lists with
  block structure.

## Phasing

1. **Phase 1 — e1 generator + diff driver.** ✅ Done. Ints, `+`/`-`,
   assignment, bounded `loop`/`break_ifz` (counter-down and if-patterns),
   declarations, `print`, self-checking accumulator, fully-parenthesized
   expressions. Smoke target in `bazel test` (10 seeds); large runs via
   `bazel run //fuzz:diff`. Cross-level diffing blocked on the superset
   finding above.
2. **Phase 2 — e2 constructs.** ✅ Done (`efuzz [seed] [size] 2`,
   `bazel run //fuzz:diff_e2`). `case` statements (guard arms), `*` `/` `%`
   (Euclidean; `/0`/`%0` erroneous with fallback 0, per E3_SPEC.md),
   comparisons in guard position only (see findings), data-dependent
   early-break loop arms, and magnitude-guarded regeneration (values capped
   at 10^60 since multiplication inside loops can explode; checked during
   co-evaluation — repeated squaring would otherwise hang the generator).
   Diffs e2peg and e3peg against the co-evaluated expected output.

   **Enforce-mode oracle (bidirectional).** The co-evaluation records
   whether an erroneous construct actually fires and emits it as a
   `// violations: none|div0` marker. The driver then asserts both
   directions against `e3peg --enforce`: a clean program must run without
   tripping any violation (a spurious `Violation:` line is a checking-
   machinery bug), and a div0-marked program must halt with
   `Violation (div0)` (a missed violation is too). This tests the
   violation checking itself, not just value agreement.
3. **Phase 3 — e3/e4.**
   - **e3** ✅ Done (`efuzz [seed] [size] 3`, `bazel run //fuzz:diff_e3`).
     Typed generation (int/bool/closure variables — programs are
     well-typed by construction since type errors halt), booleans with
     short-circuit `&&`/`||`, comparisons as first-class bool values,
     closures (1-2 int params, capture-at-creation, applications;
     closures never flow as arguments, so self-application — the only
     route to divergence without loops — is impossible), and guard-style
     case expressions, which can fail to match: the `nomatch` violation
     kind joins `div0` in the marker and the bidirectional enforce
     oracle. Found an efuzz printer bug via 10/300 parse failures:
     comparison operands are `sum_expr`, so `a != !b` is ungrammatical
     (now noted in E3_SPEC.md).
   - **e4** ✅ Done (`efuzz [seed] [size] 4`, `bazel run //fuzz:diff_e4`).
     Arrays (literals, dot and dynamic indexing — out-of-bounds deliberately
     generated: `oob` joins the violation kinds), pattern-case statements
     and expressions (exact, prefix, literal, binder patterns; bindings
     persist after statement arms, mirroring e4peg). Level-4 emission uses
     scrutinee cases for loops/ifs since guard-style case is not e4 syntax.
     Findings:
     - **e4 grammar bug (fixed):** `paren_expr` consumed trailing
       whitespace although `atom_raw` must not, so multi-argument
       application with parenthesized arguments (`f (3) (5)`) silently
       split into two statements, and `(f (3) (5))` failed to parse.
     - **Pattern quirk (documented):** e4peg reads *any* trailing
       wildcard element as the prefix marker — `(_;)` matches every
       array, and "exact pattern ignoring the last element" is
       inexpressible. The generator avoids emitting trailing `_` in
       exact patterns.
     - **Performance:** e4peg needs >10s on some generated programs
       (PEG backtracking) — input for the planned `--stats`
       fuel-regression mode.
     - **Koka 3.2.2/3.2.3 specializer loop:** compiling efuzz's
       effect-polymorphic co-evaluator at `-O1`+ sends Koka's
       specializer into a core-dumping loop (hundreds of MB of
       `specInnerCalls` traces). Worked around with a new
       `koka_opts = ["--fno-specialize"]` attribute in rules_koka;
       reproduces in Koka v3.2.3 — worth reporting upstream.
4. **Phase 4 — hardening.** Mutator (semantics-preserving transforms:
   commute operands, split constants, wrap in always-true case) and
   PEG `--stats` fuel-regression mode. CI integration ✅ done:
   `.github/workflows/ci.yml` runs the test suite (incl. both fuzz
   smokes) plus rolling 25-seed e1 and e2 campaigns — seeds derive from
   the CI run number, so coverage accumulates across runs instead of
   re-checking one window; failing programs are uploaded as artifacts.
5. **Later (as e5/e6 interpreters land)** — records/unit, then static
   typing. e6 adds a new oracle: well-typed-by-construction programs
   must type-check; deliberately ill-typed mutations must be rejected.

Note (superset deviations, see above): per-level diff matrices are
e1 → {e1, e1_koka, e1peg, LLVM JIT, cpp-emit}, e2 → {e2peg, e3peg},
e3 → {e3peg}, e4 → {e4peg}.

## Open questions

- Exact accumulator scheme (sum vs XOR-like mixing in ℤ — sum is
  simplest and sufficient since values are exact).
- Whether the driver compares full stdout or only the final printed
  value (full stdout preferred; programs may print multiple times).
- UNCONFIRMED: whether the Koka AST interpreter (`e1.koka`) and PEG
  interpreters agree on `print` formatting (verify in Phase 1).
