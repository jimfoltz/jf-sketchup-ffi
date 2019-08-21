module SketchupFFI

  SUCurveType = enum(
    :Simple,
    :Arc
  )

  attach_function(:SUCurveToEntity, [SUCurveRef], SUEntityRef)
  attach_function(:SUCurveFromEntity, [SUEntityRef], SUCurveRef)
  attach_function(:SUCurveCreateWithEdges, [SUCurveRef, SUEdgeRef, :size_t], SUResult)
  attach_function(:SUCurveRelease, [SUCurveRef], SUResult)
  attach_function(:SUCurveGetType, [SUCurveRef, SUCurveType], SUResult)
  attach_function(:SUCurveGetNumEdges, [SUCurveRef, :size_ptr], SUResult)
  attach_function(:SUCurveGetEdges, [SUCurveRef, :size_t, SUEdgeRef, :size_ptr], SUResult)

end
