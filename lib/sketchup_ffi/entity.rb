module SketchupFFI

  attach_function(:SUEntityGetType, [SUEntityRef], SURefType)
  attach_function(:SUEntityGetID, [SUEntityRef, :int32_ptr], SUResult)
  attach_function(:SUEntityGetPersistentID, [SUEntityRef, :int64_ptr], SUResult)
  attach_function(:SUEntityGetNumAttributeDictionaries, [SUEntityRef, :size_ptr], SUResult)
  attach_function(:SUEntityGetAttributeDictionaries, [SUEntityRef, :size_t, SUAttributeDictionaryRef, :size_ptr], SUResult)
  attach_function(:SUEntityAddAttributeDictionary, [SUEntityRef, SUAttributeDictionaryRef], SUResult)
  attach_function(:SUEntityGetAttributeDictionary, [SUEntityRef, :string, SUAttributeDictionaryRef], SUResult)
  attach_function(:SUEntityGetModel, [SUEntityRef, SUModelRef], SUResult)
  attach_function(:SUEntityGetParentEntities, [SUEntityRef, SUEntitiesRef], SUResult)

end
