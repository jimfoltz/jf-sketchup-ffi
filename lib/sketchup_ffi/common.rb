# common.rb

module SketchupFFI

  SUResult = enum(
    :SU_ERROR_NONE,
    :SU_ERROR_NULL_POINTER_INPUT,
    :SU_ERROR_INVALID_INPUT,
    :SU_ERROR_NULL_POINTER_OUTPUT,
    :SU_ERROR_INVALID_OUTPUT,
    :SU_ERROR_OVERWRITE_VALID,
    :SU_ERROR_GENERIC,
    :SU_ERROR_SERIALIZATION,
    :SU_ERROR_OUT_OF_RANGE,
    :SU_ERROR_NO_DATA,
    :SU_ERROR_INSUFFICIENT_SIZE,
    :SU_ERROR_UNKNOWN_EXCEPTION,
    :SU_ERROR_MODEL_INVALID,
    :SU_ERROR_MODEL_VERSION,
    :SU_ERROR_LAYER_LOCKED,
    :SU_ERROR_DUPLICATE,
    :SU_ERROR_PARTIAL_SUCCESS,
    :SU_ERROR_UNSUPPORTED,
    :SU_ERROR_INVALID_ARGUMENT,
    :SU_ERROR_ENTITY_LOCKED,
    :SU_ERROR_INVALID_OPERATION
  )

  typedef :pointer, :bool_ptr
  typedef :pointer, :int_ptr
  typedef :pointer, :float_ptr
  typedef :pointer, :double_ptr
  typedef :pointer, :size_ptr
  typedef :pointer, :int16_ptr
  typedef :pointer, :int32_ptr
  typedef :pointer, :int64_ptr
  typedef :pointer, :uint32_ptr
  typedef :pointer, :long_ptr
  typedef :pointer, :enum_ptr
  typedef :uchar, :subyte

  class Time_tm < FFI::Struct
    layout(
      :tm_sec, :int,
      :tm_min, :int,
      :tm_hour, :int,
      :tm_mday, :int,
      :tm_mon, :int,
      :tm_year, :int,
      :tm_wday, :int,
      :tm_yday, :int,
      :tm_isdst, :int
    )
  end

  def self.is_valid?(ref)
    ref[:ptr].address != 0
  end

  def self.is_invalid?(ref)
    ref[:ptr].address == 0
  end

  def self.are_equal?(ref1, ref2)
    ref1[:ptr].address == ref2[:ptr].address
  end

  def self.set_invalid(ref)
    ref[:ptr] = 0
  end

end
