let Map = (../Prelude.dhall).Map.Type

let JobType = ../types/JobType.dhall

in  { Type = ../types/Job.dhall
    , default =
      { affinity = None (List ../types/Affinity.dhall)
      , all_at_once = False
      , constraint = None (List ../types/Constraint.dhall)
      , meta = None (Map Text Text)
      , name = None Text
      , migrate = None ../types/Migrate.dhall
      , namespace = None Text
      , parameterized = None ../types/Parameterized.dhall
      , periodic = None ../types/Periodic.dhall
      , priority = 50
      , region = "global"
      , reschedule = None ../types/Reschedule.dhall
      , type = JobType.service
      , spread = None (List ../types/Spread.dhall)
      , update = None ../types/Update.dhall
      , vault = None ../types/Vault.dhall
      }
    , JobType
    }
