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
  SPECIALIZER-LOOP-REPORT.md there). Once the fix ships in a release (or
  the hermetic toolchain points at a patched build), drop the
  --fno-specialize workaround from //src:efuzz and re-verify at -O3;
  consider upstreaming the fix to koka-lang/koka if not already done
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
