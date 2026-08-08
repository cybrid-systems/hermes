# Denseness Report — \(S_{\mathrm{Hermes}}\)

**Status**: Phase 1–2 probes landed (partial evidence; full judgment deferred)

## Summary Judgment

*Not yet a full denseness claim on \(S_{\mathrm{Hermes}}\).*  

| Phase | Result | Axes |
|-------|--------|------|
| 1 Minimal topology + metrology | **pass**, escapes=0 | A F |
| 2 Mutation of routing / roles / AST coordination policy under load | **pass**, escapes=0 | A B F |

Phase 2 shows that **coordination topology and policy** can be hot-mutated (route table, agent roles, AST `coord-scale`) under multi-agent load with dual rollback (topology routes + AST snapshot), still pure Aura on the evolvable core.

Axes C–E (failure/partiality, wire, cross-node observability) remain unproven.  
`std/orchestrator` is still avoided (host [aura#2767](https://github.com/cybrid-systems/aura/issues/2767)).

## Probe Results

| Probe | Axes | Result | Notes |
|-------|------|--------|-------|
| 01-minimal-topology | A F | **pass** | Star/region; N=40; escapes=0 |
| 02-mutation-routing | A B F | **pass** | Route swap, role rebind, poison→restore, AST rebind+rollback; escapes=0 |

### 02-mutation-routing detail

| Round | Mutation | Verify |
|-------|----------|--------|
| R0 | baseline | east*2 / west*3 sum |
| R1 | `set-routes!` swap east↔west workers | inverted factors under load |
| R2 | `rebind-role!` worker-e → *5 | east-only batch |
| R3 | poison routes → `restore-topology-routes!` | dual rollback of route baseline |
| R4 | `rebind-safe` `coord-scale` *2→*4; poison *99; AST restore | workload + sample after restore |

- **Escapes on coordination path**: **0**
- **Out of scope**: failure injection (Phase 3), wire (Phase 4), multi-host (Phase 5)

## Escape Summary

See [`escape-log.md`](escape-log.md) — empty for Phase 1–2 core paths.

## Host residuals

See [`host-residuals.md`](host-residuals.md) — aura#2766–#2769.

## Next Actions

1. Phase 3: failure injection (drop / pause) + recovery denseness (Axis C).
2. Phase 4: thin schema-gated wire \(E\) (Axis D).
3. Phase 5: multi-host soak + denseness judgment.
