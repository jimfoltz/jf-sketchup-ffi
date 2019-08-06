# model.rb
module SketchupFFI

  SUModelVersion = enum(
    :SUModelVersion_SU3,
    :SUModelVersion_SU4,
    :SUModelVersion_SU5,
    :SUModelVersion_SU6,
    :SUModelVersion_SU7,
    :SUModelVersion_SU8,
    :SUModelVersion_SU2013,
    :SUModelVersion_SU2014,
    :SUModelVersion_SU2015,
    :SUModelVersion_SU2016,
    :SUModelVersion_SU2017,
    :SUModelVersion_SU2018,
    :SUModelVersion_SU2019
  )
  SUModelUnits = enum(
    :Inches,
    :Feet,
    :Millimeters,
    :Centimeters,
    :Meters
  )

  class SUModelStatistics < FFI::Struct
  end

  attach_function(:SUModelCreate, [SUModelRef], SUResult)
  attach_function(:SUModelCreateFromFile, [SUModelRef, :string], SUResult)
  attach_function(:SUModelRelease, [SUModelRef], SUResult)
  attach_function(:SUModelCreateFromBuffer, [SUModelRef, :string, :size_t], SUResult)

  attach_function(:SUModelGetEntities, [SUModelRef, SUEntitiesRef], SUResult)

  attach_function(:SUModelGetNumMaterials, [SUModelRef, :int_ptr], SUResult)
  attach_function(:SUModelGetMaterials, [SUModelRef, :size_t, SUMaterialRef, :size_ptr], SUResult)
  attach_function(:SUModelAddMaterials, [SUModelRef, :size_t, SUMaterialRef], SUResult)

  attach_function(:SUModelGetNumComponentDefinitions, [SUModelRef, :size_ptr], SUResult)
  attach_function(:SUModelGetComponentDefinitions, [SUModelRef, :size_t, SUComponentDefinitionRef, :size_ptr], SUResult)

  attach_function(:SUModelGetNumGroupDefinitions, [SUModelRef, :size_ptr], SUResult)
  attach_function(:SUModelGetGroupDefinitions, [SUModelRef, :size_t, SUComponentDefinitionRef, :size_ptr], SUResult)

  attach_function(:SUModelGetNumImageDefinitions, [SUModelRef, :size_ptr], SUResult)
  attach_function(:SUModelGetImageDefinitions, [SUModelRef, :size_t, SUComponentDefinitionRef, :size_ptr], SUResult)

  attach_function(:SUModelAddComponentDefinitions, [SUModelRef, :size_t, SUComponentDefinitionRef, :size_ptr], SUResult)
  attach_function(:SUModelRemoveComponentDefinitions, [SUModelRef, :size_t, SUComponentDefinitionRef], SUResult)

  attach_function(:SUModelSaveToFile, [SUModelRef, :string], SUResult)
  attach_function(:SUModelSaveToFileWithVersion, [SUModelRef, :string, SUModelVersion], SUResult)

  attach_function(:SUModelGetCamera, [SUModelRef, SUCameraRef], SUResult)
  attach_function(:SUModelSetCamera, [SUModelRef, SUCameraRef], SUResult)

  attach_function(:SUModelGetNumScenes, [SUModelRef, :size_ptr], SUResult)

  attach_function(:SUModelGetNumLayers, [SUModelRef, :size_ptr], SUResult)
  attach_function(:SUModelGetLayers, [SUModelRef, :size_ptr, SULayerRef, :size_ptr], SUResult)
  attach_function(:SUModelAddLayers, [SUModelRef, :size_ptr, SULayerRef], SUResult)
  attach_function(:SUModelGetDefaultLayer, [SUModelRef, SULayerRef], SUResult)
  attach_function(:SUModelRemoveLayers, [SUModelRef, :size_t, SULayerRef], SUResult)

  attach_function(:SUModelGetVersion, [SUModelRef, :int_ptr, :int_ptr, :int_ptr], SUResult)

  attach_function(:SUModelGetNumAttributeDictionaries, [SUModelRef, :int_ptr], SUResult)
  attach_function(:SUModelGetAttributeDictionaries, [SUModelRef, :size_t, :pointer, :pointer], SUResult)
  attach_function(:SUModelGetAttributeDictionary, [SUModelRef, :string, SUAttributeDictionaryRef], SUResult)

  attach_function(:SUModelIsGeoReferenced, [SUModelRef, :bool_ptr], SUResult)
  attach_function(:SUModelSetGeoReference, [SUModelRef, :double, :double, :double, :bool, :bool], SUResult)
  attach_function(:SUModelGetLocation, [SUModelRef, SULocationRef], SUResult)

  attach_function(:SUModelGetStatistics, [SUModelRef, SUModelStatistics], SUResult)

  attach_function(:SUModelGetRenderingOptions, [SUModelRef, SURenderingOptionsRef], SUResult)
  attach_function(:SUModelGetShadowInfo, [SUModelRef, SUShadowInfoRef], SUResult)

  attach_function(:SUModelGetOptionsManager, [SUModelRef, SUOptionsManagerRef], SUResult)
  
  attach_function(:SUModelGetNorthCorrection, [SUModelRef, :double_ptr], SUResult)

  attach_function(:SUModelMergeCoplanarFaces, [SUModelRef], SUResult)

  attach_function(:SUModelGetScenes, [SUModelRef, :size_t, SUSceneRef, :size_ptr], SUResult)
  attach_function(:SUModelGetSceneWithName, [SUModelRef, :string, SUSceneRef], SUResult)
  attach_function(:SUModelAddScenes, [SUModelRef, :size_t, SUSceneRef], SUResult)
  attach_function(:SUModelAddScene, [SUModelRef, :int, SUSceneRef, :int_ptr], SUResult)
  attach_function(:SUModelGetActiveScene, [SUModelRef, SUSceneRef], SUResult)
  attach_function(:SUModelSetActiveScene, [SUModelRef, SUSceneRef], SUResult)
  attach_function(:SUModelAddMatchPhotoScene, [SUModelRef, :string, SUCameraRef, :string, SUSceneRef], SUResult)

  attach_function(:SUModelGetName, [SUModelRef, SUStringRef], SUResult)
  attach_function(:SUModelSetName, [SUModelRef, :string], SUResult)

  attach_function(:SUModelGetPath, [SUModelRef, SUStringRef], SUResult)
  attach_function(:SUModelGetTitle, [SUModelRef, SUStringRef], SUResult)
  attach_function(:SUModelGetDescription, [SUModelRef, SUStringRef], SUResult)
  attach_function(:SUModelSetDescription, [SUModelRef, :string], SUResult)
  attach_function(:SUModelGetUnits, [SUModelRef, SUModelUnits], SUResult)
  attach_function(:SUModelGetClassifications, [SUModelRef, SUClassificationsRef], SUResult)
  attach_function(:SUModelGetAxes, [SUModelRef, :pointer], SUResult)
  attach_function(:SUModelGetStyles, [SUModelRef, SUStylesRef], SUResult)
  attach_function(:SUModelGetInstancePathByPid, [SUModelRef, SUStringRef, SUInstancePathRef], SUResult)
  attach_function(:SUModelGetNumFonts, [SUModelRef, :size_ptr], SUResult)
  attach_function(:SUModelGetFonts, [SUModelRef, :size_t, SUFontRef, :size_ptr], SUResult)
  attach_function(:SUModelGetDimensionStyle, [SUModelRef, SUDimensionStyleRef], SUResult)
  attach_function(:SUModelGetLengthFormatter, [SUModelRef, SULengthFormatterRef], SUResult)
  attach_function(:SUModelGenerateUniqueMaterialName, [SUModelRef, :string, SUStringRef], SUResult)
  attach_function(:SUModelFixErrors, [SUModelRef], SUResult)
  attach_function(:SUModelOrientFacesConsistently, [SUModelRef, :bool], SUResult)
  attach_function(:SUModelGetLineStyles, [SUModelRef, SULineStyleRef], SUResult)
  attach_function(:SUModelLoadDefinition, [SUModelRef, :string, SUComponentDefinitionRef], SUResult)
  attach_function(:SUModelRemoveMaterials, [SUModelRef, :size_t, SUMaterialRef], SUResult)
  attach_function(:SUModelRemoveScenes, [SUModelRef, :size_t, SUSceneRef], SUResult)
  attach_function(:SUModelGetNumAllMaterials, [SUModelRef, :size_ptr], SUResult)
  attach_function(:SUModelGetAllMaterials, [SUModelRef, :size_t, SUMaterialRef, :size_ptr], SUResult)
  attach_function(:SUModelGetGuid, [SUModelRef, SUStringRef], SUResult)

end
