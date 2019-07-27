module SketchupFFI

  attach_function(:SUShadowInfoGetNumKeys, [SUShadowInfoRef, :size_ptr], SUResult)
  attach_function(:SUShadowInfoGetKeys,    [SUShadowInfoRef, :size_t, SUStringRef, :size_ptr], SUResult)
  attach_function(:SUShadowInfoGetValue,   [SUShadowInfoRef, :string, SUTypedValueRef], SUResult)
  attach_function(:SUShadowInfoSetValue,   [SUShadowInfoRef, :string, SUTypedValueRef], SUResult)

end
