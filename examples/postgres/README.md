# Example Postgres Nomad Config

The `postgres.dhall` file in this folder is equivalent to the
`postgres.nomad` reference file.

The `postgres.json` file is generated with

```bash
dhall-to-json --file postgres.dhall > postgres.json
```

The json file is equivalent to the nomad file and can be scheduled with:

```bash
nomad job run postgres.json
```

