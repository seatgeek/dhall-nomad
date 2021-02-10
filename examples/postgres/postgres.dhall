let nomad = ../../package.dhall

let port = { name = "db", from = 25432, to = 5432 }

let postgres =
      nomad.Job::{
      , region = "us-east-1"
      , datacenters = [ "default" ]
      , type = nomad.Job.JobType.service
      , meta = Some (toMap { version = "1" })
      , group = toMap
          { db = nomad.Group::{
            , task = toMap
                { postgres = nomad.Task::{
                  , driver = "docker"
                  , config =
                      nomad.Task.Config.Docker.new
                        nomad.Task.Config.Docker::{
                        , image = "postgres:12"
                        , volumes = Some [ "/postgres:/data/postgres" ]
                        , port_map = Some
                          [ { mapKey = port.name, mapValue = port.to } ]
                        }
                  , env = Some
                      ( toMap
                          { POSTGRES_DB = "postgres"
                          , POSTGRES_USER = "postgres"
                          , POSTGRES_PASSWORD = "root"
                          , PGDATA = "/data/postgres"
                          }
                      )
                  , service = Some
                    [ nomad.Service::{
                      , name = "\${NOMAD_JOB_NAME}"
                      , tags = Some [ "postgres" ]
                      , port = Some port.name
                      , check = Some
                        [ nomad.Check::{
                          , type = nomad.Check.CheckType.tcp
                          , port = Some "db"
                          , interval = "30s"
                          , timeout = "2s"
                          }
                        ]
                      }
                    ]
                  , resources = nomad.Resources::{
                    , network = Some nomad.Network::{
                      , port = Some
                        [ { mapKey = port.name
                          , mapValue = nomad.Port::{ static = Some port.from }
                          }
                        ]
                      }
                    }
                  }
                }
            }
          }
      }

in  { job = toMap { postgres } }
