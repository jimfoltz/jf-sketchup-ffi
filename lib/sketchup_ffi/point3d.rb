# point3d.rb

require_relative "geometry"

module SketchupFFI

  attach_function(:SUPoint3DDistanceToSUPoint3D, [SUPoint3d, SUPoint3d, :double_ptr], SUResult)
  attach_function(:SUPoint3DGetEqual, [SUPoint3d, SUPoint3d, :bool_ptr], SUResult)
  attach_function(:SUPoint3DLessThan, [SUPoint3d, SUPoint3d, :bool_ptr], SUResult)
  attach_function(:SUPoint3DOffset, [SUPoint3d, SUVector3d, SUPoint3d], SUResult)
  attach_function(:SUPoint3DTransform, [SUTransformation, SUPoint3d], SUResult)

end
