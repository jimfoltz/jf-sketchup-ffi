# guide-point.rb
module SketchupFFI

  attach_function(:SUGuidePointCreate, [SUGuidePointRef, :pointer], SUResult)

end
