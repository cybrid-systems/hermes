# Hermes lib

Thin composition surfaces over Aura for the distributed coordination denseness probes.

## Modules

| Module | Role | Status |
|--------|------|--------|
| `hermes-min.aura` | Facade re-export | Phase 1–5 |
| `hermes-measure.aura` | Metrology / escape accounting (Axis F) | Phase 1–5 |
| `hermes-topology.aura` | Topology / routes / roles / fault plane (A/B/C/E) | Phase 1–3 |
| `hermes-mutate.aura` | Safe AST rebind of coordination policy (Axis B) | Phase 2 |
| `hermes-fault.aura` | Failure injection + recovery policies (Axis C/E) | Phase 3 |
| `hermes-wire.aura` | Schema-gated message surface (Axis D) | Phase 4 |
| `hermes-host.aura` | Multi-process FS/shell transport (\(E\), Axis D/E) | Phase 5 |
| `hermes-tcp.aura` | TCP listen/accept/connect wrappers (host prims, Axis D) | Phase 6 |
| `hermes-llm.aura` | Live `llm:chat` propose edge (HTTPS \(E\)) | Phase 7 |

All modules *compose* pure Aura (lists, hashes, closures). They do not fork the engine
and do not pull external queues / consensus libraries into the evolvable core.
