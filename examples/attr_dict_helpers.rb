# Helper
def attr_dict_get_keys(dict)
  n = FFI::MemoryPointer.new :int
  attribute_dictionary_get_num_keys dict[:ptr], n
  n = n.read_int
  ptr = FFI::MemoryPointer.new SUStringRef, n
  strs = n.times.collect {|i| SUStringRef.new(ptr + i * SUStringRef.size) }
  strs.each_with_index {|s, i| string_create strs[i]}
  ret = FFI::MemoryPointer.new :size_t
  attribute_dictionary_get_keys dict[:ptr], n, ptr, ret
  keys = ret.read_int.times.collect {|i|
    SketchupFFI.get_string strs[i]
  }
  keys
end

def attr_dict_set_value(dict, key, value)
  typed_value = value_to_typed_value(value)
  attribute_dictionary_set_value(dict[:ptr], key, typed_value)
  #typed_value_release typed_value
end
