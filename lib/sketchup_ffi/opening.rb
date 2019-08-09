module SketchupFFI
  attach_function(:SUOpeningGetNumPoints, [SUOpeningRef, :size_ptr], SUResult)
  attach_function(:SUOpeningGetPoints, [SUOpeningRef, :size_t, SUPoint3d, :size_ptr], SUResult)
  attach_function(:SUOpeningRelease, [SUOpeningRef], SUResult)
end
