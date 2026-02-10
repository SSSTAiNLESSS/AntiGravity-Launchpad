---
description: Security hardening — secret detection, IAM, STRIDE threat modeling, compliance
---

# Security Hardening

## When to Use
Invoked for: secret detection, IAM review, threat modeling, compliance checks.

## Quick Reference
1. **Secret Detection**: Pre-commit hook scans for API keys, tokens, passwords
2. **IAM**: Principle of least privilege — grant minimum permissions needed
3. **Input Validation**: Sanitize all user inputs; use parameterized queries
4. **STRIDE Threat Model**: Spoofing, Tampering, Repudiation, Info Disclosure, DoS, Elevation

## Mandatory Checks
- [ ] No secrets in source code or git history
- [ ] All user inputs validated and sanitized
- [ ] SQL queries parameterized (no string concatenation)
- [ ] HTTP headers: CORS, CSP, HSTS configured
- [ ] Dependencies scanned (Snyk / `npm audit` / `pip-audit`)

## Detailed Resources
- [execution-protocol.md](resources/execution-protocol.md)
