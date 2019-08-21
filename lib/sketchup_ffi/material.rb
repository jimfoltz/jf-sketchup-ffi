module SketchupFFI

  SUMaterialType = enum(
    :Colored,
    :Textured,
    :ColorizedTexture
  )
  SUMaterialOwnerType = enum(
    :None, :DrawingElement, :Image, :Layer
  )
  SUMaterialColorizeType = enum(
    :Shift, :Tint
  )

  attach_function(:SUMaterialToEntity, [SUMaterialRef], SUEntityRef)
  attach_function(:SUMaterialFromEntity, [SUEntityRef], SUMaterialRef)
  attach_function(:SUMaterialCreate, [SUMaterialRef], SUResult)
  attach_function(:SUMaterialRelease, [SUMaterialRef], SUResult)
  attach_function(:SUMaterialSetName, [SUMaterialRef, :string], SUResult)
  attach_function(:SUMaterialGetName, [SUMaterialRef, SUStringRef], SUResult)
  attach_function(:SUMaterialGetNameLegacyBehavior, [SUMaterialRef, SUStringRef], SUResult)
  attach_function(:SUMaterialSetColor, [SUMaterialRef, SUColor], SUResult)
  attach_function(:SUMaterialGetColor, [SUMaterialRef, SUColor], SUResult)
  attach_function(:SUMaterialSetTexture, [SUMaterialRef, SUTextureRef], SUResult)
  attach_function(:SUMaterialGetTexture, [SUMaterialRef, SUTextureRef], SUResult)
  attach_function(:SUMaterialGetOpacity, [SUMaterialRef, :double_ptr], SUResult)
  attach_function(:SUMaterialSetOpacity, [SUMaterialRef, :double], SUResult)
  attach_function(:SUMaterialGetUseOpacity, [SUMaterialRef, :bool_ptr], SUResult)
  attach_function(:SUMaterialSetUseOpacity, [SUMaterialRef, :bool], SUResult)
  attach_function(:SUMaterialSetType, [SUMaterialRef, SUMaterialType], SUResult)
  attach_function(:SUMaterialGetType, [SUMaterialRef, SUMaterialType], SUResult)
  attach_function(:SUMaterialIsDrawnTransparent, [SUMaterialRef, :bool_ptr], SUResult)
  attach_function(:SUMaterialGetOwnerType, [SUMaterialRef, SUMaterialOwnerType], SUResult)
  attach_function(:SUMaterialSetColorizeType, [SUMaterialRef, SUMaterialColorizeType], SUResult)
  attach_function(:SUMaterialGetColorizeType, [SUMaterialRef, SUMaterialColorizeType], SUResult)
  attach_function(:SUMaterialGetColorizeDeltas, [SUMaterialRef, :double_ptr, :double_ptr, :double_ptr], SUResult)
end
