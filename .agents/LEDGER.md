# Ledger

## Goal

Explore the design and implementation of simple languages. Inspired by PL/0.

## Key decisions
- Keep languages small
- PL/0 grammar variants project (e0 through e6)
- Concepts/grammar should be familiar across variants/level
- Koka-based interpreters, C++ interpreter/compiler, and perhaps also other implementation languages

## Additional decisions/constraints/assumptions
- Currently using PEG grammars
- Each language level/variant should have an code example file.
    - This example file should: 1) Demonstrate new functionality if not done by step 2. 2) Demonstrate how to express/encode features from the next level using only the current level's primitives (if possible).

## State
- Files organized into `src`, `examples`, `docs`, `test`, and `old`.
- Grammars reside in `src/`.
- e0 has a grammar (13 lines) and minimal interpreter (`e0peg.koka`, 99 lines)
- e1 has a grammar and working interpreters/compilers:
  - `e1peg.koka` (382 lines) — single-phase PEG interpreter
  - `e1.koka` — two-phase Koka interpreter
  - `e1.cpp` — C++ interpreter
  - `e1_compile.cpp` (112 lines) — unified C++/LLVM compiler
- Stack-based bigint runtime (`e1_rt_bigint_stack.cpp`) — no heap allocation
- C++ implementations support configurable integer widths via `e1.hpp`
- Factorial benchmark: C++ backend 17ms, LLVM backend 17ms, lli 77ms
- Bazel build system with hermetic toolchains (LLVM, Koka) — no system compiler required
- Other levels (e2 through e6) have PEG grammars and examples but no interpreters

## Next
- Harden PEG interpreter against infinite loops:
  1. ~~Progress check in all `PStar`/`PPlus` variants~~ ✓ Done
  2. ~~Add fuel counter to `peg-exec-match` that fails after N operations~~ ✓ Done
  3. ~~Left recursion detection~~ ✓ Done
  4. Nullable loop detection (`e*`/`e+` where `e` can match empty)
- ~~Fix underlying e3 grammar issue with `func_lit` + parenthesized expressions~~ ✓ Done
- Future PEG improvements:
  - ~~Memoization for semantic actions (packrat parsing)~~ ✓ Done (but doesn't fix lookahead backtracking)
  - Fix e3 grammar exponential backtracking on `((x) -> x) (1)` patterns
    - Issue: lookahead in `expression` rule causes exponential backtracking
    - Memoization doesn't help because backtracking happens inside lookahead, not at rule boundaries
    - Options: refactor grammar, memoize inside lookahead patterns, or different closure parsing strategy
  - Factor out common prefixes in grammar (e.g., cmp_expr alternatives)
  - Ambiguity detection
  - Fuel usage statistics
- Create proper `rules_koka` for Bazel
  - Add `koka_library` rule (compile to `.kki` interface files)
  - Proper dependency tracking (per-file actions instead of rebuilding all together)
  - Toolchain abstraction (`toolchain_type` + `koka_toolchain` for multi-platform)
  - macOS/Windows platform support
  - `koka_test` rule
  - Challenge: Koka's incremental build (`.koka/` dir) vs Bazel's action model
- Restructure directories by language level (e0/, e1/, e2/, ... + shared/)
  - Each level gets its own directory with grammar, implementations, examples, docs
  - Shared code (peg.koka, bigint runtime) in shared/
  - Pros: clear ownership, easier to add levels, level-specific docs with code
  - Cons: more directories, Makefile complexity
  - Consider hybrid: keep src/ flat, split examples by level
- Support for "syntactic sugar"?
- Explore papers about efficient interpreters.
  - Test Graal/Truffle
  - Plan some adoptions towards a more efficient implementation
  - Simple JIT?
- Continue with other grammar/interpreter work
- Standard library?
- Support for symbolic expressions (as in computer algebra systems)?
- Testing with a tool like csmith/llvm-stress (and creduce/llvm-reduce)
- Perhaps a seprate project: "Agent DSL": Use LLMs and tools as operators and add memory and parallel control flow. VALIDATE/RETRY clause. Linda-style parallelism for sharing context information?

## Now

### Working set (current focus only; replace/prune as "Now" changes)

(No active task)

## Done (prune when exceeding 30 items)
- Added memoization for PEG semantic-action mode (`peg-exec-memo`, `peg-exec-partial-memo`)
  - Caches at rule boundaries (packrat-style)
  - Threads memo table functionally through execution
  - Updated docs/PEG_SPEC.md with API documentation
  - Note: doesn't fix `factorial_y.e3` — exponential backtracking happens inside lookahead patterns, not at rule boundaries
- Fixed Bazel build for C++ targets:
  - Installed system dependencies: glibc-devel, libstdc++-devel, gcc, g++
  - Configured `e1_rt_bigint_ll` genrule with `local = True` to access system headers
  - Configured `e1_llvm_binary` macro with `-fuse-ld=lld` and `local = True`
  - Working: C++ interpreter (`//src:e1`), compiler (`//src:e1_compile`), all C++/LLVM backend examples
  - Working test: `//test:e1_interp_test` (PASSED)
- Hermetic Koka toolchain for Bazel (`koka.bzl`):
  - Downloads Koka v3.2.2 automatically (no system install needed)
  - Uses hermetic Clang from toolchains_llvm_bootstrapped
  - `koka_binary` rule with -O2 optimization
  - PEG interpreters: `//src:e0peg`, `//src:e1peg`, `//src:e2peg`, `//src:e3peg`
  - Hand-written interpreter: `//src:e1_koka`
  - PEG parser tests: `//test:peg_test`
- Added Bazel Koka target (`//src:e1peg`) using genrule with system koka
  - Copies files to temp dir to avoid Koka's symlink resolution issues
  - Multi-step compilation: peg.koka → pegeval.koka → e1peg.koka
  - Added `--action_env=PATH` to .bazelrc for Koka access
  - Restored Koka installation to setup.sh (installs to ~/.local/bin)
- Bazel build system prototype (`bazel-prototype` branch):
  - Bazel 9.0.0 with bzlmod (rules_cc 0.2.16, rules_shell 0.6.1)
  - Hermetic LLVM toolchain (toolchains_llvm_bootstrapped 0.4.1, Clang 21)
  - C++ interpreter/compiler targets, LLVM IR runtime generation
  - Macros `e1_cpp_binary` and `e1_llvm_binary` for compilation pipelines
  - Tests (`//test:e1_interp_test`) and benchmarks (`//bench:bench`)
  - Bazelisk installation in setup.sh
- Completed e2 and e3 interpreters and grammars
- Created e2peg.koka interpreter with case/break/comparison/mul-div support
- Added inline actions to e2.peg grammar
- Fixed PPlus in peg.koka to collect all children (was only keeping first)
- Added Makefile targets: koka-peg2, src/e2peg, bench (renamed from bench-1)
- Created e2 examples: factorial.e2, gcd.e2, collatz.e2
- Updated README.md and docs/IMPLEMENTATIONS.md with e2 info
- Renamed pl0_N languages to eN ("e" for experiment/exploration)
  - Renamed all files: .peg, .cpp, .hpp, .koka, docs
  - Updated all references in docs, examples, and source
- Added inline action support for suffix operators (*, +, ?)
  - `{ Block }` at end of sequence wraps star's children
  - Action table now empty — all semantics via inline actions + default-action
  - Documented future fold syntax consideration in PEG_SPEC.md
- Added inline actions to PEG grammar with expression language
  - Syntax: pattern { Cons($capture) }
  - Moved int_lit, ident, binding, print, break, loop to inline actions
  - Semantics now partially in grammar, not just Koka code
- Added named captures to PEG (`n:pattern` syntax) for binding sub-matches
- Created `docs/E1_SPEC.md` — language specification for e1
- Added error handling section to `docs/IMPLEMENTATIONS.md`
- Explored parse errors in dead code (`examples/test_dead_code*.e1`):
  - C++ interpreter is STRICT: tokenizes all → parses all → executes (fails on any invalid char)
  - Koka interpreters are LENIENT: tolerate trailing garbage
  - e1 uses `many(pstmt)` which silently stops on parse failure
  - e1peg reports parse failure but continues
- How to apply e1.hpp config to Koka: Moved to "Open questions" - not urgent
- Bigint reallocations for assignments: double capacity when too small, renamed runtime files (removed "_stack" suffix)
- Changed stacksave/restore from per-loop to per-allocation
  - Resolves dynamic sizing conflict: restore happens after copy, so variable buffers are safe
  - No performance impact (intrinsics are essentially free)
- Optimized bigint runtime: uint32_t size, bool neg, cleaner code
  - LLVM backend now matches C++ backend (17ms vs 17ms)
- Removed `e1_rt_bigint_stack.ll` from git, added to .gitignore (generated by Makefile)
- Modernized `e1_rt_bigint_stack.cpp` with C++26: auto, std::span, std::ranges, static_cast
- Unified C++/LLVM compiler replacing separate backends:
  - `e1_compile.cpp` (112 lines) + `e1_preamble.hpp` (85 lines)
  - Single `Gen` struct with `L` flag for backend selection
  - Removed old heap-based bigint runtime
- Stack-based bigint runtime (`e1_rt_bigint_stack.cpp`):
  - No heap allocation — all buffers on stack via `alloca`
  - Uses `llvm.stacksave`/`llvm.stackrestore` in loops to prevent stack exhaustion
- Updated docs/IMPLEMENTATIONS.md and README.md with new benchmarks
- Created `docs/DESIGN.md` documenting design decisions
- Aligned e0peg.koka to e1peg.koka structure
- Added `make test` target: 25 tests across 5 implementations
- Fixed e1peg.koka and e1.koka bugs
- Added ARG_COUNT and INT_BITS configuration parameters
- Moved Koka into podman container
- Added `arg1` and `arg2` built-in variables
- Added `bench-1` Makefile target
- Added LLVM IR compiler with configurable bit width
- Added `@tag` syntax to PEG grammar
- Simplified `e0.peg` and `e0peg.koka`
- Renumbered grammar levels: e0..e5 → e1..e6
- True single-phase interpreter: `e1peg.koka`
- Added packrat memoization to `peg.koka`
- Organized project files into `src`, `examples`, `docs` directories
- Created `peg_test.koka` test suite (30/30 pass)
- PEG parser specification (`PEG_SPEC.md`)
- Seven levels of grammar variants (e0 through e6)
