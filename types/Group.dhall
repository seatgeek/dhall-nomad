{- https://www.nomadproject.io/docs/job-specification/group -}
let Map = (../Prelude.dhall).Map.Type

in  { affinity : Optional (List ./Affinity.dhall)
    , constraint : Optional (List ./Constraint.dhall)
    , count : Optional Natural
    , ephemeral_disk : Optional ./EphemeralDisk.dhall
    , meta : Optional (Map Text Text)
    , migrate : Optional ./Migrate.dhall
    , network : Optional ./Network.dhall
    , restart : Optional ./Restart.dhall
    , reschedule : Optional ./Reschedule.dhall
    , service : Optional (List ./Service.dhall)
    , shutdown_delay : Text
    , scaling : Optional ./Scaling.dhall
    , spread : Optional (List ./Spread.dhall)
    , stop_after_client_disconnect : Optional Text
    , task : Map Text ./Task.dhall
    , update : Optional ./Update.dhall
    , vault : Optional ./Vault.dhall
    , volume : Optional (List ./Volume.dhall)
    }
