let Check = ../types/UpdateCheck.dhall

in  { Type = ../types/Update.dhall
    , default =
      { max_parallel = 1
      , health_check = Check.checks
      , min_healthy_time = "10s"
      , healthy_deadline = "5m"
      , progress_deadline = "10m"
      , auto_revert = False
      , auto_promote = False
      , canary = 0
      , stagger = "30s"
      }
    , Check
    }
