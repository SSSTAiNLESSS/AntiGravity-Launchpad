# Skill Routing Map

Routing rules for Orchestrator and workflow-guide to assign tasks to the correct agent.

---

## Keyword → Skill Mapping

| User Request Keywords | Primary Skill | Notes |
|----------------------|---------------|-------|
| API, endpoint, REST, GraphQL, database, migration | **backend-agent** | |
| auth, JWT, login, register, password | **backend-agent** | Auth UI task can also be created for frontend |
| UI, component, page, form, screen (web) | **frontend-agent** | |
| style, Tailwind, responsive, CSS | **frontend-agent** | |
| mobile, iOS, Android, Flutter, React Native, app | **mobile-agent** | |
| offline, push notification, camera, GPS | **mobile-agent** | |
| bug, error, crash, broken, slow | **debug-agent** | |
| review, security, performance | **qa-agent** | |
| accessibility, WCAG, a11y | **qa-agent** | |
| plan, breakdown, task, sprint | **pm-agent** | |
| automatic, parallel, orchestrate | **orchestrator** | |
| workflow, guide, manual, step-by-step | **workflow-guide** | |

---

## Complex Request Routing

| Request Pattern | Execution Order |
|----------------|-----------------|
| "Create a fullstack app" | pm → (backend + frontend) parallel → qa |
| "Create a mobile app" | pm → (backend + mobile) parallel → qa |
| "Fullstack + mobile" | pm → (backend + frontend + mobile) parallel → qa |
| "Fix bug and review" | debug → qa |
| "Add feature and test" | pm → relevant agent → qa |
| "Do everything automatically" | orchestrator (internally pm → agents → qa) |
| "I'll manage manually" | workflow-guide |

---

## Inter-Agent Dependency Rules

### Parallel Execution Possible (No Dependencies)
- backend + frontend (when API contract is pre-defined)
- backend + mobile (when API contract is pre-defined)
- frontend + mobile (independent of each other)

### Sequential Execution Required
- pm → all other agents (planning comes first)
- implementation agent → qa (review after implementation complete)
- implementation agent → debug (debugging after implementation complete)
- backend → frontend/mobile (when executing parallel without API contract)

### QA Is Always Last
- qa-agent runs after all implementation tasks are complete
- Exception: Can run immediately if user requests review of specific files only

---

## Escalation Rules

| Situation | Escalation Target |
|-----------|------------------|
| Agent finds bug in different domain | Create task for debug-agent |
| QA finds CRITICAL issue | Re-run relevant domain agent |
| Architecture change needed | Request re-planning from pm-agent |
| Performance issue found (during implementation) | Current agent fixes, debug-agent if severe |
| API contract mismatch | Orchestrator re-runs backend agent |

---

## Turn Limit Guide by Agent

| Agent | Default Turns | Max Turns (including retries) |
|-------|--------------|------------------------------|
| pm-agent | 10 | 15 |
| backend-agent | 20 | 30 |
| frontend-agent | 20 | 30 |
| mobile-agent | 20 | 30 |
| debug-agent | 15 | 25 |
| qa-agent | 15 | 20 |
