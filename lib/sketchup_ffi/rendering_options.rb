# rendering_options.rb
module SketchupFFI

  attach_function(:SURenderingOptionsGetNumKeys, [SURenderingOptionsRef, :size_ptr], SUResult)

  attach_function(:SURenderingOptionsGetKeys, [SURenderingOptionsRef, :size_t, SUStringRef, :size_ptr], SUResult)

  attach_function(:SURenderingOptionsSetValue, [SURenderingOptionsRef, :string, SUTypedValueRef], SUResult)

  attach_function(:SURenderingOptionsGetValue, [SURenderingOptionsRef, :string, SUTypedValueRef], SUResult)

end
