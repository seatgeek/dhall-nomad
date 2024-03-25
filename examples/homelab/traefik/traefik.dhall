let nomad = ../../../package.dhall

let traefikTask =
      nomad.Task::{
      , driver = "docker"
      , resources = nomad.Resources::{ cpu = Some 500, memory = 500 }
      , config =
          nomad.Task.Config.Docker.new
            nomad.Task.Config.Docker::{
            , image = "traefik:2.11.0"
            , ports = Some [ "admin", "http" ]
            , network_mode = Some nomad.Task.Config.Docker.NetworkMode.host
            , args = Some
              [ "--api.dashboard=true"
              , "--api.insecure=true"
              , "--entrypoints.web.address=:80"
              , "--entrypoints.traefik.address=:8080"
              , "--providers.consulcatalog=true"
              , "--providers.consulcatalog.exposedByDefault=false"
              , "--providers.consulcatalog.connectAware=true"
              , "--log.level=DEBUG"
              ]
            }
      }

let http = nomad.Port::{ static = Some 80 }

let admin = nomad.Port::{ static = Some 8080 }

let traefikGroup =
      toMap
        { traefik = nomad.Group::{
          , task = toMap { traefikTask }
          , network = Some nomad.Network::{
            , port = Some (toMap { http, admin })
            , mode = nomad.Network.Mode.host
            }
          , service = Some
            [ nomad.Service::{
              , name = "traefik-http"
              , port = Some "http"
              , connect = Some nomad.Service.Connect::{ native = Some True }
              }
            ]
          }
        }

let traefik =
      nomad.Job::{
      , datacenters = [ "dc1" ]
      , group = traefikGroup
      , priority = 100
      , type = nomad.Job.JobType.system
      }

in  { job = toMap { traefik } }
