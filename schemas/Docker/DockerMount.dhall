let Mount = ../../types/Docker/DockerConfigMount.dhall

let VolumeType = ../../types/Docker/DockerVolumeType.dhall

let BindType = ../../types/Docker/DockerBindType.dhall

let TmpfsType = ../../types/Docker/DockerTmpfsType.dhall

let VolumeDriverConfig = ../../types/Docker/DockerVolumeDriverConfig.dhall

let Map = (../../Prelude.dhall).Map.Type

let Volume =
      { Type = Mount.VolumeConfig
      , default =
        { type = VolumeType.volume
        , readonly = False
        , volume_options = None Mount.VolumeOptions
        }
      , Options =
        { Type = Mount.VolumeOptions
        , default =
          { no_copy = None Bool
          , labels = None (Map Text Text)
          , driver_config = None VolumeDriverConfig
          }
        , Config =
          { Type = VolumeDriverConfig, default.options = None (Map Text Text) }
        }
      , new = Mount.Type.Volume
      }

let Bind =
      { Type = Mount.BindConfig
      , default =
        { type = BindType.bind
        , readonly = False
        , bind_options = None Mount.BindOptions
        }
      , Options =
        { Type = Mount.BindOptions
        , default =
          { propagation = None Text
          , consistency = None Text
          , non_recursive = None Bool
          }
        }
      , new = Mount.Type.Bind
      }

let Tmpfs =
      { Type = Mount.TmpfsConfig
      , default =
        { type = TmpfsType.tmpfs
        , readonly = False
        , tmpfs_options = None Mount.TmpfsOptions
        }
      , Options = { Type = Mount.TmpfsOptions, default.mode = None Text }
      , new = Mount.Type.Tmpfs
      }

in  { Volume
    , Bind
    , Tmpfs
    , BindOptions = Mount.BindOptions
    , TmpfsOptions = Mount.TmpfsOptions
    }
