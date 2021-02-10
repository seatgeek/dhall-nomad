let Map = (../../Prelude.dhall).Map.Type

in  { no_copy : Optional Bool
    , labels : Optional (Map Text Text)
    , driver_config : Optional ./DockerVolumeDriverConfig.dhall
    }
