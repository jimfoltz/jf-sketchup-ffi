module SketchupFFI
  attach_function(:SULineStyleGetName, [SULineStyleRef, SUStringRef], SUResult)
  attach_function(:SULineStylesGetNumLineStyles, [SULineStylesRef, :size_ptr], SUResult)
  attach_function(:SULineStylesGetLineStyleNames, [SULineStylesRef, :size_t, SUStringRef, :size_ptr], SUResult)
  attach_function(:SULineStylesGetLineStyleByName, [SULineStylesRef, :string, SULineStyleRef], SUResult)
end
