module SketchupFFI
  attach_function(:SUClassificationAttributeGetValue, [SUClassificationAttributeRef, SUTypedValueRef], SUResult)
  attach_function(:SUClassificationAttributeGetPath, [SUClassificationAttributeRef, SUStringRef], SUResult)
  attach_function(:SUClassificationAttributeGetNumChildren, [SUClassificationAttributeRef, :size_ptr], SUResult)
  attach_function(:SUClassificationAttributeGetChild, [SUClassificationAttributeRef, :size_t, SUClassificationAttributeRef], SUResult)
end
