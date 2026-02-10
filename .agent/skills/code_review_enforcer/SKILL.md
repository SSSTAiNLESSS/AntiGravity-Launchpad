---
description: Code quality enforcement — linting, static analysis, architectural compliance
---

# Code Review Enforcer

## When to Use
Invoked for: code reviews, lint checks, static analysis, style enforcement.

## Quick Reference
1. **Python**: Run `ruff check .` and `ruff format --check .`
2. **TypeScript**: Run `npx eslint .` and `npx prettier --check .`
3. **SQL**: Validate against naming conventions in `.context/coding_standards.md`
4. **Architecture**: Verify no cross-boundary violations (frontend ↛ DB, client ↛ secrets)

## Quality Gates
- [ ] All linters pass with zero errors
- [ ] No `any` types in TypeScript
- [ ] All functions have type annotations (Python)
- [ ] No hardcoded secrets or credentials
- [ ] Cyclomatic complexity < 15 per function

## Detailed Resources
- [execution-protocol.md](resources/execution-protocol.md)
- [checklist.md](resources/checklist.md)
