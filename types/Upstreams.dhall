{- https://developer.hashicorp.com/nomad/docs/job-specification/upstreams -}
let Map = (../Prelude.dhall).Map.Type

in  { config : Optional (Map Text Text)
    , destination_name : Text
    , destination_namespace : Text
    , destination_peer : Optional Text
    , destination_type : Optional Text
    , local_bind_port : Natural
    , datacenter : Optional Text
    , local_bind_address : Optional Text
    , local_bind_socket_mode : Optional Text
    , local_bind_socket_path : Optional Text
    , mesh_gateway : ./MeshGateway.dhall
    }
