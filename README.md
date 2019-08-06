# sketchup_ffi


## What is this?

`sketchup_ffi` is a Ruby [FFI](https://github.com/ffi/ffi) library which
defines the data structures and functions of the [SketchUp
SDK](https://extensions.sketchup.com/en/developer_center/sketchup_sdk) shared
libraries.  

I believe this library is in parity with the C SDK 2019.1.222 although I'm sure
there some typos and bugs. Please open an
[issue](https://github.com/jimfoltz/jf-sketchup-ffi/issues) if you find one.

## Translating C function names to Ruby

The rule for transforming the C function names to ruby is pretty simple:

  * Drop the first 2 characters "SU", and snake-case the rest. 

Here are some examples:

| C Function | | Ruby method |
| :--- | --- | :--- |
| `SUModelCreate` |  | `model_create` |
|`SUAxesGetYAxis` |  | `axes_get_y_axis` |
| `SUVector3dAngleBetween` | | `vector3d_angle_between` |

See [methods.md](methods.md) for the full list.

## FFI::NotFound

Sketchup_ffi will attempt to create all defined c functions regardless
if they exists in the shared library.  If a function does not exist, `FFI::NotFoundError`
error will be printed but the ruby method is still defined. The Ruby method
will raise a `NotImplemented` Exception.

## SUResult

If a c function returns a `SU_RESULT`, its Ruby equivalent will automatically raise a `SUError` exception
if the return value is not `SU_ERROR_NONE`.

If you want to handle the return value yourself, a "bang" method is also created without error checking. For example:

| C Func | Ruby method with exceptions | Bang method  |
| :--- | :--- | :--- |
| SUModelCreate | model_create | model_create! |







## Example Code

This example is a direct translation of the official SketchUp SDK example for
writing to a .skp file.

### Writing to a .skp file

```ruby
require_relative '..\lib\sketchup-ffi'

include SketchupFFI

# Always initialize the API before using it
initialize

# Create an empty model
model = SUModelRef.new
model_create(model)

# Return codes are automatically checked for each function call.
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
```
