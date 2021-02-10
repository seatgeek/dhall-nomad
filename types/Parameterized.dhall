{- https://www.nomadproject.io/docs/job-specification/parameterized -}
{ meta_optional : Optional (List Text)
, meta_required : Optional (List Text)
, payload : ./ParameterizedPayload.dhall
}
