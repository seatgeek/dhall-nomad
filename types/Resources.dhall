{- https://www.nomadproject.io/docs/job-specification/resources

Had to include deprecated network property due to Nomad version < 0.12
Due to the following issues:

https://github.com/hashicorp/nomad/issues/8780
https://github.com/hashicorp/nomad/issues/8770
https://www.nomadproject.io/docs/drivers/docker#deprecated-port_map-syntax

-}
let Map = (../Prelude.dhall).Map.Type

in  { cpu : Optional Natural
    , cores : Optional Natural
    , memory : Natural
    , network : Optional ./Network.dhall
    , device : Optional (Map Text ./Device.dhall)
    }
