
module SketchupFFI

  attach_function(:SUStringCreate, [SUStringRef], SUResult)
  attach_function(:SUStringGetUTF8, [SUStringRef, :size_t, :pointer, :pointer], SUResult)
  attach_function(:SUStringGetUTF8Length, [SUStringRef, :pointer], SUResult)
  attach_function(:SUStringRelease, [SUStringRef], SUResult)

end
