---
description: TDD enforcement — Red-Green-Refactor, coverage tracking, flaky test quarantine
---

# Test Driven Development

## When to Use
Invoked for: writing tests, enforcing TDD, coverage analysis, test debugging.

## The Red-Green-Refactor Cycle
1. **RED**: Write a failing test that defines the desired behavior
2. **GREEN**: Write the minimum code to make the test pass
3. **REFACTOR**: Clean up without changing behavior; tests must stay green

## Quick Reference
- **Python**: `pytest` with `--cov` flag; minimum 80% coverage
- **TypeScript**: `vitest` or `jest`; minimum 80% coverage
- **Flaky Tests**: Quarantine with `@pytest.mark.flaky` or `it.skip`, track in `.agent/.shared/lessons-learned.md`

## Detailed Resources
- [execution-protocol.md](resources/execution-protocol.md)
- [checklist.md](resources/checklist.md)
