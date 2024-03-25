{- https://developer.hashicorp.com/nomad/docs/job-specification/gateway#proxy-parameters -}
let Map = (../Prelude.dhall).Map.Type

let Address = ./GatewayAddress.dhall

in  { Type = ../types/GatewayProxy.dhall
    , default =
      { connect_timeout = None Text
      , envoy_gateway_bind_tagged_addresses = None Bool
      , envoy_gateway_bind_addresses =
          None (Map Text ../types/GatewayAddress.dhall)
      , envoy_gateway_no_default_bind = None Bool
      , envoy_dns_discovery_type = None Bool
      , config = None (Map Text Text)
      }
    , Address
    }
