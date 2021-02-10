let JSON = (../Prelude.dhall).JSON

let VolumeType = ../types/VolumeType.dhall

in  { Type = ../types/Volume.dhall
    , default = { read_only = False, mount_options = JSON.null }
    , VolumeType
    }
