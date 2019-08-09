module SketchupFFI
  attach_function(:SUClassificationsLoadSchema, [SUClassificationsRef, :string], SUResult)
  attach_function(:SUClassificationsGetSchema, [SUClassificationsRef, :string, SUSchemaRef], SUResult)
end
