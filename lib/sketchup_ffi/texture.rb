module SketchupFFI
  attach_function(:SUTextureToEntity, [SUTextureRef], SUEntityRef)
  attach_function(:SUTextureFromEntity, [SUEntityRef], SUTextureRef)
  attach_function(:SUTextureCreateFromImageData, [SUTextureRef, :size_t, :size_t, :size_t, :subyte], SUResult)
  attach_function(:SUTextureCreateFromImageRep, [SUTextureRef, SUImageRepRef], SUResult)
  attach_function(:SUTextureCreateFromFile, [SUTextureRef, :string, :double, :double], SUResult)
  attach_function(:SUTextureRelease, [SUTextureRef], SUResult)
  attach_function(:SUTextureGetDimensions, [SUTextureRef, :size_ptr, :size_ptr, :double_ptr, :double_ptr], SUResult)
  attach_function(:SUTextureGetImageDataSize, [SUTextureRef, :size_ptr, :size_ptr], SUResult)
  attach_function(:SUTextureGetImageData, [SUTextureRef, :size_t, :subyte], SUResult)
  attach_function(:SUTextureGetImageRep, [SUTextureRef, SUImageRepRef], SUResult)
  attach_function(:SUTextureWriteToFile, [SUTextureRef, :string], SUResult)
  attach_function(:SUTextureSetFileName, [SUTextureRef, :string], SUResult)
  attach_function(:SUTextureGetFileName, [SUTextureRef, SUStringRef], SUResult)
  attach_function(:SUTextureGetUseAlphaChannel, [SUTextureRef, :bool_ptr], SUResult)
  attach_function(:SUTextureGetAverageColor, [SUTextureRef, SUColor], SUResult)
  attach_function(:SUTextureGetColorizedImageRep, [SUTextureRef, SUImageRepRef], SUResult)
  attach_function(:SUTextureWriteOriginalToFile, [SUTextureRef, :string], SUResult)
end
