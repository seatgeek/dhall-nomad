let Check = ../types/MigrateCheck.dhall

in  { Type = ../types/Migrate.dhall
    , default =
      { health_check = Check.checks
      , healthy_deadline = "5m"
      , max_parallel = 1
      , min_healthy_time = "10s"
      }
    , Check
    }
