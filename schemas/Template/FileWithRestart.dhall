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

in  { Type = Template.RestartFileConfig, default, new }
