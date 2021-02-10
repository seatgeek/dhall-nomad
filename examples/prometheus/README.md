# Example Prometheus Nomad Config

The `prometheus.dhall` file in this folder is equivalent to the
`prometheus.nomad` reference file.

The `prometheus.json` file is generated with

```bash
dhall-to-json --file prometheus.dhall > prometheus.json
```

The json file is equivalent to the nomad file and can be scheduled with:

```bash
nomad job run prometheus.json
```
