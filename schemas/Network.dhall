let Map = (../Prelude.dhall).Map.Type

let Mode = ../types/NetworkMode.dhall

in  { Type = ../types/Network.dhall
    , default =
      { port = None (Map Text ../types/Port.dhall)
      , mode = Mode.host
      , dns = None ../types/DnsConfig.dhall
      }
    , Mode
    }
