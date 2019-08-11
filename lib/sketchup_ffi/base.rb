require "ffi"
require_relative "c_name_to_ruby"

module SketchupFFI

  #ffi_lib "C:/Program Files/SketchUp/SketchUp 2017/SketchUpAPI.dll"
  ffi_lib File.join(File.dirname(__FILE__), "SketchupCommonPreferences.dll")
  ffi_lib File.join(File.dirname(__FILE__), "SketchupAPI.dll")
  #ffi_convention :stdcall

  SUError = Class.new(StandardError)

  # https://github.com/Burgestrand/plaything/blob/2893c02b2d0750721152af0ca393af5df6c852ed/lib/plaything/openal.rb#L29

  def self.attach_function(c_name, params, returns, options = {})
    ruby_name = c_name_to_ruby(c_name)
    #puts "#{c_name.to_s.ljust(65, ".")} #{ruby_name}"
    begin
      super(ruby_name, c_name, params, returns, options)
    rescue FFI::NotFoundError
      warn "FFI::NotFoundError: #{c_name} (#{ruby_name})."
      define_method(ruby_name) { |*args, &block| raise NotImplementedError }
      module_function ruby_name
      return
    end
    if returns == SUResult
      bang_name = "#{ruby_name}!"
      alias_method(bang_name, ruby_name)
      define_method(ruby_name) do |*args, &block|
        result = send(bang_name, *args, &block)
        if result != :SU_ERROR_NONE
          #warn "error:\n#{ruby_name}(\n\t#{args.inspect}\n) returned #{result.inspect}"
          raise SUError.new result
        end
        result
      end
      module_function ruby_name
      module_function bang_name
    end
  end

  # @return [String]
  def self.api_version
    major = FFI::MemoryPointer.new(:int)
    minor = FFI::MemoryPointer.new(:int)
    get_api_version(major, minor)
    "#{major.read_int}.#{minor.read_int}"
  end

end # module SketchupFFI
