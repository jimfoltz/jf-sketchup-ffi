
module SketchupFFI

  attach_function(:SUStringCreate, [SUStringRef], SUResult)
  attach_function(:SUStringGetUTF8, [SUStringRef, :size_t, :pointer, :size_ptr], SUResult)
  attach_function(:SUStringGetUTF8Length, [SUStringRef, :pointer], SUResult)
  attach_function(:SUStringRelease, [SUStringRef], SUResult)
  attach_function(:SUStringCreateFromUTF8, [SUStringRef, :string], SUResult)
  attach_function(:SUStringCreateFromUTF16, [SUStringRef, :string], SUResult)
  attach_function(:SUStringGetUTF16Length, [SUStringRef, :size_ptr], SUResult)
  attach_function(:SUStringSetUTF8, [SUStringRef, :string], SUResult)
  attach_function(:SUStringSetUTF16, [SUStringRef, :string], SUResult)
  attach_function(:SUStringGetUTF16, [SUStringRef, :size_t, :pointer, :size_ptr], SUResult)
  attach_function(:SUStringTrimLeft, [SUStringRef], SUResult)
  attach_function(:SUStringTrimRight, [SUStringRef], SUResult)
  attach_function(:SUStringCompare, [SUStringRef, SUStringRef, :int_ptr], SUResult)


end
