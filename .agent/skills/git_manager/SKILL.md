---
description: Git operations — commits, branches, PRs, secret pre-flight
---

# Git Manager

## When to Use
Invoked for: commits, branch creation, merging, PR workflows, pre-push checks.

## Quick Reference
1. **Stage & Commit**: Use Conventional Commits format (`feat:`, `fix:`, `chore:`, `docs:`, `refactor:`, `test:`)
2. **Branch**: `feature/`, `fix/`, `chore/` prefix convention
3. **Secret Check**: Run `git diff --staged | grep -iE "(api_key|secret|password|token)"` before every commit
4. **PR**: Include description, linked issue, passing CI status

## Atomic Commit Protocol (GSD)
During execution workflows, enforce **one commit per task**:
- Each XML `<task>` in a plan gets its own atomic commit
- Commit message includes phase reference: `feat(phase-1): add JWT endpoint`
- Benefits: clean `git bisect`, independent revertability, clear AI-generated history
- If a task fails, only that commit needs reverting — not the entire phase

## Detailed Resources
- [execution-protocol.md](resources/execution-protocol.md) — Full commit workflow
- [error-playbook.md](resources/error-playbook.md) — Common git errors and fixes
- [checklist.md](resources/checklist.md) — Pre-commit/pre-push checks
