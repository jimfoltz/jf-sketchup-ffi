require_relative "geometry"

module SketchupFFI
  attach_function(:SUPlane3DSetWithPoints, [SUPlane3d, SUPoint3d, SUPoint3d, SUPoint3d], SUResult)
  attach_function(:SUPlane3DSetWithPointAndNormal, [SUPlane3d, SUPoint3d, SUVector3d], SUResult)
  attach_function(:SUPlane3DSetWithCoefficients, [SUPlane3d, :double, :double, :double, :double], SUResult)
  attach_function(:SUPlane3DGetPosition, [SUPlane3d, SUPoint3d], SUResult)
  attach_function(:SUPlane3DGetNormal, [SUPlane3d, SUVector3d], SUResult)
  attach_function(:SUPlane3DIsOn, [SUPlane3d, SUPoint3d, :bool_ptr], SUResult)
  attach_function(:SUPlane3DDistanceTo, [SUPlane3d, SUPoint3d, :double_ptr], SUResult)
  attach_function(:SUPlane3DProjectTo, [SUPlane3d, SUPoint3d, SUPoint3d], SUResult)
  attach_function(:SUPlane3DTransform, [SUTransformation, SUPlane3d], SUResult)
end
