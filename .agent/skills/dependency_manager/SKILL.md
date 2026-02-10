---
description: Dependency management — vulnerability scanning, license compliance, update batching
---

# Dependency Manager

## When to Use
Invoked for: adding/removing dependencies, vulnerability scanning, license checks, updates.

## Quick Reference
1. **Add Dependency**: Verify license compatibility (MIT, Apache-2.0, BSD preferred)
2. **Vulnerability Scan**: `npm audit` / `pip-audit` / Snyk MCP
3. **Update Strategy**: Batch non-breaking updates; individual PRs for major bumps
4. **Lock Files**: Always commit `package-lock.json` / `requirements.txt`

## Red Flags
- ⚠️  GPL/AGPL in a proprietary project
- ⚠️  Dependency with 0 maintenance (no commits in 12+ months)
- ⚠️  Known CVE without patch

## Detailed Resources
- [execution-protocol.md](resources/execution-protocol.md)
