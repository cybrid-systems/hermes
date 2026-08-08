# Hermes lib

Thin composition surfaces over Aura for the distributed coordination denseness probes.

## Modules

| Module | Role | Status |
|--------|------|--------|
| `hermes-min.aura` | Facade re-export | Phase 1–4 |
| `hermes-measure.aura` | Metrology / escape accounting (Axis F) | Phase 1–4 |
| `hermes-topology.aura` | Topology / routes / roles / fault plane (A/B/C/E) | Phase 1–3 |
| `hermes-mutate.aura` | Safe AST rebind of coordination policy (Axis B) | Phase 2 |
| `hermes-fault.aura` | Failure injection + recovery policies (Axis C/E) | Phase 3 |
| `hermes-wire.aura` | Schema-gated message surface (thin \(E\), Axis D) | Phase 4 |
| `hermes-escape.aura` | Escape metering helpers | planned |

All modules *compose* pure Aura (lists, hashes, closures). They do not fork the engine
and do not pull external queues / consensus libraries into the evolvable core.
