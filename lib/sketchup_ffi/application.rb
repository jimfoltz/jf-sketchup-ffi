module SketchupFFI

  attach_function(:SUApplicationGetActiveModel, [SUModelRef], SUResult)

end
