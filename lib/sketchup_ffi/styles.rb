module SketchupFFI
  attach_function(:SUStylesAddStyle, [SUStylesRef, :string, :bool], SUResult)
  attach_function(:SUStylesGetNumStyles, [SUStylesRef, :size_ptr], SUResult)
  attach_function(:SUStylesGetStyles, [SUStylesRef, :size_t, SUStyleRef, :size_ptr], SUResult)
  attach_function(:SUStylesGetActiveStyle, [SUStylesRef, SUStyleRef], SUResult)
  attach_function(:SUStylesGetSelectedStyle, [SUStylesRef, SUStyleRef], SUResult)
  attach_function(:SUStylesGetStyleByGuid, [SUStylesRef, :string, SUStyleRef], SUResult)
  attach_function(:SUStylesGetStyleByPath, [SUStylesRef, :string, SUStyleRef], SUResult)
  attach_function(:SUStylesGetActiveStyleChanged, [SUStylesRef, :bool_ptr], SUResult)
  attach_function(:SUStylesApplyStyleToScene, [SUStylesRef, SUStyleRef, SUSceneRef], SUResult)
  attach_function(:SUStylesSetSelectedStyle, [SUStylesRef, SUStyleRef], SUResult)
  attach_function(:SUStylesRemoveStyle, [SUStylesRef, SUStyleRef], SUResult)
end
