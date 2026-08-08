#!/usr/bin/env bash
# Host Aura runner for Hermes denseness probes.
# Expects Aura checkout at ../aura-grok (or set AURA_ROOT).

set -euo pipefail

AURA_ROOT="${AURA_ROOT:-../aura-grok}"
AURA_BIN="${AURA_BIN:-$AURA_ROOT/build/aura}"

if [[ ! -x "$AURA_BIN" ]]; then
  echo "Aura binary not found at $AURA_BIN"
  echo "Build Aura first, or set AURA_ROOT / AURA_BIN."
  exit 1
fi

export AURA_PATH="${AURA_PATH:-$AURA_ROOT/lib:$(pwd)/lib}"
export AURA_SANDBOX="${AURA_SANDBOX:-off}"

exec "$AURA_BIN" "$@"
