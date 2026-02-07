# Technical Debt Audit Report

**Repository**: pl0e
**Analysis Date**: 2026-02-07
**Total Source Files**: ~48 files (~3,930 lines)
**Test Suites**: 4 (all passing)
**Build System**: Bazel 9.0.0 with hermetic toolchains
**Overall Health**: **B+** (Medium-Low Debt)

---

## Executive Summary

The pl0e project is well-structured with strong engineering fundamentals. Technical debt is primarily **incompleteness** rather than poor code quality. The codebase demonstrates hermetic builds, comprehensive documentation, and multiple implementation approaches. Seven areas require attention, with three considered critical.

---

## Debt Inventory

### 1. Test Coverage Gaps (Critical)

| Language Level | Interpreter | Tests | Risk |
|----------------|-------------|-------|------|
| e0 | `e0peg` | None | Medium |
| e1 | `e1`, `e1_koka`, `e1peg` | `e1_interp_test` | Low |
| e2 | `e2peg` | None | **High** |
| e3 | `e3peg` | `e3_test` | Low |
| e4 | `e4peg` | `e4_test` | Low |
| e5 | None | N/A | Critical |
| e6 | None | N/A | Critical |

- e2 has a production interpreter (`e2peg.koka`) and 3 example files but zero automated tests.
- e0 is only tested transitively through e1 tests.

**Effort**: 1 day (copy `e1_test.sh` pattern).

### 2. Incomplete Language Implementations (Critical)

e5 and e6 have grammars (`src/e5.peg`, `src/e6.peg`) and example files but no interpreters.

```
e5: Grammar Y, Examples Y, Spec N, Interpreter N, Tests N
e6: Grammar Y, Examples Y, Spec N, Interpreter N, Tests N
```

This means the roadmap promise of "e0-e6" is only 67% delivered (e0-e4 functional).

**Effort**: 3-5 days per level (based on e4peg complexity).

### 3. No CI/CD Pipeline (High)

Tests run locally via `bazel test //test:all` but there is no automated testing on commits or PRs.

- Manual verification burden on contributors.
- Risk of undetected regressions.
- No cross-platform testing.

Already acknowledged in `LEDGER.md` roadmap.

**Effort**: 1 day (GitHub Actions with Bazel cache).

### 4. Code Duplication in PEG Interpreters (Medium)

e0/e1/e2 share `pegeval.koka`, but e3peg (331 LOC) and e4peg (425 LOC) reimplement similar patterns independently:

- Environment management (`e3env`, `e4env`)
- Value types (`rval` defined separately in both)
- Evaluation logic duplicated

**Justification** (from `docs/IMPLEMENTATIONS.md`): e3+ needs multi-type values (int, bool, closure), which `pegeval.koka` doesn't support.

**Opportunity**: Extract shared e3/e4 runtime into `e3runtime.koka`.

**Effort**: 2 days refactoring.

### 5. Missing Specification Documents (Medium)

| Level | Spec | Status |
|-------|------|--------|
| e1 | `docs/E1_SPEC.md` | Complete |
| e2 | — | **Missing** |
| e3 | `docs/E3_SPEC.md` | Complete |
| e4 | — | **Missing** |
| e5 | — | **Missing** |
| e6 | — | **Missing** |

**Effort**: 1 day per spec (template exists from E1_SPEC.md).

### 6. `peg.koka` Complexity (Low)

At 1,301 lines, `peg.koka` is the largest source file. It handles PEG grammar parsing, AST definition, execution, static analysis, and parse tree manipulation in a single file.

Acceptable for a research project but would benefit from modularization if it continues to grow.

**Potential split**: `peg-ast.koka`, `peg-parser.koka`, `peg-interp.koka`, `peg-analysis.koka`.

**Effort**: 3 days (only if file exceeds ~1,500 lines).

### 7. Deprecated `/old` Directory (Low)

Contains 3 files (`pl0.ebnf`, `pl_0_parser_non_oop.cpp`, `pl0_minimal.ebnf`) with no cleanup plan.

**Effort**: 15 minutes — delete or add a README explaining historical context.

---

## Prioritized Roadmap

### Sprint 1: Critical Gaps (3-5 days)

1. Add e2 test suite — create `test/e2_test.sh`, add to `test/BUILD.bazel`, validate 3 e2 examples.
2. Write E2 specification — create `docs/E2_SPEC.md` following E1_SPEC.md structure.
3. Set up GitHub Actions CI — `bazel test //test:all` on every push/PR with Bazel cache.

### Sprint 2: Language Completion (5-8 days)

4. Implement e5peg interpreter — extend e4 with records and unit type, add tests and spec.
5. Implement e6peg interpreter — add static typing and type definitions, add tests and spec.
6. Add e0 dedicated tests.

### Sprint 3: Code Health (3-5 days)

7. Refactor PEG interpreter runtime — extract shared e3/e4 patterns.
8. Write E4 specification.
9. Clean up `/old` directory.

---

## Metrics

| Metric | Current | Target |
|--------|---------|--------|
| Test Coverage (Language Levels) | 60% (3/5) | 100% |
| Language Completeness | 67% (4/6) | 100% |
| Specification Completeness | 33% (2/6) | 100% |
| CI/CD Coverage | 0% | 100% |
| Build Hermeticity | 100% | 100% |
| Documentation Quality | High | High |

---

## Strengths to Preserve

- **Hermetic builds**: Bazel + pinned LLVM 21.1.4 + Koka v3.2.2 ensure reproducibility.
- **Documentation**: README, DESIGN.md, IMPLEMENTATIONS.md are comprehensive.
- **Multiple implementations**: Comparing Koka, C++, PEG, AST-based, and compiled variants.
- **Code style**: Consistent formatting and clear naming.
- **All existing tests pass** reliably.
- **Bigint implementation**: Header-only `e1_bigint.hpp` is elegant.

---

## Risk Assessment

| Risk | Severity | Likelihood | Mitigation |
|------|----------|------------|------------|
| e2/e5/e6 regressions undetected | High | Medium | Add tests (Sprint 1-2) |
| Incomplete roadmap delivery | Medium | High | Prioritize e5/e6 (Sprint 2) |
| PEG interpreter divergence | Medium | Medium | Refactor shared runtime (Sprint 3) |
| Build complexity barriers | Low | Low | Maintain BAZEL.md docs |
| Dependency obsolescence | Low | Low | Hermetic toolchains mitigate |

---

**Estimated Total Effort**: 11-18 days
**Key Takeaway**: This is a well-maintained exploration project. Debt is manageable and well-documented. Primary recommendation is to systematize testing and complete the e0-e6 language progression.
