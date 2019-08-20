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

end
