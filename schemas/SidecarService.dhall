let Map = (../Prelude.dhall).Map.Type

in  { Type = ../types/SidecarService.dhall
    , default =
      { disable_default_tcp_check = None Bool
      , meta = None (Map Text Text)
      , port = None Text
      , proxy = None ../types/Proxy.dhall
      , tags = None (List Text)
      }
    }
