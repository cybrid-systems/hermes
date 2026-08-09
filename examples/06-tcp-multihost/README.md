# 06-tcp-multihost

TCP loopback denseness after Aura #2771 (`tcp-listen` / `tcp-accept`).

## Path

```
client  --HMSG/tcp-->  server fiber
                         decode + star topology
client  <--OK|payload|delta--
```

Host TCP prims are audited \(E\). Do **not** `(require "std/socket")` — wrappers currently shadow prims.

## Run

```bash
./scripts/run-aura.sh examples/06-tcp-multihost/main.aura
```
