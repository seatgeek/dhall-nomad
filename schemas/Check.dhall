let AddressMode = ../types/AddressMode.dhall

let Restart = ../types/CheckRestart.dhall

let Status = ../types/CheckInitialStatus.dhall

let Method = ../types/HTTPMethod.dhall

let Protocol = ../types/CheckProtocol.dhall

let CheckType = ../types/CheckType.dhall

let Map = (../Prelude.dhall).Map.Type

in  { Type = ../types/Check.dhall
    , default =
      { address_mode = AddressMode.host
      , args = None (List Text)
      , check_restart = None Restart
      , command = None Text
      , grpc_service = None Text
      , grpc_use_tls = False
      , initial_status = Status.critical
      , success_before_passing = None Natural
      , failures_before_critical = None Natural
      , method = Method.GET
      , name = None Text
      , path = None Text
      , expose = False
      , port = None Text
      , protocol = None Protocol
      , task = None Text
      , timeout = Text
      , tls_skip_verify = False
      , header = None (Map Text (List Text))
      }
    , CheckType
    , AddressMode
    , Restart
    , Status
    , Method
    , Protocol
    }
