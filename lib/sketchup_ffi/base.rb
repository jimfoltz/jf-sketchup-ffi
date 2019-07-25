require 'ffi'

module SketchupFFI

  extend FFI::Library

  ffi_lib File.join(File.dirname(__FILE__), "SketchupCommonPreferences.dll")
  ffi_lib File.join(File.dirname(__FILE__), "SketchupAPI.dll")
  #ffi_lib "C:/Program Files/SketchUp/SketchUp 2017/SketchUpAPI.dll"
  #ffi_convention :stdcall

  # From Ruby Facets
  # https://github.com/rubyworks/facets/blob/master/lib/core/facets/string/snakecase.rb
  # Convert CamelCase to snake_case
  def self.snakecase(str)
    str.to_s.
      gsub(/([A-Z]+)([A-Z][a-z])/,'\1_\2').
      gsub(/([a-z\d])([A-Z])/,'\1_\2').
      tr('-', '_').
      gsub(/\s/, '_').
      gsub(/__+/, '_').
      downcase
  end

  SUError = Class.new(StandardError)

  # https://github.com/Burgestrand/plaything/blob/2893c02b2d0750721152af0ca393af5df6c852ed/lib/plaything/openal.rb#L29
  #
  # 1 Convert SU* function names to Ruby style, dropping the su_ prefix
  # 2 Create a bang_name without error checking

  def self.attach_function(c_name, params, returns, options = {})
    ruby_name = snakecase(c_name).gsub(/su_/, '').gsub(/3_d/, '3d')
    #p ruby_name
    begin
      super(ruby_name, c_name, params, returns, options)
    rescue FFI::NotFoundError
      warn "FFI::NotFoundError: #{c_name} (#{ruby_name})."
      define_method(ruby_name) { |*args| raise NotImplementedError }
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
      #module_function ruby_name
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



  class SURef < FFI::Struct
    def valid?
      self[:ptr].address != 0
    end
  end

  def self.define_ref(sym)
    ref_name = "SU#{sym}Ref"
    #const_set(ref_name, Class.new(FFI::Struct))
    const_set(ref_name, Class.new(SURef))
    const_get(ref_name).send :layout, :ptr, :pointer
  end

  typedef :pointer, :bool_ptr
  typedef :pointer, :int_ptr
  typedef :pointer, :double_ptr
  typedef :pointer, :size_ptr
  typedef :pointer, :int32_ptr
  typedef :pointer, :int64_ptr


  class SUTransformation < FFI::Struct
    # TODO
  end

  class SUPlane3d < FFI::Struct
    layout :a, :double, :b, :double, :c, :double, :d, :double
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
    n = FFI::MemoryPointer.new(:int)
    res = SketchupFFI.string_get_utf8_length(ref[:ptr], n)
    str = FFI::MemoryPointer.new(:string, n.read_int + 1)
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

  attach_function(:SUInitialize, [], :void)
  attach_function(:SUTerminate, [], :void)
  attach_function(:SUGetAPIVersion, [:int_ptr, :int_ptr], :int)

end # module SketchupFFI
