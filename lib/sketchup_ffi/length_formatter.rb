module SketchupFFI

  SULengthFormatType = enum(
    :DECIMAL,
    :ARCHITECTURAL,
    :ENGINEERING,
    :FRACTIONAL
  )

  SULengthUnitType = enum(
    :INCHES,
    :FEET,
    :MILLIMETER,
    :CENTIMETER,
    :METER
  )

  SUAreaUnitType = enum(
    :SQUARE_INCHES,
    :SQUARE_FEET,
    :SQUARE_MILLIMETER,
    :SQUARE_CENTIMETER,
    :SQUARE_METER
  )

  SUVolumeUnitType = enum(
    :CUBIC_INCHES,
    :CUBIC_FEET,
    :CUBIC_MILLIMETERS,
    :CUBIC_CENTIMETER,
    :CUBIC_METER
  )

  attach_function(:SULengthFormatterCreate, [SULengthFormatterRef], SUResult)
  attach_function(:SULengthFormatterRelease, [SULengthFormatterRef], SUResult)
  attach_function(:SULengthFormatterGetPrecision, [SULengthFormatterRef, :size_ptr], SUResult)
  attach_function(:SULengthFormatterSetPrecision, [SULengthFormatterRef, :size_t], SUResult)
  attach_function(:SULengthFormatterGetFormat, [SULengthFormatterRef, SULengthFormatType], SUResult)
  attach_function(:SULengthFormatterSetFormat, [SULengthFormatterRef, SULengthFormatType], SUResult)
  attach_function(:SULengthFormatterGetUnits, [SULengthFormatterRef, SULengthUnitType], SUResult)
  attach_function(:SULengthFormatterGetAreaUnits, [SULengthFormatterRef, SUAreaUnitType], SUResult)
  attach_function(:SULengthFormatterGetVolumeUnits, [SULengthFormatterRef, SUVolumeUnitType], SUResult)
  attach_function(:SULengthFormatterSetUnits, [SULengthFormatterRef, SULengthUnitType], SUResult)
  attach_function(:SULengthFormatterSetAreaUnits, [SULengthFormatterRef, SUAreaUnitType], SUResult)
  attach_function(:SULengthFormatterSetVolumeUnits, [SULengthFormatterRef, SUVolumeUnitType], SUResult)
  attach_function(:SULengthFormatterGetSuppressUnits, [SULengthFormatterRef, :bool_ptr], SUResult)
  attach_function(:SULengthFormatterSetSuppressUnits, [SULengthFormatterRef, :bool], SUResult)
  attach_function(:SULengthFormatterGetLengthString, [SULengthFormatterRef, :double, :bool, SUStringRef], SUResult)
  attach_function(:SULengthFormatterGetAreaString, [SULengthFormatterRef, :double, SUStringRef], SUResult)
  attach_function(:SULengthFormatterGetVolumeString, [SULengthFormatterRef, :double, SUStringRef], SUResult)
  attach_function(:SULengthFormatterParseString, [SULengthFormatterRef, SUStringRef, :double_ptr], SUResult)
  attach_function(:SULengthFormatterSetForceInchDisplay, [SULengthFormatterRef, :bool], SUResult)
  attach_function(:SULengthFormatterGetForceInchDisplay, [SULengthFormatterRef, :bool_ptr], SUResult)

end
