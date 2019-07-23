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
      if returns == :SUResult
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

   SUModelVersion = enum(
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
   )

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

   class SURef < FFI::Struct
      def valid?
         self[:ptr].address != 0
      end
   end

   %w[
      AttributeDictionary
      DrawingElement
      Edge
      Entities
      Entity
      Face
      GuidePoint
      Layer
      LoopInput
      Material
      Model
      String
      TypedValue
      Vertex
   ].each {|name|
      ref_name = "SU#{name}Ref"
      #const_set(ref_name, Class.new(FFI::Struct))
      const_set(ref_name, Class.new(SURef))
      const_get(ref_name).send :layout, :ptr, :pointer
   }

   typedef :pointer, :int_ptr
   typedef :pointer, :double_ptr
   typedef :pointer, :size_ptr
   typedef :pointer, :int32_ptr
   typedef :pointer, :int64_ptr

   class SUPoint3d < FFI::Struct
      layout :x, :double,
         :y, :double,
         :z, :double
      def self.create(x = 0, y = 0, z = 0)
         pt = new
         pt[:x] = x
         pt[:y] = y
         pt[:z] = z
         pt
      end
   end

   class SUVector3d < FFI::Struct
      layout :x, :double, :y, :double, :z, :double
      def self.create(x = 0, y = 0, z = 0)
         vector = new
         vector[:x] = x
         vector[:y] = y
         vector[:z] = z
         vector
      end
   end

   class SUColor < FFI::Struct
      layout :red, :uchar, :green, :uchar, :blue, :uchar, :alpha, :uchar
      def self.create(red = 0, green = 0, blue = 0, alpha = 255)
         color = new
         color[:red]   = red
         color[:green] = green
         color[:blue]  = blue
         color[:alpha] = alpha
         color
      end
      def to_s
         "#<SUColor (#{self[:red]}, #{self[:green]}, #{self[:blue]}, #{self[:alpha]})>"
      end
   end

   attach_function(:SUInitialize, [], :void)
   attach_function(:SUTerminate, [], :void)
   attach_function(:SUGetAPIVersion, [:int_ptr, :int_ptr], :int)

   attach_function(:SUAttributeDictionaryCreate, [SUAttributeDictionaryRef, :string], :SUResult)
   attach_function(:SUAttributeDictionaryRelease, [SUAttributeDictionaryRef], :SUResult)
   attach_function(:SUAttributeDictionaryFromEntity, [SUEntityRef], SUAttributeDictionaryRef)
   attach_function(:SUAttributeDictionaryToEntity, [SUAttributeDictionaryRef], SUEntityRef)
   attach_function(:SUAttributeDictionaryGetNumKeys, [SUAttributeDictionaryRef, :size_ptr], :SUResult)
   attach_function(:SUAttributeDictionaryGetKeys, [SUAttributeDictionaryRef, :size_t, SUStringRef, :size_ptr], :SUResult)
   attach_function(:SUAttributeDictionaryGetName, [SUAttributeDictionaryRef, SUStringRef], :SUResult)
   attach_function(:SUAttributeDictionaryGetValue, [SUAttributeDictionaryRef, :string, :pointer], :SUResult)
   attach_function(:SUAttributeDictionarySetValue, [SUAttributeDictionaryRef, :string, SUTypedValueRef], :SUResult)

   attach_function(:SUDrawingElementSetMaterial, [SUDrawingElementRef, SUMaterialRef], :SUResult)

   attach_function(:SUEdgeCreate, [SUEdgeRef, SUPoint3d, SUPoint3d], :SUResult)
   attach_function(:SUEdgeToDrawingElement, [SUEdgeRef], SUDrawingElementRef)
   attach_function(:SUEdgeGetStartVertex, [SUEdgeRef, SUVertexRef], :SUResult)
   attach_function(:SUEdgeSetColor, [SUEdgeRef, SUColor], :SUResult)

   attach_function(:SUEntitiesAddEdges, [SUEntitiesRef, :size_t, :pointer], :SUResult)
   attach_function(:SUEntitiesAddFaces, [SUEntitiesRef, :size_t, :pointer], :SUResult)
   attach_function(:SUEntitiesAddGuidePoints, [SUEntitiesRef, :size_t, :pointer], :SUResult)

   attach_function(:SUEntityGetID, [SUEntityRef, :int32_ptr], :SUResult)
   attach_function(:SUEntityGetPersistentID, [SUEntityRef, :int64_ptr], :SUResult)
   attach_function(:SUEntityGetNumAttributeDictionaries, [SUEntityRef, :size_ptr], :SUResult)
   attach_function(:SUEntityGetAttributeDictionaries, [SUEntityRef, :size_t, SUAttributeDictionaryRef, :size_ptr], :SUResult)
   attach_function(:SUEntityAddAttributeDictionary, [SUEntityRef, SUAttributeDictionaryRef], :SUResult)
   attach_function(:SUEntityGetAttributeDictionary, [SUEntityRef, :string, SUAttributeDictionaryRef], :SUResult)
   attach_function(:SUEntityGetModel, [SUEntityRef, SUModelRef], :SUResult)
   attach_function(:SUEntityGetParentEntities, [SUEntityRef, SUEntitiesRef], :SUResult)

   attach_function(:SUFaceCreate, [SUFaceRef, :pointer, SULoopInputRef], :SUResult)
   attach_function(:SUFaceCreateSimple, [SUFaceRef, :pointer, :size_t], :SUResult)
   attach_function(:SUFaceRelease, [SUFaceRef], :SUResult)

   attach_function(:SUGuidePointCreate, [SUGuidePointRef, :pointer], :SUResult)

   attach_function(:SULoopInputAddVertexIndex, [SULoopInputRef, :size_t], :SUResult)
   attach_function(:SULoopInputCreate, [SULoopInputRef], :SUResult)

   attach_function(:SUMaterialCreate, [SUMaterialRef], :SUResult)
   attach_function(:SUMaterialSetColor, [SUMaterialRef, SUColor], :SUResult)
   attach_function(:SUMaterialSetName, [SUMaterialRef, :string], :SUResult)

   attach_function(:SUModelAddMaterials, [SUModelRef, :size_t, SUMaterialRef], :SUResult)
   attach_function(:SUModelCreate, [SUModelRef], :SUResult)
   attach_function(:SUModelCreateFromFile, [SUModelRef, :string], :SUResult)
   attach_function(:SUModelGetNumAttributeDictionaries, [SUModelRef, :int_ptr], :SUResult)
   attach_function(:SUModelGetAttributeDictionaries, [SUModelRef, :size_t, :pointer, :pointer], :SUResult)
   attach_function(:SUModelGetAttributeDictionary, [SUModelRef, :string, SUAttributeDictionaryRef], :SUResult)
   attach_function(:SUModelGetAxes, [SUModelRef, :pointer], :SUResult)
   attach_function(:SUModelGetEntities, [SUModelRef, SUEntitiesRef], :SUResult)
   attach_function(:SUModelGetName, [SUModelRef, SUStringRef], :SUResult)
   attach_function(:SUModelGetVersion, [SUModelRef, :int_ptr, :int_ptr, :int_ptr], :SUResult)
   attach_function(:SUModelRelease, [SUModelRef], :SUResult)
   attach_function(:SUModelSaveToFile, [SUModelRef, :string], :SUResult)
   attach_function(:SUModelSaveToFileWithVersion, [SUModelRef, :string, SUModelVersion], :SUResult)
   attach_function(:SUModelSetName, [SUModelRef, :string], :SUResult)

   attach_function(:SUPoint3DDistanceToSUPoint3D, [SUPoint3d, SUPoint3d, :double_ptr], :SUResult)

   attach_function(:SUStringCreate, [SUStringRef], :SUResult)
   attach_function(:SUStringGetUTF8, [SUStringRef, :size_t, :pointer, :pointer], :SUResult)
   attach_function(:SUStringGetUTF8Length, [SUStringRef, :pointer], :SUResult)
   attach_function(:SUStringRelease, [SUStringRef], :SUResult)

   attach_function(:SUTypedValueCreate, [SUTypedValueRef], :SUResult)
   attach_function(:SUTypedValueRelease, [SUTypedValueRef], :SUResult)
   attach_function(:SUTypedValueGetType, [SUTypedValueRef, :pointer], :SUResult)
   attach_function(:SUTypedValueGetByte, [SUTypedValueRef, :string], :SUResult)
   attach_function(:SUTypedValueSetByte, [SUTypedValueRef, :char], :SUResult)
   attach_function(:SUTypedValueSetFloat, [SUTypedValueRef, :float], :SUResult)
   attach_function(:SUTypedValueSetDouble, [SUTypedValueRef, :double], :SUResult)
   attach_function(:SUTypedValueGetDouble, [SUTypedValueRef, :double_ptr], :SUResult)
   attach_function(:SUTypedValueSetInt16, [SUTypedValueRef, :int16], :SUResult)
   attach_function(:SUTypedValueGetInt16, [SUTypedValueRef, :int16], :SUResult)
   attach_function(:SUTypedValueSetInt32, [SUTypedValueRef, :int32], :SUResult)
   attach_function(:SUTypedValueGetInt32, [SUTypedValueRef, :pointer], :SUResult)
   attach_function(:SUTypedValueSetString, [SUTypedValueRef, :string], :SUResult)
   attach_function(:SUTypedValueGetString, [SUTypedValueRef, SUStringRef], :SUResult)
   attach_function(:SUTypedValueGetBool, [SUTypedValueRef, :pointer], :SUResult)
   attach_function(:SUTypedValueSetBool, [SUTypedValueRef, :bool], :SUResult)
   attach_function(:SUTypedValueSetColor, [SUTypedValueRef, SUColor], :SUResult)
   attach_function(:SUTypedValueGetColor, [SUTypedValueRef, :pointer], :SUResult)
   attach_function(:SUTypedValueSetVector3d, [SUTypedValueRef, SUVector3d], :SUResult)
   attach_function(:SUTypedValueGetVector3d, [SUTypedValueRef, :pointer], :SUResult)
   attach_function(:SUTypedValueSetTime, [SUTypedValueRef, :int64], :SUResult)
   attach_function(:SUTypedValueGetTime, [SUTypedValueRef, :pointer], :SUResult)

   attach_function(:SUVertexGetNumEdges, [SUVertexRef, :int_ptr], :SUResult)

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


end
