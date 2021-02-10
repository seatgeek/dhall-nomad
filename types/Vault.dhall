{- https://www.nomadproject.io/docs/job-specification/vault -}
{ change_mode : ./ChangeMode.dhall
, change_signal : ./Signal.dhall
, env : Bool
, namespace : Optional Text
, policies : List Text
}
