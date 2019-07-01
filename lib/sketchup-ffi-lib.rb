require 'ffi'

module SketchupFFI

   extend FFI::Library

   ffi_lib File.join(File.dirname(__FILE__), "SketchupCommonPreferences.dll")
   ffi_lib File.join(File.dirname(__FILE__), "SketchupAPI.dll")
   ffi_convention :stdcall

   enum :SUResult, [
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
   ]

   enum :SUModelVersion, [
      :SUModelVersion_SU3,
      :SUModelVersion_SU4,
      :SUModelVersion_SU5,
      :SUModelVersion_SU6,
      :SUModelVersion_SU7,
      :SUModelVersion_SU8,
      :SUModelVersion_SU2013,
      :SUModelVersion_SU2014,
      :SUModelVersion_SU2015,
      :SUModelVersion_SU2016,
      :SUModelVersion_SU2017,
      :SUModelVersion_SU2018,
      :SUModelVersion_SU2019
   ]

   class SURef < FFI::Struct
      layout :ptr, :pointer
   end

   # common.h
   attach_function("su_initialize", :SUInitialize, [], :int)
   attach_function("su_terminate", :SUTerminate, [], :int)
   attach_function(:SUGetAPIVersion, [:pointer, :pointer], :int)

   # @return [String]
   def self.get_api_version
      major = FFI::MemoryPointer.new(:int)
      minor = FFI::MemoryPointer.new(:int)
      SUGetAPIVersion(major, minor)
      "#{major.read_int}.#{minor.read_int}"
   end

   attach_function("create_model", :SUModelCreate, [SURef], :SUResult)
   attach_function("create_from_file", :SUModelCreateFromFile, [SURef, :string], :SUResult)

   attach_function(:SUModelRelease, [SURef], :SUResult)
   def self.release(model)
      SUModelRelease(model)
   end

   # SU_RESULT SUModelSaveToFile(SUModelRef model, const char* file_path);
   attach_function("save_to_file", :SUModelSaveToFile, [SURef, :string], :SUResult)

   # SU_RESULT SUModelSaveToFileWithVersion(SUModelRef model, const char* file_path, enum SUModelVersion version);
   attach_function("save_to_file_with_version", :SUModelSaveToFileWithVersion, [SURef, :string, :SUModelVersion], :SUResult)

   # SU_RESULT SUModelGetVersion(SUModelRef model, int* major, int* minor, int* build);
   attach_function(:SUModelGetVersion, [SURef, :pointer, :pointer, :pointer], :SUResult)

   attach_function(:SUModelGetName, [SURef, SURef], :SUResult)
   attach_function(:SUModelSetName, [SURef, :string], :SUResult)

   # SU_RESULT SUModelGetPath(SUModelRef model, SUStringRef* path);
   attach_function(:SUModelGetPath, [SURef, SURef], :SUResult)

   # SU_RESULT SUModelGetAxes(SUModelRef model, SUAxesRef* axes);
   attach_function(:SUModelGetAxes, [SURef, :pointer], :SUResult)

   # SU_RESULT SUStringCreate(SUStringRef * out_string_ref)
   attach_function(:SUStringCreate, [:pointer], :SUResult)

   # SU_RESULT SUStringGetUTF8Length(SUStringRef string_ref, size_t * out_length)
   attach_function(:SUStringGetUTF8Length, [SURef, :pointer], :SUResult)

   attach_function(:SUStringGetUTF8, [SURef, :size_t, :pointer, :pointer], :SUResult)

end
