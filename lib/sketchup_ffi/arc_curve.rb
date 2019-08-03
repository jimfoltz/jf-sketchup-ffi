# arc-curve.rb
#
require_relative "geometry"

module SketchupFFI

  attach_function(:SUArcCurveCreate, [SUArcCurveRef, SUPoint3d, SUPoint3d, SUPoint3d, SUVector3d, :size_t], SUResult)
  attach_function(:SUArcCurveRelease, [SUArcCurveRef], SUResult)
  attach_function(:SUArcCurveFromEntity, [SUEntitiesRef], SUArcCurveRef)
  attach_function(:SUArcCurveToEntity, [SUArcCurveRef], SUEntityRef)
  attach_function(:SUArcCurveToCurve, [SUArcCurveRef], SUCurveRef)
  attach_function(:SUArcCurveFromCurve, [SUCurveRef], SUArcCurveRef)
  attach_function(:SUArcCurveGetRadius, [SUArcCurveRef, :double_ptr], SUResult)
  attach_function(:SUArcCurveGetCenter, [SUArcCurveRef, SUPoint3d], SUResult)
  attach_function(:SUArcCurveGetEndAngle, [SUArcCurveRef, :double_ptr], SUResult)
  attach_function(:SUArcCurveGetEndPoint, [SUArcCurveRef, SUPoint3d], SUResult)
  attach_function(:SUArcCurveGetIsFullCircle, [SUArcCurveRef, :bool_ptr], SUResult)
  attach_function(:SUArcCurveGetNormal, [SUArcCurveRef, SUVector3d], SUResult)
  attach_function(:SUArcCurveGetStartAngle, [SUArcCurveRef, :double_ptr], SUResult)
  attach_function(:SUArcCurveGetStartPoint, [SUArcCurveRef, SUPoint3d], SUResult)
  attach_function(:SUArcCurveGetXAxis, [SUArcCurveRef, SUVector3d], SUResult)
  attach_function(:SUArcCurveGetYAxis, [SUArcCurveRef, SUVector3d], SUResult)
  attach_function(:SUArcCurveRelease, [SUArcCurveRef], SUResult)

end
