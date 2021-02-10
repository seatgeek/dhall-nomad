let nomad = ../../package.dhall

let ports =
      { prometheus_ui = { name = "prometheus_ui", to = "9090" }
      , grafana_ui = { name = "grafana_ui", to = "3000" }
      }

let InlineTemplate = nomad.Template.strategy.noop.Inline

let grafanaTask =
      nomad.Task::{
      , artifact = Some
        [ nomad.Artifact::{
          , source = "https://example.com/prometheus_nomad.json"
          , destination = Some "local/provisioning/dashboards/dashs"
          }
        ]
      , template = Some
        [ InlineTemplate.new
            InlineTemplate::{
            , destination = "local/provisioning/dashboards/file_provider.yml"
            , data = ./file_provider.yml as Text
            }
        , InlineTemplate.new
            InlineTemplate::{
            , destination =
                "local/provisioning/datasources/prometheus_datasource.yml"
            , data = ./prometheus_datasource.yml as Text
            }
        ]
      , env = Some
          ( toMap
              { GF_SERVER_ROOT_URL = "http://127.0.0.1:9999/grafana/"
              , GF_PATHS_PROVISIONING = "/\${NOMAD_TASK_DIR}/provisioning"
              }
          )
      , driver = "docker"
      , config =
          nomad.Task.Config.Docker.new
            nomad.Task.Config.Docker::{
            , image = "grafana/grafana:6.1.4"
            , ports = Some [ ports.grafana_ui.name ]
            }
      , resources = nomad.Resources::{=}
      }

let prometheusTask =
      nomad.Task::{
      , template = Some
        [ InlineTemplate.new
            InlineTemplate::{
            , destination = "local/prometheus.yml"
            , data = ./prometheus.yml as Text
            }
        ]
      , driver = "docker"
      , config =
          nomad.Task.Config.Docker.new
            nomad.Task.Config.Docker::{
            , image = "prom/prometheus:v2.9.1"
            , args = Some
              [ "--web.external-url=http://127.0.0.1:9999/prometheus"
              , "--web.route-prefix=/"
              , "--config.file=/local/prometheus.yml"
              ]
            , ports = Some [ ports.prometheus_ui.name ]
            }
      , resources = nomad.Resources::{ cpu = 500, memory = 256 }
      }

let prometheus =
      nomad.Job::{
      , datacenters = [ "dc1" ]
      , type = nomad.Job.JobType.service
      , update = Some nomad.Update::{
        , max_parallel = 1
        , min_healthy_time = "10s"
        , healthy_deadline = "3m"
        , auto_revert = False
        , canary = 0
        }
      , group = toMap
          { monitoring = nomad.Group::{
            , count = Some 1
            , restart = Some nomad.Restart::{
              , attempts = Some 10
              , interval = Some "5m"
              , delay = "25s"
              , mode = nomad.Restart.Mode.delay
              }
            , network = Some nomad.Network::{
              , port = Some
                [ { mapKey = ports.prometheus_ui.name
                  , mapValue = nomad.Port::{ to = Some ports.prometheus_ui.to }
                  }
                , { mapKey = ports.grafana_ui.name
                  , mapValue = nomad.Port::{ to = Some ports.grafana_ui.to }
                  }
                ]
              }
            , service = Some
              [ nomad.Service::{
                , name = "prometheus_ui"
                , tags = Some [ "urlprefix-/prometheus strip=/prometheus" ]
                , port = Some ports.prometheus_ui.name
                , check = Some
                  [ nomad.Check::{
                    , name = Some "prometheus_ui port alive"
                    , type = nomad.Check.CheckType.tcp
                    , interval = "10s"
                    , timeout = "2s"
                    }
                  ]
                }
              , nomad.Service::{
                , name = "grafana_ui"
                , tags = Some [ "urlprefix-/grafana strip=/grafana" ]
                , port = Some ports.grafana_ui.name
                , check = Some
                  [ nomad.Check::{
                    , name = Some "grafana_ui port alive"
                    , type = nomad.Check.CheckType.tcp
                    , interval = "10s"
                    , timeout = "2s"
                    }
                  ]
                }
              ]
            , ephemeral_disk = Some nomad.EphemeralDisk::{ size = 1000 }
            , task = toMap
                { grafana = grafanaTask, prometheus = prometheusTask }
            }
          }
      }

in  { job = toMap { prometheus } }
