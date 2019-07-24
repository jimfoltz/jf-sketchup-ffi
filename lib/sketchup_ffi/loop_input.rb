
module SketchupFFI

  attach_function(:SULoopInputAddVertexIndex, [SULoopInputRef, :size_t], SUResult)
  attach_function(:SULoopInputCreate, [SULoopInputRef], SUResult)

end
