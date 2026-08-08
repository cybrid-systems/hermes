# Hermes lib

Thin composition surfaces over Aura stdlib for the distributed coordination denseness probes.

Planned modules (to be filled with probes):

- `hermes-min.aura` — minimal facade
- `hermes-measure.aura` — metrology / escape accounting
- `hermes-topology.aura` — topology / region / arbiter helpers
- `hermes-mutate.aura` — safe rebind of coordination logic
- `hermes-wire.aura` — schema-gated message surface (thin \(E\))
- `hermes-escape.aura` — escape metering helpers

All modules should *compose* Aura primitives (`mutate:*`, `query:*`, `orch:*`, fibers, mailboxes, …) rather than reimplement them.
