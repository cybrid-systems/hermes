# Host Residuals — Hermes

Issues that are packaging / host / environment related, **not** denseness failures
on \(S_{\mathrm{Hermes}}\).

| Date | Issue | Upstream | Notes |
|------|-------|----------|-------|
| 2026-08-08 | Module free-var capture broken when `(require …)` precedes `(export …)` | [aura#2766](https://github.com/cybrid-systems/aura/issues/2766) **P0** | Minimal bad/good order repro. Root cause. |
| 2026-08-08 | `std/orchestrator` agent registry unusable on stdin (`agent:spawn` / `agent:list` / epoch) | [aura#2767](https://github.com/cybrid-systems/aura/issues/2767) **P0** | Consequence of #2766; Hermes Phase 1 avoided orchestrator. |
| 2026-08-08 | Stdlib-wide require-before-export class risk | [aura#2768](https://github.com/cybrid-systems/aura/issues/2768) **P1** | Audit + canary. |
| 2026-08-08 | CLI stdin-only + denseness env footguns | [aura#2767](https://github.com/cybrid-systems/aura/issues/2767) **P2** | Runner DX; comment added for multi-process. |
| 2026-08-08 | `AURA_BIN` not visible to child unless exported | [aura#2772](https://github.com/cybrid-systems/aura/issues/2772) **P1** | Phase 5: `export AURA_BIN` + fallback path. |
| 2026-08-08 | `std/string` `string-split` O(n) recursive depth | [aura#2770](https://github.com/cybrid-systems/aura/issues/2770) **P0** | Soak mailboxes; use `hermes:host-split-lines`. |
| 2026-08-08 | No `tcp-listen` / `tcp-accept` | [aura#2771](https://github.com/cybrid-systems/aura/issues/2771) **P1** | Phase 5 uses FS mailbox + child process. |
| 2026-08-08 | Module free-var / require-before-export | [aura#2766](https://github.com/cybrid-systems/aura/issues/2766) **P0** | export-before-require discipline. |
| 2026-08-08 | `std/orchestrator` agent registry broken | [aura#2768](https://github.com/cybrid-systems/aura/issues/2768) **P0** | Avoid until fixed. |

## Hermes workarounds (until host fix)

1. **Form order in span libs**: always `(export …)` before `(require …)` when exports free-ref module cells.
2. **Do not require `std/orchestrator`** for denseness evidence; pure list/hash topology in `hermes-topology.aura`.
3. **Private helpers**: prefer inlined bodies or **exported** bindings (Phase 3 free-var residual).
4. **Soak-scale strings**: use `hermes:host-split-lines` (iterative), not `string-split`, on multi-line mailboxes.
5. **Runner**:
   ```bash
   export AURA_BIN   # required for Phase 5 child getenv
   export AURA_PATH="$AURA_LIB:$HERMES_LIB"
   export AURA_SANDBOX=off
   export AURA_PIPELINE_STRICT=0
   exec "$AURA_BIN" < "$SRC"
   ```

## Not denseness failures

- Mis-set `AURA_PATH` (e.g. polluting the env and shadowing `run-aura.sh` defaults) → module resolve errors; fix env, do not log as escape.
- Extra `)` / parse errors in probe sources → probe bug, not host.
