# 03-failure-recovery

Phase 3 denseness probe: **failure injection + recovery** under multi-agent topology.

## Axes

| Axis | Coverage |
|------|----------|
| **C. Failure & partiality** | pause agent, message drop, failover route, full recover |
| **E. Observability** | fault event log (kind/at/msg/region), snapshot paused + event_count |
| **F. Metrology** | inject_*, drops_consumed, pause_hits, failovers, recoveries, escapes |

## Rounds

| Round | What |
|-------|------|
| R0 | Baseline east workload |
| R1 | Pause `worker-e` → all east fail with `:reason paused` |
| R2 | Resume → east recovers |
| R3 | Inject N drops at `router` → exactly N drop failures |
| R4 | Pause + `failover-east!` → east via `worker-w` (*3) |
| R5 | `recover-normal!` + event-log denseness checks |

## Run

```bash
./scripts/run-aura.sh examples/03-failure-recovery/main.aura
```

Expect `RESULT pass example=03-failure-recovery escapes=0`.
