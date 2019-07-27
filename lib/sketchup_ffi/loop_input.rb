
module SketchupFFI

  attach_function(:SULoopInputCreate, [SULoopInputRef], SUResult)
  attach_function(:SULoopInputRelease, [SULoopInputRef], SUResult)
  attach_function(:SULoopInputAddVertexIndex, [SULoopInputRef, :size_t], SUResult)
  attach_function(:SULoopInputEdgeSetHidden, [SULoopInputRef, :size_t, :bool], SUResult)
  attach_function(:SULoopInputEdgeSetSoft, [SULoopInputRef, :size_t, :bool], SUResult)
  attach_function(:SULoopInputEdgeSetSmooth, [SULoopInputRef, :size_t, :bool], SUResult)
  attach_function(:SULoopInputEdgeSetMaterial, [SULoopInputRef, :size_t, SUMaterialRef], SUResult)
  attach_function(:SULoopInputEdgeSetLayer, [SULoopInputRef, :size_t, SULayerRef], SUResult)
  attach_function(:SULoopInputAddCurve, [SULoopInputRef, :size_t, :size_t], SUResult)
  attach_function(:SULoopInputIsClosed, [SULoopInputRef, :bool_ptr], SUResult)

end
