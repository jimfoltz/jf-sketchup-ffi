module SketchupFFI

  attach_function(:SUInstancePathCreate, [SUInstancePathRef], SUResult)
  attach_function(:SUInstancePathCreateCopy, [SUInstancePathRef, SUInstancePathRef], SUResult)
  attach_function(:SUInstancePathRelease, [SUInstancePathRef], SUResult)
  attach_function(:SUInstancePathPushInstance, [SUInstancePathRef, SUComponentInstanceRef], SUResult)
  attach_function(:SUInstancePathPopInstance, [SUInstancePathRef], SUResult)
  attach_function(:SUInstancePathSetLeaf, [SUInstancePathRef, SUEntityRef], SUResult)
  attach_function(:SUInstancePathGetPathDepth, [SUInstancePathRef, :size_ptr], SUResult)
  attach_function(:SUInstancePathGetFullDepth, [SUInstancePathRef, :size_ptr], SUResult)
  attach_function(:SUInstancePathGetTransform, [SUInstancePathRef, SUTransformation], SUResult)
  attach_function(:SUInstancePathGetTransformAtDepth, [SUInstancePathRef, :size_t, SUTransformation], SUResult)
  attach_function(:SUInstancePathGetInstanceAtDepth, [SUInstancePathRef, :size_t, SUComponentInstanceRef], SUResult)
  attach_function(:SUInstancePathGetLeafAsEntity, [SUInstancePathRef, SUEntityRef], SUResult)
  attach_function(:SUInstancePathGetLeaf, [SUInstancePathRef, SUDrawingElementRef], SUResult)
  attach_function(:SUInstancePathIsValid, [SUInstancePathRef, :bool_ptr], SUResult)
  attach_function(:SUInstancePathIsEmpty, [SUInstancePathRef, :bool_ptr], SUResult)
  attach_function(:SUInstancePathContains, [SUInstancePathRef, SUEntityRef, :bool_ptr], SUResult)
  attach_function(:SUInstancePathGetPersistentID, [SUInstancePathRef, SUStringRef], SUResult)
  attach_function(:SUInstancePathGetPersistentIDAtDepth, [SUInstancePathRef, :size_t, SUStringRef], SUResult)

end