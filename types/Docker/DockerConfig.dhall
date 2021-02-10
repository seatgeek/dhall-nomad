{- https://www.nomadproject.io/docs/drivers/docker -}
let Prelude = ../../Prelude.dhall

let Map = Prelude.Map.Type

let JSON = Prelude.JSON.Type

let MountConfig = (./DockerConfigMount.dhall).Type

in  { image : Text
    , image_pull_timeout : Optional Text
    , args : Optional (List Text)
    , auth : Optional ./DockerAuth.dhall
    , auth_soft_fail : Optional Bool
    , command : Optional Text
    , cpuset_cpus : Optional Text
    , dns_search_domains : Optional (List Text)
    , dns_options : Optional (List Text)
    , dns_servers : Optional (List Text)
    , entrypoint : Optional (List Text)
    , extra_hosts : Optional (List Text)
    , force_pull : Optional Bool
    , hostname : Optional Text
    , interactive : Optional Bool
    , sysctl : Optional (Map Text Text)
    , ulimit : Optional (Map Text Text)
    , privileged : Optional Bool
    , ipc_mode : Optional Text
    , ipv4_address : Optional Text
    , ipv6_address : Optional Text
    , labels : Optional (Map Text Text)
    , load : Optional Text
    , logging : Optional JSON
    , mac_address : Optional Text
    , memory_hard_limit : Optional Natural
    , network_aliases : Optional (List Text)
    , network_mode : Optional ./DockerNetworkMode.dhall
    , pid_mode : Optional ./DockerPIDMode.dhall
    , ports : Optional (List Text)
    , port_map : Optional (Map Text Natural)
    , security_opt : Optional (List Text)
    , shm_size : Optional Natural
    , storage_opt : Optional (Map Text Text)
    , tty : Optional Bool
    , uts_mode : Optional ./DockerPIDMode.dhall
    , userns_mode : Optional ./DockerPIDMode.dhall
    , volumes : Optional (List Text)
    , volume_driver : Optional Text
    , work_dir : Optional Text
    , mounts : Optional (List MountConfig)
    , devices : Optional (List ./DockerDevice.dhall)
    , cap_add : Optional (List Text)
    , cap_drop : Optional (List Text)
    , cpu_hard_limit : Optional Bool
    , cpu_cfs_period : Optional Natural
    , advertise_ipv6_address : Optional Bool
    , readonly_rootfs : Optional Bool
    , runtime : Optional Text
    , pids_limit : Optional Natural
    }
