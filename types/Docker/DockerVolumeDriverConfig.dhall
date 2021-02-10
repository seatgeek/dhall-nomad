let Map = (../../Prelude.dhall).Map.Type

in  { name : Text, options : Optional (Map Text Text) }
