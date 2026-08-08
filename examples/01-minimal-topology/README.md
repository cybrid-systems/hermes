# 01-minimal-topology

Phase 1 denseness probe: **pure-Aura multi-agent topology + baseline metrology**.

## Axes

| Axis | Coverage |
|------|----------|
| **A. Topology completeness** | Star/region graph as first-class object; all agents bound; routes resolve |
| **F. Metrology** | messages_sent/delivered, hops, route_hits/miss, correctness, escapes |

## Topology

```
producer → router ─east→ worker-e (*2) → collector
                   ─west→ worker-w (*3) → collector
```

Single host, single process. No wire / transport (Phase 4). No topology mutation (Phase 2).

## Run

```bash
./scripts/run-aura.sh examples/01-minimal-topology/main.aura
```

Expect `RESULT pass example=01-minimal-topology escapes=0`.
