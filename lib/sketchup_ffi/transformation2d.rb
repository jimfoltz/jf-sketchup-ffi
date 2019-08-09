require_relative "geometry"

module SketchupFFI
  attach_function(:SUTransformation2DTranslation, [SUTransformation2d, SUVector2d], SUResult)
  attach_function(:SUTransformation2DScale, [SUTransformation2d, :double], SUResult)
  attach_function(:SUTransformation2DNonUniformScale, [SUTransformation2d, :double, :double], SUResult)
  attach_function(:SUTransformation2DScaleAboutPoint, [SUTransformation2d, SUPoint2d, :double], SUResult)
  attach_function(:SUTransformation2DNonUniformScaleAboutPoint, [SUTransformation2d, SUPoint2d, :double, :double], SUResult)
  attach_function(:SUTransformation2DNonUniformScaleAboutPoint, [SUTransformation2d, SUPoint2d, :double, :double], SUResult)
  attach_function(:SUTransformation2DNonUniformScaleAboutPoint, [SUTransformation2d, SUPoint2d, :double, :double], SUResult)
  attach_function(:SUTransformation2DGetInverse, [SUTransformation2d, SUTransformation2d], SUResult)
  attach_function(:SUTransformation2DMultiply, [SUTransformation2d, SUTransformation2d, SUTransformation2d], SUResult)
  attach_function(:SUTransformation2DIsIdentity, [SUTransformation2d, :bool_ptr], SUResult)
  attach_function(:SUTransformation2DRotation, [SUTransformation2d, SUPoint2d, :double], SUResult)
end
