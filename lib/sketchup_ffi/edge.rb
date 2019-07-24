module SketchupFFI

  attach_function(:SUEdgeCreate, [SUEdgeRef, SUPoint3d, SUPoint3d], SUResult)
  attach_function(:SUEdgeToDrawingElement, [SUEdgeRef], SUDrawingElementRef)
  attach_function(:SUEdgeGetStartVertex, [SUEdgeRef, SUVertexRef], SUResult)
  attach_function(:SUEdgeSetColor, [SUEdgeRef, SUColor], SUResult)

end
