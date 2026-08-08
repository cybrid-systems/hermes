# Hermes lib

Thin composition surfaces over Aura for the distributed coordination denseness probes.

## Modules

| Module | Role | Status |
|--------|------|--------|
| `hermes-min.aura` | Facade re-export | Phase 1 |
| `hermes-measure.aura` | Metrology / escape accounting (Axis F) | Phase 1 |
| `hermes-topology.aura` | Topology / region / route helpers (Axis A) | Phase 1 |
| `hermes-mutate.aura` | Safe rebind of coordination logic (Axis B) | planned |
| `hermes-wire.aura` | Schema-gated message surface (thin \(E\), Axis D) | planned |
| `hermes-escape.aura` | Escape metering helpers | planned |

All modules *compose* pure Aura (lists, hashes, closures). They do not fork the engine
and do not pull external queues / consensus libraries into the evolvable core.
