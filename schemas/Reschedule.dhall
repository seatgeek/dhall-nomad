let Function = ../types/DelayFunction.dhall

let Reschedule =
      { Type = ../types/Reschedule.dhall
      , default =
        { attempts = None Natural
        , interval = None Text
        , delay_function = None Function
        , max_delay = None Text
        , unlimited = False
        }
      , Function
      }

let example0 =
        assert
      :   Reschedule::{ attempts = Some 0, unlimited = False, delay = "0s" }
        ≡ { attempts = Some 0
          , interval = None Text
          , delay = "0s"
          , delay_function = None Function
          , max_delay = None Text
          , unlimited = False
          }

in  Reschedule
