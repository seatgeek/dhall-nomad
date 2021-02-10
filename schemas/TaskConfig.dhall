let Taskconfig = ../types/TaskConfig.dhall

in  { Docker = ./Docker.dhall
    , RawExec = ./RawExec.dhall
    , Custom.new = Taskconfig.Custom
    }
