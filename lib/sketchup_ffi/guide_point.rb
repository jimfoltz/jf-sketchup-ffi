# guide-point.rb
module SketchupFFI
  attach_function(:SUGuidePointToEntity, [SUGuidePointRef], SUEntityRef)
  attach_function(:SUGuidePointFromEntity, [SUEntityRef], SUGuidePointRef)
  attach_function(:SUGuidePointToDrawingElement, [SUGuidePointRef], SUDrawingElementRef)
  attach_function(:SUGuidePointFromDrawingElement, [SUDrawingElementRef], SUGuidePointRef)
  attach_function(:SUGuidePointCreate, [SUGuidePointRef, SUPoint3d], SUResult)
  attach_function(:SUGuidePointRelease, [SUGuidePointRef], SUResult)
  attach_function(:SUGuidePointGetPosition, [SUGuidePointRef, SUPoint3d], SUResult)
  attach_function(:SUGuidePointGetFromPosition, [SUGuidePointRef, SUPoint3d], SUResult)
  attach_function(:SUGuidePointGetDisplayAsLine, [SUGuidePointRef, :bool_ptr], SUResult)
end
