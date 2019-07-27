# edge.rb
module SketchupFFI

  attach_function(:SUEdgeToEntity, [SUEdgeRef], SUEntityRef)
  attach_function(:SUEdgeFromEntity, [SUEntityRef], SUEdgeRef)
  attach_function(:SUEdgeToDrawingElement, [SUEdgeRef], SUDrawingElementRef)
  attach_function(:SUEdgeFromDrawingElement, [SUDrawingElementRef], SUEdgeRef)
  attach_function(:SUEdgeCreate, [SUEdgeRef, SUPoint3d, SUPoint3d], SUResult)
  attach_function(:SUEdgeRelease, [SUEdgeRef], SUResult)
  attach_function(:SUEdgeGetCurve, [SUEdgeRef, SUCurveRef], SUResult)
  attach_function(:SUEdgeGetStartVertex, [SUEdgeRef, SUVertexRef], SUResult)
  attach_function(:SUEdgeGetEndVertex, [SUEdgeRef, SUVertexRef], SUResult)
  attach_function(:SUEdgeSetSoft, [SUEdgeRef, :bool], SUResult)
  attach_function(:SUEdgeGetSoft, [SUEdgeRef, :bool_ptr], SUResult)
  attach_function(:SUEdgeSetSmooth, [SUEdgeRef, :bool], SUResult)
  attach_function(:SUEdgeGetSmooth, [SUEdgeRef, :bool_ptr], SUResult)
  attach_function(:SUEdgeGetNumFaces, [SUEdgeRef, :size_ptr], SUResult)
  attach_function(:SUEdgeGetFaces, [SUEdgeRef, :size_ptr, SUFaceRef, :size_ptr], SUResult)
  attach_function(:SUEdgeGetColor, [SUEdgeRef, SUColor], SUResult)
  attach_function(:SUEdgeSetColor, [SUEdgeRef, SUColor], SUResult)
  attach_function(:SUEdgeGetLengthWithTransform, [SUEdgeRef, SUTransformation, :double_ptr], SUResult)

end
