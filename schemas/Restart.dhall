let Mode = ../types/RestartMode.dhall

in  { Type = ../types/Restart.dhall
    , default =
      { attempts = None Natural
      , delay = "15s"
      , interval = None Text
      , mode = Mode.fail
      }
    , Mode
    }
