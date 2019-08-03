# attribute-dictionary.rb
#
module SketchupFFI

  attach_function(:SUAttributeDictionaryCreate, [SUAttributeDictionaryRef, :string ], SUResult)
  attach_function(:SUAttributeDictionaryRelease, [SUAttributeDictionaryRef ], SUResult)
  attach_function(:SUAttributeDictionaryToEntity, [SUAttributeDictionaryRef ], SUEntityRef)
  attach_function(:SUAttributeDictionaryFromEntity, [SUEntityRef ], SUAttributeDictionaryRef)
  attach_function(:SUAttributeDictionaryGetName, [SUAttributeDictionaryRef, SUStringRef ], SUResult)
  attach_function(:SUAttributeDictionarySetValue, [SUAttributeDictionaryRef, :string, SUTypedValueRef ], SUResult)
  attach_function(:SUAttributeDictionaryGetValue, [SUAttributeDictionaryRef, :string, :pointer ], SUResult)
  attach_function(:SUAttributeDictionaryGetNumKeys, [SUAttributeDictionaryRef, :size_ptr ], SUResult)
  attach_function(:SUAttributeDictionaryGetKeys, [SUAttributeDictionaryRef, :size_t, SUStringRef, :size_ptr ], SUResult)

end
