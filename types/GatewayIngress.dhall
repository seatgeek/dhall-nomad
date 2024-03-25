{- https://developer.hashicorp.com/nomad/docs/job-specification/gateway#ingress-parameters -}
{ tls : Optional ./GatewayTls.dhall, listener : List ./GatewayListener.dhall }
