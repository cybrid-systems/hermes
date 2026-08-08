# Denseness Report — \(S_{\mathrm{Hermes}}\)

**Status**: Phase 1–4 probes landed (partial evidence; multi-host judgment deferred)

## Summary Judgment

*Not yet a full denseness claim on multi-host \(S_{\mathrm{Hermes}}\).*  
Single-host / single-process denseness on axes **A–F (partial D)** is constructively positive:

| Phase | Result | Axes |
|-------|--------|------|
| 1 Minimal topology + metrology | **pass**, escapes=0 | A F |
| 2 Mutation of routing / roles / AST policy under load | **pass**, escapes=0 | A B F |
| 3 Failure injection + recovery | **pass**, escapes=0 | C E F |
| 4 Thin schema-gated wire | **pass**, escapes=0 | D E F |

Phase 4 shows the **wire schema boundary** can live in pure Aura \(V_A\) (`HMSG|v1|…` pipe frame), refuse invalid frames before topology delivery, and meter crossings via `wire_*` stats — without external queues or JSON engine on the denseness path.

Phase 5 (multi-host sockets / discovery) remains the open pressure test for true network \(E\).

`std/orchestrator` still avoided ([aura#2767](https://github.com/cybrid-systems/aura/issues/2767)).

## Probe Results

| Probe | Axes | Result | Notes |
|-------|------|--------|-------|
| 01-minimal-topology | A F | **pass** | Star/region; N=40 |
| 02-mutation-routing | A B F | **pass** | Route/role/AST + dual rollback |
| 03-failure-recovery | C E F | **pass** | pause/drop/failover/recover |
| 04-thin-wire | D E F | **pass** | schema gate + batch wire send |

### 04-thin-wire detail

| Round | What |
|-------|------|
| R0 | encode/decode roundtrip |
| R1 | valid wire → topology → collector |
| R2 | refuse bad magic/version/arity/payload/injection |
| R3 | batch N=20 wire messages, sum closed-form |
| R4 | `wire_*` metrology; escapes=0 |

- **Escapes on coordination + wire-schema path**: **0** (pure-Aura string schema)
- **Conceptual \(E\)**: wire is a gated boundary; implementation remains in \(V_A\) for this phase
- **Out of scope**: multi-host TCP/UDP, external brokers (Phase 5 / denseness collapse if required on core)

## Escape Summary

See [`escape-log.md`](escape-log.md). Phase 1–4 core paths: no required leave from \(V_A\).

## Host residuals

See [`host-residuals.md`](host-residuals.md) — aura#2766–#2769.

## Next Actions

1. Phase 5: multi-host soak + denseness judgment (thin transport \(E\) if host forces it).
2. Optionally adopt `std/orchestrator` when #2767 fixed.
