let changeMode = ../../types/ChangeModeSignal.dhall

let Template = ../../types/Template.dhall

let default =
      { change_mode = changeMode.signal
      , splay = None Text
      , left_delimiter = None Text
      , perms = None Text
      , right_delimiter = None Text
      }

let new = Template.Type.InlineTemplateWithSignal

let Inline = { Type = Template.SignalInlineConfig, default, new }

let example0 =
        assert
      :   Inline.new
            Inline::{
            , data = "file contents"
            , destination = "/my/dest"
            , change_signal = "SIGHUP"
            }
        ≡ Template.Type.InlineTemplateWithSignal
            { change_mode = changeMode.signal
            , left_delimiter = None Text
            , right_delimiter = None Text
            , perms = None Text
            , data = "file contents"
            , destination = "/my/dest"
            , splay = None Text
            , change_signal = "SIGHUP"
            }

in  Inline
