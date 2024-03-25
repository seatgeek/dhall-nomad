let ListenerProtocol = ../types/GatewayListenerProtocol.dhall

let ListenerService = ./GatewayListenerService.dhall

in  { Type = ../types/GatewayListener.dhall
    , default =
      { protocol = ../types/GatewayListenerProtocol.dhall
      , service = [] : List ../types/GatewayListenerService.dhall
      }
    , ListenerProtocol
    , ListenerService
    }
