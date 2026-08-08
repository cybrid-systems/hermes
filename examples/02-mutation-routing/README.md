# 02-mutation-routing

Phase 2 denseness probe: **hot mutation of routing / roles / coordination policy under multi-agent load**.

## Axes

| Axis | Coverage |
|------|----------|
| **A. Topology completeness** | Star topology remains complete across rebinds |
| **B. Mutation of coordination** | `set-routes!`, `rebind-role!`, AST `coord-scale` rebind + dual rollback |
| **F. Metrology** | route_rebinds, role_rebinds, mut_ok, rollback_ok, escapes |

## Rounds

| Round | What |
|-------|------|
| R0 | Baseline east*2 / west*3 workload |
| R1 | Hot swap routes (east↔west workers) |
| R2 | Hot rebind worker-e role to *5 |
| R3 | Poison routes → restore topology snapshot → workload OK |
| R4 | AST rebind `coord-scale` used by worker → poison → AST restore |

Does **not** use `std/orchestrator` (host [aura#2767](https://github.com/cybrid-systems/aura/issues/2767)).

## Run

```bash
./scripts/run-aura.sh examples/02-mutation-routing/main.aura
```

Expect `RESULT pass example=02-mutation-routing escapes=0`.
