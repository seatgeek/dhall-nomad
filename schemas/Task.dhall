let Map = (../Prelude.dhall).Map.Type

let Template = (../types/Template.dhall).Type

let default =
      { artifact = None (List ../types/Artifact.dhall)
      , constraint = None (List ../types/Constraint.dhall)
      , affinity = None (List ../types/Affinity.dhall)
      , dispatch_payload = None ../types/DispatchPayload.dhall
      , env = None (Map Text Text)
      , kill_signal = None Text
      , kill_timeout = None Text
      , leader = None Bool
      , lifecycle = None ../types/Lifecycle.dhall
      , logs = None ../types/Logs.dhall
      , meta = None (Map Text Text)
      , service = None (List ../types/Service.dhall)
      , shutdown_delay = None Text
      , user = None Text
      , template = None (List Template)
      , vault = None ../types/Vault.dhall
      , volume_mount = None ../types/VolumeMount.dhall
      }

in  { Type = ../types/Task.dhall, default, Config = ./TaskConfig.dhall }
