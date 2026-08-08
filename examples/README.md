# Hermes denseness probes

Copy `_template` (when added) to create a new probe.

## Planned sequence

| # | Probe | Axes | Status |
|---|-------|------|--------|
| 01 | Minimal pure-Aura multi-agent topology + baseline metrology | A F | planned |
| 02 | Mutation of routing / arbiter under load | A B F | planned |
| 03 | Failure injection + recovery | C E F | planned |
| 04 | Thin wire / schema-gated messages | D E | planned |
| 05+ | Multi-host soak, denseness judgment | all | planned |

Each probe should be runnable via `./scripts/run-aura.sh examples/NN-name/main.aura` and contribute evidence to `notes/denseness-report.md`.
