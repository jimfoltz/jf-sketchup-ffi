# defs.rb

module SketchupFFI

  def self.define_ref(sym)
    ref_name = "SU#{sym}Ref"
    #const_set(ref_name, Class.new(SURef))
    const_set(ref_name, Class.new(FFI::Struct))
    const_get(ref_name).send :layout, :ptr, :pointer
  end

  define_ref(:ArcCurve)
  define_ref(:AttributeDictionary)
  define_ref(:Axes)
  define_ref(:Camera)
  define_ref(:Classifications)
  define_ref(:ClassificationAttribute)
  define_ref(:ClassificationInfo)
  define_ref(:ComponentDefinition)
  define_ref(:ComponentInstance)
  define_ref(:Curve)
  define_ref(:Dimension)
  define_ref(:DimensionLinear)
  define_ref(:DimensionRadial)
  define_ref(:DimensionStyle)
  define_ref(:DrawingElement)
  define_ref(:DynamicComponentInfo)
  define_ref(:DynamicComponentAttribute)
  define_ref(:Edge)
  define_ref(:EdgeUse)
  define_ref(:Entities)
  define_ref(:EntityList)
  define_ref(:EntityListIterator)
  define_ref(:Entity)
  define_ref(:Face)
  define_ref(:Font)
  define_ref(:GeometryInput)
  define_ref(:Group)
  define_ref(:GuideLine)
  define_ref(:GuidePoint)
  define_ref(:Image)
  define_ref(:ImageRep)
  define_ref(:InstancePath)
  define_ref(:Layer)
  define_ref(:LineStyle)
  define_ref(:LineStyles)
  define_ref(:Location)
  define_ref(:LoopInput)
  define_ref(:Loop)
  define_ref(:Material)
  define_ref(:MeshHelper)
  define_ref(:Model)
  define_ref(:Opening)
  define_ref(:OptionsManager)
  define_ref(:OptionsProvider)
  define_ref(:Polyline3d)
  define_ref(:RenderingOptions)
  define_ref(:Scene)
  define_ref(:Schema)
  define_ref(:SchemaType)
  define_ref(:SectionPlane)
  define_ref(:ShadowInfo)
  define_ref(:Style)
  define_ref(:Styles)
  define_ref(:Text)
  define_ref(:Texture)
  define_ref(:TextureWriter)
  define_ref(:TypedValue)
  define_ref(:UVHelper)
  define_ref(:Vertex)
  define_ref(:String)
  define_ref(:LengthFormatter)


  SURefType = enum [
    :Unknown,
    :AttributeDictionary,
    :Camera,
    :ComponentDefinition,
    :ComponentInstance,
    :Curve,
    :Edge,
    :EdgeUse,
    :Entities,
    :Face,
    :Group,
    :Image,
    :Layer,
    :Location,
    :Loop,
    :MeshHelper,
    :Material,
    :Model,
    :Polyline3D,
    :Scene,
    :Texture,
    :TextureWriter,
    :TypedValue,
    :UVHelper,
    :Vertex,
    :RenderingOptions,
    :GuidePoint,
    :GuideLine,
    :Schema,
    :SchemaType,
    :ShadowInfo,
    :Axes,
    :ArcCurve,
    :SectionPlane,
    :DynamicComponentInfo,
    :DynamicComponentAttribute,
    :Style,
    :Styles,
    :ImageRep,
    :InstancePath,
    :Font,
    :Dimension,
    :DimensionLinear,
    :DimensionRadial,
    :DimensionStyle,
    :Text,
    :EntityList,
    :EntityListIterator,
    :DrawingElement,
    :Entity,
    :LengthFormatter,
    :LineStyle,
    :LineStyleManager
  ]

end
