{- https://www.nomadproject.io/docs/job-specification/service -}
let Map = (../Prelude.dhall).Map.Type

in  { check : Optional (List ./Check.dhall)
    , name : Text
    , port : Optional Text
    , provider : Optional Text
    , tags : Optional (List Text)
    , canary_tags : Optional (List Text)
    , enable_tag_override : Bool
    , address_mode : ./AddressMode.dhall
    , task : Optional Text
    , meta : Optional (Map Text Text)
    , canary_meta : Optional (Map Text Text)
    }
