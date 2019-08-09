require_relative "geometry"

module SketchupFFI
  attach_function(:SURay3DIsOn, [SURay3d, SUPoint3d, :bool_ptr], SUResult)
  attach_function(:SURay3DDistanceTo, [SURay3d, SUPoint3d, :double_ptr], SUResult)
  attach_function(:SURay3DProjectTo, [SURay3d, SUPoint3d, SUPoint3d], SUResult)
end
