---
description: Add a persistent rule with Claude's help (reformulated for clarity)
argument-hint: <describe the rule you want>
---

You are helping the user create a well-formulated persistent rule that survives compaction.

## Workflow

1. **Parse the intent** from: `$ARGUMENTS`
2. **Read** `~/.claude/rules-keeper/rules.md` to check for duplicates
3. **Propose a reformulated version** of the rule:
   - Clear, concise, actionable
   - One line, imperative form
   - Show the original intent and your proposed version side by side
4. **Wait for user validation** - ask if the reformulation is good
5. **On validation**: append to `~/.claude/rules-keeper/rules.md`
6. **Confirm** what was added

## Presentation Format

```
Original: [what the user said]
Proposed: [your reformulated version]

Add this rule? (yes/modify/cancel)
```

## Rules

- Propose ONE clear reformulation, not multiple options
- Keep the spirit of what the user said
- Make it actionable and unambiguous
- If a similar rule exists, point it out and ask if they want to update it
- Don't add until the user explicitly validates
