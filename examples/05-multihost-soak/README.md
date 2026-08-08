# 05-multihost-soak

Phase 5 denseness probe: **multi-process host boundary + soak + judgment**.

## Architecture

```
Host A (main.aura)                    Host B (worker.aura, child process)
  encode HMSG frames
  write-file inbox  ───────────────►  read-file inbox
                                      schema gate + star topology deliver
  read-file outbox  ◄───────────────  write-file outbox summary
```

## Axes

| Axis | Coverage |
|------|----------|
| **D** | Wire schema (V_A) + host FS/shell transport (\(E\), metered) |
| **E** | Cross-process summary observability |
| **F** | escapes == host_writes+reads+shells; soak correctness |

## Escapes (audited)

| Tag | Mechanism |
|-----|-----------|
| 10 | `write-file` mailbox / outbox clear |
| 11 | `read-file` summary |
| 12 | `shell` child aura process |

Coordination core (topology + HMSG schema) stays pure Aura.

## Run

```bash
./scripts/run-aura.sh examples/05-multihost-soak/main.aura
```

Expect `RESULT pass example=05-multihost-soak` and a denseness **JUDGMENT** line.
