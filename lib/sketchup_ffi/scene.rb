module SketchupFFI

  FLAG_USE_CAMERA            = 0x0001
  FLAG_USE_RENDERING_OPTIONS = 0x0002
  FLAG_USE_SHADOWINFO        = 0x0004
  FLAG_USE_AXES              = 0x0008
  FLAG_USE_HIDDEN            = 0x0010
  FLAG_USE_LAYER_VISIBILITY  = 0x0020
  FLAG_USE_SECTION_PLANES    = 0x0040
  FLAG_USE_ALL               = 0x0fff
  FLAG_NO_CAMERA             = 0x0ffe

  attach_function(:SUSceneToEntity, [SUSceneRef], SUEntityRef)
  attach_function(:SUSceneFromEntity, [SUEntityRef], SUSceneRef)
  attach_function(:SUSceneCreate, [SUSceneRef], SUResult)
  attach_function(:SUSceneRelease, [SUSceneRef], SUResult)
  attach_function(:SUSceneGetUseCamera, [SUSceneRef, :bool_ptr], SUResult)
  attach_function(:SUSceneSetUseCamera, [SUSceneRef, :bool], SUResult)
  attach_function(:SUSceneGetCamera, [SUSceneRef, SUCameraRef], SUResult)
  attach_function(:SUSceneSetCamera, [SUSceneRef, SUCameraRef], SUResult)
  attach_function(:SUSceneGetIncludeInAnimation, [SUSceneRef, :bool_ptr], SUResult)
  attach_function(:SUSceneSetIncludeInAnimation, [SUSceneRef, :bool], SUResult)
  attach_function(:SUSceneGetName, [SUSceneRef, SUStringRef], SUResult)
  attach_function(:SUSceneSetName, [SUSceneRef, :string], SUResult)
  attach_function(:SUSceneGetRenderingOptions, [SUSceneRef, SURenderingOptionsRef], SUResult)
  attach_function(:SUSceneGetShadowInfo, [SUSceneRef, SUShadowInfoRef], SUResult)
  attach_function(:SUSceneGetUseShadowInfo, [SUSceneRef, :bool_ptr], SUResult)
  attach_function(:SUSceneSetUseShadowInfo, [SUSceneRef, :bool], SUResult)
  attach_function(:SUSceneGetUseRenderingOptions, [SUSceneRef, :bool_ptr], SUResult)
  attach_function(:SUSceneSetUseRenderingOptions, [SUSceneRef, :bool], SUResult)
  attach_function(:SUSceneGetUseHidden, [SUSceneRef, :bool_ptr], SUResult)
  attach_function(:SUSceneSetUseHidden, [SUSceneRef, :bool], SUResult)
  attach_function(:SUSceneGetUseHiddenLayers, [SUSceneRef, :bool_ptr], SUResult)
  attach_function(:SUSceneSetUseHiddenLayers, [SUSceneRef, :bool], SUResult)
  attach_function(:SUSceneGetUseSectionPlanes, [SUSceneRef, :bool_ptr], SUResult)
  attach_function(:SUSceneSetUseSectionPlanes, [SUSceneRef, :bool], SUResult)
  attach_function(:SUSceneGetNumLayers, [SUSceneRef, :size_ptr], SUResult)
  attach_function(:SUSceneGetLayers, [SUSceneRef, :size_t, SULayerRef, :size_ptr], SUResult)
  attach_function(:SUSceneAddLayer, [SUSceneRef, SULayerRef], SUResult)
  attach_function(:SUSceneRemoveLayer, [SUSceneRef, SULayerRef], SUResult)
  attach_function(:SUSceneClearLayers, [SUSceneRef], SUResult)
  attach_function(:SUSceneGetAxes, [SUSceneRef, SUAxesRef], SUResult)
  attach_function(:SUSceneSetUseAxes, [SUSceneRef, :bool], SUResult)
  attach_function(:SUSceneGetUseAxes, [SUSceneRef, :bool_ptr], SUResult)
  attach_function(:SUSceneGetNumHiddenEntities, [SUSceneRef, :size_ptr], SUResult)
  attach_function(:SUSceneGetHiddenEntities, [SUSceneRef, :size_t, SUEntityRef, :size_ptr], SUResult)
  attach_function(:SUSceneSetFlags, [SUSceneRef, :uint32], SUResult)
  attach_function(:SUSceneGetFlags, [SUSceneRef, :uint32_ptr], SUResult)
  attach_function(:SUSceneSetSketchAxesDisplayed, [SUSceneRef, :bool], SUResult)
  attach_function(:SUSceneGetSketchAxesDisplayed, [SUSceneRef, :bool_ptr], SUResult)
  attach_function(:SUSceneGetPhotoMatchImageDisplayed, [SUSceneRef, :bool_ptr], SUResult)
  attach_function(:SUSceneClearPhotoMatchImage, [SUSceneRef], SUResult)
  attach_function(:SUSceneGetStyle, [SUSceneRef, SUStyleRef], SUResult)
  attach_function(:SUSceneCopy, [SUSceneRef, SUSceneRef], SUResult)
  attach_function(:SUSceneActivate, [SUSceneRef], SUResult)
end
