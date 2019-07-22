require_relative '..\lib\sketchup-ffi'

include SketchupFFI

# Always initialize the API before using it
initialize

# Create an empty model
model = SUModelRef.new
model_create(model)

# Return codes are automatically checked from each function call.
# A SUError exception is raised if the call fails.

# Get the entities container of the model
entities = SUEntitiesRef.new
model_get_entities(model[:ptr], entities)

outer_loop = SULoopInputRef.new
loop_input_create(outer_loop)
4.times {|i|
   loop_input_add_vertex_index(outer_loop[:ptr], i)
}

vertices = [
   [0,   0,   0],
   [100, 100, 0],
   [100, 100, 100],
   [0,   0,   100]
]
n = vertices.length
ptr = FFI::MemoryPointer.new(SUPoint3d, n)
pts = n.times.map {|i|
   SUPoint3d.new(ptr + i * SUPoint3d.size)
}
vertices.each_with_index {|pt, i|
   pts[i][:x] = pt[0]
   pts[i][:y] = pt[1]
   pts[i][:z] = pt[2]
}

# Create the face
face = SUFaceRef.new
face_create(face, ptr, outer_loop)

# Add the face to the entities
entities_add_faces(entities[:ptr], 1, face)

# Save the model to file
model_save_to_file_with_version(
   model[:ptr],
   "model.skp",
   SUModelVersion[:SUModelVersion_SU2017]
)

# Release the model to avoid memory leaks
model_release(model)

# Always terminate the API when done
terminate
