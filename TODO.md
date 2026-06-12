# TODO

## Next

- Implement e5peg interpreter (records, unit)
- Implement e6peg interpreter (static typing). New efuzz oracle:
  well-typed-by-construction programs must type-check; ill-typed mutants
  must be rejected
- efuzz Phase 3 (docs/FUZZING.md): e3/e4 generators — booleans, closures
  (bounded depth), case expressions, arrays/patterns; would exercise the
  `nomatch` and `oob` violation kinds the enforce oracle doesn't yet see
- efuzz Phase 4: mutator (semantics-preserving transforms), reducer,
  PEG `--stats` fuel-regression mode
- Restructure directories by language level (e0/, e1/, ... + shared/)

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
