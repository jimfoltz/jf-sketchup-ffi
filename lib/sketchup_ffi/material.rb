module SketchupFFI

  attach_function(:SUMaterialCreate, [SUMaterialRef], SUResult)
  attach_function(:SUMaterialSetColor, [SUMaterialRef, SUColor], SUResult)
  attach_function(:SUMaterialSetName, [SUMaterialRef, :string], SUResult)

end
