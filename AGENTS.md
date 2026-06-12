# Agent Notes

Project overview, goals, and philosophy: [README.md](README.md).
Language-design decisions and rationale: [docs/DESIGN.md](docs/DESIGN.md)
and the specs ([docs/E1_SPEC.md](docs/E1_SPEC.md),
[docs/E3_SPEC.md](docs/E3_SPEC.md)).
Backlog and open questions: [TODO.md](TODO.md).

## Commands

```bash
bazel test //test/... //fuzz/...                 # full test suite
bazel run //src:e1 -- examples/factorial.e1      # run an interpreter
bazel run //fuzz:diff -- -- 100 1 30             # differential fuzzing (e1)
bazel run //fuzz:diff_e2 -- -- 100 1 30          # differential fuzzing (e2)
bazel run //bench:bench                          # benchmarks
```

## Conventions

- Run the test suite before committing.
- Durable state lives in the repo, not in chat: record language-design
  decisions in docs/DESIGN.md or the relevant spec, keep README's feature
  list current, and maintain TODO.md (add follow-ups, prune finished
  items). History belongs in commit messages.
- If parallel Koka compiles get OOM-killed on memory-constrained machines,
  build with `--jobs=2` (CI does, via `--config=ci`).
