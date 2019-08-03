require_relative "geometry"

module SketchupFFI

  attach_function(:SUPoint2DToSUPoint2D, [SUPoint2d, SUPoint2d, SUVector2d], SUResult)
  attach_function(:SUPoint2DGetEqual, [SUPoint2d, SUPoint2d, :bool_ptr], SUResult)
  attach_function(:SUPoint2DOffset, [SUPoint2d, SUVector2d, SUPoint2d], SUResult)
  attach_function(:SUPoint2DDistanceToSUPoint2D, [SUPoint2d, SUPoint2d, :double_ptr], SUResult)
  attach_function(:SUPoint2DTransform, [SUTransformation2d, SUPoint2d], SUResult)

end
