module SketchupFFI
  attach_function(:SUDegreesToRadians, [:double], :double)
  attach_function(:SURadiansToDegrees, [:double], :double)
  attach_function(:SUEquals, [:double, :double], :bool)
  attach_function(:SULessThan, [:double, :double], :bool)
  attach_function(:SULessThanOrEqual, [:double, :double], :bool)
  attach_function(:SUGreaterThan, [:double, :double], :bool)
  attach_function(:SUGreaterThanOrEqual, [:double, :double], :bool)
end
