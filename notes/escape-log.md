# Escape Log — Hermes

Every leave from pure Aura (\(V_A\)) on a coordination-critical path must be recorded here.

| Date | Location | Reason | Mechanism | Impact | Mitigation / Plan |
|------|----------|--------|-----------|--------|-------------------|
| 2026-08-08 | `hermes-host.aura` `host-write-file!` | Cross-process mailbox write | host prim `write-file` (tag 10) | Distribution only; frames still HMSG schema | Keep thin; do not put routing logic in FS |
| 2026-08-08 | `hermes-host.aura` `host-read-file` | Cross-process summary / inbox read | host prim `read-file` (tag 11) | Distribution only | Same |
| 2026-08-08 | `hermes-host.aura` `host-shell!` / `host-run-aura-file!` | Spawn host-B aura worker | host prim `shell` (tag 12) | Distribution only | Prefer future native multi-session when dense |

## Phase 1–4

No required leave from \(V_A\) on the coordination / schema path (wire was pure-Aura strings).

## Phase 4 wire note

`HMSG|v1|…` schema is **conceptual \(E\)** implemented in \(V_A\). Not logged as escape.

## Phase 5 transport note

Multi-process denseness uses **metered host \(E\)** only. Probe enforces:

```text
escapes == host_writes + host_reads + host_shells
```

Evolvable core (topology, routing, schema gate) remains pure Aura on both hosts.

## Convention

- Prefer pure Aura on the evolvable coordination core.
- Escapes on core paths are evidence *against* denseness until justified and isolated.
- Host / packaging residuals go to `host-residuals.md`, not here.
