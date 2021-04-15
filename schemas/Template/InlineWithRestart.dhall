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

let new = Template.Type.InlineTemplateWithRestart

let Inline = { Type = Template.RestartInlineConfig, default, new }

let example0 =
        assert
      :   Inline.new
            Inline::{ data = "file contents", destination = "/my/dest" }
        ≡ Template.Type.InlineTemplateWithRestart
            { change_mode = changeMode.restart
            , left_delimiter = None Text
            , right_delimiter = None Text
            , perms = None Text
            , data = "file contents"
            , destination = "/my/dest"
            , env = False
            , splay = None Text
            }

in  Inline
