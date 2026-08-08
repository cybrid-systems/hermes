# Hermes denseness probes

## Sequence

| # | Probe | Axes | Status |
|---|-------|------|--------|
| 01 | Minimal pure-Aura multi-agent topology + baseline metrology | A F | landed |
| 02 | Mutation of routing / roles / AST coordination policy under load | A B F | landed |
| 03 | Failure injection + recovery | C E F | landed |
| 04 | Thin wire / schema-gated messages | D E F | landed |
| 05 | Multi-process soak + denseness judgment | D E F | landed |

Each probe is runnable via:

```bash
./scripts/run-aura.sh examples/NN-name/main.aura
```

Or the full suite:

```bash
./scripts/run-all.sh
```

Evidence lands in `notes/denseness-report.md`.
