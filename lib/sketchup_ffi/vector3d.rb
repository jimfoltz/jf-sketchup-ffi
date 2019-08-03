require_relative "geometry"

module SketchupFFI

  attach_function(:SUVector3DCreate, [SUVector3d, SUPoint3d, SUPoint3d], SUResult)
  attach_function(:SUVector3DIsValid, [SUVector3d, :bool_ptr], SUResult)
  attach_function(:SUVector3DIsParallelTo, [SUVector3d, SUVector3d, :bool_ptr], SUResult)
  attach_function(:SUVector3DIsPerpendicularTo, [SUVector3d, SUVector3d, :bool_ptr], SUResult)
  attach_function(:SUVector3DIsSameDirectionAs, [SUVector3d, SUVector3d, :bool_ptr], SUResult)
  attach_function(:SUVector3DIsEqual, [SUVector3d, SUVector3d, :bool_ptr], SUResult)
  attach_function(:SUVector3DLessThan, [SUVector3d, SUVector3d,:bool_ptr], SUResult)
  attach_function(:SUVector3DNormalize, [SUVector3d], SUResult)
  attach_function(:SUVector3DReverse, [SUVector3d], SUResult)
  attach_function(:SUVector3DDot, [SUVector3d, SUVector3d, :double_ptr], SUResult)
  attach_function(:SUVector3DCross, [SUVector3d, SUVector3d, SUVector3d], SUResult)
  attach_function(:SUVector3DIsUnitVector, [SUVector3d, :bool_ptr], SUResult)
  attach_function(:SUVector3DGetLength, [SUVector3d, :double_ptr], SUResult)
  attach_function(:SUVector3DSetLength, [SUVector3d, :double], SUResult)
  attach_function(:SUVector3DAngleBetween, [SUVector3d, SUVector3d, :double_ptr], SUResult)
  attach_function(:SUVector3DGetArbitraryAxes, [SUVector3d, SUVector3d, SUVector3d], SUResult)
  attach_function(:SUVector3DTransform, [SUTransformation, SUVector3d], SUResult)
  attach_function(:SUVector3DLinearCombination, [SUVector3d, :double_ptr, :size_t, SUVector3d], SUResult)

end
