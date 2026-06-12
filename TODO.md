# TODO

## Next

- Implement e6peg interpreter (static typing). New efuzz oracle:
  well-typed-by-construction programs must type-check; ill-typed mutants
  must be rejected
- e5 deferred design questions (from the pre-implementation e5.peg draft,
  saved decisions for later): tuples `(a, b)`, optional case scrutinee,
  block-as-expression (trailing expression value), lvalue assignment paths
  (`rec.field := e`, `arr.0 := e`)
- efuzz Phase 3c: extend the generator to e5 (records in the value domain,
  record patterns, field access; `nofield` as a violation kind candidate)
- efuzz Phase 4: mutator (semantics-preserving transforms), reducer,
  PEG `--stats` fuel-regression mode (first candidate: e4peg takes >10s
  on some generated programs — see docs/FUZZING.md findings)
- Report the Koka specializer loop upstream (koka-lang/koka): compiling
  efuzz's effect-polymorphic co-evaluator at -O1+ dumps endless
  "specialize: specInnerCalls" core traces; reproduces in v3.2.2 and
  v3.2.3; workaround --fno-specialize (rules_koka koka_opts)
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
