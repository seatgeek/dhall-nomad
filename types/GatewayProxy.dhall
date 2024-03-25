{- https://developer.hashicorp.com/nomad/docs/job-specification/gateway#proxy-parameters -}
let Map = (../Prelude.dhall).Map.Type

in  { connect_timeout : Optional Text
    , envoy_gateway_bind_tagged_addresses : Optional Bool
    , envoy_gateway_bind_addresses : Optional (Map Text ./GatewayAddress.dhall)
    , envoy_gateway_no_default_bind : Optional Bool
    , envoy_dns_discovery_type : Optional Bool
    , config : Optional (Map Text Text)
    }
