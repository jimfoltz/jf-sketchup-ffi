
module SketchupFFI
  attach_function(:SUInitialize, [], :void)
  attach_function(:SUTerminate, [], :void)
  attach_function(:SUGetAPIVersion, [:int_ptr, :int_ptr], :int)
end
