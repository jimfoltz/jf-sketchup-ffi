# Helper method
def typed_value_get_rb_value(typed_value)
  type_ptr = FFI::MemoryPointer.new :int
  typed_value_get_type(typed_value[:ptr], type_ptr)
  type_num = type_ptr.read_int

  case type_num
  when SUTypedValueType[:Empty]

  when SUTypedValueType[:Byte]
    ptr = FFI::MemoryPointer.new :char
    typed_value_get_byte typed_value[:ptr], ptr
    value = ptr.read(:char)

  when SUTypedValueType[:Short]
    ptr = FFI::MemoryPointer.new :int16
    typed_value_get_int16 typed_value[:ptr], ptr
    value = ptr.read(:int16)

  when SUTypedValueType[:Int32]
    ptr = FFI::MemoryPointer.new :int32
    typed_value_get_int32 typed_value[:ptr], ptr
    value = ptr.read(:int32)

  when SUTypedValueType[:Float]
    ptr = FFI::MemoryPointer.new :float
    typed_value_get_float typed_value[:ptr], ptr
    value = ptr.read(:float)

  when SUTypedValueType[:Double]
    ptr = FFI::MemoryPointer.new :double
    typed_value_get_double typed_value[:ptr], ptr
    value = ptr.read(:double)

  when SUTypedValueType[:Bool]
    ptr = FFI::MemoryPointer.new :bool
    typed_value_get_bool typed_value[:ptr], ptr
    value = ptr.read(:bool)

  when SUTypedValueType[:Color]
    ptr = FFI::MemoryPointer.new SUColor
    typed_value_get_color typed_value[:ptr], ptr
    value = SUColor.new ptr

  when SUTypedValueType[:Time]
    ptr = FFI::MemoryPointer.new :int64
    typed_value_get_time typed_value[:ptr], ptr
    value = ptr.read :int64

  when SUTypedValueType[:String]
    str = SUStringRef.new
    string_create str
    typed_value_get_string typed_value[:ptr], str
    value = get_string str
    string_release str

  when SUTypedValueType[:Vector3d]
    ptr = FFI::MemoryPointer.new SUVector3d
    typed_value_get_vector3d typed_value[:ptr], ptr
    value = SUVector3d.new ptr

  when SUTypedValueType[:Array]
    int_p = FFI::MemoryPointer.new :size_t
    typed_value_get_num_array_items(typed_value[:ptr], int_p)
    n = int_p.read(:size_t)
    ary_p = FFI::MemoryPointer.new SUTypedValueRef, n
    count = FFI::MemoryPointer.new :size_t
    typed_value_get_array_items(typed_value[:ptr], n, ary_p, count)
    value = count.read(:size_t).times.collect { |i|
      typed_value_get_rb_value(SUTypedValueRef.new(ary_p + i * SUTypedValueRef.size))
    }

  else
    value = "N/A"

  end # case
  value
end

def rb_value_to_typed_value(value)

  typed_value = SUTypedValueRef.new
  typed_value_create(typed_value)
  SketchupFFI.set_invalid(typed_value)

  case value

  when TrueClass, FalseClass
    typed_value_set_bool(typed_value, value)

  when String
    typed_value_set_string(typed_value, value)

  when Integer
    #case value
    #when (-2**7)..(2**7-1)
    #  typed_value_set_byte(typed_value, value)
    #when (-2**15)..(2**15-1)
    #  typed_value_set_int16(typed_value, value)
    #else # (-2**31)..(2**31-1)
    #  typed_value_set_int32(typed_value, value)
    #end
    typed_value_set_int32(typed_value, value)

  when Float
    case value
      # Based on FLT_MIN & FLT_MAX on my machine
    when (1.175494e-38)..(3.402823e+38)
      typed_value_set_float(typed_value, value)
    else
      typed_value_set_double(typed_value, value)
    end

  when SketchupFFI::SUColor
    typed_value_set_color(typed_value, value)

  when SketchupFFI::SUVector3d
    typed_value_set_vector3d(typed_value, value)

  when Array
    values = value.collect{|v| rb_value_to_typed_value(v)}
    ptr = FFI::MemoryPointer.new SUTypedValueRef, values.length
    ptr.put_array_of_pointer(0, values)
    typed_value_set_array_items(typed_value, values.length, ptr)

  else
    fail "unhandled value: #{value.inspect} <#{value.class}>"

  end # case
  typed_value
end
