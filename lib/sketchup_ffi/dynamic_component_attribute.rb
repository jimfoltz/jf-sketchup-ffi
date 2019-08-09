module SketchupFFI
  attach_function(:SUDynamicComponentAttributeGetName, [SUDynamicComponentAttributeRef, SUStringRef], SUResult)
  attach_function(:SUDynamicComponentAttributeGetDisplayName, [SUDynamicComponentAttributeRef, SUStringRef], SUResult)
  attach_function(:SUDynamicComponentAttributeGetVisibility, [SUDynamicComponentAttributeRef, :bool_ptr], SUResult)
  attach_function(:SUDynamicComponentAttributeGetDisplayValue, [SUDynamicComponentAttributeRef, SUStringRef], SUResult)
end
