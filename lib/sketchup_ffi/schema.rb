module SketchupFFI
  attach_function(:SUSchemaGetSchemaType, [SUSchemaRef, :string, SUSchemaTypeRef], SUResult)
end
