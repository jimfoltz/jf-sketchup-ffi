module SketchupFFI

  class SUPoint2d < FFI::Struct
    layout :x, :double, :y, :double
  end

  class SUVector2d < FFI::Struct
    layout :x, :double, :y, :double
  end

end
