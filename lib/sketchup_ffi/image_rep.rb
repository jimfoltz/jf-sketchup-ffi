
module SketchupFFI

  class SUColorOrder < FFI::Struct
    layout(
      :red_index, :short,
      :blue_index, :short,
      :green_index, :short,
      :alpha_index, :short
    )
  end

  attach_function(:SUGetColorOrder, [], SUColorOrder)
  attach_function(:SUImageRepCreate, [SUImageRepRef], SUResult)
  attach_function(:SUImageRepRelease, [SUImageRepRef], SUResult)
  attach_function(:SUImageRepCopy, [SUImageRepRef, SUImageRepRef], SUResult)
  attach_function(:SUImageRepSetData, [SUImageRepRef, :size_t, :size_t, :size_t, :size_t, :subyte], SUResult)
  attach_function(:SUImageRepLoadFile, [SUImageRepRef, :string], SUResult)
  attach_function(:SUImageRepSaveToFile, [SUImageRepRef, :string], SUResult)
  attach_function(:SUImageRepGetPixelDimensions, [SUImageRepRef, :size_ptr, :size_ptr], SUResult)
  attach_function(:SUImageRepGetRowPadding, [SUImageRepRef, :size_ptr], SUResult)
  attach_function(:SUImageRepResize, [SUImageRepRef, :size_t, :size_t], SUResult)
  attach_function(:SUImageRepConvertTo32BitsPerPixel, [SUImageRepRef], SUResult)
  attach_function(:SUImageRepGetDataSize, [SUImageRepRef, :size_ptr, :size_ptr], SUResult)
  attach_function(:SUImageRepGetData, [SUImageRepRef, :size_t, :uchar], SUResult)
  attach_function(:SUImageRepGetDataAsColors, [SUImageRepRef, SUColor], SUResult)
  attach_function(:SUImageRepGetColorAtUV, [SUImageRepRef, :double, :double, :bool, SUColor], SUResult)

end
