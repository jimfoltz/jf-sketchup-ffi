module SketchupFFI
  attach_function(:SUDimensionRadialToDimension, [SUDimensionRadialRef], SUDimensionRef)
  attach_function(:SUDimensionRadialFromDimension, [SUDimensionRef], SUDimensionRadialRef)
  attach_function(:SUDimensionRadialCreate, [SUDimensionRadialRef, SUInstancePathRef], SUResult)
  attach_function(:SUDimensionRadialRelease, [SUDimensionRadialRef], SUResult)
  attach_function(:SUDimensionRadialGetCurveInstancePath, [SUDimensionRadialRef, SUInstancePathRef], SUResult)
  attach_function(:SUDimensionRadialSetCurveInstancePath, [SUDimensionRadialRef, SUInstancePathRef], SUResult)
  attach_function(:SUDimensionRadialGetDiameter, [SUDimensionRadialRef, :bool_ptr], SUResult)
  attach_function(:SUDimensionRadialSetDiameter, [SUDimensionRadialRef, :bool], SUResult)
  attach_function(:SUDimensionRadialGetLeaderBreakPoint, [SUDimensionRadialRef, SUPoint3d], SUResult)
  attach_function(:SUDimensionRadialSetLeaderBreakPoint, [SUDimensionRadialRef, SUPoint3d], SUResult)
  attach_function(:SUDimensionRadialGetLeaderPoints, [SUDimensionRadialRef, SUPoint3d], SUResult)
end
