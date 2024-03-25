{- https://developer.hashicorp.com/nomad/docs/job-specification/proxy -}
let Map = (../Prelude.dhall).Map.Type

let Upstreams = ./SidecarProxyUpstreams.dhall

let Expose = ./SidecarProxyExpose.dhall

in  { Type = ../types/SidecarProxy.dhall
    , default =
      { local_service_address = None Text
      , local_service_port = None Natural
      , upstreams = None ../types/SidecarProxyUpstreams.dhall
      , expose = None ../types/SidecarProxyExpose.dhall
      , config = None (Map Text Text)
      }
    , Upstreams
    , Expose
    }
