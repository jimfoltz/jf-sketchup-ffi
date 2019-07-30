
module SketchupFFI

  attach_function(:SUClassificationInfoRelease, [SUClassificationInfoRef], SUResult)
  attach_function(:SUClassificationInfoGetNumSchemas, [SUClassificationInfoRef, :size_ptr], SUResult)
  attach_function(:SUClassificationInfoGetSchemaName, [SUClassificationInfoRef, :size_t, SUStringRef], SUResult)
  attach_function(:SUClassificationInfoGetSchemaType, [SUClassificationInfoRef, :size_t, SUStringRef], SUResult)
  attach_function(:SUClassificationInfoGetSchemaAttribute, [SUClassificationInfoRef, :size_t, SUClassificationAttributeRef], SUResult)
  attach_function(:SUClassificationInfoGetSchemaAttributeByPath, [SUClassificationInfoRef, SUStringRef, SUClassificationAttributeRef], SUResult)

end
