{- https://developer.hashicorp.com/nomad/docs/job-specification/connect -}
{ native : Optional Bool
, sidecar_service : Optional ./SidecarService.dhall
, sidecar_task : Optional ./SidecarTask.dhall
, gateway : Optional ./Gateway.dhall
}
