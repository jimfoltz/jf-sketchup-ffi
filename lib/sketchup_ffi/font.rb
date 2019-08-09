module SketchupFFI
  attach_function(:SUFontToEntity, [SUFontRef], SUEntityRef)
  attach_function(:SUFontFromEntity, [SUEntityRef], SUFontRef)
  attach_function(:SUFontGetFaceName, [SUFontRef, SUStringRef], SUResult)
  attach_function(:SUFontGetPointSize, [SUFontRef, :size_ptr], SUResult)
  attach_function(:SUFontGetBold, [SUFontRef, :bool_ptr], SUResult)
  attach_function(:SUFontGetItalic, [SUFontRef, :bool_ptr], SUResult)
  attach_function(:SUFontGetUseWorldSize, [SUFontRef, :bool_ptr], SUResult)
  attach_function(:SUFontGetWorldSize, [SUFontRef, :double_ptr], SUResult)
end
