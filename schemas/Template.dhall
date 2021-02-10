{ strategy =
  { noop =
    { File = ./Template/FileNoop.dhall, Inline = ./Template/InlineNoop.dhall }
  , restart =
    { File = ./Template/FileWithRestart.dhall
    , Inline = ./Template/InlineWithRestart.dhall
    }
  , notify =
    { File = ./Template/InlineWithSignal.dhall
    , Inline = ./Template/FileWithSignal.dhall
    }
  }
, Type = (../types/Template.dhall).Type
}
