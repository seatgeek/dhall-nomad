{- https://www.nomadproject.io/docs/job-specification/task -}
let Map = (../Prelude.dhall).Map.Type

let Template = (./Template.dhall).Type

in  { artifact : Optional (List ./Artifact.dhall)
    , config : ./TaskConfig.dhall
    , constraint : Optional (List ./Constraint.dhall)
    , affinity : Optional (List ./Affinity.dhall)
    , dispatch_payload : Optional ./DispatchPayload.dhall
    , driver : Text
    , env : Optional (Map Text Text)
    , kill_timeout : Optional Text
    , kill_signal : Optional Text
    , leader : Optional Bool
    , lifecycle : Optional ./Lifecycle.dhall
    , logs : Optional ./Logs.dhall
    , meta : Optional (Map Text Text)
    , resources : ./Resources.dhall
    , service : Optional (List ./Service.dhall)
    , shutdown_delay : Optional Text
    , user : Optional Text
    , template : Optional (List Template)
    , vault : Optional ./Vault.dhall
    , volume_mount : Optional ./VolumeMount.dhall
    }
