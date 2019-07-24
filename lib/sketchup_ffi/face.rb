# face.rb
module SketchupFFI

  attach_function(:SUFaceCreate, [SUFaceRef, :pointer, SULoopInputRef], SUResult)
  attach_function(:SUFaceCreateSimple, [SUFaceRef, :pointer, :size_t], SUResult)
  attach_function(:SUFaceRelease, [SUFaceRef], SUResult)

end
