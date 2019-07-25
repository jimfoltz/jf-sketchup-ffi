module SketchupFFI

  class SUBoundingBox3d < FFI::Struct
    layout :min_point, SUPoint3d, :max_point, SUPoint3d
  end

  attach_function(:SUBoundingBox3DGetMidPoint, [SUBoundingBox3d, SUPoint3d], SUResult)

end
