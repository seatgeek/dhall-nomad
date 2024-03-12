let Map = (../Prelude.dhall).Map.Type

in  { Type = ../types/Group.dhall
    , default =
      { affinity = None (List ../types/Affinity.dhall)
      , constraint = None (List ../types/Constraint.dhall)
      , count = None Natural
      , ephemeral_disk = None ../types/EphemeralDisk.dhall
      , meta = None (Map Text Text)
      , migrate = None ../types/Migrate.dhall
      , network = None ../types/Network.dhall
      , restart = None ../types/Restart.dhall
      , reschedule = None ../types/Reschedule.dhall
      , service = None (List ../types/Service.dhall)
      , shutdown_delay = "0s"
      , scaling = None ../types/Scaling.dhall
      , spread = None (List ../types/Spread.dhall)
      , stop_after_client_disconnect = None Text
      , update = None ../types/Update.dhall
      , vault = None ../types/Vault.dhall
      , volume = None (Map Text ../types/Volume.dhall)
      }
    }
