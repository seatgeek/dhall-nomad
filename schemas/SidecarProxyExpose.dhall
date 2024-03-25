{- https://developer.hashicorp.com/nomad/docs/job-specification/expose -}
let Path = ./SidecarProxyExposePath.dhall

in  { Type = ../types/SidecarProxyExpose.dhall, default = {=}, Path }
