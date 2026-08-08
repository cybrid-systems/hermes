# Escape Log — Hermes

Every leave from pure Aura (\(V_A\)) on a coordination-critical path must be recorded here.

| Date | Location | Reason | Mechanism | Impact | Mitigation / Plan |
|------|----------|--------|-----------|--------|-------------------|
| (none on Phase 1–4 core) | | | | | |

## Phase 4 wire note

The Phase 4 wire path (`hermes-wire.aura`, `HMSG|v1|…`) is **schema-gated and metered** (`wire_encode` / `wire_decode` / `wire_refuse` / `wire_bytes`) but implemented entirely in pure Aura strings. It is a **conceptual boundary \(E\)** without a required host/FFI leave.

If Phase 5 multi-host transport needs sockets / OS I/O, record those leaves here as audited \(E\).

## Convention

- Prefer pure Aura on the evolvable coordination core.
- Escapes on core paths are evidence *against* denseness until justified and isolated.
- Host / packaging residuals go to `host-residuals.md`, not here.
