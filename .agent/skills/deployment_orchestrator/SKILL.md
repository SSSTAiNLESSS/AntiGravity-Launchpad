---
description: Deployment orchestration — canary releases, auto-rollback, environment promotion
---

# Deployment Orchestrator

## When to Use
Invoked for: deploying to staging/production, canary releases, rollbacks.

## Quick Reference
1. **Environments**: `dev` → `staging` → `production`
2. **Canary Strategy**: 5% → 25% → 50% → 100% with health checks between stages
3. **Rollback Trigger**: Error rate > 2x baseline OR p99 latency > 2x baseline
4. **Promotion Gates**: All tests pass + security scan clean + performance within budget

## Safety
- Production deploys ALWAYS require human approval
- Database migrations run BEFORE application deployment
- Rollback plan MUST exist before deploy begins

## Detailed Resources
- [execution-protocol.md](resources/execution-protocol.md)
