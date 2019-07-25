module SketchupFFI

  attach_function(:SUAxesToEntity, [SUAxesRef], SUEntityRef)
  attach_function(:SUAxesFromEntity, [SUEntityRef], SUAxesRef)
  attach_function(:SUAxesToDrawingElement, [SUAxesRef], SUDrawingElementRef)
  attach_function(:SUAxesFromDrawingElement, [SUDrawingElementRef], SUAxesRef)
  attach_function(:SUAxesCreate, [SUAxesRef], SUResult)
  attach_function(:SUAxesCreateCustom, [SUAxesRef, SUPoint3d, SUVector3d, SUVector3d, SUVector3d], SUResult)
  attach_function(:SUAxesRelease, [SUAxesRef], SUResult)
  attach_function(:SUAxesGetOrigin, [SUAxesRef, SUPoint3d], SUResult)
  attach_function(:SUAxesSetOrigin, [SUAxesRef, SUPoint3d], SUResult)
  attach_function(:SUAxesGetXAxis, [SUAxesRef, SUVector3d], SUResult)
  attach_function(:SUAxesGetYAxis, [SUAxesRef, SUVector3d], SUResult)
  attach_function(:SUAxesGetZAxis, [SUAxesRef, SUVector3d], SUResult)
  attach_function(:SUAxesSetAxesVecs, [SUAxesRef, SUVector3d, SUVector3d, SUVector3d], SUResult)
  attach_function(:SUAxesGetTransform, [SUAxesRef, SUTransformation], SUResult)
  attach_function(:SUAxesGetPlane, [SUAxesRef, SUPlane3d], SUResult)

end