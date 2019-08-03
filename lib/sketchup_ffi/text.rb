module SketchupFFI

  SUTextLeaderType = enum(
    :None,
    :ViewBased,
    :PushPin
  )

attach_function(:SUTextToEntity, [SUTextRef], SUEntityRef)
attach_function(:SUTextFromEntity, [SUEntityRef], SUTextRef)
attach_function(:SUTextToDrawingElement, [SUTextRef], SUDrawingElementRef)
attach_function(:SUTextFromDrawingElement, [SUDrawingElementRef], SUTextRef)
attach_function(:SUTextCreate, [SUTextRef], SUResult)
attach_function(:SUTextRelease, [SUTextRef], SUResult)
attach_function(:SUTextSetString, [SUTextRef, :string], SUResult)
attach_function(:SUTextGetString, [SUTextRef, SUStringRef], SUResult)
attach_function(:SUTextSetFont, [SUTextRef, SUFontRef], SUResult)
attach_function(:SUTextGetFont, [SUTextRef, SUFontRef], SUResult)
attach_function(:SUTextSetLeaderType, [SUTextRef, SUTextLeaderType], SUResult)
attach_function(:SUTextGetLeaderType, [SUTextRef, SUTextLeaderType], SUResult)
attach_function(:SUTextSetArrowType, [SUTextRef, SUArrowType], SUResult)
attach_function(:SUTextGetArrowType, [SUTextRef, SUArrowType], SUResult)
attach_function(:SUTextSetPoint, [SUTextRef, SUPoint3d, SUInstancePathRef], SUResult)
attach_function(:SUTextGetPoint, [SUTextRef, SUPoint3d, SUInstancePathRef], SUResult)
attach_function(:SUTextSetLeaderVector, [SUTextRef, SUVector3d], SUResult)
attach_function(:SUTextGetLeaderVector, [SUTextRef, SUVector3d], SUResult)
attach_function(:SUTextSetColor, [SUTextRef, SUColor], SUResult)
attach_function(:SUTextGetColor, [SUTextRef, SUColor], SUResult)
attach_function(:SUTextSetScreenPosition, [SUTextRef, :double, :double], SUResult)
attach_function(:SUTextGetScreenPosition, [SUTextRef, :double_ptr, :double_ptr], SUResult)

end
