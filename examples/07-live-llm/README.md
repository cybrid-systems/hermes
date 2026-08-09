# 07-live-llm

Live LLM propose edge (HTTPS \(E\)) + pure-Aura topology delivery.

## Providers

```bash
# MiniMax-M3
source ./scripts/env-minimax.sh
./scripts/run-aura.sh examples/07-live-llm/main.aura

# DeepSeek v4-flash
source ./scripts/env-deepseek.sh
./scripts/run-aura.sh examples/07-live-llm/main.aura
```

Keys: `~/code/keys/minimax`, `~/code/keys/deepseek` (never committed).

Offline / CI without keys: probe prints `RESULT skip` (not a denseness failure).
