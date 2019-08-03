module SketchupFFI

  SUStylePropertyType = enum(
    :SUStyleEdgesColor,
    :SUStyleEdgesExtensionsEnabled,
    :SUStyleEdgesExtensionLength,
    :SUStyleEdgesProfilesEnabled,
    :SUStyleEdgesProfileWidth,
    :SUStyleEdgesDepthCueEnabled ,
    :SUStyleEdgesDepthCueLevels,
    :SUStyleBackgroundColor
  )

  attach_function(:SUStyleCreate, [SUStyleRef], SUResult)
  attach_function(:SUStyleCreateFromFile, [SUStyleRef, :string], SUResult)
  attach_function(:SUStyleRelease, [SUStyleRef], SUResult)
  attach_function(:SUStyleToEntity, [SUStyleRef], SUResult)
  attach_function(:SUStyleFromEntity, [SUEntityRef], SUResult)
  attach_function(:SUStyleSetName, [SUStyleRef, :string], SUResult)
  attach_function(:SUStyleGetName, [SUStyleRef, SUStringRef], SUResult)
  attach_function(:SUStyleGetDisplayName, [SUStyleRef, SUStringRef], SUResult)
  attach_function(:SUStyleSetDescription, [SUStyleRef, :string], SUResult)
  attach_function(:SUStyleGetDescription, [SUStyleRef, SUStringRef], SUResult)
  attach_function(:SUStyleGetPath, [SUStyleRef, SUStringRef], SUResult)
  attach_function(:SUStyleGetGuid, [SUStyleRef, SUStringRef], SUResult)
  attach_function(:SUStyleGetDisplaysWatermark, [SUStyleRef, :bool_ptr], SUResult)
  attach_function(:SUStyleSaveToFile, [SUStyleRef, :string], SUResult)
  attach_function(:SUStyleSetProperty, [SUStyleRef, SUStylePropertyType, SUTypedValueRef], SUResult)
  attach_function(:SUStyleGetProperty, [SUStyleRef, SUStylePropertyType, SUTypedValueRef], SUResult)
  attach_function(:SUStyleGetThumbnail, [SUStyleRef, SUImageRepRef], SUResult)

end
