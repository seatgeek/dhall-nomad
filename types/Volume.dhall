{- https://www.nomadproject.io/docs/job-specification/volume -}
let JSON = (../Prelude.dhall).JSON.Type

in  { type : ./VolumeType.dhall
    , source : Text
    , read_only : Bool
    , mount_options : JSON
    }
