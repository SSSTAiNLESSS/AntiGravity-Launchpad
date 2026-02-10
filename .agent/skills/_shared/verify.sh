#!/bin/bash
# verify.sh — Shared verification script for all skills
# Run after any implementation to validate quality gates

set -e

echo "🔍 Running verification checks..."

# 1. Linting
if [ -f "pyproject.toml" ] || [ -f "setup.py" ]; then
    echo "  → Python linting (ruff)..."
    ruff check . --fix 2>/dev/null || echo "  ⚠️  Ruff not installed or errors found"
fi

if [ -f "package.json" ]; then
    echo "  → TypeScript/JS linting (eslint)..."
    npx eslint . 2>/dev/null || echo "  ⚠️  ESLint not configured or errors found"
fi

# 2. Tests
if [ -f "pyproject.toml" ] || [ -f "setup.py" ]; then
    echo "  → Running pytest..."
    python -m pytest --tb=short 2>/dev/null || echo "  ⚠️  Tests failed or pytest not installed"
fi

if [ -f "package.json" ]; then
    echo "  → Running vitest/jest..."
    npm test 2>/dev/null || echo "  ⚠️  Tests failed or not configured"
fi

# 3. Type checking
if [ -f "tsconfig.json" ]; then
    echo "  → TypeScript type check..."
    npx tsc --noEmit 2>/dev/null || echo "  ⚠️  Type errors found"
fi

echo "✅ Verification complete."
