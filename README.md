<p align="center">
  <img src="https://img.shields.io/badge/AntiGravity-Launchpad-8B5CF6?style=for-the-badge&logo=googlegemini&logoColor=white" alt="AntiGravity-Launchpad" />
  <img src="https://img.shields.io/badge/Agents-7-10B981?style=for-the-badge" alt="7 Agents" />
  <img src="https://img.shields.io/badge/Skills-11-3B82F6?style=for-the-badge" alt="11 Skills" />
  <img src="https://img.shields.io/badge/MCP_Servers-9-F59E0B?style=for-the-badge" alt="9 MCP Servers" />
  <img src="https://img.shields.io/badge/GSD-Integrated-EF4444?style=for-the-badge" alt="GSD Integrated" />
</p>

# 🚀 AntiGravity-Launchpad

> A batteries-included, multi-agent orchestration template for building AI-powered development environments with **plan-first discipline**, **anti-hallucination safeguards**, and **persistent memory**.

Born from the Google DeepMind Antigravity ecosystem, this template gives you a production-ready scaffold for AI agents that plan before they code, verify before they ship, and learn as they go.

---

## 📖 Table of Contents

- [Why This Template?](#-why-this-template)
- [Architecture](#-architecture)
- [Directory Structure](#-directory-structure)
- [Getting Started](#-getting-started)
- [How to Drive It](#-how-to-drive-it)
- [The Seven Agents](#-the-seven-agents)
- [The Eleven Skills](#-the-eleven-skills)
- [MCP Integrations](#-mcp-integrations)
- [Workflows](#-workflows)
- [Governance & Safety](#-governance--safety)
- [Use Case Examples](#-use-case-examples)
- [Configuration](#-configuration)
- [Contributing](#-contributing)
- [Credits & Acknowledgements](#-credits--acknowledgements)
- [License](#-license)

---

## 💡 Why This Template?

Most AI coding assistants are **reactive** — you ask, they generate, you debug the result. This template flips that model:

| Traditional AI Coding | Antigravity Template |
|----------------------|---------------------|
| Generate code immediately | **Plan first**, code second |
| Hallucinate APIs and libraries | **Verify every claim** with tools |
| Forget context between sessions | **Dual-layer memory** (Serena + OpenMemory) |
| Single generic agent | **7 specialized agents** with clear boundaries |
| No quality gates | **Automated verification** at every phase |
| Context window degrades over time | **Fresh context per task** — zero context rot |

### Core Principles
1. **Plan Mode Supremacy** — No code without a plan. Period.
2. **Anti-Hallucination** — Every claim tagged `[VERIFIED]`, `[INFERRED]`, or `[UNCERTAIN]`
3. **Progressive Complexity** — Start with 5 essential skills, scale to 10+ as needed
4. **Human-in-the-Loop** — Approval gates at plan, spec, and verify phases
5. **Persistent State** — Plans and decisions survive IDE restarts and context window resets

---

## 🏗 Architecture

```
┌────────────────────────────────────────────────────────────────┐
│                       YOUR IDE (VSCode)                        │
│                       "Command Center"                         │
├────────────────────────────────────────────────────────────────┤
│                                                                │
│   ┌───────────┐   ┌───────────┐   ┌───────────┐   ┌───────────┐│
│   │ .context/ │   │ .planning/│   │  .serena/ │   │  .agent/  ││
│   │ Grounding │   │ Lifecycle │   │  Session  │   │   Brain   ││
│   └───────────┘   └───────────┘   └───────────┘   └───────────┘│
│         │               │               │               │      │
│         │            PROJECT          active         7 Agents  │
│         │            ROADMAP        task-board      11 Skills  │
│         │             STATE            ADRs          7 Flows   │
│         │               │               │               │      │
│         └───────────────┼───────────────┼───────────────┘      │
│                         │               │                      │
│                         └───────┬───────┘                      │
│                                 │                              │
│                      ┌──────────┴──────────┐                   │
│                      │     MCP Servers     │                   │
│                      │  (9 integrations)   │                   │
│                      └─────────────────────┘                   │
└────────────────────────────────────────────────────────────────┘
```

**Four pillars:**
- **`.context/`** — Grounding layer. Tech stack and coding standards injected into every agent to prevent hallucination.
- **`.planning/`** — Project lifecycle. `PROJECT.md`, `ROADMAP.md`, `STATE.md` — persistent across milestones. *(From GSD)*
- **`.serena/`** — Session coordination. Active agent whiteboard and ephemeral handoffs.
- **`.agent/`** — The brain. Agents, skills, workflows, rules, and configuration.

> **Design-aware**: `.context/design_system.md` grounds UI agents with your actual design tokens (colors, typography, layout). Extract automatically from Google Stitch or Figma.

---

## 📁 Directory Structure

```
your-project/
├── .agent/                          # 🧠 The Brain
│   ├── .shared/                     # Cross-cutting standards
│   │   └── lessons-learned.md       # Accumulated project knowledge
│   ├── agents/                      # 7 specialist personas
│   │   ├── pm-agent/                # Requirements → Plans
│   │   ├── architect-agent/         # Codebase mapping & patterns (NEW)
│   │   ├── frontend-agent/          # React / Tailwind
│   │   ├── backend-agent/           # FastAPI / PostgreSQL
│   │   ├── mobile-agent/            # Flutter
│   │   ├── qa-agent/                # Testing & Security
│   │   └── debug-agent/             # Root Cause Analysis
│   ├── skills/                      # 11 executable capabilities
│   │   ├── _shared/                 # Shared protocols & utilities
│   │   ├── git_manager/             # + atomic commit protocol
│   │   ├── code_review_enforcer/
│   │   ├── test_driven_development/
│   │   ├── docs_updater/
│   │   ├── dependency_manager/
│   │   ├── database_schema_manager/
│   │   ├── api_contract_validator/
│   │   ├── deployment_orchestrator/
│   │   ├── observability_configurator/
│   │   ├── security_hardening/
│   │   └── skill_creator/           # Meta-skill: generates new skills
│   ├── workflows/                   # Orchestration patterns
│   │   ├── coordinate.yaml          # Discuss → Plan → Execute → Verify
│   │   ├── orchestrate.yaml         # Parallel agents
│   │   ├── plan.yaml                # XML-structured task planning
│   │   ├── quick.yaml               # Fast path for small tasks (NEW)
│   │   ├── map-codebase.yaml        # Brownfield analysis (NEW)
│   │   ├── review.yaml              # Multi-agent code review
│   │   └── debug.yaml               # Incident response
│   ├── rules/                       # Governance
│   │   ├── manager.md               # Master system prompt
│   │   ├── security-policy.yaml
│   │   └── code-quality-gates.yaml
│   └── config/                      # Configuration
│       ├── mcp_servers.json
│       ├── user-preferences.yaml
│       └── skill-selection.yaml
│
├── .planning/                       # 📋 Project Lifecycle (from GSD)
│   ├── PROJECT.md                   # Vision, goals, constraints
│   ├── ROADMAP.md                   # Phased execution plan
│   ├── STATE.md                     # Real-time project state
│   └── research/                    # Codebase maps, phase research
│
├── .serena/                         # 💾 Session Coordination
│   ├── active_plan.md               # Ephemeral agent whiteboard
│   ├── architectural_decisions.md   # Immutable ADR log
│   ├── memories/                    # Persistent agent memory
│   └── task-board.md                # Shared agent handoffs
│
├── .context/                        # 🎯 Grounding Layer
│   ├── tech_stack.md                # "Use FastAPI, not Django"
│   ├── coding_standards.md          # "snake_case for Python"
│   └── design_system.md             # Colors, typography, layout (NEW)
│
├── AGENTS.md                        # Master system prompt (3-layer)
└── README.md                        # ← You are here
```

---

## 🚀 Getting Started

### Prerequisites
- [Node.js](https://nodejs.org/) 18+ (for MCP servers via `npx`)
- [Python](https://python.org/) 3.12+ (for backend agents)
- A Gemini API key or compatible LLM provider
- Git

### Quick Start

```bash
# 1. Clone or copy the template into your project
git clone https://github.com/your-org/antigravity-template.git my-project
cd my-project

# 2. (Optional) Initialize oh-my-ag orchestration framework
npx oh-my-ag init

# 3. (Optional) Install essential skill bundle
npx antigravity-awesome-skills --bundle essentials

# 4. Verify your setup
npx oh-my-ag doctor

# 5. Customize grounding files for YOUR project
#    Edit .context/tech_stack.md with your actual stack
#    Edit .context/coding_standards.md with your conventions
```

### First Steps After Setup

> [!NOTE]
> If you run `oh-my-ag doctor`, you may see warnings about **Global MCP Config** being "Not configured". This is expected as this project uses a self-contained **Local Configuration** in `.agent/mcp.json`. You can safely ignore these warnings.


1. **Edit `.context/tech_stack.md`** — Replace the defaults with your actual technology choices
2. **Edit `.context/coding_standards.md`** — Set your team's conventions
3. **Review `.agent/config/skill-selection.yaml`** — Start with `essentials-only` mode
4. **Configure MCP servers** — Update `.agent/config/mcp_servers.json` with your credentials

---

## 🎮 How to Drive It

### The Core Loop: Discuss → Plan → Execute → Verify

This template enforces a disciplined development cycle inspired by the [GSD protocol](https://github.com/gsd-build/get-shit-done). Here's how a typical feature request flows:

```
YOU: "Add user authentication with JWT"
                    │
                    ▼
        ┌──────────────────┐
        │ Phase 1: DISCUSS │  PM Agent asks targeted questions:
        │  (PM Agent)      │  "Session storage or cookies?"
        └────────┬─────────┘  Creates {phase}-CONTEXT.md
                 │ ✅ You're satisfied
                 ▼
        ┌──────────────────┐
        │  Phase 2: PLAN   │  Architect maps codebase patterns.
        │  (Architect+PM)  │  PM creates atomic XML task plans.
        └────────┬─────────┘  QA verifies plans against requirements.
                 │ ✅ You approve the plan
                 ▼
        ┌──────────────────┐
        │ Phase 3: EXECUTE │  Dev Agents implement in parallel waves.
        │  (Dev Agents)    │  Fresh context per task. Atomic commits.
        └────────┬─────────┘
                 │ Tests run automatically
                 ▼
        ┌──────────────────┐
        │ Phase 4: VERIFY  │  QA runs full suite + walks you through
        │  (QA Agent)      │  manual verification of each deliverable.
        └────────┬─────────┘  If issues → auto-creates fix plans.
                 │ ✅ You sign off
                 ▼
              ✨ MERGE
```

### Key Commands

| What you want to do | How to do it |
|---------------------|-------------|
| Full feature pipeline | `npx oh-my-ag workflow:run coordinate "Add user profiles"` |
| Map existing codebase | `npx oh-my-ag workflow:run map-codebase` |
| Quick ad-hoc task | `npx oh-my-ag workflow:run quick "Fix dark mode toggle"` |
| Start planning a feature | `npx oh-my-ag agent:spawn pm-agent "Plan user authentication"` |
| Explore the codebase | `npx oh-my-ag agent:spawn architect-agent "Map the auth module"` |
| Build backend | `npx oh-my-ag agent:spawn backend-agent "Implement JWT auth endpoints"` |
| Build frontend | `npx oh-my-ag agent:spawn frontend-agent "Create login page"` |
| Run tests | `npx oh-my-ag agent:spawn qa-agent "Run full test suite"` |
| Debug an issue | `npx oh-my-ag agent:spawn debug-agent "Investigate login timeout error"` |

### Using CLI Aliases

Configure shortcuts in `.agent/config/user-preferences.yaml`:

```bash
npx oh-my-ag plan "Add shopping cart"    # alias → pm-agent
npx oh-my-ag explore                     # alias → architect-agent (map-codebase)
npx oh-my-ag build "Create cart API"     # alias → backend-agent
npx oh-my-ag ui "Build cart component"   # alias → frontend-agent
npx oh-my-ag test "Verify cart flow"     # alias → qa-agent
npx oh-my-ag debug "Cart total is wrong" # alias → debug-agent
npx oh-my-ag quick "Fix button color"    # alias → quick workflow
```

---

## 🤖 The Seven Agents

| Agent | Role | What It Does | What It Won't Do |
|-------|------|--------------|-----------------|
| **PM Agent** | Product Manager | Writes plans, API contracts, ADRs, runs Discuss phase | Write implementation code |
| **Architect Agent** | Explorer *(NEW)* | Maps codebases, discovers patterns, validates architecture | Modify code — read-only and advisory |
| **Frontend Agent** | UI Specialist | React components, Tailwind, accessibility | Modify backend or database |
| **Backend Agent** | API Specialist | FastAPI endpoints, migrations, JWT | Modify frontend code |
| **Mobile Agent** | Cross-Platform | Flutter widgets, store assets | Modify web code |
| **QA Agent** | Quality Gate | TDD scaffolding, security audits, perf tests | Write implementation code |
| **Debug Agent** | Diagnostician | **Iron Law**: root cause before any fix, 4-phase protocol, regression tests | Randomly try fixes ("shotgun debugging") |

Each agent has:
- `SYSTEM_PROMPT.md` — Persona definition, responsibilities, constraints
- `CAPABILITY_MANIFEST.yaml` — Machine-readable capabilities for orchestration

---

## ⚡ The Eleven Skills

Skills are modular capabilities loaded on demand via lightweight `SKILL.md` routers (~1KB each).
*(Note: The `skills/` directory may contain additional internal or meta-skills like `commit` and `orchestrator` beyond the core list below.)*

| Skill | Triggers | What It Provides |
|-------|----------|-----------------|
| `git_manager` | commit, push, branch, PR | Conventional Commits, secret pre-flight, branch automation |
| `code_review_enforcer` | review, lint, audit | ESLint/Ruff unified reports, complexity analysis |
| `test_driven_development` | test, TDD, coverage | Red-Green-Refactor enforcement, flaky test quarantine |
| `docs_updater` | docs, readme, changelog | Keep a Changelog format, auto-generated API docs |
| `dependency_manager` | dependency, vulnerability | License compliance, Snyk scanning, update batching |
| `database_schema_manager` | migration, schema, table | Idempotent migrations, rollback safety, drift detection |
| `api_contract_validator` | contract, openapi, spec | Breaking change detection, consumer-driven testing |
| `deployment_orchestrator` | deploy, release, canary | Canary deployment, auto-rollback, promotion gates |
| `observability_configurator` | metrics, logging, tracing | OpenTelemetry, SLO-based alerts, structured logging |
| `security_hardening` | security, secrets, IAM | STRIDE threat modeling, secret detection, OWASP checks |
| `skill_creator` *(META)* | create skill, new skill, scaffold | **Self-replicating** — generates new skills from natural language descriptions |

### Progressive Adoption

Start with **essentials-only** mode (5 skills), expand as your project matures. The `skill_creator` meta-skill lets you generate custom skills on demand:

```yaml
# .agent/config/skill-selection.yaml
mode: essentials-only   # Start here

active_skills:
  - git_manager
  - code_review_enforcer
  - test_driven_development
  - docs_updater
  - dependency_manager
```

---

## 🔌 MCP Integrations

Nine Model Context Protocol servers enable agents to interact with external tools:

| MCP Server | Purpose | Default Mode |
|-----------|---------|-------------|
| **Filesystem** | Read/write/search local files | Read/write |
| **Git** | Status, diff, log, commit | Read/write |
| **Supabase** | Database, auth, storage management | Via service role key |
| **PostgreSQL** | Direct SQL queries | **Read-only** by default |
| **GitHub** | Issues, PRs, repository management | Via personal access token |
| **Linear** | Issue tracking | Via API key |
| **Snyk** | Vulnerability intelligence | Via token |
| **OpenMemory** | Long-term cross-project memory | Via API key |
| **Stitch** | Google Stitch design-to-code pipeline | Via API key |

| Layer | Mechanism | Scope | Example |
|-------|-----------|-------|---------|
| **Short-term** (Serena) | `.serena/` markdown files | Current session | "Frontend is waiting for Backend API" |
| **Long-term** (OpenMemory) | Vector/graph database via MCP | Cross-project, permanent | "User prefers dark mode" → remembered in next project |

Configure in `.agent/config/config.yaml` (pointing to `.agent/mcp.json`). All secrets reference environment variables (`${VAR_NAME}`).

---

## 🔄 Workflows

| Workflow | Pattern | Use For |
|----------|---------|---------|
| **coordinate** | Discuss → Plan → Execute → Verify (sequential) | Standard feature implementation |
| **quick** *(NEW)* | Lightweight plan → execute → verify | Bug fixes, config changes, small features |
| **map-codebase** *(NEW)* | Parallel codebase analysis | Brownfield projects, pre-feature exploration |
| **orchestrate** | Parallel agent execution | Independent workstreams |
| **plan** | XML-structured task planning + research | Upfront requirement analysis |
| **review** | Multi-agent code review | Pre-merge quality checks |
| **debug** | Structured diagnosis + 3-Strike Rule | Bug investigation |

### Context Rot Prevention *(from GSD)*

During execution, each XML `<task>` runs in a **fresh context window** (~200K tokens purely for implementation). This prevents the quality degradation that happens as context fills up. Each task also gets its own **atomic git commit** — clean `git bisect` and independent revertability.

### The 3-Strike Rule

When debugging, the system allows **3 fix attempts** max. If the third attempt fails:
1. **STOP** — No more blind retries
2. **Log** findings to `lessons-learned.md`
3. **Escalate** — Request human intervention with full context

This prevents the infinite-retry loops that plague traditional AI assistants.

---

## 🛡 Governance & Safety

### Auto-Approval Tiers

| Tier | Examples | Approval |
|------|---------|----------|
| **Safe** | File read, directory list, git status | ✅ Auto-approved |
| **Logged** | File write, git commit, dev dependency install | ✅ Auto-approved + audit log |
| **Approval Required** | New file creation, protected branch push, DB migration, production deploy | ⏳ Human approval |
| **Prohibited** | Production DB write, secret modification, infrastructure destruction | ❌ Never approved |

### Security Policy
- **Secret detection**: Regex-based scanning blocks commits containing API keys, tokens, passwords
- **Input validation**: Parameterized queries enforced, no string concatenation SQL
- **Access control**: Principle of least privilege; MCP read-only by default
- **Audit logging**: JSON format, SHA-256 tamper-evident chain, 90-day retention

### Code Quality Gates
All code must pass before merge:
- ✅ Linting (Ruff/ESLint) — zero errors
- ✅ Formatting (Black/Prettier)
- ✅ Type checking (mypy/tsc) — strict mode
- ✅ Test coverage ≥ 80%
- ✅ Cyclomatic complexity < 15 per function
- ✅ Security scan (secrets + dependencies)

---

## 📚 Use Case Examples

### Example 1: Building a New API Feature

```
You: "I need a REST API for managing user bookmarks"

PM Agent thinks:
  → Reads .context/tech_stack.md (FastAPI + Supabase)
  → Reads .context/coding_standards.md (snake_case, Pydantic v2)
  → Drafts plan with 3 endpoints: POST, GET, DELETE
  → Writes API contract to .agent/.shared/api-contracts/bookmarks.yaml
  → Records ADR for data model choice
  → Presents plan for your approval

You: ✅ "Approved"

QA Agent:
  → Scaffolds failing test cases from acceptance criteria
  → Confirms "Red State" — all new tests fail

Backend Agent:
  → Implements FastAPI routes + Pydantic models
  → Creates Supabase migration
  → Runs tests → all green

QA Agent:
  → Full verification: tests ✅ | security ✅ | coverage 94% ✅

You: ✅ "Ship it"
```

### Example 2: Debugging a Production Issue

```
You: "Users report 500 errors on the profile page since yesterday's deploy"

Debug Agent:
  → Characterize: 500 on GET /api/users/profile, started 2026-02-09 14:00
  → Hypotheses:
      1. DB migration broke schema (70% likely)
      2. New dependency version incompatibility (20%)
      3. Environment variable misconfigured (10%)
  → Evidence: git log shows migration ran at 13:58 — adds nullable column
  → Fix: Column referenced as non-nullable in Pydantic model
  → Applies: model.field = Optional[str]
  → Regression test: test_profile_with_null_field()
  → Updates lessons-learned.md
```

### Example 3: Multi-Agent Parallel Build

```
You: "Build the dashboard page — API + UI simultaneously"

Orchestrate workflow spawns:
  → Backend Agent: Dashboard API endpoints (data aggregation)
  → Frontend Agent: Dashboard React components (charts, tables)

Both work in parallel using shared API contract from PM Agent.
Task board in .serena/task-board.md coordinates handoffs.

QA Agent verifies integration after both complete.
```

### Example 4: Starting a Brand New Project

```
You: "Set up a new e-commerce platform"

PM Agent:
  → Reads .context/tech_stack.md
  → Designs architecture: FastAPI + React + Supabase
  → Creates implementation plan with 12 phases
  → Defines API contracts for: products, cart, orders, payments
  → Writes ADRs for: database schema, auth approach, payment provider

You: ✅ "Approved — start with Phase 1"

coordinate workflow runs Phase 1:
  Plan ✅ → Spec ✅ → Code ✅ → Verify ✅

Active plan updates automatically. Ready for Phase 2.
```

### Example 5: Design-to-Code with Stitch

```
You: "Build a landing page using our Stitch design for the coffee brand"

PM Agent (Discuss phase):
  → "Should this be dark or light theme?"
  → "Mobile-first or desktop-first?"
  → "Any existing brand colors to extract?"

You: "Dark theme, mobile-first, pull colors from the Stitch project"

Stitch MCP:
  → Calls list_projects → finds "SA Coffee Brand"
  → Extracts design tokens → writes .context/design_system.md
  → Generates hero, collection, checkout screens

Frontend Agent:
  → Reads design_system.md for colors, typography, layout
  → Scaffolds React + Tailwind from Stitch assets
  → Runs dev server → browser verifies layout

Auto-fix loop (up to 3 rounds):
  → Screenshot → "Hero section is 50/50, spec says 60/40" → fixes → re-verifies ✅

You: ✅ "Deploy to Vercel"
```

### Example 6: Creating a Custom Skill

```
You: "Create a skill for managing feature flags"

Skill Creator (meta-skill):
  → Discovery: "What triggers it? What does the agent need to know?"
  → Uniqueness check: scans skill-routing.md → no overlap
  → Scaffolds:
      skills/feature_flag_manager/
      ├── SKILL.md (743 bytes — under 1KB ✅)
      └── resources/
          ├── execution-protocol.md
          └── checklist.md
  → Registers in skill-routing.md:
      | `feature flag`, `toggle`, `rollout` | feature_flag_manager | Backend |
  → Self-test: triggers match ✅ | frontmatter valid ✅ | links work ✅

You: "Toggle the dark-mode flag for 20% of users"
  → Routes to feature_flag_manager automatically
```

### Example 7: Mapping a Brownfield Codebase

```
You: "I inherited this legacy Rails app — map it"

Architect Agent (/map-codebase):
  → Spawns 4 parallel sub-agents:
      1. Stack Detective → Ruby 3.1, Rails 7, PostgreSQL, Sidekiq, Redis
      2. Architecture Mapper → MVC + Service Objects, 47 models, 23 controllers
      3. Convention Scanner → RSpec, RuboCop, .env.example present
      4. Concern Finder → N+1 queries in 3 controllers, no rate limiting

  → Writes to .planning/research/:
      STRUCTURE.md — directory tree with annotations
      STACK.md — technology inventory
      CONVENTIONS.md — detected patterns
      CONCERNS.md — tech debt hotspots

  → STATE.md updated: "Codebase mapped. 3 critical concerns identified."

You: "Fix the N+1 queries first"
  → PM Agent plans from CONCERNS.md — no re-exploration needed
```

### Example 8: Quick Fix (Minimal Ceremony)

```
You: "/quick rename the UserProfile component to AccountProfile"

Quick workflow (no plan needed):
  → Reads .planning/STATE.md for current context
  → grep: finds 14 references across 6 files
  → Renames all occurrences
  → Updates imports
  → Runs tests → all green ✅
  → Atomic commit: "refactor: rename UserProfile → AccountProfile"
  → STATE.md updated

Total: ~30 seconds, no plan/approval step
```

### Example 9: GSD Discuss → Plan → Execute

```
You: "Add user notifications — email + in-app"

Discuss phase (captures preferences):
  → "Real-time in-app or polling?"
  → "Email provider preference? (SendGrid / Resend / SES)"
  → "Should notifications be batched or immediate?"

You: "Real-time via WebSocket, Resend for email, batch digest every 4 hours"

Plan phase:
  → Reads .planning/PROJECT.md for constraints
  → Generates XML task plan:
      <task type="auto">
        <name>WebSocket notification channel</name>
        <files>src/notifications/ws_channel.py</files>
        <verify>ws connect + receive test message</verify>
      </task>
      <task type="auto">
        <name>Resend email integration</name>
        <files>src/notifications/email.py</files>
        <verify>send test email, check delivery</verify>
      </task>
      ... (6 tasks total)

Execute phase:
  → Each task runs in fresh context (prevents context rot)
  → Each task gets atomic commit: "feat(phase-1): add ws channel"
  → Parallel where possible, sequential where dependent

Verify phase:
  → QA Agent runs all <verify> checks
  → 5/6 pass, 1 fails → auto-generates fix plan → re-executes → ✅
```

---

## ⚙️ Configuration

### Environment Variables

Create a `.env` file (never commit this):

```env
# LLM
GEMINI_API_KEY=your-gemini-key

# Database
SUPABASE_SERVICE_ROLE_KEY=your-supabase-key
DATABASE_URL=postgresql://localhost:5432/mydb

# Integrations (optional)
GITHUB_TOKEN=ghp_...
LINEAR_API_KEY=lin_api_...
SNYK_TOKEN=your-snyk-token
OPENMEMORY_API_KEY=your-openmemory-key
STITCH_API_KEY=your-stitch-key
```

### Customizing Agent Models

In `.agent/config/user-preferences.yaml`:

```yaml
model_routing:
  pm-agent: "gemini-2.5-pro"         # Planning needs deep reasoning
  architect-agent: "gemini-2.5-pro"  # Codebase analysis
  frontend-agent: "gemini-2.5-pro"   # Code generation
  backend-agent: "gemini-2.5-pro"    # Code generation
  qa-agent: "gemini-2.5-pro"         # Security analysis
  debug-agent: "gemini-2.5-pro"      # Complex diagnosis
  mobile-agent: "gemini-2.5-pro"     # Code generation
```

### Skill Bundles

| Bundle | Skills | Best For |
|--------|--------|----------|
| `essentials-only` | git, review, TDD, docs, deps | Solo developers, new projects |
| `team-standard` | Essentials + DB, API, deploy | Team environments |
| `full` | All 10 skills | Enterprise, production systems |

---

## 🤝 Contributing

Contributions welcome! Here's how:

1. **Fork** the repository
2. **Create** a feature branch (`feature/my-new-skill`)
3. **Follow** the template's own conventions (Conventional Commits, TDD)
4. **Submit** a PR with description and linked issue

### Adding a New Skill

1. Create `skills/your_skill/SKILL.md` with the standard frontmatter
2. Add a `resources/` directory with detailed docs
3. Register trigger patterns in `skills/_shared/skill-routing.md`
4. Update `config/skill-selection.yaml` with the new skill

### Adding a New Agent

1. Create `agents/your-agent/SYSTEM_PROMPT.md`
2. Create `agents/your-agent/CAPABILITY_MANIFEST.yaml`
3. Define clear boundaries (what it CAN and CANNOT do)
4. Update workflow files if the agent participates in pipelines

---

## 🙏 Credits & Acknowledgements

This template was synthesized from multiple sources, and credit goes to the original creators and communities:

### Core Framework & Inspiration
- **[Google DeepMind — Antigravity](https://deepmind.google/)** — The Antigravity agentic coding ecosystem that this template is built upon
- **[GSD (Get Shit Done)](https://github.com/gsd-build/get-shit-done)** — Meta-prompting, context engineering, and spec-driven development system by TÂCHES. Key patterns integrated: Discuss phase, XML task formatting, atomic commits, fresh context per task, quick mode, map-codebase, `.planning/` lifecycle
- **[oh-my-ag](https://github.com/nicholasoxford/oh-my-ag)** — Community orchestration framework for multi-agent CLI workflows (181+ ⭐)
- **[Serena Memory Protocol](https://github.com/ralf-life/serena)** — Persistent memory system using human-readable markdown files
- **[OpenMemory](https://github.com/mem0ai/mem0)** — Long-term cross-project memory via vector/graph database

### Research & Design Documents
- **"Building the Ultimate Antigravity Agent"** — Architecture report analyzing oh-my-ag, Serena Memory, and the ecosystem
- **"Ultimate Google Antigravity Agent Template"** — Enterprise-grade specification covering 10 skills, 7 agents, governance, and CI/CD integration
- **"Build AI Agents That Explore" (YouTube)** — Explorer Agent pattern with ReAct loop and filesystem navigation tools
- **"The Ultimate Build" blueprint** — Synthesis document merging Antigravity + GSD into the "Mission Control" paradigm

### Standards & Protocols
- **[Model Context Protocol (MCP)](https://modelcontextprotocol.io/)** — Anthropic's open protocol for tool integration
- **[Conventional Commits](https://www.conventionalcommits.org/)** — Structured commit message specification
- **[Keep a Changelog](https://keepachangelog.com/)** — Changelog format standard
- **[OWASP](https://owasp.org/)** — Security best practices (Top 10, ASVS)
- **[STRIDE](https://learn.microsoft.com/en-us/azure/security/develop/threat-modeling-tool-threats)** — Microsoft's threat modeling framework

### Community
- **[antigravity-awesome-skills](https://github.com/nicholasoxford/antigravity-awesome-skills)** — Community skill registry
- **[Kimi AI](https://www.kimi.com/)** — Research assistance for executive summary and token budget analysis

### Built By
- **STAiNLESS** — Template synthesis, implementation, and testing

---

## 📄 License

This template is provided as-is for use in your projects. See individual skill and dependency licenses for specific terms.

---

<p align="center">
  <strong>Plan first. Verify everything. Ship with confidence.</strong>
  <br><br>
  <em>Built with the Antigravity Agent ecosystem 🚀</em>
</p>
