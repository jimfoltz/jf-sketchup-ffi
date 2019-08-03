module SketchupFFI

  attach_function(:SULayerToEntity, [SULayerRef], SUEntityRef)
  attach_function(:SULayerFromEntity, [SUEntityRef], SULayerRef)
  attach_function(:SULayerCreate, [SULayerRef], SUResult)
  attach_function(:SULayerRelease, [SULayerRef], SUResult)
  attach_function(:SULayerGetName, [SULayerRef, SUStringRef], SUResult)
  attach_function(:SULayerSetName, [SULayerRef, :string], SUResult)
  attach_function(:SULayerGetMaterial, [SULayerRef, SUMaterialRef], SUResult)
  attach_function(:SULayerGetVisibility, [SULayerRef, :bool_ptr], SUResult)
  attach_function(:SULayerSetVisibility, [SULayerRef, :bool], SUResult)
  attach_function(:SULayerGetLineStyle, [SULayerRef, SULineStyleRef], SUResult)
  attach_function(:SULayerSetLineStyle, [SULayerRef, SULineStyleRef], SUResult)
  attach_function(:SULayerClearLineStyle, [SULayerRef], SUResult)

end
