{- https://www.nomadproject.io/docs/job-specification/migrate -}
{ health_check : ./MigrateCheck.dhall
, healthy_deadline : Text
, max_parallel : Natural
, min_healthy_time : Text
}
