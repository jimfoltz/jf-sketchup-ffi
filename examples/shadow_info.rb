require_relative '../lib/sketchup_ffi'
require_relative "string_helpers"
require_relative "typed_value_helpers"

include SketchupFFI

file = ARGV.shift
file = "model.skp" if file.nil?

SketchupFFI.initialize

model = SUModelRef.new
model_create_from_file model, file

info = SURenderingOptionsRef.new

model_get_shadow_info model[:ptr], info

n = FFI::MemoryPointer.new :int
shadow_info_get_num_keys info[:ptr], n
n = n.read_int
ptr = FFI::MemoryPointer.new SUStringRef, n
strs = n.times.collect {|i|
  SUStringRef.new(ptr + i * SUStringRef.size)
}
strs.each_with_index {|s, i| string_create strs[i]}
ret = FFI::MemoryPointer.new :size_t
shadow_info_get_keys info[:ptr], n, ptr, ret
keys = ret.read_int.times.collect {|i| get_string strs[i] }

type = FFI::MemoryPointer.new :int
value = SUTypedValueRef.new
typed_value_create value

keys.each {|key|
  shadow_info_get_value info[:ptr], key, value
  typed_value_get_type value[:ptr], type
  type_no = type.read_int
  val = typed_value_get_rb_value value
  puts "#{key.ljust(20)} = #{val.to_s.ljust(20)} <#{SUTypedValueType[type_no]}> <#{val.class}>"
}

