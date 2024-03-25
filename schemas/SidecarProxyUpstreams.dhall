{- https://developer.hashicorp.com/nomad/docs/job-specification/upstreams -}
let Map = (../Prelude.dhall).Map.Type

let MeshGateway = ./SidecarProxyUpstreamsMeshGateway.dhall

in  { Type = ../types/SidecarProxyUpstreams.dhall
    , default =
      { config = None (Map Text Text)
      , destination_namespace = None Text
      , destination_peer = None Text
      , destination_type = None Text
      , datacenter = None Text
      , local_bind_address = None Text
      , local_bind_socket_mode = None Text
      , local_bind_socket_path = None Text
      , mesh_gateway = None ../types/SidecarProxyUpstreamsMeshGateway.dhall
      }
    , MeshGateway
    }
