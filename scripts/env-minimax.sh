#!/usr/bin/env bash
# MiniMax-M3 credentials for Hermes live LLM probes (OpenAI-compatible).
#
#   source ./scripts/env-minimax.sh
#   ./scripts/run-aura.sh examples/07-live-llm/main.aura
#
# Key file: ~/code/keys/minimax  (raw token or KEY=value)
# Does not print secrets.

set -euo pipefail

KEY_FILE="${MINIMAX_KEY_FILE:-$HOME/code/keys/minimax}"
if [[ ! -f "$KEY_FILE" ]]; then
  echo "error: MiniMax key file not found: $KEY_FILE" >&2
  return 1 2>/dev/null || exit 1
fi

_raw="$(tr -d '\r\n' < "$KEY_FILE" | sed 's/^[[:space:]]*//;s/[[:space:]]*$//')"
if [[ "$_raw" == *=* ]]; then
  export LLM_API_KEY="${_raw#*=}"
else
  export LLM_API_KEY="$_raw"
fi
unset _raw

# Always set provider defaults (override previous env-deepseek etc.).
export LLM_BASE_URL="https://api.minimaxi.com/v1"
export LLM_MODEL="${LLM_MODEL_OVERRIDE:-MiniMax-M3}"
export HERMES_LLM_LIVE="${HERMES_LLM_LIVE:-1}"

echo "env-minimax: LLM_MODEL=$LLM_MODEL LLM_BASE_URL=$LLM_BASE_URL key=set"
