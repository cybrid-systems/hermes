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
  "lib/hermes-min.aura"
  "lib/hermes-measure.aura"
  "lib/hermes-topology.aura"
  "lib/hermes-mutate.aura"
  "lib/hermes-fault.aura"
  "lib/hermes-wire.aura"
  "examples/01-minimal-topology/main.aura"
  "examples/02-mutation-routing/main.aura"
  "examples/03-failure-recovery/main.aura"
  "examples/04-thin-wire/main.aura"
  "scripts/run-aura.sh"
  "scripts/run-all.sh"
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
