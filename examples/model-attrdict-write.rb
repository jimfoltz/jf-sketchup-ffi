require_relative '../lib/sketchup_ffi'

include SketchupFFI

model = SUModelRef.new
model_create(model)

dict = SUAttributeDictionaryRef.new
model_get_attribute_dictionary(model[:ptr], "My Dictionary", dict)

value = SUTypedValueRef.new
typed_value_create(value)
SketchupFFI.set_invalid value

byte_value = SUTypedValueRef.new
typed_value_create byte_value
typed_value_set_byte(byte_value, 65)
attribute_dictionary_set_value(dict[:ptr], "Byte", byte_value)

SketchupFFI.set_invalid value
typed_value_set_string(value, "I am a © String")
attribute_dictionary_set_value(dict[:ptr], "String", value)

SketchupFFI.set_invalid value
typed_value_set_bool(value, true)
attribute_dictionary_set_value(dict[:ptr], "Bool", value)

color = SUColor.create(205, 128, 96)
SketchupFFI.set_invalid value
typed_value_set_color(value, color)
attribute_dictionary_set_value(dict[:ptr], "Color", value)

SketchupFFI.set_invalid value
float_value = SUTypedValueRef.new
typed_value_create(float_value)
typed_value_set_float(float_value, 8.8)
attribute_dictionary_set_value(dict[:ptr], "Float", float_value)

SketchupFFI.set_invalid value
typed_value_set_double(value, 2.2)
attribute_dictionary_set_value(dict[:ptr], "Double", value)

SketchupFFI.set_invalid value
typed_value_set_int32(value, 2**31 - 1 )
attribute_dictionary_set_value(dict[:ptr], "Int32", value)

SketchupFFI.set_invalid value
typed_value_set_int16(value, 2**15 - 1)
attribute_dictionary_set_value(dict[:ptr], "Int16", value)

vector = SUVector3d.create(0, 0, 1)
SketchupFFI.set_invalid value
typed_value_set_vector3d(value, vector)
attribute_dictionary_set_value(dict[:ptr], "Vector3d", value)

puts "saving model.skp"
p model_save_to_file_with_version(
   model[:ptr],
   "model.skp",
   SUModelVersion[:SUModelVersion_SU2017]
)
