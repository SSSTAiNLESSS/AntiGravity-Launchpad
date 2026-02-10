---
description: API contract validation — OpenAPI/GraphQL, breaking change detection, contract testing
---

# API Contract Validator

## When to Use
Invoked for: API spec validation, breaking change detection, contract-first development.

## Quick Reference
1. **Contract Location**: `.agent/.shared/api-contracts/`
2. **Format**: OpenAPI 3.0 (YAML) or GraphQL SDL
3. **Breaking Changes**: Any removal or type change in response schema = BREAKING
4. **Validation**: `npx @openapitools/openapi-generator-cli validate -i spec.yaml`

## Breaking Change Policy
- **Non-breaking**: Adding optional fields, new endpoints → auto-approve
- **Breaking**: Removing fields, changing types, renaming → requires PM Agent ADR + human approval

## Detailed Resources
- [execution-protocol.md](resources/execution-protocol.md)
