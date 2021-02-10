{ Type = ../types/Docker/DockerConfig.dhall
, default =
  { command = None Text
  , entrypoint = None (List Text)
  , force_pull = None Bool
  , hostname = None Text
  , volumes = None (List Text)
  , mounts = None (List (../types/Docker/DockerConfigMount.dhall).Type)
  }
}
