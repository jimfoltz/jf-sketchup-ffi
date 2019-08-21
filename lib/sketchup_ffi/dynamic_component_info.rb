module SketchupFFI

  attach_function(:SUDynamicComponentInfoRelease, [SUDynamicComponentInfoRef], SUResult)
  attach_function(:SUDynamicComponentInfoGetNumDCAttributes, [SUDynamicComponentInfoRef, :size_ptr], SUResult)
  attach_function(:SUDynamicComponentInfoGetDCAttributes, [SUDynamicComponentInfoRef, :size_t, SUDynamicComponentAttributeRef, :size_ptr], SUResult)

end
