
module SketchupFFI

  attach_function(:SUEdgeUseToEntity, [SUEdgeUseRef], SUEntityRef)
  attach_function(:SUEdgeUseFromEntity, [SUEntityRef], SUEdgeUseRef)
  attach_function(:SUEdgeUseGetEdge, [SUEdgeUseRef, SUEdgeRef], SUResult)
  attach_function(:SUEdgeUseGetLoop, [SUEdgeUseRef, SULoopRef], SUResult)
  attach_function(:SUEdgeUseGetFace, [SUEdgeUseRef, SUFaceRef], SUResult)
  attach_function(:SUEdgeUseGetNumPartners, [SUEdgeUseRef, :size_ptr], SUResult)
  attach_function(:SUEdgeUseGetPartners, [SUEdgeUseRef, :size_t, SUEdgeUseRef, :size_ptr], SUResult)
  attach_function(:SUEdgeUseIsReversed, [SUEdgeUseRef, :bool_ptr], SUResult)
  attach_function(:SUEdgeUseGetPrevious, [SUEdgeUseRef, SUEdgeUseRef], SUResult)
  attach_function(:SUEdgeUseGetNext, [SUEdgeUseRef, SUEdgeUseRef], SUResult)
  attach_function(:SUEdgeUseGetStartVertex, [SUEdgeUseRef, SUVertexRef], SUResult)
  attach_function(:SUEdgeUseGetEndVertex, [SUEdgeUseRef, SUVertexRef], SUResult)
  attach_function(:SUEdgeUseGetStartVertexNormal, [SUEdgeUseRef, SUVector3d], SUResult)
  attach_function(:SUEdgeUseGetEndVertexNormal, [SUEdgeUseRef, SUVector3d], SUResult)

end
