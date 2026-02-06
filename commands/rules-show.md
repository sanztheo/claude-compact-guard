---
description: Show all active rules for the current session (session + global + project)
---

You are showing the user all rules currently active in this session.

## Workflow

1. **Read session rules:** `~/.claude/rules-keeper/session-rules.md`
2. **Read global rules:** `~/.claude/rules-keeper/rules.md`
3. **Detect project:** Run `basename $(git rev-parse --show-toplevel 2>/dev/null || pwd)` to get the project name
4. **Read project rules:** `~/.claude/rules-keeper/projects/<project>/rules.md` (if it exists)
5. **Display** all rules in a clear format:

## Display Format

```
Active Rules

── Session ─────────────────────────
- [rule 1]
(or "No session rules.")

── Global ──────────────────────────
- [rule 1]
(or "No global rules.")

── Project: <name> ─────────────────
- [rule 1]
(or "No project rules for <name>.")
```

## Rules

- Read the actual files, don't guess
- If all are empty, say "No rules set. Use /rules to add a session rule, /rules-global for a permanent rule."
- Show the count of rules per scope
- Keep it concise, no extra commentary
