#!/usr/bin/env bash
set -euo pipefail

# Session-start hook: detects if session started right after a compaction
# If compaction was recent (< 60s), writes a marker file for Claude to pick up

readonly GUARD_DIR="${HOME}/.claude/compact-guard"
readonly STATE_FILE="${GUARD_DIR}/state.json"
readonly MARKER_FILE="${GUARD_DIR}/.just-compacted"
readonly COMPACTION_WINDOW_SECONDS=60

# --- Helpers ---

get_last_compaction_epoch() {
    local last_compaction=""

    if [[ ! -f "${STATE_FILE}" ]]; then
        echo "0"
        return
    fi

    if command -v jq &>/dev/null; then
        last_compaction=$(jq -r '.last_compaction // ""' "${STATE_FILE}" 2>/dev/null) || last_compaction=""
    elif command -v python3 &>/dev/null; then
        last_compaction=$(python3 -c "import json; print(json.load(open('${STATE_FILE}')).get('last_compaction',''))" 2>/dev/null) || last_compaction=""
    else
        last_compaction=$(grep -o '"last_compaction"[[:space:]]*:[[:space:]]*"[^"]*"' "${STATE_FILE}" 2>/dev/null | grep -o '"[^"]*"$' | tr -d '"') || last_compaction=""
    fi

    if [[ -z "${last_compaction}" || "${last_compaction}" == "null" ]]; then
        echo "0"
        return
    fi

    # Convert ISO timestamp to epoch
    if command -v python3 &>/dev/null; then
        python3 -c "
from datetime import datetime
try:
    dt = datetime.fromisoformat('${last_compaction}')
    print(int(dt.timestamp()))
except:
    print(0)
" 2>/dev/null || echo "0"
    elif date --version &>/dev/null 2>&1; then
        # GNU date
        date -d "${last_compaction}" "+%s" 2>/dev/null || echo "0"
    else
        # macOS date
        date -j -f "%Y-%m-%dT%H:%M:%S" "${last_compaction}" "+%s" 2>/dev/null || echo "0"
    fi
}

# --- Main ---

main() {
    local last_epoch
    last_epoch=$(get_last_compaction_epoch)

    local now_epoch
    now_epoch=$(date "+%s")

    local diff=$((now_epoch - last_epoch))

    if [[ "${diff}" -le "${COMPACTION_WINDOW_SECONDS}" && "${last_epoch}" -gt 0 ]]; then
        touch "${MARKER_FILE}"
    fi
}

main "$@"
