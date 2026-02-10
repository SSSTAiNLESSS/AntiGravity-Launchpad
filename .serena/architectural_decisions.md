# Architecture Decision Records (ADRs)

## ADR-001: Multi-Agent Orchestration via oh-my-ag
- **Status**: Accepted
- **Date**: 2026-02-10
- **Context**: Need structured multi-agent coordination for the development workflow.
- **Decision**: Adopt oh-my-ag's 6-agent architecture with Serena Memory.
- **Consequences**: Enables parallel CLI execution, persistent state, and role-based specialization.

## ADR-002: .context/ Grounding Layer
- **Status**: Accepted
- **Date**: 2026-02-10
- **Context**: Agents frequently hallucinate tech stack choices (e.g., suggesting TensorFlow when project uses PyTorch).
- **Decision**: Maintain `.context/tech_stack.md` and `.context/coding_standards.md` as immutable grounding files injected into every agent prompt.
- **Consequences**: Drastically reduces dependency hallucination. Files must be kept current.

## ADR-003: Plan Mode Supremacy
- **Status**: Accepted
- **Date**: 2026-02-10
- **Context**: Unconstrained code generation leads to runaway execution, hallucination loops, and technical debt.
- **Decision**: Enforce mandatory planning phase with human approval gate for any task involving >3 files or cross-layer changes.
- **Consequences**: Slower initial velocity but significantly higher quality and predictability.
