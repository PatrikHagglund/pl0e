# TODO

## Next

- efuzz e6 oracle: well-typed-by-construction programs must pass e6peg's
  static checker; ill-typed mutants must be rejected with "Static error"
- e6 design notes to revisit: no recursive types (so the Y combinator does
  not type-check — recursion is loops-only at e6); record types are
  invariant (no width subtyping in expressions, though record *patterns*
  still match extra fields); checker scoping is conservative (variables
  first bound inside loop/case/block bodies are not visible afterwards)
- e5 deferred design questions (from the pre-implementation e5.peg draft,
  saved decisions for later): tuples `(a, b)`, optional case scrutinee,
  block-as-expression (trailing expression value), lvalue assignment paths
  (`rec.field := e`, `arr.0 := e`)
- efuzz Phase 3c: extend the generator to e5 (records in the value domain,
  record patterns, field access; `nofield` as a violation kind candidate)
- ~~efuzz Phase 4 mutator~~ DONE (2026-06-14): semantics+type-preserving
  rewrites (commute commutative binops, flip ordering comparisons, rewrite
  int literals), self-validating (co-eval before/after must match), level-
  safe by construction. `efuzz ... [mutate]` + drivers' 4th MUTATE arg;
  pure+mutated smokes gated, rolling CI campaigns now mutated. 750 mutated
  seeds e1-e4, 0 failures. Remaining Phase 4: reducer to minimize failing
  cases; PEG `--stats` fuel-regression mode. (The original --stats first
  candidate — e4peg exponential paren backtracking — was already fixed by
  left-factoring paren_expr.)
- PEG engine: the action-executing path (peg-exec-*) is NOT memoized
  (only the action-less matcher is), so overlapping-FIRST rules re-parse
  on backtrack. Left-factoring paren_expr fixed the one exponential case;
  a general fix would be packrat memoization of the exec path (parsing is
  side-effect-free here — actions build closures, side effects run at
  exec time — so memoizing parse results should be safe). Bigger change.
- Koka specializer loop: reported and fixed in ../koka (dev branch, see
  SPECIALIZER-LOOP-REPORT.md there). Fix verified against pl0e:
  `bazel build --config=koka-local //src:efuzz` (new NON-HERMETIC local
  toolchain override, KOKA_LOCAL_PATH in .bazelrc) compiles at -O3 with
  specialization in ~24s and produces byte-identical fuzz output. Once the
  fix ships in a release, bump KOKA_VERSION in rules_koka and drop the
  --fno-specialize workaround from //src:efuzz; consider upstreaming the
  fix to koka-lang/koka if not already done
- ~~Koka-next compatibility~~ resolved: the issue was the `.koka` file
  extension, not module headers — koka 3.2.3+ resolves imports only as
  `.kk`. All Koka sources renamed to the official `.kk`; hermetic
  toolchain bumped to 3.2.3; --config=koka-local now covers all targets
- ~~Make rules_koka more bazel-native~~ DONE (2026-06-13): koka_library
  now compiles to a build-dir artifact reused by dependents, so the
  shared peg/pegeval (and stdlib) compile once instead of per target.
  Interpreter rebuild ~3min -> ~1m7s once its library is cached.
  (Investigated stdlib-only reuse first; too small — ~8%/target — and
  reverted, since the per-dependent library recompile was the real cost.)
- Restructure directories by language level (e0/, e1/, ... + shared/)
- rules_cc pinned at 0.2.16 (latest compatible): 0.2.17+ removed targets
  toolchains_llvm_bootstrapped 0.5.9 still references. Bump it when the
  bootstrapped toolchain bumps its own rules_cc dependency.
- Decide: e4 trailing-wildcard pattern quirk — `(_;)` matches any array
  and "exact pattern ignoring the last element" is inexpressible
  (docs/FUZZING.md findings); fine as-is or change pattern syntax?

## Exploration ideas

- Efficient interpreters (Graal/Truffle, simple JIT)
- Standard library?
- Symbolic expressions (computer algebra)?
- Zig/Koru and OCaml as implementation languages
- Rascal and/or K Framework for specifications
- Syntactic sugar via rewrite rules in the PEG eval
- Beads for task tracking
- BuildStream/BuildGrid

## Open questions

(none currently)
