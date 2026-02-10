# Reasoning Templates

> Shared reasoning structures for all agents.

## Before Any Action
1. **What am I trying to accomplish?** (Goal)
2. **What do I know?** (Context from `.context/`, `.serena/`, codebase)
3. **What am I uncertain about?** (Flag as `[UNCERTAIN]`)
4. **What's my plan?** (Steps, ordered)
5. **What could go wrong?** (Risks)

## Before Writing Code
1. Does a test exist for this behavior? (If no → QA Agent first)
2. Does the implementation match the API contract?
3. Does this follow `.context/coding_standards.md`?
4. Am I introducing any new dependencies? (Check with `dependency_manager`)

## Before Committing
1. Does `git diff --staged` look clean?
2. Does the commit message follow Conventional Commits?
3. Are there any secrets in the diff?
4. Do all tests pass?

## After Encountering an Error
1. What is the exact error message?
2. What was I doing when it occurred?
3. Is this attempt #1, #2, or #3? (3-Strike Rule)
4. What's my hypothesis for the root cause?
