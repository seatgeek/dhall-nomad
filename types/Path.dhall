{- https://developer.hashicorp.com/nomad/docs/job-specification/expose#path-parameters -}
{ path : Text
, protocol : ./PathProtocol.dhall
, local_path_port : Natural
, listener_port : ./Port.dhall
}
