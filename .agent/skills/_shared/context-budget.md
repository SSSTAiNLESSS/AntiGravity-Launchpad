# Context Budget Management

> Strategies for efficient token usage across model tiers.

## High-Context Models (Gemini 2.5 Pro — 2M tokens)
- Aggressive context loading: full codebase index, all contracts, full history
- Prefer completeness over summarization

## Limited-Context Models
- **Priority order**: Current task > recent changes > arch decisions > older context
- Summarize completed phases; keep only current phase details
- Use `.serena/` checkpoints to offload state

## Token Budget by Operation
| Operation | Estimated Tokens |
|-----------|-----------------|
| Planning (PM Agent) | 15,000–50,000 |
| Frontend component | 10,000–20,000 |
| Backend endpoint | 15,000–25,000 |
| Debug investigation | 20,000–80,000 |
| Code review | 10,000–30,000 |

## Optimization Tips
- Load `SKILL.md` first (~800 bytes); only load `resources/` on demand
- Summarize `.serena/active_plan.md` completed steps
- Cache `.context/` files per session (they rarely change)
