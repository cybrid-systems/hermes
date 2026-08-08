#!/usr/bin/env bash
set -euo pipefail

echo "=== Hermes structure check ==="

required=(
  "README.md"
  "LICENSE"
  "notes/aura-unify.md"
  "notes/denseness-report.md"
  "notes/escape-log.md"
  "notes/host-residuals.md"
  "prompts/GROK.md"
)

for f in "${required[@]}"; do
  if [[ -f "$f" ]]; then
    echo "  OK  $f"
  else
    echo "  MISSING  $f"
    exit 1
  fi
done

echo "Structure OK (no Aura binary required)."
