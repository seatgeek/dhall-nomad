let changeMode = ../../types/ChangeModeSignal.dhall

let Template = ../../types/Template.dhall

let default =
      { change_mode = changeMode.signal
      , splay = None Text
      , left_delimiter = None Text
      , perms = None Text
      , right_delimiter = None Text
      }

let new = Template.Type.FileTemplateWithSignal

let File = { Type = Template.SignalFileConfig, default, new }

let example0 =
        assert
      :   File.new
            File::{
            , source = "/my/file"
            , destination = "/my/dest"
            , change_signal = "SIGHUP"
            }
        ≡ Template.Type.FileTemplateWithSignal
            { change_mode = changeMode.signal
            , splay = None Text
            , left_delimiter = None Text
            , right_delimiter = None Text
            , perms = None Text
            , source = "/my/file"
            , destination = "/my/dest"
            , change_signal = "SIGHUP"
            }

in  File
