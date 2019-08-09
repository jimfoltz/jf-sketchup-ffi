
module SketchupFFI
  attach_function(:SUVertexToEntity, [SUVertexRef], SUEntityRef)
  attach_function(:SUVertexFromEntity, [SUEntityRef], SUVertexRef)
  attach_function(:SUVertexGetPosition, [SUVertexRef, SUPoint3d], SUResult)
  attach_function(:SUVertexSetPosition, [SUVertexRef, SUPoint3d], SUResult)
  attach_function(:SUVertexGetNumEdges, [SUVertexRef, :int_ptr], SUResult)
  attach_function(:SUVertexGetEdges, [SUVertexRef, :size_t, SUEdgeRef, :size_ptr], SUResult)
  attach_function(:SUVertexGetNumFaces, [SUVertexRef, :size_ptr], SUResult)
  attach_function(:SUVertexGetFaces, [SUVertexRef, :size_t, SUFaceRef, :size_ptr], SUResult)
  attach_function(:SUVertexGetNumLoops, [SUVertexRef, :size_ptr], SUResult)
  attach_function(:SUVertexGetLoops, [SUVertexRef, :size_t, SULoopRef, :size_ptr], SUResult)
end
