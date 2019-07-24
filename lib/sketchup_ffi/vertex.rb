
module SketchupFFI

  attach_function(:SUVertexGetNumEdges, [SUVertexRef, :int_ptr], SUResult)

end
