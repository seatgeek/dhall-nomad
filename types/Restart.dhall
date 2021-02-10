{- https://www.nomadproject.io/docs/job-specification/restart -}
{ attempts : Optional Natural
, delay : Text
, interval : Optional Text
, mode : ./RestartMode.dhall
}
