let Map = (../Prelude.dhall).Map.Type

in  { Type = ../types/SidecarTask.dhall
    , default =
      { name = None Text
      , user = None Text
      , config = None (Map Text Text)
      , env = None (Map Text Text)
      , meta = None (Map Text Text)
      , logs = None ../types/Logs.dhall
      , kill_timeout = None Text
      , shutdown_delay = None Text
      , kill_signal = None Text
      }
    }
