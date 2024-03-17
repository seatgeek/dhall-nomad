{- https://developer.hashicorp.com/nomad/docs/job-specification/gateway#listener-parameters -}
{ port : Natural
, protocol : ./GatewayListenerProtocol.dhall
, service : List ./GatewayListenerService.dhall
}
