let Map = (../Prelude.dhall).Map.Type

let Proxy = ./SidecarProxy.dhall

in  { Type = ../types/SidecarService.dhall
    , default =
      { disable_default_tcp_check = None Bool
      , meta = None (Map Text Text)
      , port = None Text
      , proxy = None ../types/SidecarProxy.dhall
      , tags = None (List Text)
      }
    , Proxy
    }
