---
description: Database schema management — migrations, rollback safety, drift detection
---

# Database Schema Manager

## When to Use
Invoked for: creating tables, altering schemas, running migrations, detecting drift.

## Quick Reference
1. **Migrations**: Idempotent, reversible, timestamped (e.g., `001_create_users.sql`)
2. **Naming**: `snake_case`, plural tables, explicit constraint names
3. **Rollback**: Every migration MUST have a corresponding `down` migration
4. **Lock Estimation**: Estimate lock impact before `ALTER TABLE` on production

## Safety Checks
- [ ] Migration is idempotent (safe to run twice)
- [ ] Rollback script tested
- [ ] No data-destructive operations without backup verification
- [ ] Lock time estimated for tables > 10K rows

## Detailed Resources
- [execution-protocol.md](resources/execution-protocol.md)
