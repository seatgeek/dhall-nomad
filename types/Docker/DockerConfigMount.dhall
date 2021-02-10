{- https://www.nomadproject.io/docs/drivers/docker#mounts -}
let VolumeOptions = ./DockerVolumeOptions.dhall

let BindOptions = ./DockerBindOptions.dhall

let TmpfsOptions = ./DockerTmpfsOptions.dhall

let VolumeConfig =
      { type : ./DockerVolumeType.dhall
      , target : Text
      , source : Text
      , readonly : Bool
      , volume_options : Optional VolumeOptions
      }

let BindConfig =
      { type : ./DockerBindType.dhall
      , target : Text
      , source : Text
      , readonly : Bool
      , bind_options : Optional BindOptions
      }

let TmpfsConfig =
      { type : ./DockerTmpfsType.dhall
      , target : Text
      , readonly : Bool
      , tmpfs_options : Optional TmpfsOptions
      }

let Variants =
      < Volume : VolumeConfig | Bind : BindConfig | Tmpfs : TmpfsConfig >

in  { Type = Variants
    , VolumeConfig
    , BindConfig
    , TmpfsConfig
    , VolumeOptions
    , BindOptions
    , TmpfsOptions
    }
