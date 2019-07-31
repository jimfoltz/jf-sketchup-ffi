module SketchupFFI

  attach_function(:SUGroupToEntity, [SUGroupRef], SUEntityRef)
  attach_function(:SUGroupFromEntity, [SUEntityRef], SUGroupRef)
  attach_function(:SUGroupToDrawingElement, [SUGroupRef], SUDrawingElementRef)
  attach_function(:SUGroupFromDrawingElement, [SUDrawingElementRef], SUGroupRef)
  attach_function(:SUGroupToComponentInstance, [SUGroupRef], SUComponentInstanceRef)
  attach_function(:SUGroupFromComponentInstance, [SUComponentInstanceRef], SUGroupRef)
  attach_function(:SUGroupCreate, [SUGroupRef], SUResult)
  attach_function(:SUGroupSetName, [SUGroupRef, :string], SUResult)
  attach_function(:SUGroupGetName, [SUGroupRef, SUStringRef], SUResult)
  attach_function(:SUGroupSetGuid, [SUGroupRef, :string], SUResult)
  attach_function(:SUGroupGetGuid, [SUGroupRef, SUStringRef], SUResult)
  attach_function(:SUGroupSetTransform, [SUGroupRef, SUTransformation], SUResult)
  attach_function(:SUGroupGetTransform, [SUGroupRef, SUTransformation], SUResult)
  attach_function(:SUGroupGetEntities, [SUGroupRef, SUEntitiesRef], SUResult)

end
