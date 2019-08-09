module SketchupFFI
  attach_function(:SUPolyline3dToEntity, [SUPolyline3dRef], SUEntityRef)
  attach_function(:SUPolyline3dFromEntity, [SUEntityRef], SUPolyline3dRef)
  attach_function(:SUPolyline3dToDrawingElement, [SUPolyline3dRef], SUDrawingElementRef)
  attach_function(:SUPolyline3dFromDrawingElement, [SUDrawingElementRef], SUPolyline3dRef)
  attach_function(:SUPolyline3dCreate, [SUPolyline3dRef], SUResult)
  attach_function(:SUPolyline3dRelease, [SUPolyline3dRef], SUResult)
  attach_function(:SUPolyline3dAddPoints, [SUPolyline3dRef, :size_t, SUPoint3d], SUResult)
  attach_function(:SUPolyline3dGetNumPoints, [SUPolyline3dRef, :size_ptr], SUResult)
  attach_function(:SUPolyline3dGetPoints, [SUPolyline3dRef, :size_t, SUPoint3d, :size_ptr], SUResult)
end
