<!-- CLAUDE-RULES-KEEPER:START -->
## Claude Rules Keeper (MANDATORY)

You have **claude-rules-keeper** installed. Context compaction erases your memory. You MUST:

1. **Read rules at conversation start:**
   - Session: `~/.claude/rules-keeper/session-rules.md` (this conversation only)
   - Global: `~/.claude/rules-keeper/rules.md` (permanent)
   - Project: `~/.claude/rules-keeper/projects/<project>/rules.md` (detect via `git rev-parse --show-toplevel` basename)
2. **Auto-detect rules:** Default to **session scope**. Only save to global if user says "toujours"/"permanently".
3. **Maintain `~/.claude/rules-keeper/current-task.md`** with current task state
4. **After compaction (`[COMPACTION RECOVERY]`):** Read all rules + recovered context, confirm with user

**Commands:** `/rules` (session), `/rules-global` (permanent), `/rules-create`, `/rules-project`, `/rules-show`, `/rules-save`, `/rules-load`

This is NON-NEGOTIABLE. If you skip this, rules and work will be lost on compaction.
<!-- CLAUDE-RULES-KEEPER:END -->
