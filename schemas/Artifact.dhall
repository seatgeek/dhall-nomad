let Mode = ../types/ArtifactMode.dhall

let Map = (../Prelude.dhall).Map.Type

in  { Type = ../types/Artifact.dhall
    , default =
      { destination = None Text
      , mode = Mode.any
      , options = None (Map Text Text)
      , headers = None (Map Text Text)
      }
    , Mode
    }
