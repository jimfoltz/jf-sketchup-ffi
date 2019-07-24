module SketchupFFI
  attach_function(:SUBoundingBox3DGetMidPoint, [SUBoundingBox3d, SUPoint3d], SUResult)
end
