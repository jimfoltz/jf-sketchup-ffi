module SketchupFFI
  SUDimensionType = enum(
    :Invalid,
    :linear,
    :Radial
  )

  attach_function(:SUDimensionToEntity, [SUDimensionRef], SUEntityRef)
  attach_function(:SUDimensionFromEntity, [SUEntityRef], SUDimensionRef)
  attach_function(:SUDimensionToDrawingElement, [SUDimensionRef], SUDrawingElementRef)
  attach_function(:SUDimensionFromDrawingElement, [SUDrawingElementRef], SUDimensionRef)
  attach_function(:SUDimensionGetType, [SUDimensionRef, SUDimensionType], SUResult)
  attach_function(:SUDimensionGetText, [SUDimensionRef, SUStringRef], SUResult)
  attach_function(:SUDimensionSetText, [SUDimensionRef, :string], SUResult)
  attach_function(:SUDimensionGetPlane, [SUDimensionRef, SUPlane3d], SUResult)
  attach_function(:SUDimensionGetText3D, [SUDimensionRef, :bool_ptr], SUResult)
  attach_function(:SUDimensionSetText3D, [SUDimensionRef, :bool], SUResult)
  attach_function(:SUDimensionGetArrowType, [SUDimensionRef, SUArrowType], SUResult)
  attach_function(:SUDimensionSetArrowType, [SUDimensionRef, SUArrowType], SUResult)
  attach_function(:SUDimensionGetFont, [SUDimensionRef, SUFontRef], SUResult)
  attach_function(:SUDimensionSetFont, [SUDimensionRef, SUFontRef], SUResult)
end
