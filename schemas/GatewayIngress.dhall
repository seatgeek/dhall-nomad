let GatewayTls = ./GatewayTls.dhall

let GatewayListener = ./GatewayListener.dhall

in  { Type = ../types/GatewayIngress.dhall
    , default =
      { tls = None ../types/GatewayTls.dhall
      , listener = [] : List ../types/GatewayListener.dhall
      }
    , GatewayTls
    , GatewayListener
    }
