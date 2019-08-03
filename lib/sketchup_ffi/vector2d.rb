require_relative "geometry"

module SketchupFFI

  attach_function(:SUVector2DCreate, [SUVector2d, SUPoint2d, SUPoint2d], SUResult)
  attach_function(:SUVector2DIsValid, [SUVector2d, :bool_ptr], SUResult)
  attach_function(:SUVector2DIsParallelTo, [SUVector2d, SUVector2d, :bool_ptr], SUResult)
  attach_function(:SUVector2DIsPerpendicularTo, [SUVector2d, SUVector2d, :bool_ptr], SUResult)
  attach_function(:SUVector2DIsSameDirectionAs, [SUVector2d, SUVector2d, :bool_ptr], SUResult)
  attach_function(:SUVector2DIsEqual, [SUVector2d, SUVector2d, :bool_ptr], SUResult)
  attach_function(:SUVector2DNormalize, [SUVector2d], SUResult)
  attach_function(:SUVector2DReverse, [SUVector2d], SUResult)
  attach_function(:SUVector2DDot, [SUVector2d, SUVector2d, :double_ptr], SUResult)
  attach_function(:SUVector2DCross, [SUVector2d, SUVector2d, :double_ptr], SUResult)
  attach_function(:SUVector2DIsUnitVector, [SUVector2d, :bool_ptr], SUResult)
  attach_function(:SUVector2DGetLength, [SUVector2d, :double_ptr], SUResult)
  attach_function(:SUVector2DSetLength, [SUVector2d, :double], SUResult)
  attach_function(:SUVector2DAngleBetween, [SUVector2d, SUVector2d, :double_ptr], SUResult)
  attach_function(:SUVector2DTransform, [SUTransformation2d, SUVector2d], SUResult)

end
