

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

  attach_function(:SUPoint3DDistanceToSUPoint3D, [SUPoint3d, SUPoint3d, :double_ptr], SUResult)

  # TODO
  #SU_RESULT SUPoint3DGetEqual(const struct SUPoint3D* point1,
  #SU_RESULT SUPoint3DLessThan(const struct SUPoint3D* point1,
  #SU_RESULT SUPoint3DOffset(const struct SUPoint3D* point1,
  #SU_RESULT SUPoint3DTransform(const struct SUTransformation* transform,

end
