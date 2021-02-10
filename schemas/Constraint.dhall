let Operator = ../types/ConstraintOperator.dhall

in  { Type = ../types/Constraint.dhall
    , default.operator = Operator.`=`
    , Operator
    }
