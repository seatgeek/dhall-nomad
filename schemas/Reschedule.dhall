let Function = ../types/DelayFunction.dhall

in  { Type = ../types/Parameterized.dhall
    , default =
      { attempts = None Natural
      , interval = None Text
      , delay_function = None Function
      , max_delay = None Natural
      , unlimited = False
      }
    , Function
    }
