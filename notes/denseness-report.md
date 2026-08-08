# Denseness Report — \(S_{\mathrm{Hermes}}\)

**Status**: Phase 1 probe landed (partial evidence; full judgment deferred)

## Summary Judgment

*Not yet a full denseness claim on \(S_{\mathrm{Hermes}}\).*  
Phase 1 shows that a **minimal multi-agent coordination topology** (star/region
router + workers + collector) can live entirely in pure Aura \(V_A\) with
**zero escapes** on the coordination path under single-host / single-process
execution, with baseline metrology and closed-form correctness checks.

Axes B–E (mutation of coordination, failure/partiality, wire, cross-node
observability) remain unproven.

## Probe Results

| Probe | Axes | Result | Notes |
|-------|------|--------|-------|
| 01-minimal-topology | A F | **pass** (local) | Star/region topology; N=40 messages; escapes=0; route miss metered |

### 01-minimal-topology detail

- **Topology**: `producer → router ─east/west→ worker-* → collector`
- **Objects in \(V_A\)**: agents list, route table, role handlers, message records, inbox
- **Correctness**: east payload \(i \mapsto 2i\), west \(i \mapsto 3i\); sum matches closed form
- **Metrology**: messages_sent/delivered, hops_total, route_hits/miss, correctness_*, escapes
- **Escapes on coordination path**: **0**
- **Out of scope here**: topology mutation, failure injection, wire/transport, multi-host

## Escape Summary

See [`escape-log.md`](escape-log.md) — empty for Phase 1 core path.

## Next Actions

1. Phase 2: hot rebind of router / region map under load (Axis B).
2. Phase 3: failure injection (drop / pause) + recovery denseness (Axis C).
3. Phase 4: thin schema-gated wire \(E\) (Axis D).
4. Phase 5: multi-host soak + denseness judgment.
