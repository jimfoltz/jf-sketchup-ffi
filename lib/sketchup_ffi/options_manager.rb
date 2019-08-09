module SketchupFFI
  attach_function(:SUOptionsManagerGetNumOptionsProviders, [SUOptionsManagerRef, :size_ptr], SUResult)
  attach_function(:SUOptionsManagerGetOptionsProviderNames, [SUOptionsManagerRef, :size_t, SUStringRef, :size_ptr], SUResult)
  attach_function(:SUOptionsManagerGetOptionsProviderByName, [SUOptionsManagerRef, :string, SUOptionsProviderRef], SUResult)
end
