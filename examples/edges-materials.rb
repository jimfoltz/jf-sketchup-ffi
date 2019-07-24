# https://forums.sketchup.com/t/c-sdk-suedgesetcolor-seems-to-create-a-new-auto-material-for-every-call/98521

require_relative '../lib/sketchup_ffi'

include SketchupFFI

SketchupFFI.initialize

model = SUModelRef.new
model_create(model)
ents  = SUEntitiesRef.new
model_get_entities(model[:ptr], ents)

color1 = SUColor.create(255, 0, 0)
color2 = SUColor.create(0, 255, 0)
color3 = SUColor.create(0, 0, 255)

material1 = SUMaterialRef.new
material_create(material1)
material_set_name(material1[:ptr], "MyMaterial1")
material_set_color(material1[:ptr], color1)

material2 = SUMaterialRef.new
material_create(material2)
material_set_name(material2[:ptr], "MyMaterial2")
material_set_color(material2[:ptr], color2)

materials_ary = [material1, material2]
materials = FFI::MemoryPointer.new(:pointer, materials_ary.length)
materials.put_array_of_pointer(0, materials_ary.map{|e| e[:ptr]})
res = model_add_materials(model[:ptr], materials_ary.length, materials)

edge1 = SUEdgeRef.new
start1 = SUPoint3d.new
end1 = SUPoint3d.create(5, 5, 5)
edge_create(edge1, start1, end1)
#edge_set_color edge1[:ptr], color1
ptr = edge_to_drawing_element(edge1)
de = SUDrawingElementRef.new(ptr)
drawing_element_set_material(de[:ptr], material1[:ptr])


edge2 = SUEdgeRef.new
start2 = SUPoint3d.create(2, 2, 2)
end2 = SUPoint3d.create(11, 2, 3)
edge_create(edge2, start2, end2)
#edge_set_color edge2[:ptr], color2
ptr = edge_to_drawing_element(edge2)
de = SUDrawingElementRef.new(ptr)
drawing_element_set_material(de[:ptr], material2[:ptr])

edge3 = SUEdgeRef.new
start3 = SUPoint3d.create(3, 3, 0)
end3 = SUPoint3d.create(9, 9, 0)
edge_create(edge3, start3, end3)
#edge_set_color edge3[:ptr], color3

edges_ary = [edge1, edge2, edge3]
edges = FFI::MemoryPointer.new(:pointer, edges_ary.length)
edges.put_array_of_pointer(0, edges_ary.map{|e| e[:ptr]})

#res = entities_add_edges ents[:ptr], 1, edge1.pointer
res = entities_add_edges(ents[:ptr], edges_ary.length, edges)
p res

# Set the Edge Color By Material option
r_opts = SURenderingOptionsRef.new
model_get_rendering_options(model[:ptr], r_opts)
value = SUTypedValueRef.new
typed_value_set_byte(value, 0)
rendering_options_set_value(r_opts[:ptr], "EdgeColorMode", value)


if res == :SU_ERROR_NONE
   puts "Saving model."
   model_save_to_file_with_version(
     model[:ptr],
     "#{File.basename(__FILE__, ".rb")}.skp",
     SUModelVersion[:SUModelVersion_SU2017]
   )
end

terminate

