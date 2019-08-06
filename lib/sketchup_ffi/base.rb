require 'ffi'
require_relative "snake_case"

module SketchupFFI

  extend FFI::Library

  # if windows
  ffi_lib File.join(File.dirname(__FILE__), "SketchupCommonPreferences.dll")
  ffi_lib File.join(File.dirname(__FILE__), "SketchupAPI.dll")
  #ffi_lib "C:/Program Files/SketchUp/SketchUp 2017/SketchUpAPI.dll"
  #ffi_convention :stdcall
  #else
  #end

  SUError = Class.new(StandardError)
  ATTACHED_FUNCTIONS = []
  UNATTACHED_FUNCTIONS = []

  # https://github.com/Burgestrand/plaything/blob/2893c02b2d0750721152af0ca393af5df6c852ed/lib/plaything/openal.rb#L29
  #
  # 1 Convert SU* function names to Ruby style, dropping the su_ prefix
  # 2 Create a bang_name without error checking

  def self.attach_function(c_name, params, returns, options = {})
    ruby_name = snakecase(c_name).gsub(/3_d/, '3d').gsub(/2_d/, '2d')
    begin
      super(ruby_name, c_name, params, returns, options)
      ATTACHED_FUNCTIONS << [c_name, ruby_name]
    rescue FFI::NotFoundError
      warn "FFI::NotFoundError: #{c_name} (#{ruby_name})."
      define_method(ruby_name) { |*args, &block| raise NotImplementedError }
      UNATTACHED_FUNCTIONS << ruby_name
      #module_function ruby_name
      return
    end
    if returns == SUResult
      bang_name = "#{ruby_name}!"
      alias_method(bang_name, ruby_name)
      define_method(ruby_name) do |*args, &block|
        result = public_send(bang_name, *args, &block)
        if result != :SU_ERROR_NONE
          #warn "error:\n#{ruby_name}(\n\t#{args.inspect}\n) returned #{result.inspect}"
          raise SUError.new result
        end
        result
      end
      module_function ruby_name
      #module_function bang_name
    end
  end

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


  #class SURef < FFI::Struct
  #  def valid?
  #    self[:ptr].address != 0
  #  end
  #end

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
  typedef :uchar, :subyte

  class Time_tm < FFI::Struct
    layout :tm_sec, :int,
      :tm_min, :int,
      :tm_hour, :int,
      :tm_mday, :int,
      :tm_mon, :int,
      :tm_year, :int,
      :tm_wday, :int,
      :tm_yday, :int,
      :tm_isdst, :int
  end


  # @return [String]
  def self.api_version
    major = FFI::MemoryPointer.new(:int)
    minor = FFI::MemoryPointer.new(:int)
    get_api_version(major, minor)
    "#{major.read_int}.#{minor.read_int}"
  end

  # helper
  def self.get_string(ref)
    n = FFI::MemoryPointer.new(:size_t)
    res = SketchupFFI.string_get_utf8_length(ref[:ptr], n)
    str = FFI::MemoryPointer.new(:buffer_out, n.read_int + 1)
    res = SketchupFFI.string_get_utf8(ref[:ptr], n.read_int + 1, str, n)
    str.read_string
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

end # module SketchupFFI

