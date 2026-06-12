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
- efuzz Phase 4: mutator (semantics-preserving transforms), reducer,
  PEG `--stats` fuel-regression mode (first candidate: e4peg takes >10s
  on some generated programs — see docs/FUZZING.md findings)
- Koka specializer loop: reported and fixed in ../koka (dev branch, see
  SPECIALIZER-LOOP-REPORT.md there). Fix verified against pl0e:
  `bazel build --config=koka-local //src:efuzz` (new NON-HERMETIC local
  toolchain override, KOKA_LOCAL_PATH in .bazelrc) compiles at -O3 with
  specialization in ~24s and produces byte-identical fuzz output. Once the
  fix ships in a release, bump KOKA_VERSION in rules_koka and drop the
  --fno-specialize workaround from //src:efuzz; consider upstreaming the
  fix to koka-lang/koka if not already done
- Koka-next compatibility: koka 3.2.7-dev no longer resolves our
  `import src/peg` against `module peg` headers (3.2.2 tolerated the
  mismatch), so multi-module targets (PEG interpreters) do not build with
  --config=koka-local yet. Align module headers/import paths with the
  next Koka release's resolution rules when upgrading
- Restructure directories by language level (e0/, e1/, ... + shared/)
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
