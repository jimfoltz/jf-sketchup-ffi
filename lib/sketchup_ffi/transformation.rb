require_relative "geometry"

module SketchupFFI
  attach_function(:SUTransformationSetFromPointAndNormal, [SUTransformation, SUPoint3d, SUVector3d], SUResult)
  attach_function(:SUTransformationSetFromPointAndAxes, [SUTransformation, SUPoint3d, SUVector3d, SUVector3d, SUVector3d], SUResult)
  attach_function(:SUTransformationTranslation, [SUTransformation, SUVector3d], SUResult)
  attach_function(:SUTransformationScale, [SUTransformation, :double], SUResult)
  attach_function(:SUTransformationNonUniformScale, [SUTransformation, :double, :double, :double], SUResult)
  attach_function(:SUTransformationScaleAboutPoint, [SUTransformation, SUPoint3d, :double], SUResult)
  attach_function(:SUTransformationNonUniformScaleAboutPoint, [SUTransformation, SUPoint3d, :double, :double, :double], SUResult)
  attach_function(:SUTransformationRotation, [SUTransformation, SUPoint3d, SUVector3d, :double], SUResult)
  attach_function(:SUTransformationInterpolate, [SUTransformation, SUTransformation, SUTransformation, :double], SUResult)
  attach_function(:SUTransformationIsIdentity, [SUTransformation, :bool_ptr], SUResult)
  attach_function(:SUTransformationGetInverse, [SUTransformation, SUTransformation], SUResult)
  attach_function(:SUTransformationGetOrigin, [SUTransformation, SUPoint3d], SUResult)
  attach_function(:SUTransformationGetXAxis, [SUTransformation, SUVector3d], SUResult)
  attach_function(:SUTransformationGetYAxis, [SUTransformation, SUVector3d], SUResult)
  attach_function(:SUTransformationGetZAxis, [SUTransformation, SUVector3d], SUResult)
  attach_function(:SUTransformationGetZRotation, [SUTransformation, :double], SUResult)
  attach_function(:SUTransformationMultiply, [SUTransformation, SUTransformation, SUTransformation], SUResult)
  attach_function(:SUTransformationIsMirrored, [SUTransformation, :bool_ptr], SUResult)
end
