require_relative '../lib/sketchup_ffi'

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
keys = ret.read_int.times.collect {|i|
  SketchupFFI.get_string strs[i]
}

type = FFI::MemoryPointer.new :int
value = SUTypedValueRef.new
typed_value_create value
keys.each {|key|
  shadow_info_get_value info[:ptr], key, value
  typed_value_get_type value[:ptr], type
  val = nil
  type_no = type.read_int

  case type_no

  when SUTypedValueType[:Empty]
    val = "<empty>"

  when SUTypedValueType[:Byte]
    ptr = FFI::MemoryPointer.new :char
    typed_value_get_byte value[:ptr], ptr
    val = ptr.read(:char)

  when SUTypedValueType[:Float]
    d = FFI::MemoryPointer.new :float
    typed_value_get_double value[:ptr], d
    val = d.read(:float)

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

  when SUTypedValueType[:Short]
    ptr = FFI::MemoryPointer.new :short
    typed_value_get_int32 value[:ptr], ptr
    val = ptr.read(:short)

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
    typed_value_get_vector3d value[:ptr], ptr
    val = SUVector3d.new ptr

  when SUTypedValueType[:Time]
    ptr = FFI::MemoryPointer.new :int64
    typed_value_get_time value[:ptr], ptr
    val = Time.at ptr.read(:int64)

  when SUTypedValueType[:Array]
    val = "Array"
  end

  puts "#{key.ljust(20)} = #{val} <#{SUTypedValueType[type_no]}>"

}

