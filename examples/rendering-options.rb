require_relative '../lib/sketchup_ffi'

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
keys = ret.read_int.times.collect {|i|
  SketchupFFI.get_string strs[i]
}

type = FFI::MemoryPointer.new :int
value = SUTypedValueRef.new
typed_value_create value

keys.each {|key|
  rendering_options_get_value r_opts[:ptr], key, value
  typed_value_get_type value[:ptr], type
  val = nil
  type_no = type.read_int
  case type.read_int

  when SUTypedValueType[:Empty]
    val = "<empty>"

  when SUTypedValueType[:Byte]
    ptr = FFI::MemoryPointer.new :char
    typed_value_get_byte value[:ptr], ptr
    val = ptr.read(:char)

  when SUTypedValueType[:Double]
    d = FFI::MemoryPointer.new :double
    typed_value_get_double value[:ptr], d
    val = d.read(:double)

  when SUTypedValueType[:String]
    s = SUStringRef.new
    string_create s
    typed_value_get_string value[:ptr], s
    val = SketchupFFI.get_string s
    string_release s

  when SUTypedValueType[:Int16]
    ptr = FFI::MemoryPointer.new :int16
    typed_value_get_int16 value[:ptr], ptr
    val = ptr.read(:int16)

  when SUTypedValueType[:Int32]
    ptr = FFI::MemoryPointer.new :int32
    typed_value_get_int32 value[:ptr], ptr
    val = ptr.read(:int32)

  when SUTypedValueType[:Bool]
    ptr = FFI::MemoryPointer.new :bool
    typed_value_get_bool value[:ptr], ptr
    val = ptr.read(:bool)

  when SUTypedValueType[:Color]
    ptr = FFI::MemoryPointer.new SUColor
    typed_value_get_color value[:ptr], ptr
    val = SUColor.new ptr

  when SUTypedValueType[:Vector3d]
    ptr = FFI::MemoryPointer.new SUVector3d
    typed_value_get_vector value[:ptr], ptr
    val = SUVector3d.new ptr

  end

  puts "#{key.ljust(25)} = #{val.inspect} <#{SUTypedValueType[type_no]}>"

}

