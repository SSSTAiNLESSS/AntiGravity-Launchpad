# Coding Standards

> This file is auto-injected into the agent's context. Violations are critical failures.

## Python
- **Naming**: `snake_case` for variables/functions, `PascalCase` for classes
- **Type hints**: Required on all function signatures
- **Docstrings**: Google-style for public functions
- **Formatting**: Black (line length 88)
- **Linting**: Ruff
- **Imports**: stdlib → third-party → local, separated by blank lines

## TypeScript / React
- **Naming**: `camelCase` for variables/functions, `PascalCase` for components/classes
- **Components**: Functional components with hooks (no class components)
- **Exports**: Named exports preferred over default exports
- **Formatting**: Prettier (printWidth 100)
- **Linting**: ESLint with TypeScript parser

## SQL
- **Table names**: `snake_case`, plural (`users`, `documents`)
- **Column names**: `snake_case`
- **Migrations**: Idempotent, reversible, timestamped
- **Constraints**: Always name constraints explicitly

## Git
- **Commits**: Conventional Commits format (`feat:`, `fix:`, `chore:`, etc.)
- **Branches**: `feature/`, `fix/`, `chore/` prefixes
- **PRs**: Require description, linked issue, and passing CI

## General
- **No secrets in code** — Use environment variables
- **No `any` type** — Be explicit
- **Error handling** — Never swallow exceptions silently
- **Tests** — TDD preferred; minimum coverage target 80%
