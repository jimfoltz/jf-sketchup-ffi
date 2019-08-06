module SketchupFFI

  attach_function(:SUSectionPlaneToEntity, [SUSectionPlaneRef], SUEntityRef)
  attach_function(:SUSectionPlaneFromEntity, [SUEntityRef], SUSectionPlaneRef)
  attach_function(:SUSectionPlaneToDrawingElement, [SUSectionPlaneRef], SUDrawingElementRef)
  attach_function(:SUSectionPlaneFromDrawingElement, [SUDrawingElementRef], SUSectionPlaneRef)
  attach_function(:SUSectionPlaneCreate, [SUSectionPlaneRef], SUResult)
  attach_function(:SUSectionPlaneRelease, [SUSectionPlaneRef], SUResult)
  attach_function(:SUSectionPlaneSetPlane, [SUSectionPlaneRef, SUPlane3d], SUResult)
  attach_function(:SUSectionPlaneGetPlane, [SUSectionPlaneRef, SUPlane3d], SUResult)
  attach_function(:SUSectionPlaneIsActive, [SUSectionPlaneRef, :bool_ptr], SUResult)
  attach_function(:SUSectionPlaneGetName, [SUSectionPlaneRef, SUStringRef], SUResult)
  attach_function(:SUSectionPlaneSetName, [SUSectionPlaneRef, :string], SUResult)
  attach_function(:SUSectionPlaneGetSymbol, [SUSectionPlaneRef, SUStringRef], SUResult)
  attach_function(:SUSectionPlaneSetSymbol, [SUSectionPlaneRef, :string], SUResult)

end