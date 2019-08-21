module SketchupFFI

  SULoopWinding = enum(
    :CCW,
    :CW
  )

  attach_function(:SULoopToEntity, [SULoopRef], SUEntityRef)
  attach_function(:SULoopFromEntity, [SUEntityRef], SULoopRef)
  attach_function(:SULoopGetNumVertices, [SULoopRef, :size_ptr], SUResult)
  attach_function(:SULoopGetVertices, [SULoopRef, :size_t, SUVertexRef, :size_ptr], SUResult)
  attach_function(:SULoopGetEdges, [SULoopRef, :size_t, SUEdgeRef, :size_ptr], SUResult)
  attach_function(:SULoopGetWinding, [SULoopRef, SUVector3d, SULoopWinding], SUResult)
  attach_function(:SULoopIsEdgeReversed, [SULoopRef, SUEdgeRef, :bool_ptr], SUResult)
  attach_function(:SULoopGetFace, [SULoopRef, SUFaceRef], SUResult)
  attach_function(:SULoopIsConvex, [SULoopRef, :bool_ptr], SUResult)
  attach_function(:SULoopIsOuterLoop, [SULoopRef, :bool_ptr], SUResult)
  attach_function(:SULoopGetEdgeUses, [SULoopRef, :size_t, SUEdgeUseRef, :size_ptr], SUResult)
end
