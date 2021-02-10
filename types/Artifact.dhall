{- https://www.nomadproject.io/docs/job-specification/artifact -}
let Map = (../Prelude.dhall).Map.Type

in  { destination : Optional Text
    , mode : ./ArtifactMode.dhall
    , options : Optional (Map Text Text)
    , headers : Optional (Map Text Text)
    , source : Text
    }
