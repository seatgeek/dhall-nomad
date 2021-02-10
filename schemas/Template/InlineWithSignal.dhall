let changeMode = ../../types/ChangeModeSignal.dhall

let Template = ../../types/Template.dhall

let default =
      { change_mode = changeMode.signal
      , splay = None Text
      , left_delimiter = None Text
      , perms = None Text
      , right_delimiter = None Text
      , env = False
      }

let new = Template.Type.InlineTemplateWithSignal

in  { Type = Template.SignalInlineConfig, default, new }
