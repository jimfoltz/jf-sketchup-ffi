module SketchupFFI
  attach_function(:SUOptionsProviderGetNumKeys, [SUOptionsProviderRef, :size_ptr], SUResult)
  attach_function(:SUOptionsProviderGetKeys, [SUOptionsProviderRef, :size_t, SUStringRef, :size_ptr], SUResult)
  attach_function(:SUOptionsProviderGetValue, [SUOptionsProviderRef, :string, SUTypedValueRef], SUResult)
  attach_function(:SUOptionsProviderSetValue, [SUOptionsProviderRef, :string, SUTypedValueRef], SUResult)
  attach_function(:SUOptionsProviderGetName, [SUOptionsProviderRef, SUStringRef], SUResult)
end
