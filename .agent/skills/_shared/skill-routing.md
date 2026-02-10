# Skill Routing

> How the orchestrator decides which skill/agent to invoke. Supports fuzzy matching.

## Routing Rules
| Trigger Pattern | Skill | Agent |
|----------------|-------|-------|
| `commit`, `push`, `branch`, `merge`, `PR` | git_manager | Any |
| `review`, `lint`, `audit code` | code_review_enforcer | QA |
| `test`, `TDD`, `coverage` | test_driven_development | QA |
| `docs`, `readme`, `changelog` | docs_updater | Any |
| `dependency`, `package`, `vulnerability`, `CVE` | dependency_manager | Any |
| `migration`, `schema`, `database`, `table` | database_schema_manager | Backend |
| `contract`, `api spec`, `openapi`, `graphql` | api_contract_validator | PM/Backend |
| `deploy`, `release`, `canary`, `rollback` | deployment_orchestrator | Any |
| `metrics`, `logging`, `tracing`, `alerts` | observability_configurator | Backend |
| `security`, `secrets`, `IAM`, `threat model` | security_hardening | QA |
| `create skill`, `new skill`, `scaffold skill`, `add capability` | skill_creator | PM |

## Fuzzy Matching
- "run tests" → `test_driven_development`
- "check for vulns" → `dependency_manager` + `security_hardening`
- "update docs" → `docs_updater`
- Unmatched → ask user for clarification
