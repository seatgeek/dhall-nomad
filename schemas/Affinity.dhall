let operator = ../types/AffinityOperator.dhall

in  { Type = ../types/Affinity.dhall
    , default = { operator = operator.`=`, weight = 50 }
    }
