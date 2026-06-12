# PL/0 Exploration

[![CI](https://github.com/PatrikHagglund/pl0e/actions/workflows/ci.yml/badge.svg)](https://github.com/PatrikHagglund/pl0e/actions/workflows/ci.yml)

This project explores the design and implementation of simple programming languages, inspired by Niklaus Wirth's [PL/0](https://en.wikipedia.org/wiki/PL/0).

**Current state:**

Currently in an initial work-in-progress state.
- e1 has a [language specification](docs/E1_SPEC.md), two [Koka](https://koka-lang.github.io/) interpreters (AST-based and [PEG](https://en.wikipedia.org/wiki/Parsing_expression_grammar) with actions), a C++ interpreter, and a C++ compiler (with C++ and LLVM IR backends)
- e0, e2, e3, and e4 have PEG interpreters in Koka; e3 has a [language specification](docs/E3_SPEC.md)
- Benchmarks for levels 1, 2, and 3
- e5 and e6 have PEG grammars and example files, but no interpreters yet
- For each level, example code shows how to emulate higher-level features with lower-level primitives
- `efuzz`: differential fuzzer for e1 and e2 — generates random well-defined programs with known output and diffs implementations (see [docs/FUZZING.md](docs/FUZZING.md))

**Philosophy:**
- Keep languages small
- Progressive complexity — currently seven levels (e0–e6), each almost a strict superset of the previous
- Try several implementation approaches

The "e" in e0–e6 may stand for "experiment" or "exploration".

## Quick Start

```bash
./setup.sh        # Install Bazelisk

bazel run //src:e1 -- examples/factorial.e1      # C++ interpreter
bazel run //src:e1peg -- examples/factorial.e1   # Koka PEG interpreter
bazel run //examples:factorial_cpp               # C++ backend
bazel run //examples:factorial_llvm              # LLVM backend
bazel test //test:all                            # Run tests
bazel run //bench:bench                          # Run benchmarks
bazel run //fuzz:diff -- -- 100 1 30             # Differential fuzzing (e1)
bazel run //fuzz:diff_e2 -- -- 100 1 30          # Differential fuzzing (e2: e2peg vs e3peg)
```

Uses hermetic LLVM and Koka toolchains. See [docs/BAZEL.md](docs/BAZEL.md) for details.

## Grammar Levels

| Version | Types | Features |
|---------|-------|----------|
| e0 | ℤ | sequential only, + - (not Turing-complete) |
| e1 | ℤ | + loop, break_ifz (Turing-complete, Minsky machine) |
| e2 | ℤ | + case statements, break, blocks, comparisons, `*` `/` `%` |
| e3 | ℤ, 𝔹, () → T | + booleans, callables, case expressions |
| e4 | ℤ, 𝔹, [T], () → T | + arrays, pattern matching |
| e5 | ℤ, 𝔹, [T], {…}, () → T, unit | + records, unit literal |
| e6 | ℤ, 𝔹, [T], {…}, () → T, unit | + static typing, type definitions |

Each level is almost a strict superset of the previous — the deliberate deviations (e.g. `break_ifz` dropped at e2+) are documented in [docs/DESIGN.md](docs/DESIGN.md).

## Examples

- [example.e0](examples/example.e0) — Sequential computation (e0)
- [factorial.e1](examples/factorial.e1) — Factorial benchmark (e1)
- [collatz.e1](examples/collatz.e1) — Collatz sequence iteration (e1)
- [gcd.e1](examples/gcd.e1) — Euclidean algorithm (e1)
- [example.e1](examples/example.e1) — Emulating e2 features in e1
- [factorial.e2](examples/factorial.e2) — Factorial benchmark (e2)
- [collatz.e2](examples/collatz.e2) — Collatz sequence (e2)
- [gcd.e2](examples/gcd.e2) — Euclidean algorithm (e2)
- [factorial.e3](examples/factorial.e3) — Factorial benchmark (e3)
- [collatz.e3](examples/collatz.e3) — Collatz sequence (e3)
- [gcd.e3](examples/gcd.e3) — Euclidean algorithm (e3)
- [example.e4](examples/example.e4) — Arrays and pattern matching (e4)
- [factorial.e4](examples/factorial.e4) — Factorial benchmark (e4)
- [collatz.e4](examples/collatz.e4) — Collatz sequence (e4)
- [gcd.e4](examples/gcd.e4) — Euclidean algorithm with arrays (e4)

## Implementations

| Approach | Files | Notes |
|----------|-------|-------|
| Koka (hand-written parser) | `e1.koka` | AST used|
| Koka (PEG meta-interpreter) | `peg.koka`, `e1peg.koka` | Single-phase parse+execute, no AST |
| Koka (PEG, e2) | `peg.koka`, `e2peg.koka` | e2 with case/comparisons/mul-div |
| Koka (PEG, e3) | `peg.koka`, `e3peg.koka` | e3 with booleans/closures |
| Koka (PEG, e4) | `peg.koka`, `e4peg.koka` | e4 with arrays/pattern matching |
| C++ interpreter | `e1.cpp`, `e1.hpp` | Handwritten, AST used |
| Compiler in C++ | `e1_compile.cpp`, `e1.hpp` | C++ or LLVM IR backend |

See [docs/IMPLEMENTATIONS.md](docs/IMPLEMENTATIONS.md) for details on each implementation.

## Benchmarks

```bash
bazel run //bench:bench                          # default: 2000 iterations of 31!
bazel run //bench:bench -- 100 20                # custom: 100 iterations of 20!
```

Example results for `2000 31` (with bigint, INT_BITS=0):

| Implementation | Time |
|----------------|------|
| LLVM backend | 16ms |
| C++ backend | 18ms |
| LLVM JIT | 80ms |
| Koka PEG e2 | 0.18s |
| C++ interpreter | 0.97s |
| Koka interpreter | 1.75s |
| Koka PEG e1 | 1.95s |

## Further Reading

- [docs/DESIGN.md](docs/DESIGN.md) — Language progression rationale, control flow design decisions
- [docs/E1_SPEC.md](docs/E1_SPEC.md), [docs/E3_SPEC.md](docs/E3_SPEC.md) — Language specifications (e1: minimal; e3: introduces behavior categories)
- [docs/IMPLEMENTATIONS.md](docs/IMPLEMENTATIONS.md) — Implementation details, integer bit width configuration
- [docs/PEG_SPEC.md](docs/PEG_SPEC.md) — PEG grammar specification, static analysis (`--warn` flag)
- [docs/FUZZING.md](docs/FUZZING.md) — `efuzz`, a differential fuzzing tool adapted from llvm-fuzzgen (Phases 1-2: e1, e2)
- [docs/minimal_turing_languages.md](docs/minimal_turing_languages.md) — Survey of minimal Turing-complete languages (Minsky machines, λ-calculus, etc.)
- [examples/](examples/) — All example programs for each language level


