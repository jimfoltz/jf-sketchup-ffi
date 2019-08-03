module SketchupFFI

  class SUMaterialInput < FFI::Struct
    layout :num_uv_coords, :size_t,
      :uv_coords, SUPoint2d,
      :vertex_indices, :size_t,
      :material, SUMaterialRef
  end

  attach_function(:SUGeometryInputCreate, [SUGeometryInputRef], SUResult)
  attach_function(:SUGeometryInputRelease, [SUGeometryInputRef], SUResult)
  attach_function(:SUGeometryInputAddVertex, [SUGeometryInputRef, SUPoint3d], SUResult)
  attach_function(:SUGeometryInputSetVertices, [SUGeometryInputRef, :size_t, SUPoint3d], SUResult)
  attach_function(:SUGeometryInputAddEdge, [SUGeometryInputRef, :size_t, :size_t, :size_ptr], SUResult)
  attach_function(:SUGeometryInputEdgeSetHidden, [SUGeometryInputRef, :size_t, :bool], SUResult)
  attach_function(:SUGeometryInputEdgeSetSoft, [SUGeometryInputRef, :size_t, :bool], SUResult)
  attach_function(:SUGeometryInputEdgeSetSmooth, [SUGeometryInputRef, :size_t, :bool], SUResult)
  attach_function(:SUGeometryInputEdgeSetMaterial, [SUGeometryInputRef, :size_t, SUMaterialRef], SUResult)
  attach_function(:SUGeometryInputEdgeSetLayer, [SUGeometryInputRef, :size_t, SULayerRef], SUResult)
  attach_function(:SUGeometryInputAddCurve, [SUGeometryInputRef, :size_t, :size_t, :size_ptr], SUResult)
  attach_function(:SUGeometryInputAddArcCurve, [SUGeometryInputRef, :size_t, :size_t, SUPoint3d, SUVector3d, :size_t, :size_ptr, :size_ptr], SUResult)
  attach_function(:SUGeometryInputAddFace, [SUGeometryInputRef, SULoopInputRef, :size_ptr], SUResult)
  attach_function(:SUGeometryInputFaceSetReverse, [SUGeometryInputRef, :size_t, :bool], SUResult)
  attach_function(:SUGeometryInputFaceSetLayer, [SUGeometryInputRef, :size_t, SULayerRef], SUResult)
  attach_function(:SUGeometryInputFaceAddInnerLoop, [SUGeometryInputRef, :size_t, SULoopInputRef], SUResult)
  attach_function(:SUGeometryInputFaceSetFrontMaterial, [SUGeometryInputRef, :size_t, SUMaterialInput], SUResult)
  attach_function(:SUGeometryInputFaceSetBackMaterial, [SUGeometryInputRef, :size_t, SUMaterialInput], SUResult)
  attach_function(:SUGeometryInputFaceSetHidden, [SUGeometryInputRef, :size_t, :bool], SUResult)
  attach_function(:SUGeometryInputGetCounts, [SUGeometryInputRef, :size_ptr, :size_ptr, :size_ptr, :size_ptr, :size_ptr], SUResult)

end
