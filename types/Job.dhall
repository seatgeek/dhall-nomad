{- https://www.nomadproject.io/docs/job-specification/job -}
let Map = (../Prelude.dhall).Map.Type

in  { affinity : Optional (List ./Affinity.dhall)
    , all_at_once : Bool
    , constraint : Optional (List ./Constraint.dhall)
    , datacenters : List Text
    , group : Map Text ./Group.dhall
    , meta : Optional (Map Text Text)
    , name : Optional Text
    , migrate : Optional ./Migrate.dhall
    , namespace : Optional Text
    , parameterized : Optional ./Parameterized.dhall
    , periodic : Optional ./Periodic.dhall
    , priority : Natural
    , region : Text
    , reschedule : Optional ./Reschedule.dhall
    , type : ./JobType.dhall
    , spread : Optional (List ./Spread.dhall)
    , update : Optional ./Update.dhall
    , vault : Optional ./Vault.dhall
    }
 