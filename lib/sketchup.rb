#require_relative 'sketchup-ffi-lib'
require_relative 'model'

module Sketchup

   # @return [Module] The Sketchup module.
   def self.file_new
      ref = SketchupFFI::SURef.new
      SketchupFFI.create_model(ref)
      @model = Model.new(ref)
      Sketchup
   end

   # @return [Boolean]
   def self.open_file(filename)
      ref = SketchupFFI::SURef.new
      res = SketchupFFI.create_from_file(ref, filename)
      @model = Model.new(ref)
      res
   end

   # @return [Sketchup::Model]
   def self.active_model
      @model
   end

end # module Sketchup

