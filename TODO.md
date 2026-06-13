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
- ~~Koka-next compatibility~~ resolved: the issue was the `.koka` file
  extension, not module headers — koka 3.2.3+ resolves imports only as
  `.kk`. All Koka sources renamed to the official `.kk`; hermetic
  toolchain bumped to 3.2.3; --config=koka-local now covers all targets
- Make rules_koka more bazel-native (stdlib recompiled per action). Each
  koka_binary action recompiles ~25 stdlib modules (~10s; 10 koka targets
  => ~100s redundant per clean build) because it runs in a fresh mktemp
  builddir. Investigation (2026-06-13):
  - Shipped distro has a precompiled stdlib (lib/koka/<ver>/gcc-release/,
    165 .kki + 168 .o) but our hermetic clang `--cc` + -O3 yields a
    different variant (`<cc>-drelease-<hash>`), so it is not reused.
  - A shared, WRITABLE --builddir reuses the stdlib: 13.7s cold -> 1.5s
    warm (~9x). A read-only --libdir does NOT (recompiles anyway).
  - Blocker: the variant hash embeds the full `--cc` path. Same wrapper
    basename + byte-identical content in different dirs => different hash
    => no reuse. Bazel's per-action mktemp sandboxes guarantee mismatch.
  - Plan: (1) make the clang wrapper a tracked file at a stable
    execroot-relative path (toolchain dirs passed via env, not baked), so
    every action passes an identical `--cc` string; (2) a koka_stdlib
    action prebuilds the stdlib into a builddir TreeArtifact; (3)
    koka_binary copies that in (cheap) and compiles only user modules.
    Medium-risk rules_koka rewrite; current build is green, so do it
    behind verification.
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
