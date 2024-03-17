{- https://developer.hashicorp.com/nomad/docs/job-specification/proxy -}
let Map = (../Prelude.dhall).Map.Type

in  { local_service_address : Text
    , local_service_port : Natural
    , upstreams : Optional ./Upstreams.dhall
    , expose : Optional ./Expose.dhall
    , config : Optional (Map Text Text)
    }
