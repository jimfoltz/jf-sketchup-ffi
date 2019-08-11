# typed-value.rb

module SketchupFFI

  SUTypedValueType = enum(
    :Empty, :Byte, :Short, :Int32,
    :Float, :Double, :Bool, :Color,
    :Time, :String, :Vector3d, :Array
  )

  attach_function(:SUTypedValueCreate, [SUTypedValueRef], SUResult)
  attach_function(:SUTypedValueRelease, [SUTypedValueRef], SUResult)
  attach_function(:SUTypedValueGetType, [SUTypedValueRef, :enum_ptr], SUResult)

  attach_function(:SUTypedValueGetByte, [SUTypedValueRef, :string], SUResult)
  attach_function(:SUTypedValueSetByte, [SUTypedValueRef, :char], SUResult)

  attach_function(:SUTypedValueSetFloat, [SUTypedValueRef, :float], SUResult)
  attach_function(:SUTypedValueGetFloat, [SUTypedValueRef, :float_ptr], SUResult)

  attach_function(:SUTypedValueSetDouble, [SUTypedValueRef, :double], SUResult)
  attach_function(:SUTypedValueGetDouble, [SUTypedValueRef, :double_ptr], SUResult)

  attach_function(:SUTypedValueSetInt16, [SUTypedValueRef, :int16], SUResult)
  attach_function(:SUTypedValueGetInt16, [SUTypedValueRef, :int16_ptr], SUResult)

  attach_function(:SUTypedValueSetInt32, [SUTypedValueRef, :int32], SUResult)
  attach_function(:SUTypedValueGetInt32, [SUTypedValueRef, :int32_ptr], SUResult)
  
  attach_function(:SUTypedValueSetString, [SUTypedValueRef, :string], SUResult)
  attach_function(:SUTypedValueGetString, [SUTypedValueRef, SUStringRef], SUResult)
  
  attach_function(:SUTypedValueGetBool, [SUTypedValueRef, :bool_ptr], SUResult)
  attach_function(:SUTypedValueSetBool, [SUTypedValueRef, :bool], SUResult)

  attach_function(:SUTypedValueSetColor, [SUTypedValueRef, SUColor], SUResult)
  attach_function(:SUTypedValueGetColor, [SUTypedValueRef, SUColor], SUResult)

  attach_function(:SUTypedValueSetVector3d, [SUTypedValueRef, SUVector3d], SUResult)
  attach_function(:SUTypedValueGetVector3d, [SUTypedValueRef, SUVector3d], SUResult)

  attach_function(:SUTypedValueSetTime, [SUTypedValueRef, :int64], SUResult)
  attach_function(:SUTypedValueGetTime, [SUTypedValueRef, :int64_ptr], SUResult)

  attach_function(:SUTypedValueSetUnitVector3d, [SUTypedValueRef, :double_ptr], SUResult)

  # SU_RESULT 	SUTypedValueSetArrayItems (SUTypedValueRef typed_value, size_t len, SUTypedValueRef values[])
  attach_function(:SUTypedValueSetArrayItems, [SUTypedValueRef, :size_t, SUTypedValueRef], SUResult)

  attach_function(:SUTypedValueGetNumArrayItems, [SUTypedValueRef, :size_ptr], SUResult)
  attach_function(:SUTypedValueGetArrayItems, [SUTypedValueRef, :size_t, SUTypedValueRef, :size_ptr], SUResult)

  # Helper method
  def self.typed_value_get_rb_value(typed_value)
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


    end
    value
  end

end
