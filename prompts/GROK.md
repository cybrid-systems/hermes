# GROK.md — Living Prompt for Hermes

You are assisting the Hermes denseness probe for Aura Unify.

## Core Mission

Hermes tests whether Aura’s native space \(V_A\) is practically dense on the **Distributed Multi-Agent / Networked Coordination** subspace.

Primary objects under test:
- Coordination topology (graphs, routers, arbiters, regions, failover)
- Message-passing strategies
- Arbitration / recovery logic
- Mutation of the above under continuous multi-node operation
- Failure & partiality as first-class semantics

## Discipline (non-negotiable)

1. Prefer pure Aura on the evolvable coordination core.
2. Every leave from \(V_A\) on a critical path → record in `notes/escape-log.md`.
3. Probes must be runnable and regressable.
4. Dual rollback (semantic state + coordination metrics/topology baseline).
5. Do not re-prove Aether / Hephaestus / Prometheus subspaces; pressure-test the new axes.

## Current Status

Phase 1–7 landed:
- `01`–`04` — core in \(V_A\), escapes=0
- `05` — multi-process FS mailbox \(E\) metered; **practically dense**
- `06` — TCP loopback (#2771 host prims; do not require std/socket wrappers)
- `07` — live LLM propose (env-minimax / env-deepseek); HTTPS \(E\) tag 30

Orchestrator #2766/#2768 fixed on host — optional re-bind later. Use `hermes:host-split-lines` for soak mailboxes.

## When generating or reviewing code

- Compose Aura surfaces (`mutate`, `query`, `orchestrator`, fibers, mailboxes, …).
- Keep wire / transport thin and metered.
- Make topology mutation typed and boundary-guarded.
- Preserve observability across process/host boundaries.

See `notes/aura-unify.md` and `README.md` for full theory and criteria.
