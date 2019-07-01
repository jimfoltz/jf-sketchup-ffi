#require_relative 'sketchup-ffi-lib'
require_relative 'entity.rb'
require_relative 'axes.rb'

module Sketchup

   class Model

      VERSION_3 = :SUModelVersion_SU3
      VERSION_4 = :SUModelVersion_SU4
      VERSION_5 = :SUModelVersion_SU5
      VERSION_6 = :SUModelVersion_SU6
      VERSION_7 = :SUModelVersion_SU7
      VERSION_8 = :SUModelVersion_SU8
      VERSION_2013 = :SUModelVersion_SU2013
      VERSION_2014 = :SUModelVersion_SU2014
      VERSION_2015 = :SUModelVersion_SU2015
      VERSION_2016 = :SUModelVersion_SU2016
      VERSION_2017 = :SUModelVersion_SU2017
      VERSION_2018 = :SUModelVersion_SU2018
      VERSION_2019 = :SUModelVersion_SU2019

      def initialize(ref)
         @ref = ref
      end

      def ref
         @ref
      end

      # @return [Sketchup::Axes]
      def axes
         ref = SketchupFFI::SURef.new
         SketchupFFI.SUModelGetAxes(@ref[:ptr], ref)
         Sketchup::Axes.new(ref)
      end

      # @return true or false
      def save(filename = nil, version = nil)
         res = false
         if filename.nil?
            # model needs to have been once saved already
            fail "NotImplemented"
         end
         if version.nil?
           su_res = SketchupFFI.save_to_file(@ref[:ptr], filename)
         else
            su_res = SketchupFFI.save_to_file_with_version(@ref[:ptr], filename, version)
         end
         return su_res == :SU_ERROR_NONE
      end

      # @return [String]
      def version
         major = FFI::MemoryPointer.new(:int)
         minor = FFI::MemoryPointer.new(:int)
         build = FFI::MemoryPointer.new(:int)
         SketchupFFI.SUModelGetVersion(@ref[:ptr], major, minor, build)
         "#{major.read_int}.#{minor.read_int}.#{build.read_int}"
      end

      # @return [String]
      def name
         s = SketchupFFI::SURef.new
         SketchupFFI.SUStringCreate s
         SketchupFFI.SUModelGetName @ref[:ptr], s
         n = FFI::MemoryPointer.new(:int)
         SketchupFFI.SUStringGetUTF8Length s[:ptr], n
         str = FFI::MemoryPointer.new(:string, n.read_int + 1)
         SketchupFFI.SUStringGetUTF8 s[:ptr], n.read_int + 1, str, n
         str.read_string
      end

      # @return [String]
      def name=(name)
         SketchupFFI.SUModelSetName(@ref[:ptr], name)
      end

      # @return [String]
      def path
         s = SketchupFFI::SURef.new
         SketchupFFI.SUStringCreate s
         SketchupFFI.SUModelGetPath @ref[:ptr], s
         n = FFI::MemoryPointer.new(:int)
         SketchupFFI.SUStringGetUTF8Length s[:ptr], n
         str = FFI::MemoryPointer.new(:string, n.read_int + 1)
         SketchupFFI.SUStringGetUTF8 s[:ptr], n.read_int + 1, str, n
         str.read_string
      end

   end # class Model
end # module Sketchup

