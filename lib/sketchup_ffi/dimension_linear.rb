require_relative "geometry"

module SketchupFFI
  SUHorizontalTextPositionType = enum(
    :Center,
    :OutsideStart,
    :OutsideEnd
  )

  SUVerticalTextPositionType = enum(
    :Center,
    :Above,
    :Below
  )

  SUDimensionLinearAlignmentType = enum(
    :Aligned,
    :Vertical,
    :Horizontal
  )

  attach_function(:SUDimensionLinearToDimension, [SUDimensionLinearRef], SUDimensionRef)
  attach_function(:SUDimensionLinearFromDimension, [SUDimensionRef], SUDimensionLinearRef)
  attach_function(:SUDimensionLinearCreate, [SUDimensionLinearRef, SUPoint3d, SUInstancePathRef, SUPoint3d, SUInstancePathRef, :double], SUResult)
  attach_function(:SUDimensionLinearRelease, [SUDimensionLinearRef], SUResult)
  attach_function(:SUDimensionLinearGetStartPoint, [SUDimensionLinearRef, SUPoint3d, SUInstancePathRef], SUResult)
  attach_function(:SUDimensionLinearSetStartPoint, [SUDimensionLinearRef, SUPoint3d, SUInstancePathRef], SUResult)
  attach_function(:SUDimensionLinearGetEndPoint, [SUDimensionLinearRef, SUPoint3d, SUInstancePathRef], SUResult)
  attach_function(:SUDimensionLinearSetEndPoint, [SUDimensionLinearRef, SUPoint3d, SUInstancePathRef], SUResult)
  attach_function(:SUDimensionLinearGetXAxis, [SUDimensionLinearRef, SUVector3d], SUResult)
  attach_function(:SUDimensionLinearSetXAxis, [SUDimensionLinearRef, SUVector3d], SUResult)
  attach_function(:SUDimensionLinearGetNormal, [SUDimensionLinearRef, SUVector3d], SUResult)
  attach_function(:SUDimensionLinearSetNormal, [SUDimensionLinearRef, SUVector3d], SUResult)
  attach_function(:SUDimensionLinearGetPosition, [SUDimensionLinearRef, SUPoint2d], SUResult)
  attach_function(:SUDimensionLinearSetPosition, [SUDimensionLinearRef, SUPoint2d], SUResult)
  attach_function(:SUDimensionLinearGetVerticalAlignment, [SUDimensionLinearRef, SUVerticalTextPositionType], SUResult)
  attach_function(:SUDimensionLinearSetVerticalAlignment, [SUDimensionLinearRef, SUVerticalTextPositionType], SUResult)
  attach_function(:SUDimensionLinearGetHorizontalAlignment, [SUDimensionLinearRef, SUHorizontalTextPositionType], SUResult)
  attach_function(:SUDimensionLinearSetHorizontalAlignment, [SUDimensionLinearRef, SUHorizontalTextPositionType], SUResult)
  attach_function(:SUDimensionLinearGetAlignment, [SUDimensionLinearRef, SUDimensionLinearAlignmentType], SUResult)
  attach_function(:SUDimensionLinearGetTextPosition, [SUDimensionLinearRef, SUPoint3d], SUResult)
end
