{ Type = ../types/Vault.dhall
, default =
  { change_mode = (../types/ChangeMode.dhall).restart
  , change_signal = (../types/Signal.dhall).SIGHUP
  , env = True
  , namespace = None Text
  }
}
