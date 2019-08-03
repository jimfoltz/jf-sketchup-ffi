module SketchupFFI
  attach_function(:SULocationGetLatLong, [SULocationRef, :double_ptr, :double_ptr], SUResult)
  attach_function(:SULocationSetLatLong, [SULocationRef, :double, :double], SUResult)
  attach_function(:SULocationSetNorthAngle, [SULocationRef, :double], SUResult)
end
