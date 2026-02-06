---
description: Add a persistent rule that survives compaction (raw, no reformulation)
argument-hint: <rule to remember>
---

You are adding a persistent rule to the user's rules-keeper file. This rule will survive all context compactions.

## Workflow

1. **Parse the rule** from the user's argument: `$ARGUMENTS`
2. **Read** `~/.claude/rules-keeper/rules.md` to see existing rules
3. **Append** the new rule to the file, keeping it clean:
   - Add a `- ` prefix (markdown list item)
   - Keep the exact wording the user provided (no reformulation)
   - Don't duplicate if the same rule already exists
4. **Confirm** what was added

## Format in rules.md

```markdown
# Persistent Rules

- [rule 1 as written by user]
- [rule 2 as written by user]
```

## Rules

- NEVER reformulate or "improve" the user's wording - write it EXACTLY as given
- If the file doesn't exist, create it with the `# Persistent Rules` header
- If a similar rule already exists, warn the user instead of duplicating
- Keep rules concise - one line each
- No verbose confirmation - just show what was added
