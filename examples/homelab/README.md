# Example homelab config

Since this is a homelab and not a cloud provider the volumes are simple NFS configured in nomad.hcl

All jobs can be started with `nomad job run -detach <(dhall-to-json --file ./path/to/file.dhall)`

## Traefik

* Host networking
* System job
* DNS set to round robin between all cluster hosts

## Passbolt

* NFS for gpg and mysql state
* Consul connect service mesh for web<->mysql communication
* Traefik as gateway
