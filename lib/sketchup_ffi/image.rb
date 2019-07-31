module SketchupFFI

  attach_function(:SUImageToEntity, [SUImageRef], SUEntityRef)
  attach_function(:SUImageFromEntity, [SUEntityRef], SUImageRef)
  attach_function(:SUImageToDrawingElement, [SUImageRef], SUDrawingElementRef)
  attach_function(:SUImageFromDrawingElement, [SUDrawingElementRef], SUImageRef)
  attach_function(:SUImageCreateFromFile, [SUImageRef, :string], SUResult)
  attach_function(:SUImageCreateFromImageRep, [SUImageRef, SUImageRepRef], SUResult)
  attach_function(:SUImageGetImageRep, [SUImageRef, SUImageRepRef], SUResult)
  attach_function(:SUImageGetName, [SUImageRef, SUStringRef], SUResult)
  attach_function(:SUImageSetName, [SUImageRef, :string], SUResult)
  attach_function(:SUImageGetTransform, [SUImageRef, SUTransformation], SUResult)
  attach_function(:SUImageSetTransform, [SUImageRef, SUTransformation], SUResult)
  attach_function(:SUImageGetFileName, [SUImageRef, SUStringRef], SUResult)
  attach_function(:SUImageGetDimensions, [SUImageRef, :double_ptr, :double_ptr], SUResult)
  attach_function(:SUImageGetPixelDimensions, [SUImageRef, :size_ptr, :size_ptr], SUResult)
  attach_function(:SUImageGetDataSize, [SUImageRef, :size_ptr, :size_ptr], SUResult)
  # TODO input buffer or something?
  #attach_function(:SUImageGetData, [SUImageRef, :size_t, :uchar], SUResult)

end
