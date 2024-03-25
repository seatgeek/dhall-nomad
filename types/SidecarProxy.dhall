{- https://developer.hashicorp.com/nomad/docs/job-specification/proxy -}
let Map = (../Prelude.dhall).Map.Type

in  { local_service_address : Optional Text
    , local_service_port : Optional Natural
    , upstreams : Optional ./SidecarProxyUpstreams.dhall
    , expose : Optional ./SidecarProxyExpose.dhall
    , config : Optional (Map Text Text)
    }
