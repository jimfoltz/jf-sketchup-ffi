require_relative '../lib/sketchup_ffi'
require_relative 'typed_value_helpers'
require_relative 'string_helpers'

include SketchupFFI

file = ARGV.shift
file = "model.skp" if file.nil?

SketchupFFI.initialize

model = SUModelRef.new
model_create_from_file model, file

r_opts = SURenderingOptionsRef.new

model_get_rendering_options model[:ptr], r_opts

n = FFI::MemoryPointer.new :int
rendering_options_get_num_keys r_opts[:ptr], n
n = n.read_int
ptr = FFI::MemoryPointer.new SUStringRef, n
strs = n.times.collect {|i|
  SUStringRef.new(ptr + i * SUStringRef.size)
}
strs.each_with_index {|s, i| string_create strs[i]}
ret = FFI::MemoryPointer.new :size_t
rendering_options_get_keys r_opts[:ptr], n, ptr, ret
keys = ret.read_int.times.collect {|i| get_string strs[i] }

type = FFI::MemoryPointer.new :int
value = SUTypedValueRef.new
typed_value_create value

keys.each { |key|
  rendering_options_get_value r_opts[:ptr], key, value
  val = typed_value_get_rb_value value
  typed_value_get_type value[:ptr], type
  type_no = type.read_int
  puts "#{key.ljust(25)} = #{val.inspect} <#{SUTypedValueType[type_no]}>"
}

