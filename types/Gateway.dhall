{- https://developer.hashicorp.com/nomad/docs/job-specification/gateway -}
{ proxy : Optional ./GatewayProxy.dhall
, ingress : Optional ./GatewayIngress.dhall
, terminating : Optional ./GatewayTerminating.dhall
, mesh : Optional ./GatewayMesh.dhall
}
