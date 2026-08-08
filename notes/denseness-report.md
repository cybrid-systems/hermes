# Denseness Report — \(S_{\mathrm{Hermes}}\)

**Status**: Phase 1–5 landed — **constructive denseness judgment recorded**

## Summary Judgment

### Practically dense (single-machine multi-process \(S_{\mathrm{Hermes}}\))

On the high-leverage coordination subspace Hermes claims, Aura’s native space \(V_A\) is **practically dense** for the evolvable core:

| Layer | Where it lives | Evidence |
|-------|----------------|----------|
| Topology / routing / roles | pure Aura | Phases 1–3 |
| Coordination mutation + dual rollback | pure Aura + `mutate:rebind` | Phase 2 |
| Failure/partiality + event log | pure Aura | Phase 3 |
| Wire **schema** (`HMSG\|v1`) | pure Aura | Phase 4 |
| Cross-process transport | audited \(E\): `write-file` / `read-file` / `shell` | Phase 5 |

**Necessary escapes \(E\)** are limited to host FS + process spawn, **metered** (`escapes == host_writes + host_reads + host_shells`), and **do not** own the evolvable coordination logic. Invalid frames are refused by schema on the worker before topology delivery.

### Explicit limits of this judgment

| Not claimed | Why |
|-------------|-----|
| Production multi-datacenter / WAN denseness | Single-machine multi-process only |
| TCP/UDP listen denseness | Host exposes client `tcp-connect` but no `tcp-listen` in std surface used here |
| `std/orchestrator` denseness | Still avoided ([aura#2767](https://github.com/cybrid-systems/aura/issues/2767)) |
| Zero escapes absolute | Phase 5 **requires** thin host \(E\); denseness is “core dense + \(E\) thin/metered” |

## Probe Results

| Probe | Axes | Result | Notes |
|-------|------|--------|-------|
| 01-minimal-topology | A F | **pass** escapes=0 | Star/region |
| 02-mutation-routing | A B F | **pass** escapes=0 | Route/role/AST |
| 03-failure-recovery | C E F | **pass** escapes=0 | pause/drop/failover |
| 04-thin-wire | D E F | **pass** escapes=0 | schema gate |
| 05-multihost-soak | D E F | **pass** escapes=12 | multi-process soak N=30 |

### 05-multihost-soak detail

```
Host A (main)  --HMSG frames-->  write-file inbox
Host B (worker child aura)       read + schema + topology
Host A  <--summary--             read-file outbox
```

| Round | Result |
|-------|--------|
| R0 N=8 happy path | delivered=8, collector_sum=72 |
| R1 soak N=30 | delivered=30, payload_sum=465, collector_sum=930 |
| R2 bad frames | refused≥2, good messages still deliver |
| R3 escape isolation | escapes = writes+reads+shells; host_fail=0 |

## Escape Summary

See [`escape-log.md`](escape-log.md). Phase 5 tags: 10=write-file, 11=read-file, 12=shell.

## Host residuals

See [`host-residuals.md`](host-residuals.md). Phase 5: export `AURA_BIN`; avoid deep-recursive `string-split` on soak mailboxes (`hermes:host-split-lines`).

## Next (optional)

- Real TCP multi-host when listen/accept is denseness-safe
- Re-bind official orchestrator after #2767
- Longer soak / overnight-coord
