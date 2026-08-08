# Denseness Report — \(S_{\mathrm{Hermes}}\)

**Status**: Phase 1–3 probes landed (partial evidence; full judgment deferred)

## Summary Judgment

*Not yet a full denseness claim on \(S_{\mathrm{Hermes}}\).*  

| Phase | Result | Axes |
|-------|--------|------|
| 1 Minimal topology + metrology | **pass**, escapes=0 | A F |
| 2 Mutation of routing / roles / AST policy under load | **pass**, escapes=0 | A B F |
| 3 Failure injection + recovery | **pass**, escapes=0 | C E F |

Phase 3 shows **failure & partiality as first-class semantics** on the pure-Aura coordination path: agent pause, message drop, failover routing, and full recover — with an observable fault event log (Axis E) and zero escapes.

Axes D (wire/transport \(E\)) and multi-host soak remain open.  
`std/orchestrator` still avoided ([aura#2767](https://github.com/cybrid-systems/aura/issues/2767)).

## Probe Results

| Probe | Axes | Result | Notes |
|-------|------|--------|-------|
| 01-minimal-topology | A F | **pass** | Star/region; N=40; escapes=0 |
| 02-mutation-routing | A B F | **pass** | Route/role/AST mutation + dual rollback |
| 03-failure-recovery | C E F | **pass** | pause/drop/failover/recover + event log |

### 03-failure-recovery detail

| Round | Failure / recovery | Verify |
|-------|--------------------|--------|
| R0 | baseline | east*2 OK |
| R1 | pause `worker-e` | delivered=0, `:reason paused` |
| R2 | resume | full recover |
| R3 | inject N drops at `router` | failed=N, delivered=batch−N |
| R4 | pause + `failover-east!` | east via worker-w *3 |
| R5 | `recover-normal!` | baseline OK; event log denseness |

- **Escapes on coordination path**: **0**
- **Out of scope**: wire (Phase 4), multi-host (Phase 5)

## Escape Summary

See [`escape-log.md`](escape-log.md) — empty for Phase 1–3 core paths.

## Host residuals

See [`host-residuals.md`](host-residuals.md) — aura#2766–#2769.  
Phase 3 note: private non-exported helpers that free-ref other private helpers can still break; prefer exported bindings or inlined bodies (same discipline as #2766 class).

## Next Actions

1. Phase 4: thin schema-gated wire \(E\) (Axis D).
2. Phase 5: multi-host soak + denseness judgment.
