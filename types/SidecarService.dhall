{- https://developer.hashicorp.com/nomad/docs/job-specification/sidecar_service -}
let Map = (../Prelude.dhall).Map.Type

in  { disable_default_tcp_check : Optional Bool
    , meta : Optional (Map Text Text)
    , port : Optional Text
    , proxy : Optional ./Proxy.dhall
    , tags : Optional (List Text)
    }
