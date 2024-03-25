{- https://developer.hashicorp.com/nomad/docs/job-specification/gateway#tls-parameters -}
{ enabled : Optional Bool
, tls_min_version : Optional Text
, tls_max_version : Optional Text
, cipher_suites : Optional (List Text)
}
