let DockerConfig = ../types/Docker/DockerConfig.dhall

let Auth = ../types/Docker/DockerAuth.dhall

let NetworkMode = ../types/Docker/DockerNetworkMode.dhall

let HostMode = ../types/Docker/DockerPIDMode.dhall

let Device = ../types/Docker/DockerDevice.dhall

let Mount = ../types/Docker/DockerConfigMount.dhall

let Prelude = ../Prelude.dhall

let Map = Prelude.Map.Type

let JSON = Prelude.JSON.Type

let default =
      { image_pull_timeout = None Text
      , args = None (List Text)
      , auth = None Auth
      , auth_soft_fail = None Bool
      , command = None Text
      , cpuset_cpus = None Text
      , dns_search_domains = None (List Text)
      , dns_options = None (List Text)
      , dns_servers = None (List Text)
      , entrypoint = None (List Text)
      , extra_hosts = None (List Text)
      , force_pull = None Bool
      , hostname = None Text
      , interactive = None Bool
      , sysctl = None (Map Text Text)
      , ulimit = None (Map Text Text)
      , privileged = None Bool
      , ipc_mode = None Text
      , ipv4_address = None Text
      , ipv6_address = None Text
      , labels = None (Map Text Text)
      , load = None Text
      , logging = None JSON
      , mac_address = None Text
      , memory_hard_limit = None Natural
      , network_aliases = None (List Text)
      , network_mode = None NetworkMode
      , pid_mode = None HostMode
      , ports = None (List Text)
      , port_map = None (Map Text Natural)
      , security_opt = None (List Text)
      , shm_size = None Natural
      , storage_opt = None (Map Text Text)
      , tty = None Bool
      , uts_mode = None HostMode
      , userns_mode = None HostMode
      , volumes = None (List Text)
      , volume_driver = None Text
      , work_dir = None Text
      , mounts = None (List Mount.Type)
      , devices = None (List Device)
      , cap_add = None (List Text)
      , cap_drop = None (List Text)
      , cpu_hard_limit = None Bool
      , cpu_cfs_period = None Natural
      , advertise_ipv6_address = None Bool
      , readonly_rootfs = None Bool
      , runtime = None Text
      , pids_limit = None Natural
      }

let new = (../types/TaskConfig.dhall).Docker

in  { Type = DockerConfig
    , default
    , new
    , NetworkMode
    , HostMode
    , Auth = ./Docker/DockerAuth.dhall
    , Device = ./Docker/DockerDevice.dhall
    , Mount = ./Docker/DockerMount.dhall
    }
