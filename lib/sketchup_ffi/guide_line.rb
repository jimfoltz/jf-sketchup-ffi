# guide_line.rb
module SketchupFFI

  attach_function(:SUGuideLineToEntity, [SUGuideLineRef], SUEntityRef)
  attach_function(:SUGuideLineFromEntity, [SUEntityRef], SUGuideLineRef)
  attach_function(:SUGuideLineToDrawingElement, [SUGuideLineRef], SUDrawingElementRef)
  attach_function(:SUGuideLineFromDrawingElement, [SUDrawingElementRef], SUGuideLineRef)
  attach_function(:SUGuideLineCreateFinite, [SUGuideLineRef, SUPoint3d, SUPoint3d], SUResult)
  attach_function(:SUGuideLineCreateInfinite, [SUGuideLineRef, SUPoint3d, SUVector3d], SUResult)
  attach_function(:SUGuideLineRelease, [SUGuideLineRef], SUResult)
  attach_function(:SUGuideLineGetData, [SUGuideLineRef, SUPoint3d, SUVector3d, :bool_ptr], SUResult)

end
