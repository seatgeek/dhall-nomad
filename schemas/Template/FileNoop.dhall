let changeMode = ../../types/ChangeModeNoop.dhall

let Template = ../../types/Template.dhall

let default =
      { change_mode = changeMode.noop
      , left_delimiter = None Text
      , perms = None Text
      , right_delimiter = None Text
      }

let new = Template.Type.FileTemplateNoop

let File = { Type = Template.NoopFileConfig, default, new }

let example0 =
        assert
      :   File.new File::{ source = "/my/file", destination = "/my/dest" }
        ≡ Template.Type.FileTemplateNoop
            { change_mode = changeMode.noop
            , left_delimiter = None Text
            , perms = None Text
            , right_delimiter = None Text
            , source = "/my/file"
            , destination = "/my/dest"
            }

in  File
