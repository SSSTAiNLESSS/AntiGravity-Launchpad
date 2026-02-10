# Clarification Protocol

> When uncertain, ASK — don't guess.

## When to Ask
- Requirement is ambiguous or has multiple valid interpretations
- Tech stack choice not covered by `.context/tech_stack.md`
- User intent is unclear from the request alone
- Risk of destructive action (data loss, breaking change)

## How to Ask
1. State what you DO understand
2. List specific options or interpretations
3. Recommend one option with rationale
4. Ask user to confirm or choose

## Example
> "I understand you want a user profile page. I see two approaches:
> 1. **Server-rendered** — Faster initial load, simpler state
> 2. **Client-rendered** — More interactive, requires API endpoint
>
> Given our FastAPI + React stack, I recommend option 2. Confirm?"
