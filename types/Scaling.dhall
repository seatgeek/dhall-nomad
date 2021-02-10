{- https://www.nomadproject.io/docs/job-specification/scaling -}
let JSON = (../Prelude.dhall).JSON.Type

in  { min : Optional Natural, max : Natural, enabled : Bool, policy : JSON }
