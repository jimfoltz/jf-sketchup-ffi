module SketchupFFI

  attach_function(:SUTextureWriterCreate, [SUTextureWriterRef], SUResult)
  attach_function(:SUTextureWriterRelease, [SUTextureWriterRef], SUResult)
  attach_function(:SUTextureWriterLoadEntity, [SUTextureWriterRef, SUEntityRef, :long_ptr], SUResult)
  attach_function(:SUTextureWriterLoadFace, [SUTextureWriterRef, SUFaceRef, :long_ptr, :long_ptr], SUResult)
  attach_function(:SUTextureWriterGetNumTextures, [SUTextureWriterRef, :size_ptr], SUResult)
  attach_function(:SUTextureWriterWriteTexture, [SUTextureWriterRef, :long, :string, :bool], SUResult)
  attach_function(:SUTextureWriterGetImageRep, [SUTextureWriterRef, :long, SUImageRepRef], SUResult)
  attach_function(:SUTextureWriterWriteAllTextures, [SUTextureWriterRef, :string], SUResult)
  attach_function(:SUTextureWriterIsTextureAffine, [SUTextureWriterRef, :long, :bool_ptr], SUResult)
  attach_function(:SUTextureWriterGetTextureFilePath, [SUTextureWriterRef, :long, SUStringRef], SUResult)
  attach_function(:SUTextureWriterGetFrontFaceUVCoords, [SUTextureWriterRef, SUFaceRef, :size_t, SUPoint3d, SUPoint2d], SUResult)
  attach_function(:SUTextureWriterGetBackFaceUVCoords, [SUTextureWriterRef, SUFaceRef, :size_t, SUPoint3d, SUPoint2d], SUResult)
  attach_function(:SUTextureWriterGetTextureIdForEntity, [SUTextureWriterRef, SUEntityRef, :long_ptr], SUResult)
  attach_function(:SUTextureWriterGetTextureIdForFace, [SUTextureWriterRef, SUFaceRef, :bool, :long_ptr], SUResult)

end