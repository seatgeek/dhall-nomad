{- https://www.nomadproject.io/docs/job-specification/update -}
{ max_parallel : Natural
, min_healthy_time : Text
, healthy_deadline : Text
, health_check : ./UpdateCheck.dhall
, progress_deadline : Text
, auto_revert : Bool
, auto_promote : Bool
, canary : Natural
, stagger : Text
}
