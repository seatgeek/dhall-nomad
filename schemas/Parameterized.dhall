let Payload = ../types/ParameterizedPayload.dhall

in  { Type = ../types/Parameterized.dhall
    , default =
      { meta_optional = None (List Text)
      , meta_required = None (List Text)
      , payload = Payload.optional
      }
    , Payload
    }
