let TaskConfig = ../types/TaskConfig.dhall

in  { Type = ../types/RawExec.dhall
    , default.args = None (List Text)
    , new = TaskConfig.RawExec
    }
