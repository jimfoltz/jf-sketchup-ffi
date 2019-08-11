require_relative "../lib/sketchup_ffi"

include SketchupFFI

SketchupFFI.initialize

vertices = [
  [0, 0, 0],
  [10, 0, 0],
  [10, 10, 0],
  [0, 10, 0],
]
n = vertices.length

# Allocate block of memory large enough for n SUPoint3d Structs
ptr = FFI::MemoryPointer.new(SUPoint3d, n)

pts = n.times.collect { |i|
  # create a SUPoint3d Struct at index * size() offsets in the memory block
  # FFI Structs use pointer arithmetic
  offset = i * SUPoint3d.size
  SUPoint3d.new(ptr + offset)
}

# Set the members of the SUPoint3d objects from the points array
vertices.each_with_index { |pt, i|
  pts[i][:x] = pt[0]
  pts[i][:y] = pt[1]
  pts[i][:z] = pt[2]
}

face = SUFaceRef.new
face_create_simple(face, ptr, n)

model = SUModelRef.new
model_create(model)
entities = SUEntitiesRef.new
model_get_entities(model[:ptr], entities)
entities_add_faces(entities[:ptr], 1, face)

puts "saving model.skp"
p model_save_to_file_with_version(
  model[:ptr],
  "model.skp",
  SUModelVersion[:SUModelVersion_SU2017]
)

model_release(model)
terminate
