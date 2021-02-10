{- https://www.nomadproject.io/docs/job-specification/service#check-parameters -}
let Map = (../Prelude.dhall).Map.Type

in  { address_mode : ./AddressMode.dhall
    , args : Optional (List Text)
    , check_restart : Optional ./CheckRestart.dhall
    , command : Optional Text
    , grpc_service : Optional Text
    , grpc_use_tls : Bool
    , initial_status : ./CheckInitialStatus.dhall
    , success_before_passing : Optional Natural
    , failures_before_critical : Optional Natural
    , interval : Text
    , method : ./HTTPMethod.dhall
    , name : Optional Text
    , path : Optional Text
    , expose : Bool
    , port : Optional Text
    , protocol : Optional ./CheckProtocol.dhall
    , task : Optional Text
    , timeout : Text
    , type : ./CheckType.dhall
    , tls_skip_verify : Bool
    , header : Optional (Map Text (List Text))
    }
