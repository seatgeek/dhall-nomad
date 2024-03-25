{- https://developer.hashicorp.com/nomad/docs/job-specification/sidecar_task -}
let Map = (../Prelude.dhall).Map.Type

in  { name : Optional Text
    , driver : Text
    , user : Optional Text
    , config : Optional (Map Text Text)
    , env : Optional (Map Text Text)
    , resources : ./Resources.dhall
    , meta : Optional (Map Text Text)
    , logs : Optional ./Logs.dhall
    , kill_timeout : Optional Text
    , shutdown_delay : Optional Text
    , kill_signal : Optional Text
    }
