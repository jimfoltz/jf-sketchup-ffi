module SketchupFFI
  attach_function(:SUMeshHelperCreate, [SUMeshHelperRef, SUFaceRef], SUResult)
  attach_function(:SUMeshHelperCreateWithTextureWriter, [SUMeshHelperRef, SUFaceRef, SUTextureWriterRef], SUResult)
  attach_function(:SUMeshHelperCreateWithUVHelper, [SUMeshHelperRef, SUFaceRef, SUUVHelperRef], SUResult)
  attach_function(:SUMeshHelperRelease, [SUMeshHelperRef], SUResult)
  attach_function(:SUMeshHelperGetNumTriangles, [SUMeshHelperRef, :size_ptr], SUResult)
  attach_function(:SUMeshHelperGetNumVertices, [SUMeshHelperRef, :size_ptr], SUResult)
  attach_function(:SUMeshHelperGetVertexIndices, [SUMeshHelperRef, :size_t, :size_t, :size_ptr], SUResult)
  attach_function(:SUMeshHelperGetVertices, [SUMeshHelperRef, :size_t, SUPoint3d, :size_ptr], SUResult)
  attach_function(:SUMeshHelperGetFrontSTQCoords, [SUMeshHelperRef, :size_t, SUPoint3d, :size_ptr], SUResult)
  attach_function(:SUMeshHelperGetBackSTQCoords, [SUMeshHelperRef, :size_t, SUPoint3d, :size_ptr], SUResult)
  attach_function(:SUMeshHelperGetNormals, [SUMeshHelperRef, :size_t, SUVector3d, :size_ptr], SUResult)
end
