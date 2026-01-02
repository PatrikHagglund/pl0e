# PL/0 Implementations

Interpreters and compilers for PL/0 level 1.

## Overview

| Implementation | Language | Type | Phases | Integer Support |
|----------------|----------|------|--------|-----------------|
| `pl01.koka` | Koka | Interpreter | 2 | Koka bigint |
| `pl0peg1.koka` | Koka | Interpreter | 1 | Koka bigint |
| `pl0_1.cpp` | C++ | Interpreter | 2 | Configurable |
| `pl0_1_compile.cpp` | C++ | Compiler | 2 | Configurable |

## Language Implementation Configuration

Configured in `src/pl0_1.hpp` (C++ implementations only):

| Parameter | Default | Description |
|-----------|---------|-------------|
| `INT_BITS` | 0 | Integer bit width (0=bigint, 32/64/128=native, >128=Boost fixed) |
| `ARG_COUNT` | 2 | Number of built-in `arg<N>` variables (arg1, arg2, ...) |

## Interpreters

### `pl01.koka` — Two-Phase Koka Interpreter

Traditional architecture: parse entire program, then execute.

```
src/
  pl01.koka        — Main entry
  pl01-types.koka  — AST types, environment
  pl01-parser.koka — Recursive descent parser
  pl01-eval.koka   — Evaluator with effect handlers
```

**Flow:** `Source → [Parse] → AST → [Execute] → Result`

```bash
make koka-pl0
```

### `pl0peg1.koka` — Single-Phase Koka Interpreter

No AST — semantic actions execute during parsing, producing thunks.

```
src/
  pl0peg1.koka — Semantic actions
  peg.koka     — Generic PEG parser
  pl0_1.peg    — Grammar file (loaded at runtime)
```

**Flow:** `Source → [Parse+Actions] → Thunks → [Execute] → Result`

Uses packrat memoization to avoid exponential backtracking.

```bash
make koka-peg
```

### `pl0_1.cpp` — C++ Interpreter

Hand-written lexer and recursive descent parser, AST-based execution.

```bash
make run
```

## Compilers

### `pl0_1_compile.cpp` — C++ Compiler

Two backends from a single compiler:

| Backend | Output | Bigint Support |
|---------|--------|----------------|
| C++ (default) | `.cpp` file | Via Boost headers |
| LLVM IR (`--llvm`) | `.ll` file | Via `pl0_1_rt_bigint.bc` |

**C++ backend:**
```bash
./pl0_1_compile prog.pl0 > out.cpp
g++ -std=gnu++26 -O3 out.cpp -o out
```

**LLVM backend:**
```bash
./pl0_1_compile --llvm prog.pl0 > prog.ll
llvm-link prog.ll src/pl0_1_rt_bigint.ll -S -o out.ll
clang++ -O3 out.ll -o out        # native
lli -load /lib64/libstdc++.so.6 out.ll  # JIT
```

### LLVM Bigint Runtime (`src/pl0_1_rt_bigint.ll`)

When `INT_BITS=0` (bigint), the LLVM backend uses an external runtime for arbitrary-precision arithmetic. The runtime is compiled from C++ using Boost.Multiprecision.

**Exported functions:**

| Function | Purpose |
|----------|---------|
| `bi_new(i64) → ptr` | Allocate new bigint from i64 |
| `bi_from_str(ptr) → ptr` | Parse string to bigint |
| `bi_add(ptr, ptr) → ptr` | Add, return new allocation |
| `bi_sub(ptr, ptr) → ptr` | Subtract, return new allocation |
| `bi_neg(ptr) → ptr` | Negate, return new allocation |
| `bi_is_zero(ptr) → i32` | Test if zero (for `break_ifz`) |
| `bi_print(ptr)` | Print to stdout |
| `bi_set(ptr, ptr)` | Copy value in-place |
| `bi_set_i(ptr, i64)` | Set from i64 in-place |
| `bi_add_to(ptr, ptr)` | Add in-place (`dst += src`) |
| `bi_sub_to(ptr, ptr)` | Subtract in-place (`dst -= src`) |
| `bi_neg_in(ptr)` | Negate in-place |

**In-place optimization:** The compiler uses `bi_set`/`bi_add_to`/`bi_sub_to` for assignments when safe (destination doesn't appear multiple times in RHS), reducing heap allocations in hot loops.

**System dependencies:**
- `operator new` / `operator delete` — heap allocation
- `std::cout` — printing
- `std::string` — argument parsing
- `abort` — error handling

**LTO note:** Link-time optimization (`-flto` or `opt -O3`) provides minimal benefit (~3%) because Boost's `cpp_int` inherently requires heap allocation for arbitrary-length storage. The ~4x gap vs C++ backend is due to the C++ compiler seeing the full Boost internals and reusing stack space, while LLVM sees opaque runtime calls.

```bash
make run-compile      # C++ backend
make run-llvm         # LLVM JIT
make run-llvm-native  # LLVM native
```

## Koka Effect Handlers

Both Koka interpreters use algebraic effects for `break`:

```koka
effect loop-break
  ctl do-break(e: env): a

fun exec-loop(e: env, body: stmt): <loop-break, div> env
  with ctl do-break(e1) e1
  val e2 = exec(e, body)
  exec-loop(e2, body)
```

## Benchmarks

```bash
make bench-1                        # default: 2000 iterations of 31!
make bench-1 BENCH_1_ARGS="100 20"  # custom args
```

Example results for `2000 31` (bigint):

| Implementation | Time |
|----------------|------|
| C++ backend -O3 | 17ms |
| LLVM IR backend -O3 | 64ms |
| LLVM IR backend -O0 | 104ms |
| LLVM IR backend lli (JIT) | 194ms |
| C++ interpreter | 0.7s |
| Koka interpreter | 1.9s |
| Koka interpreter (PEG) | 2.3s |
