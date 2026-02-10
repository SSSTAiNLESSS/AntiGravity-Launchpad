---
description: Documentation upkeep — README sync, changelog, API docs, architecture diagrams
---

# Docs Updater

## When to Use
Invoked for: README updates, changelog entries, API documentation, diagram generation.

## Quick Reference
1. **Changelog**: Follow [Keep a Changelog](https://keepachangelog.com/) format
2. **README**: Update after any user-facing API or behavior change
3. **API Docs**: Auto-generate from code annotations (docstrings, JSDoc)
4. **Diagrams**: Mermaid format, stored in `docs/`

## Trigger Conditions
- New endpoint added → update API docs
- New feature merged → update README + changelog
- Architecture change → update diagrams + ADR

## Detailed Resources
- [execution-protocol.md](resources/execution-protocol.md)
