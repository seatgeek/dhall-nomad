let changeMode = ../../types/ChangeModeRestart.dhall

let Template = ../../types/Template.dhall

let default =
      { change_mode = changeMode.restart
      , splay = None Text
      , left_delimiter = None Text
      , perms = None Text
      , right_delimiter = None Text
      , env = False
      }

let new = Template.Type.FileTemplateWithRestart

let File = { Type = Template.RestartFileConfig, default, new }

let example0 =
        assert
      :   File.new File::{ source = "/my/file", destination = "/my/dest" }
        ≡ Template.Type.FileTemplateWithRestart
            { change_mode = changeMode.restart
            , splay = None Text
            , left_delimiter = None Text
            , right_delimiter = None Text
            , perms = None Text
            , source = "/my/file"
            , destination = "/my/dest"
            , env = False
            }

in  File
