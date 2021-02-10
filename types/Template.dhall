{- https://www.nomadproject.io/docs/job-specification/template -}
let CommonConfig =
      { destination : Text
      , left_delimiter : Optional Text
      , perms : Optional Text
      , right_delimiter : Optional Text
      }

let SignalConfig =
      { change_signal : Text
      , change_mode : ./ChangeModeSignal.dhall
      , splay : Optional Text
      }

let RestartConfig =
      { change_mode : ./ChangeModeRestart.dhall
      , env : Bool
      , splay : Optional Text
      }

let NoopConfig = { change_mode : ./ChangeModeNoop.dhall }

let FileConfig = { source : Text } ⩓ CommonConfig

let InlineConfig = { data : Text } ⩓ CommonConfig

let NoopFileConfig = NoopConfig ⩓ FileConfig

let NoopInlineConfig = NoopConfig ⩓ InlineConfig

let SignalFileConfig = SignalConfig ⩓ FileConfig

let SignalInlineConfig = SignalConfig ⩓ InlineConfig

let RestartFileConfig = RestartConfig ⩓ FileConfig

let RestartInlineConfig = RestartConfig ⩓ InlineConfig

let Variants =
      < FileTemplateNoop : NoopFileConfig
      | InlineTemplateNoop : NoopInlineConfig
      | FileTemplateWithSignal : SignalFileConfig
      | InlineTemplateWithSignal : SignalInlineConfig
      | FileTemplateWithRestart : RestartFileConfig
      | InlineTemplateWithRestart : RestartInlineConfig
      >

in  { Type = Variants
    , NoopFileConfig
    , NoopInlineConfig
    , SignalFileConfig
    , SignalInlineConfig
    , RestartFileConfig
    , RestartInlineConfig
    }
