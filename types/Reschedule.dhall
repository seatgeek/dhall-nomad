{- https://www.nomadproject.io/docs/job-specification/reschedule -}
{ attempts : Optional Natural
, interval : Optional Text
, delay : Text
, delay_function : Optional ./DelayFunction.dhall
, max_delay : Optional Text
, unlimited : Bool
}
