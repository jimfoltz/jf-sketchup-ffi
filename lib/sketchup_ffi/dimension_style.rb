module SketchupFFI

  attach_function(:SUDimensionStyleGetFont, [SUDimensionStyleRef, SUFontRef], SUResult)
  attach_function(:SUDimensionStyleGet3D, [SUDimensionStyleRef, :bool_ptr], SUResult)
  attach_function(:SUDimensionStyleGetArrowType, [SUDimensionStyleRef, SUArrowType], SUResult)
  attach_function(:SUDimensionStyleGetArrowSize, [SUDimensionStyleRef, :size_ptr], SUResult)
  attach_function(:SUDimensionStyleGetColor, [SUDimensionStyleRef, SUColor], SUResult)
  attach_function(:SUDimensionStyleGetTextColor, [SUDimensionStyleRef, SUColor], SUResult)
  attach_function(:SUDimensionStyleGetExtensionLineOffset, [SUDimensionStyleRef, :size_ptr], SUResult)
  attach_function(:SUDimensionStyleGetExtensionLineOvershoot, [SUDimensionStyleRef, :size_ptr], SUResult)
  attach_function(:SUDimensionStyleGetLineWeight, [SUDimensionStyleRef, :size_ptr], SUResult)
  attach_function(:SUDimensionStyleGetHighlightNonAssociativeDimensions, [SUDimensionStyleRef, :bool_ptr], SUResult)
  attach_function(:SUDimensionStyleGetHighlightNonAssociativeDimensionsColor, [SUDimensionStyleRef, SUColor], SUResult)
  attach_function(:SUDimensionStyleGetShowRadialPrefix, [SUDimensionStyleRef, :bool_ptr], SUResult)
  attach_function(:SUDimensionStyleGetHideOutOfPlane, [SUDimensionStyleRef, :bool_ptr], SUResult)
  attach_function(:SUDimensionStyleGetHideOutOfPlaneValue, [SUDimensionStyleRef, :double_ptr], SUResult)
  attach_function(:SUDimensionStyleGetHideSmall, [SUDimensionStyleRef, :bool_ptr], SUResult)
  attach_function(:SUDimensionStyleGetHideSmallValue, [SUDimensionStyleRef, :double_ptr], SUResult)

end
