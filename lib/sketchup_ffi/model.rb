# model.rb

module SketchupFFI

  attach_function(:SUModelAddMaterials, [SUModelRef, :size_t, SUMaterialRef], SUResult)
  attach_function(:SUModelCreate, [SUModelRef], SUResult)
  attach_function(:SUModelCreateFromFile, [SUModelRef, :string], SUResult)
  attach_function(:SUModelGetNumAttributeDictionaries, [SUModelRef, :int_ptr], SUResult)
  attach_function(:SUModelGetAttributeDictionaries, [SUModelRef, :size_t, :pointer, :pointer], SUResult)
  attach_function(:SUModelGetAttributeDictionary, [SUModelRef, :string, SUAttributeDictionaryRef], SUResult)
  attach_function(:SUModelGetAxes, [SUModelRef, :pointer], SUResult)
  attach_function(:SUModelGetEntities, [SUModelRef, SUEntitiesRef], SUResult)
  attach_function(:SUModelGetName, [SUModelRef, SUStringRef], SUResult)
  attach_function(:SUModelGetVersion, [SUModelRef, :int_ptr, :int_ptr, :int_ptr], SUResult)
  attach_function(:SUModelRelease, [SUModelRef], SUResult)
  attach_function(:SUModelSaveToFile, [SUModelRef, :string], SUResult)
  attach_function(:SUModelSaveToFileWithVersion, [SUModelRef, :string, SUModelVersion], SUResult)
  attach_function(:SUModelSetName, [SUModelRef, :string], SUResult)
  attach_function(:SUModelGetRenderingOptions, [SUModelRef, SURenderingOptionsRef], SUResult)

end
