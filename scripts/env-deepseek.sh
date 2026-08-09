#!/usr/bin/env bash
# DeepSeek credentials for Hermes live LLM probes (OpenAI-compatible).
#
#   source ./scripts/env-deepseek.sh
#   ./scripts/run-aura.sh examples/07-live-llm/main.aura
#
# Key file: ~/code/keys/deepseek
# Default model: deepseek-v4-flash (override with LLM_MODEL=...)
# Does not print secrets.

set -euo pipefail

KEY_FILE="${DEEPSEEK_KEY_FILE:-$HOME/code/keys/deepseek}"
if [[ ! -f "$KEY_FILE" ]]; then
  echo "error: DeepSeek key file not found: $KEY_FILE" >&2
  return 1 2>/dev/null || exit 1
fi

_raw="$(tr -d '\r\n' < "$KEY_FILE" | sed 's/^[[:space:]]*//;s/[[:space:]]*$//')"
if [[ "$_raw" == *=* ]]; then
  export LLM_API_KEY="${_raw#*=}"
else
  export LLM_API_KEY="$_raw"
fi
unset _raw

# Always set provider defaults (override previous env-minimax etc.).
export LLM_BASE_URL="https://api.deepseek.com/v1"
export LLM_MODEL="${LLM_MODEL_OVERRIDE:-deepseek-v4-flash}"
export HERMES_LLM_LIVE="${HERMES_LLM_LIVE:-1}"

echo "env-deepseek: LLM_MODEL=$LLM_MODEL LLM_BASE_URL=$LLM_BASE_URL key=set"
