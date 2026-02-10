---
description: Meta-skill — generates new skills from natural language descriptions
---

# Skill Creator

## When to Use
Invoked for: creating skills, new skill, add capability, scaffold skill, `create-skill`, `new-skill`.

## How It Works
This is a **meta-skill** — it creates other skills. Given a natural language description of a desired capability, it scaffolds a complete, template-compliant skill directory.

## Execution Protocol

### Step 1: Discovery Interview (30 seconds)
Before scaffolding, ask these questions (skip any the user already answered):

1. **What does this skill do?** → becomes the `description` in frontmatter
2. **When should the agent use it?** → becomes trigger patterns
3. **What does the agent need to know?** → becomes Quick Reference
4. **Are there detailed protocols?** → decides if `resources/` is needed
5. **Which agents can use it?** → routing constraint (Any, Backend, QA, etc.)

### Step 2: Validate Uniqueness
Before creating, check for overlap:
```
1. Read .agent/skills/_shared/skill-routing.md
2. Check if triggers overlap with existing skills
3. If overlap found → suggest extending existing skill instead
4. If unique → proceed
```

### Step 3: Scaffold the Skill

**Directory structure:**
```
.agent/skills/{skill_name}/
├── SKILL.md              # Required — the router file
└── resources/             # Optional — only if detailed protocols needed
    ├── execution-protocol.md   # Step-by-step workflow
    ├── error-playbook.md       # Common errors and fixes
    └── checklist.md            # Pre/post checks
```

**Naming conventions:**
- Directory: `snake_case` (e.g., `api_contract_validator`)
- SKILL.md: Exactly `SKILL.md` (case-sensitive)
- Resources: `kebab-case.md`

### Step 4: Write the SKILL.md

Use this exact template:

```markdown
---
description: {one-line description — max 80 chars}
---

# {Skill Name in Title Case}

## When to Use
Invoked for: {comma-separated trigger phrases}.

## Quick Reference
1. **{Key concept 1}**: {Concise instruction}
2. **{Key concept 2}**: {Concise instruction}
3. **{Key concept 3}**: {Concise instruction}

## Detailed Resources
- [execution-protocol.md](resources/execution-protocol.md) — {what it covers}
- [error-playbook.md](resources/error-playbook.md) — {what it covers}
- [checklist.md](resources/checklist.md) — {what it covers}
```

**Critical constraints:**
- SKILL.md must be **under 1KB** — it's a router, not a manual
- All detail goes in `resources/` files
- Frontmatter `description` is the only required YAML field
- `## When to Use` must contain trigger keywords for skill-routing

### Step 5: Write Resources (if needed)

**execution-protocol.md** template:
```markdown
# {Skill Name} — Execution Protocol

## Prerequisites
- {What must exist before this skill runs}

## Steps
1. {Step with specific commands or actions}
2. {Step}
3. {Step}

## Output
- {What this skill produces}

## Rollback
- {How to undo if something goes wrong}
```

**error-playbook.md** template:
```markdown
# {Skill Name} — Error Playbook

| Error | Cause | Fix |
|-------|-------|-----|
| {Error message} | {Why it happens} | {How to fix} |
```

**checklist.md** template:
```markdown
# {Skill Name} — Checklist

## Before
- [ ] {Pre-condition check}

## After
- [ ] {Post-condition verification}
```

### Step 6: Register the Skill

1. **Update skill-routing.md** — Add a new row to the routing table:
   ```
   | `{triggers}` | {skill_name} | {Agent} |
   ```

2. **Update skill-selection.yaml** — Add to appropriate bundle:
   ```yaml
   available_skills:
     - {skill_name}
   ```

3. **Verify** — Confirm all files exist and SKILL.md is under 1KB

### Step 7: Self-Test

After creation, verify the skill works by asking:
1. Does the trigger pattern match? (Test against skill-routing)
2. Is the SKILL.md under 1KB?
3. Does the frontmatter parse correctly?
4. Are all resource links valid?
5. Is the skill unique (no overlap with existing)?

## Quality Standards

| Criterion | Requirement |
|-----------|-------------|
| SKILL.md size | < 1KB (router only) |
| Frontmatter | Valid YAML with `description` |
| Triggers | Listed in `When to Use` section |
| Resources | Only if protocols > 3 steps |
| Naming | `snake_case` directory, Title Case heading |
| Registration | Added to routing table + selection config |

## Example

**User prompt:** "Create a skill for managing environment variables"

**Result:**
```
.agent/skills/env_manager/
├── SKILL.md (487 bytes)
└── resources/
    ├── execution-protocol.md
    └── checklist.md
```

**Generated SKILL.md:**
```markdown
---
description: Environment variable management — .env files, secrets, validation
---

# Env Manager

## When to Use
Invoked for: env, environment variables, .env, secrets config, env validation.

## Quick Reference
1. **Create .env**: Copy from `.env.example`, never commit `.env` to git
2. **Validate**: Check all required vars exist before app start
3. **Rotate**: When rotating secrets, update .env + restart services
4. **Audit**: Run `grep -r "process.env\|os.environ" src/` to find all env references

## Detailed Resources
- [execution-protocol.md](resources/execution-protocol.md) — Full env setup workflow
- [checklist.md](resources/checklist.md) — Pre-deploy env verification
```
