# 04-thin-wire

Phase 4 denseness probe: **thin schema-gated wire boundary**.

## Axes

| Axis | Coverage |
|------|----------|
| **D. Wire & transport boundary** | Pure-Aura `HMSG\|v1\|…` schema; refuse bad frames; batch send |
| **E. Observability** | `wire_*` counters, refuse reasons |
| **F. Metrology** | encode/decode/ok/refuse/bytes; escapes=0 on core |

## Wire format

```
HMSG|v1|<id>|<from>|<to>|<region>|<payload>
```

- Fields: non-empty, no `|` delimiter injection  
- `payload`: number token  
- Invalid frames never enter topology delivery  

This is **conceptual \(E\)** (boundary) implemented **inside \(V_A\)** (string schema) — denseness evidence that the wire *schema* need not leave pure Aura. Multi-host sockets are Phase 5.

## Run

```bash
./scripts/run-aura.sh examples/04-thin-wire/main.aura
```

Expect `RESULT pass example=04-thin-wire escapes=0`.
