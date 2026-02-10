# Serena Memory Protocol

> How agents read and write to persistent memory in `.serena/`.

## Files
| File | Purpose | Who Updates |
|------|---------|-------------|
| `active_plan.md` | Current execution state — the "Truth" | PM Agent (create), All agents (update status) |
| `architectural_decisions.md` | Immutable ADR log | PM Agent |
| `task-board.md` | Shared whiteboard for coordination | All agents |

## Rules
1. **Read before acting**: Every agent MUST read `active_plan.md` before starting work
2. **Update after completing**: Mark steps as done in `active_plan.md`
3. **Never delete entries**: Append only. History is immutable.
4. **Conflict resolution**: Timestamp-based; latest write wins. Log conflicts.
5. **Checkpoint on long tasks**: Every 5 minutes or major phase, write state to `.serena/`

## Format
```markdown
## Step N: [Description]
- **Status**: [ ] Todo | [/] In Progress | [x] Done
- **Agent**: [agent-name]
- **Started**: [timestamp]
- **Completed**: [timestamp]
- **Notes**: [any relevant context]
```
