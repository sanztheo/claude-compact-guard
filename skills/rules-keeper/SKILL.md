---
name: rules-keeper
description: Use at the start of every conversation and before every task - maintains rules and task state so important context survives compaction. Always active, no exceptions.
---

# Rules Keeper

## Overview

You have **claude-rules-keeper** installed. Context compaction erases your memory at any time. You maintain TWO files:

1. **`~/.claude/rules-keeper/rules.md`** - Persistent rules that ALWAYS apply (coding standards, user preferences, constraints)
2. **`~/.claude/rules-keeper/current-task.md`** - Current task state (objective, progress, next step)

## 1. Rules (persistent, never expire)

**At conversation start:** Read `~/.claude/rules-keeper/rules.md` and follow every rule listed.

**Auto-detect important rules:** When the user states a preference, constraint, or standard that should persist across sessions, add it to `rules.md` automatically. Examples:
- "Toujours utiliser async/await" → add to rules.md
- "Ne jamais utiliser any en TypeScript" → add to rules.md
- "Les commits doivent etre en francais" → add to rules.md
- "Je prefere les early returns" → add to rules.md

**How to detect:** If the user says something that sounds like a permanent instruction (not task-specific), append it to `~/.claude/rules-keeper/rules.md` as a `- ` list item and confirm briefly.

**User commands:** `/rules <text>` adds raw, `/rules-create <text>` reformulates first.

## 2. Task State (temporary, per-task)

Write to `~/.claude/rules-keeper/current-task.md` at:
1. **Task start** - objective and key files
2. **After major decisions** - choices made
3. **After completing steps** - last action, next step
4. **Before stopping** - final state

Format (keep under 15 lines):
```
Objective: [specific goal]
Key files: [files involved]
Decisions made: [important choices]
Last action: [what was just done]
Next step: [what comes next]
```

## Red Flags

| Thought | Reality |
|---------|---------|
| "I'll write it later" | Compaction can happen NOW. Write immediately. |
| "This rule is obvious" | After compaction, nothing is obvious. Save it. |
| "I'll remember" | You won't. Compaction erases everything. |

## After Compaction

If you see `[COMPACTION RECOVERY]`:
1. Read `rules.md` - these are your standing orders
2. Read recovered task context
3. Confirm with user before continuing
