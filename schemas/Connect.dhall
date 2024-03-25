let SidecarService = ./SidecarService.dhall

let SidecarTask = ./SidecarTask.dhall

let Gateway = ./Gateway.dhall

in  { Type = ../types/Connect.dhall
    , default =
      { native = None Bool
      , sidecar_service = None ../types/SidecarService.dhall
      , sidecar_task = None ../types/SidecarTask.dhall
      , gateway = None ../types/Gateway.dhall
      }
    , SidecarService
    , SidecarTask
    , Gateway
    }
