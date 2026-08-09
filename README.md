# Hermes

**Distributed Multi-Agent / Networked Coordination denseness probe on Aura — the fourth concrete span of Aura Unify.**

Hermes is not a general-purpose distributed systems framework and not a reimplementation of message queues or consensus libraries.
It is the fourth **concrete span project** of [Aura Unify](notes/aura-unify.md):
an empirical test of whether Aura’s native space \(V_A\) can densely cover the
cross-process / cross-host coordination region of practical software.

> Aura supplies a machine-friendly basis.  
> Aether showed denseness on the agent + mutation closed-loop subspace.  
> Hephaestus showed denseness on the performance / numerical / systems-kernel subspace.  
> Prometheus showed denseness on large-scale continuous AST mutation + incremental compilation.  
> Hermes asks whether the same basis remains dense when the primary
> computational objects are **coordination topology, message routing, arbitration,
> failure recovery, and the mutation of these coordination logics themselves across process/machine boundaries**.

**Read first (theory):** [`notes/aura-unify.md`](notes/aura-unify.md) — Aura Unify 总论（语义空间、span 程序、与 Aether / Hephaestus / Prometheus / 本仓的关系）。

## The subspace Hermes claims: \(S_{\mathrm{Hermes}}\)

Hermes does **not** try to prove \(V_A \approx S_{\mathrm{practical}}\).
It claims only a high-leverage distributed-coordination subspace:

\[
S_{\mathrm{Hermes}} \subset S_{\mathrm{practical}}
\]

**Systems whose primary computational objects are multi-node coordination topologies,
message-passing strategies, arbitration / consensus logic, and failure-recovery policies** —
and where those objects themselves must be safely mutable under continuous operation.

A system is in \(S_{\mathrm{Hermes}}\) when it simultaneously has:

1. **Coordination topology as first-class object** — agent graphs, routers, arbiters, regions, failover policies  
2. **Cross-boundary closed loops** — Observe → Decide → Safe Mutation → Verify → Rollback spanning process or host boundaries  
3. **Mutation of coordination itself** — hot rebind of routing / arbitration / recovery logic while the system continues  
4. **Failure & partiality as semantics** — network partition, node loss, message loss are first-class and observable  
5. **Controlled network / wire escape set \(E\)** — serialization, transport, and external discovery live in a metered, capability-gated boundary

### Denseness proposition (defensible form)

> On \(S_{\mathrm{Hermes}}\), \(V_A\) is dense for the **evolvable coordination core**:  
> the majority of topology, routing, arbitration, and recovery logic stays in pure Aura;
> necessary escapes \(E\) (wire formats, transport, host discovery) are rare, metered,
> ownership-safe, and do not destroy post-mutation correctness, observability, or dual rollback.

If this subspace cannot achieve low escape rates on the coordination path while preserving
safety under partial failure and topology mutation, the broader Unify thesis is weakened
at its fourth highest-leverage engineering point — the point required for truly distributed
self-evolving agents.

### Explicitly out of scope (initial phases)

| Out of scope | Why |
|--------------|-----|
| Full consensus algorithms (Raft/Paxos production) | Later pressure tests; start with simpler reliable messaging + arbiter |
| Hard realtime / sub-ms cross-host guarantees | Different safety regime |
| Rebuilding Aura’s fiber / mailbox / orchestrator machinery | Aura already provides the basis |
| Proving universal denseness of all distributed systems | Constructive measurement only |

## Canonical distributed denseness loop

```
Bind / Specialize Topology  →  Run multi-node workload  →  Observe metrics + failures  →
Safe Mutation of routing / arbiter / recovery  →  Verify correctness + coordination envelope  →
Rollback (if needed)  →  Bind / Specialize
```

Invariants we care about:

- Mutation of coordination logic only through typed / boundary-guarded paths  
- Full observability of topology state, message outcomes, failure modes, escape cost  
- Dual rollback: semantic state **and** coordination metrics / topology baseline  
- Evolvable core stays in pure Aura; wire / transport / discovery are thin, audited \(E\)

## Orthogonal axes inside \(S_{\mathrm{Hermes}}\)

| Axis | Question |
|------|----------|
| **A. Topology completeness** | Can realistic multi-agent coordination graphs live mostly in \(V_A\)? |
| **B. Mutation of coordination** | Hot rebind of router / arbiter / recovery while running, still correct? |
| **C. Failure & partiality** | Partition, node loss, message loss remain observable and recoverable without leaving core? |
| **D. Wire & transport boundary** | Serialization + transport stay thin, metered, ownership-safe \(E\)? |
| **E. Cross-node observability** | Metrics, decision logs, and dual rollback work across boundaries? |
| **F. Metrology** | Escape rate on coordination path, latency/correctness regression under topology mutation |

## Relationship to Aura and prior spans

| Layer | Owner | Role |
|-------|--------|------|
| Runtime, typed mutation, ownership, fibers, mailboxes, orchestrator | Aura (`../aura-grok`) | Basis \(V_A\) |
| Thin stdlib surfaces (`mutate`, `query`, `orchestrator`, `hot-update`, `workspace`, …) | Aura | Callable operators |
| Agent closed-loop denseness evidence | [Aether](../aether) | First span — *practically dense* on \(S_{\mathrm{Aether}}\) |
| Performance / numerical / systems-kernel denseness evidence | [Hephaestus](../hephaestus) | Second span — *practically dense* on \(S_{\mathrm{Hephaestus}}\) |
| Large-scale continuous AST mutation denseness evidence | [Prometheus](../prometheus) | Third span — *practically dense* on \(S_{\mathrm{Prometheus}}\) |
| **Distributed coordination denseness evidence** | **Hermes** | Fourth span |

Hermes **composes** Aura surfaces. It does not fork the engine.
It **does not re-prove** the prior three subspaces; it pressure-tests the next high-leverage region
under the same Unify discipline (escape log, denseness report, pure-Aura preference on the evolvable core).

Local development is expected against an Aura checkout (default `../aura-grok` via `scripts/run-aura.sh`):

```bash
./scripts/run-aura.sh examples/01-minimal-topology/main.aura
```

### Documents

| Doc | Purpose |
|-----|---------|
| [`notes/aura-unify.md`](notes/aura-unify.md) | Aura Unify theory + span program |
| [`notes/denseness-report.md`](notes/denseness-report.md) | Evidence & judgment on \(S_{\mathrm{Hermes}}\) |
| [`notes/escape-log.md`](notes/escape-log.md) | Required log of leaves from \(V_A\) |
| [`notes/host-residuals.md`](notes/host-residuals.md) | Host/packaging issues (not denseness failures) |
| [`prompts/GROK.md`](prompts/GROK.md) | Living agent prompt |
| Prior denseness reports | See Aether / Hephaestus / Prometheus `notes/denseness-report.md` |

## Practical denseness criteria (tunable)

| Metric | Suggested threshold | Meaning |
|--------|---------------------|---------|
| Coordination-path escape rate | low / measurable | By critical path |
| Correctness after topology mutation + load / failure | ≈ 100% | No silent wrong answers |
| Dual rollback (state + coordination baseline) | yes | |
| Wire / transport isolation | core stays pure | Schema-gated, metered |
| Observability across nodes | full fields | topology / decision / outcome / failure |

**Failure modes** (pre-declared):

- Coordination logic *requires* unguarded external queue / consensus library → denseness claim collapses  
- Topology mutation introduces split-brain or unrecoverable partial state → safety failure  
- Cross-node correctness only achievable by abandoning observability → metrology failure  

## Project structure

```
hermes/
├── README.md
├── LICENSE
├── .github/workflows/denseness.yml
├── scripts/
│   ├── run-aura.sh
│   ├── run-all.sh
│   ├── check-structure.sh
│   └── overnight-coord.sh
├── lib/                    # hermes-{min,measure,topology,mutate,wire,escape}
├── examples/01 …           # denseness probes
├── notes/                  # aura-unify, denseness-report, escape-log, host-residuals
└── prompts/GROK.md
```

## Span order (initial)

| Phase | Focus | Status |
|-------|--------|--------|
| **1** | Minimal pure-Aura multi-agent topology + baseline metrology (single host, process boundary) | **landed** (`examples/01-minimal-topology`) |
| **2** | Mutation of routing / roles / AST coordination policy under load | **landed** (`examples/02-mutation-routing`) |
| **3** | Failure injection (message loss, node pause) + recovery denseness | **landed** (`examples/03-failure-recovery`) |
| **4** | Thin wire / transport \(E\) + schema-gated messages | **landed** (`examples/04-thin-wire`) |
| **5** | Multi-process soak + denseness judgment | **landed** (`examples/05-multihost-soak`) — *practically dense* |
| **6** | TCP loopback transport \(E\) | **landed** (`examples/06-tcp-multihost`) |
| **7** | Live LLM propose edge | **landed** (`examples/07-live-llm`, opt-in keys) |

## Escape discipline

Every leave from pure Aura (\(V_A\)) on a coordination-critical path must be recorded in `notes/escape-log.md`:

- Location, reason, mechanism (FFI / external service / transport / other)  
- Impact (correctness vs pure performance / distribution)  
- Ownership / lifetime implications  
- Mitigation or future plan  

Escapes on the evolvable coordination core are treated as **evidence against** denseness until justified and isolated.

## License

Apache License 2.0 (same as Aura, Aether, Hephaestus, Prometheus)

## Status

**Phase 1–5 landed.** Constructive denseness judgment: **practically dense** on single-machine multi-process \(S_{\mathrm{Hermes}}\) (core in \(V_A\); host FS/shell \(E\) metered).

```bash
./scripts/check-structure.sh
./scripts/run-all.sh            # 01–05
```

Hermes continues Aura Unify’s constructive measurement program after Aether, Hephaestus and Prometheus — pressure-testing the same basis on the distributed multi-agent coordination subspace required for viral self-evolving distributed agents.
