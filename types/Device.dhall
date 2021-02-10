{- https://www.nomadproject.io/docs/job-specification/device -}
{ count : Natural
, constraint : Optional ./Constraint.dhall
, affinity : Optional ./Affinity.dhall
}
