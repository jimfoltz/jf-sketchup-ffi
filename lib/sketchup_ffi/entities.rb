# entities.rb
module SketchupFFI
  attach_function(:SUEntitiesClear, [SUEntitiesRef], SUResult)
  attach_function(:SUEntitiesFill, [SUEntitiesRef, SUGeometryInputRef, :bool], SUResult)
  attach_function(:SUEntitiesGetBoundingBox, [SUEntitiesRef, SUBoundingBox3d], SUResult)
  attach_function(:SUEntitiesGetBoundingBoxLLA, [SUEntitiesRef, SUBoundingBox3d], SUResult)
  attach_function(:SUEntitiesGetNumFaces, [SUEntitiesRef, :size_ptr], SUResult)
  attach_function(:SUEntitiesGetFaces, [SUEntitiesRef, :size_t, SUFaceRef, :size_ptr], SUResult)
  attach_function(:SUEntitiesGetNumCurves, [SUEntitiesRef, :size_ptr], SUResult)
  attach_function(:SUEntitiesGetCurves, [SUEntitiesRef, :size_t, SUCurveRef, :size_ptr], SUResult)
  attach_function(:SUEntitiesGetNumArcCurves, [SUEntitiesRef, :size_ptr], SUResult)
  attach_function(:SUEntitiesGetArcCurves, [SUEntitiesRef, :size_t, SUArcCurveRef, :size_ptr], SUResult)
  attach_function(:SUEntitiesGetNumGuidePoints, [SUEntitiesRef, :size_ptr], SUResult)
  attach_function(:SUEntitiesGetGuidePoints, [SUEntitiesRef, :size_t, SUGuidePointRef, :size_ptr], SUResult)
  attach_function(:SUEntitiesGetNumGuideLines, [SUEntitiesRef, :size_ptr], SUResult)
  attach_function(:SUEntitiesGetGuideLines, [SUEntitiesRef, :size_t, SUGuideLineRef, :size_ptr], SUResult)
  attach_function(:SUEntitiesGetNumEdges, [SUEntitiesRef, :size_ptr], SUResult)
  attach_function(:SUEntitiesGetEdges, [SUEntitiesRef, :size_t, SUEdgeRef, :size_ptr], SUResult)
  attach_function(:SUEntitiesGetNumPolyline3ds, [SUEntitiesRef, :size_ptr], SUResult)
  attach_function(:SUEntitiesGetPolyline3ds, [SUEntitiesRef, :size_t, SUPolyline3dRef, :size_ptr], SUResult)

  attach_function(:SUEntitiesAddFaces, [SUEntitiesRef, :size_t, SUFaceRef], SUResult)
  attach_function(:SUEntitiesAddEdges, [SUEntitiesRef, :size_t, SUEdgeRef], SUResult)
  attach_function(:SUEntitiesAddCurves, [SUEntitiesRef, :size_t, SUCurveRef], SUResult)
  attach_function(:SUEntitiesAddArcCurves, [SUEntitiesRef, :size_t, SUArcCurveRef], SUResult)
  attach_function(:SUEntitiesAddGuidePoints, [SUEntitiesRef, :size_t, SUGuidePointRef], SUResult)
  attach_function(:SUEntitiesAddGuideLines, [SUEntitiesRef, :size_t, SUGuideLineRef], SUResult)
  attach_function(:SUEntitiesAddGroup, [SUEntitiesRef, SUGroupRef], SUResult)
  attach_function(:SUEntitiesAddImage, [SUEntitiesRef, SUImageRef], SUResult)
  attach_function(:SUEntitiesAddInstance, [SUEntitiesRef, SUComponentInstanceRef, SUStringRef], SUResult)
  attach_function(:SUEntitiesAddSectionPlanes, [SUEntitiesRef, :size_t, SUSectionPlaneRef], SUResult)
  attach_function(:SUEntitiesAddTexts, [SUEntitiesRef, :size_t, SUTextRef], SUResult)

  attach_function(:SUEntitiesGetNumGroups, [SUEntitiesRef, :size_ptr], SUResult)
  attach_function(:SUEntitiesGetGroups, [SUEntitiesRef, :size_t, SUGroupRef, :size_ptr], SUResult)
  attach_function(:SUEntitiesGetNumImages, [SUEntitiesRef, :size_ptr], SUResult)
  attach_function(:SUEntitiesGetImages, [SUEntitiesRef, :size_t, SUImageRef, :size_ptr], SUResult)
  attach_function(:SUEntitiesGetNumInstances, [SUEntitiesRef, :size_ptr], SUResult)
  attach_function(:SUEntitiesGetInstances, [SUEntitiesRef, :size_t, SUComponentInstanceRef, :size_ptr], SUResult)
  attach_function(:SUEntitiesGetNumSectionPlanes, [SUEntitiesRef, :size_ptr], SUResult)
  attach_function(:SUEntitiesGetSectionPlanes, [SUEntitiesRef, :size_t, SUSectionPlaneRef, :size_ptr], SUResult)
  attach_function(:SUEntitiesGetNumTexts, [SUEntitiesRef, :size_ptr], SUResult)
  attach_function(:SUEntitiesGetTexts, [SUEntitiesRef, :size_t, SUTextRef, :size_ptr], SUResult)
  attach_function(:SUEntitiesGetNumDimensions, [SUEntitiesRef, :size_ptr], SUResult)
  attach_function(:SUEntitiesGetDimensions, [SUEntitiesRef, :size_t, SUDimensionRef, :size_ptr], SUResult)

  attach_function(:SUEntitiesTransform, [SUEntitiesRef, :size_t, SUEntityRef, SUTransformation], SUResult)
  attach_function(:SUEntitiesTransformMultiple, [SUEntitiesRef, :size_t, SUEntityRef, SUTransformation], SUResult)
  attach_function(:SUEntitiesErase, [SUEntitiesRef, :size_t, SUEntityRef], SUResult)
  attach_function(:SUEntitiesIsRecursivelyEmpty, [SUEntitiesRef, :bool_ptr], SUResult)
  attach_function(:SUEntitiesHasSectionCuts, [SUEntitiesRef, :bool_ptr], SUResult)
  attach_function(:SUEntitiesEntityListFill, [SUEntitiesRef, SURefType, SUEntityListRef], SUResult)
end
