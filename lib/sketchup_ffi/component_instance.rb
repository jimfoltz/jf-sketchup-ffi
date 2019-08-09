module SketchupFFI
  attach_function(:SUComponentInstanceToEntity, [SUComponentInstanceRef], SUEntityRef)
  attach_function(:SUComponentInstanceFromEntity, [SUEntityRef], SUComponentInstanceRef)
  attach_function(:SUComponentInstanceToDrawingElement, [SUComponentInstanceRef], SUDrawingElementRef)
  attach_function(:SUComponentInstanceFromDrawingElement, [SUDrawingElementRef], SUComponentInstanceRef)
  attach_function(:SUComponentInstanceRelease, [SUComponentInstanceRef], SUResult)
  attach_function(:SUComponentInstanceSetName, [SUComponentInstanceRef, :string], SUResult)
  attach_function(:SUComponentInstanceGetName, [SUComponentInstanceRef, SUStringRef], SUResult)
  attach_function(:SUComponentInstanceSetGuid, [SUComponentInstanceRef, :string], SUResult)
  attach_function(:SUComponentInstanceGetGuid, [SUComponentInstanceRef, SUStringRef], SUResult)
  attach_function(:SUComponentInstanceSetTransform, [SUComponentInstanceRef, SUTransformation], SUResult)
  attach_function(:SUComponentInstanceGetTransform, [SUComponentInstanceRef, SUTransformation], SUResult)
  attach_function(:SUComponentInstanceGetDefinition, [SUComponentInstanceRef, SUComponentDefinitionRef], SUResult)
  attach_function(:SUComponentInstanceSetLocked, [SUComponentInstanceRef, :bool], SUResult)
  attach_function(:SUComponentInstanceIsLocked, [SUComponentInstanceRef, :bool_ptr], SUResult)
  attach_function(:SUComponentInstanceSaveAs, [SUComponentInstanceRef, :string], SUResult)
  attach_function(:SUComponentInstanceComputeVolume, [SUComponentInstanceRef, SUTransformation, :double_ptr], SUResult)
  attach_function(:SUComponentInstanceCreateDCInfo, [SUComponentInstanceRef, SUDynamicComponentInfoRef], SUResult)
  attach_function(:SUComponentInstanceCreateClassificationInfo, [SUComponentInstanceRef, SUClassificationInfoRef], SUResult)
  attach_function(:SUComponentInstanceGetNumAttachedInstances, [SUComponentInstanceRef, :size_ptr], SUResult)
  attach_function(:SUComponentInstanceGetAttachedInstances, [SUComponentInstanceRef, :size_t, SUComponentInstanceRef, :size_ptr], SUResult)
  attach_function(:SUComponentInstanceGetNumAttachedToDrawingElements, [SUComponentInstanceRef, :size_ptr], SUResult)
  attach_function(:SUComponentInstanceGetAttachedToDrawingElements, [SUComponentInstanceRef, :size_t, SUDrawingElementRef, :size_ptr], SUResult)
end
