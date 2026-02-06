<!-- CLAUDE-RULES-KEEPER:START -->
## Claude Rules Keeper (MANDATORY)

You have **claude-rules-keeper** installed. Context compaction erases your memory. You MUST:

1. **Read `~/.claude/rules-keeper/rules.md`** at conversation start — these are persistent rules to ALWAYS follow
2. **Auto-detect rules:** When the user states a permanent preference/constraint, append it to `rules.md`
3. **Maintain `~/.claude/rules-keeper/current-task.md`** with current task state (objective, progress, next step)
4. **After compaction (`[COMPACTION RECOVERY]`):** Read rules.md + recovered context, confirm with user

**Commands:** `/rules <text>` adds raw rule, `/rules-create <text>` reformulates first.

This is NON-NEGOTIABLE. If you skip this, rules and work will be lost on compaction.
<!-- CLAUDE-RULES-KEEPER:END -->
