{- https://www.nomadproject.io/docs/job-specification/network -}
let Map = (../Prelude.dhall).Map.Type

in  { port : Optional (Map Text ./Port.dhall)
    , mode : ./NetworkMode.dhall
    , dns : Optional ./DnsConfig.dhall
    }
