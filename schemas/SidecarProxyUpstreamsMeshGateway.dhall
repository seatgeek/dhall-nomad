{- https://developer.hashicorp.com/nomad/docs/job-specification/upstreams#mesh_gateway-parameters -}
let Mode = ../types/SidecarProxyUpstreamsMeshGatewayModes.dhall

in  { Type = ../types/SidecarProxyUpstreamsMeshGatewayModes.dhall
    , default.mode = None ../types/SidecarProxyUpstreamsMeshGatewayModes.dhall
    , Mode
    }
