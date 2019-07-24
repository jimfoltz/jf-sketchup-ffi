# entities.rb
module SketchupFFI

  attach_function(:SUEntitiesAddEdges, [SUEntitiesRef, :size_t, :pointer], SUResult)
  attach_function(:SUEntitiesAddFaces, [SUEntitiesRef, :size_t, :pointer], SUResult)
  attach_function(:SUEntitiesAddGuidePoints, [SUEntitiesRef, :size_t, :pointer], SUResult)

end
