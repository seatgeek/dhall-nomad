let nomad = ../../../package.dhall

let Connect = nomad.Service.Connect

let db =
      { database = "passbolt"
      , user = "passbolt"
      , password = "passbolt-user-password"
      , root_password = "passbolt-root-password"
      , addr = "\${NOMAD_UPSTREAM_IP_passbolt_mysql}"
      , port = "\${NOMAD_UPSTREAM_PORT_passbolt_mysql}"
      }

let mysql-task =
      nomad.Task::{
      , env = Some
          ( toMap
              { MARIADB_ROOT_PASSWORD = db.root_password
              , MARIADB_DATABASE = db.database
              , MARIADB_USER = db.user
              , MARIADB_PASSWORD = db.password
              }
          )
      , driver = "docker"
      , resources = nomad.Resources::{ cpu = Some 4000, memory = 4000 }
      , config =
          nomad.Task.Config.Docker.new
            nomad.Task.Config.Docker::{ image = "mariadb:10.11" }
      , user = Some "mysql"
      , volume_mount = Some
        [ { volume = "mysql-volume"
          , destination = "/var/lib/mysql"
          , read_only = False
          }
        ]
      }

let web-task =
      nomad.Task::{
      , env = Some
          ( toMap
              { APP_FULL_BASE_URL = "http://passbolt.local"
              , PASSBOLT_KEY_EMAIL = "passbolt@example.com"
              , PASSBOLT_SSL_FORCE = "false"
              , DATASOURCES_DEFAULT_HOST = db.addr
              , DATASOURCES_DEFAULT_PORT = db.port
              , DATASOURCES_DEFAULT_DATABASE = db.database
              , DATASOURCES_DEFAULT_USERNAME = db.user
              , DATASOURCES_DEFAULT_PASSWORD = db.password
              }
          )
      , driver = "docker"
      , resources = nomad.Resources::{ cpu = Some 2000, memory = 2000 }
      , config =
          nomad.Task.Config.Docker.new
            nomad.Task.Config.Docker::{ image = "passbolt/passbolt:latest-ce" }
      , volume_mount = Some
        [ { volume = "config-volume"
          , destination = "/etc/passbolt/gpg"
          , read_only = False
          }
        ]
      }

let config-volume =
      nomad.Volume::{
      , type = nomad.Volume.VolumeType.host
      , source = "passbolt-config"
      , read_only = False
      }

let mysql-volume =
      nomad.Volume::{
      , type = nomad.Volume.VolumeType.host
      , source = "passbolt-mysql"
      , read_only = False
      }

let mysql =
      nomad.Group::{
      , task = toMap { mysql-task }
      , volume = Some (toMap { mysql-volume })
      , network = Some nomad.Network::{=}
      , service = Some
        [ nomad.Service::{
          , name = "passbolt-mysql"
          , port = Some "3306"
          , connect = Some Connect::{
            , sidecar_service = Some Connect.SidecarService::{=}
            }
          }
        ]
      }

let web =
      nomad.Group::{
      , task = toMap { web-task }
      , volume = Some (toMap { config-volume })
      , network = Some nomad.Network::{=}
      , service = Some
        [ nomad.Service::{
          , name = "passbolt"
          , port = Some "80"
          , tags = Some
            [ "traefik.enable=true"
            , "traefik.consulcatalog.connect=true"
            , "traefik.http.routers.passbolt.rule=Host(`passbolt.local`)"
            ]
          , connect = Some Connect::{
            , sidecar_service = Some Connect.SidecarService::{
              , proxy = Some Connect.SidecarService.Proxy::{
                , upstreams = Some Connect.SidecarService.Proxy.Upstreams::{
                  , destination_name = "passbolt-mysql"
                  , local_bind_port = 3306
                  }
                }
              }
            }
          }
        ]
      }

let passbolt =
      nomad.Job::{ datacenters = [ "dc1" ], group = toMap { web, mysql } }

in  { job = toMap { passbolt } }
