let Proxy = ./GatewayProxy.dhall

let Ingress = ./GatewayIngress.dhall

let Terminating = ./GatewayTerminating.dhall

let Mesh = ../types/GatewayMesh.dhall

in  { Type = ../types/Gateway.dhall
    , default =
      { proxy = None ../types/GatewayProxy.dhall
      , ingress = None ../types/GatewayIngress.dhall
      , terminating = None ../types/GatewayTerminating.dhall
      , mesh = None ../types/GatewayMesh.dhall
      }
    , Proxy
    , Ingress
    , Terminating
    , Mesh
    }
