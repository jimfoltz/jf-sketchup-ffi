# typed-value.rb
#
module SketchupFFI

  SUTypedValueType = enum(
    :SUTypedValueType_Empty,
    :SUTypedValueType_Byte,
    :SUTypedValueType_Short,
    :SUTypedValueType_Int32,
    :SUTypedValueType_Float,
    :SUTypedValueType_Double,
    :SUTypedValueType_Bool,
    :SUTypedValueType_Color,
    :SUTypedValueType_Time,
    :SUTypedValueType_String,
    :SUTypedValueType_Vector3D,
    :SUTypedValueType_Array
  )

  attach_function(:SUTypedValueCreate,      [SUTypedValueRef], SUResult)
  attach_function(:SUTypedValueRelease,     [SUTypedValueRef], SUResult)
  attach_function(:SUTypedValueGetType,     [SUTypedValueRef, :pointer], SUResult)
  attach_function(:SUTypedValueGetByte,     [SUTypedValueRef, :string], SUResult)
  attach_function(:SUTypedValueSetByte,     [SUTypedValueRef, :char], SUResult)
  attach_function(:SUTypedValueSetFloat,    [SUTypedValueRef, :float], SUResult)
  attach_function(:SUTypedValueSetDouble,   [SUTypedValueRef, :double], SUResult)
  attach_function(:SUTypedValueGetDouble,   [SUTypedValueRef, :double_ptr], SUResult)
  attach_function(:SUTypedValueSetInt16,    [SUTypedValueRef, :int16], SUResult)
  attach_function(:SUTypedValueGetInt16,    [SUTypedValueRef, :int16], SUResult)
  attach_function(:SUTypedValueSetInt32,    [SUTypedValueRef, :int32], SUResult)
  attach_function(:SUTypedValueGetInt32,    [SUTypedValueRef, :pointer], SUResult)
  attach_function(:SUTypedValueSetString,   [SUTypedValueRef, :string], SUResult)
  attach_function(:SUTypedValueGetString,   [SUTypedValueRef, SUStringRef], SUResult)
  attach_function(:SUTypedValueGetBool,     [SUTypedValueRef, :pointer], SUResult)
  attach_function(:SUTypedValueSetBool,     [SUTypedValueRef, :bool], SUResult)
  attach_function(:SUTypedValueSetColor,    [SUTypedValueRef, SUColor], SUResult)
  attach_function(:SUTypedValueGetColor,    [SUTypedValueRef, :pointer], SUResult)
  attach_function(:SUTypedValueSetVector3d, [SUTypedValueRef, SUVector3d], SUResult)
  attach_function(:SUTypedValueGetVector3d, [SUTypedValueRef, :pointer], SUResult)
  attach_function(:SUTypedValueSetTime,     [SUTypedValueRef, :int64], SUResult)
  attach_function(:SUTypedValueGetTime,     [SUTypedValueRef, :pointer], SUResult)

end
