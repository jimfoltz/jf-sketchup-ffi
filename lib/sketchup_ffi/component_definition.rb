module SketchupFFI

  class SUComponentBehavior < FFI::Struct
    # TODO
  end

  SUComponentType = enum(
    :Normal, :Group
  )

  attach_function(:SUComponentDefinitionToEntity, [SUComponentDefinitionRef], SUEntityRef)
  attach_function(:SUComponentDefinitionFromEntity, [SUEntityRef], SUComponentDefinitionRef)
  attach_function(:SUComponentDefinitionToDrawingElement, [SUComponentDefinitionRef], SUDrawingElementRef)
  attach_function(:SUComponentDefinitionFromDrawingElement, [SUDrawingElementRef], SUComponentDefinitionRef)

  attach_function(:SUComponentDefinitionCreate, [SUComponentDefinitionRef], SUResult)
  attach_function(:SUComponentDefinitionRelease, [SUComponentDefinitionRef], SUResult)

  attach_function(:SUComponentDefinitionGetName, [SUComponentDefinitionRef, SUStringRef], SUResult)
  attach_function(:SUComponentDefinitionSetName, [SUComponentDefinitionRef, :string], SUResult)
  attach_function(:SUComponentDefinitionGetDescription, [SUComponentDefinitionRef, SUStringRef], SUResult)
  attach_function(:SUComponentDefinitionSetDescription, [SUComponentDefinitionRef, :string], SUResult)
  attach_function(:SUComponentDefinitionGetGuid, [SUComponentDefinitionRef, SUStringRef], SUResult)
  attach_function(:SUComponentDefinitionGetEntities, [SUComponentDefinitionRef, SUEntitiesRef], SUResult)
  attach_function(:SUComponentDefinitionCreateInstance, [SUComponentDefinitionRef, SUComponentInstanceRef], SUResult)
  attach_function(:SUComponentDefinitionGetNumUsedInstances, [SUComponentDefinitionRef, :size_ptr], SUResult)
  attach_function(:SUComponentDefinitionGetNumInstances, [SUComponentDefinitionRef, :size_ptr], SUResult)
  attach_function(:SUComponentDefinitionGetInstances, [SUComponentDefinitionRef, :size_t, SUComponentInstanceRef, :size_ptr], SUResult)
  attach_function(:SUComponentDefinitionGetBehavior, [SUComponentDefinitionRef, :size_t, SUComponentBehavior, :size_ptr], SUResult)
  attach_function(:SUComponentDefinitionSetBehavior, [SUComponentDefinitionRef, SUComponentBehavior], SUResult)
  attach_function(:SUComponentDefinitionApplySchemaType, [SUComponentDefinitionRef, SUSchemaRef, SUSchemaTypeRef], SUResult)
  attach_function(:SUComponentDefinitionIsInternal, [SUComponentDefinitionRef, :bool_ptr], SUResult)
  attach_function(:SUComponentDefinitionGetPath, [SUComponentDefinitionRef, SUStringRef], SUResult)
  attach_function(:SUComponentDefinitionGetLoadTime, [SUComponentDefinitionRef, Time_tm], SUResult)
  attach_function(:SUComponentDefinitionGetNumOpenings, [SUComponentDefinitionRef, :size_ptr], SUResult)
  attach_function(:SUComponentDefinitionGetOpenings, [SUComponentDefinitionRef, :size_t, SUOpeningRef, :size_ptr], SUResult)
  attach_function(:SUComponentDefinitionGetInsertPoint, [SUComponentDefinitionRef, SUPoint3d], SUResult)
  attach_function(:SUComponentDefinitionGetType, [SUComponentDefinitionRef, SUComponentType], SUResult)
  attach_function(:SUComponentDefinitionOrientFacesConsistently, [SUComponentDefinitionRef], SUResult)
  attach_function(:SUComponentDefinitionSetInsertPoint, [SUComponentDefinitionRef, SUPoint3d], SUResult)
  attach_function(:SUComponentDefinitionSetAxes, [SUComponentDefinitionRef, SUAxesRef], SUResult)

end
