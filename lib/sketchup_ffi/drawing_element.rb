module SketchupFFI

  attach_function(:SUDrawingElementToEntity, [SUDrawingElementRef], SUEntityRef)
  attach_function(:SUDrawingElementFromEntity, [SUEntityRef], SUDrawingElementRef)
  attach_function(:SUDrawingElementGetType, [SUDrawingElementRef], SUResult)
  attach_function(:SUDrawingElementGetBoundingBox, [SUDrawingElementRef, SUBoundingBox3d], SUResult)
  attach_function(:SUDrawingElementGetMaterial, [SUDrawingElementRef, SUMaterialRef], SUResult)
  attach_function(:SUDrawingElementSetMaterial, [SUDrawingElementRef, SUMaterialRef], SUResult)
  attach_function(:SUDrawingElementGetLayer, [SUDrawingElementRef, SULayerRef], SUResult)
  attach_function(:SUDrawingElementSetLayer, [SUDrawingElementRef, SULayerRef], SUResult)
  attach_function(:SUDrawingElementGetHidden, [SUDrawingElementRef, :bool], SUResult)
  attach_function(:SUDrawingElementSetHidden, [SUDrawingElementRef, :bool], SUResult)
  attach_function(:SUDrawingElementGetCastsShadows, [SUDrawingElementRef, :bool], SUResult)
  attach_function(:SUDrawingElementSetCastsShadows, [SUDrawingElementRef, :bool], SUResult)
  attach_function(:SUDrawingElementGetReceivesShadows, [SUDrawingElementRef, :bool], SUResult)
  attach_function(:SUDrawingElementSetReceivesShadows, [SUDrawingElementRef, :bool], SUResult)

end
