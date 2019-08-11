# attribute-dictionary.rb
#
module SketchupFFI
  attach_function(:SUAttributeDictionaryCreate, [SUAttributeDictionaryRef, :string], SUResult)
  attach_function(:SUAttributeDictionaryRelease, [SUAttributeDictionaryRef], SUResult)
  attach_function(:SUAttributeDictionaryToEntity, [SUAttributeDictionaryRef], SUEntityRef)
  attach_function(:SUAttributeDictionaryFromEntity, [SUEntityRef], SUAttributeDictionaryRef)
  attach_function(:SUAttributeDictionaryGetName, [SUAttributeDictionaryRef, SUStringRef], SUResult)
  attach_function(:SUAttributeDictionarySetValue, [SUAttributeDictionaryRef, :string, SUTypedValueRef], SUResult)
  attach_function(:SUAttributeDictionaryGetValue, [SUAttributeDictionaryRef, :string, SUTypedValueRef], SUResult)
  attach_function(:SUAttributeDictionaryGetNumKeys, [SUAttributeDictionaryRef, :size_ptr], SUResult)
  attach_function(:SUAttributeDictionaryGetKeys, [SUAttributeDictionaryRef, :size_t, SUStringRef, :size_ptr], SUResult)

  # Helper
  def self.attr_dict_get_keys(dict)
    n = FFI::MemoryPointer.new :int
    attribute_dictionary_get_num_keys dict[:ptr], n
    n = n.read_int
    ptr = FFI::MemoryPointer.new SUStringRef, n
    strs = n.times.collect {|i|
      SUStringRef.new(ptr + i * SUStringRef.size)
    }
    strs.each_with_index {|s, i| string_create strs[i]}
    ret = FFI::MemoryPointer.new :size_t
    attribute_dictionary_get_keys dict[:ptr], n, ptr, ret
    keys = ret.read_int.times.collect {|i|
      SketchupFFI.get_string strs[i]
    }
    keys
  end

end

