let addressMode = ../types/AddressMode.dhall

let Map = (../Prelude.dhall).Map.Type

in  { Type = ../types/Service.dhall
    , default =
      { check = None (List ../types/Check.dhall)
      , port = None Text
      , provider = None Text
      , tags = None (List Text)
      , canary_tags = None (List Text)
      , enable_tag_override = False
      , address_mode = addressMode.auto
      , meta = None (Map Text Text)
      , canary_meta = None (Map Text Text)
      , task = None Text
      }
    }
