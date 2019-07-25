module SketchupFFI

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

end
