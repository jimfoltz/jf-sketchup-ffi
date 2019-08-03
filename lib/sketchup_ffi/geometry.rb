
module SketchupFFI

  class SUPoint3d < FFI::Struct
    layout :x, :double, :y, :double, :z, :double
    def self.create(x = 0, y = 0, z = 0)
      pt = new
      pt[:x] = x
      pt[:y] = y
      pt[:z] = z
      pt
    end
  end

  class SUVector3d < FFI::Struct
    layout :x, :double, :y, :double, :z, :double
    def self.create(x = 0, y = 0, z = 0)
      vector = new
      vector[:x] = x
      vector[:y] = y
      vector[:z] = z
      vector
    end
  end

  class SUBoundingBox3d < FFI::Struct
    layout :min_point, SUPoint3d, :max_point, SUPoint3d
  end

  class SUPlane3d < FFI::Struct
    layout :a, :double,
      :b, :double,
      :c, :double,
      :d, :double
  end

  class SUPoint2d < FFI::Struct
    layout :x, :double, :y, :double
  end

  class SUVector2d < FFI::Struct
    layout :x, :double, :y, :double
  end

  class SUTransformation2d < FFI::Struct
    layout :m11, :double,
      :m12, :double,
      :m21, :double,
      :m22, :double,
      :tx, :double,
      :ty, :double
  end

  class SURay3d < FFI::Struct
    layout :point, SUPoint3d, :normal, SUVector3d
  end

end
