module SketchupFFI

  class SUUVQ < FFI::Struct
    layout :u, :double,
      :v, :double,
      :q, :double
  end

  attach_function(:SUUVHelperRelease, [SUUVHelperRef], SUResult)
  attach_function(:SUUVHelperGetFrontUVQ, [SUUVHelperRef, SUPoint3d, SUUVQ], SUResult)
  attach_function(:SUUVHelperGetBackUVQ, [SUUVHelperRef, SUPoint3d, SUUVQ], SUResult)

end
