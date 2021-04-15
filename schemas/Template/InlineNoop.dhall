let changeMode = ../../types/ChangeModeNoop.dhall

let Template = ../../types/Template.dhall

let default =
      { change_mode = changeMode.noop
      , left_delimiter = None Text
      , perms = None Text
      , right_delimiter = None Text
      }

let new = Template.Type.InlineTemplateNoop

let Inline = { Type = Template.NoopInlineConfig, default, new }

let example0 =
        assert
      :   Inline.new
            Inline::{ data = "file contents", destination = "/my/dest" }
        ≡ Template.Type.InlineTemplateNoop
            { change_mode = changeMode.noop
            , left_delimiter = None Text
            , right_delimiter = None Text
            , perms = None Text
            , data = "file contents"
            , destination = "/my/dest"
            }

in  Inline
