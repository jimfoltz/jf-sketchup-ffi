require_relative '../lib/sketchup_ffi'
require_relative "attr_dict_helpers"
require_relative "typed_value_helpers"

include SketchupFFI

SketchupFFI.initialize

model = SUModelRef.new
model_create(model)

dict = SUAttributeDictionaryRef.new
model_get_attribute_dictionary(model[:ptr], "My Dictionary", dict)

value = SUTypedValueRef.new
typed_value_create(value)
SketchupFFI.set_invalid(value)

attr_dict_set_value(dict, "Boolean True", true)
attr_dict_set_value(dict, "Boolean False", false)
attr_dict_set_value(dict, "String", "String Value®")
attr_dict_set_value(dict, "Zero", 0)
attr_dict_set_value(dict, "127", 127)
attr_dict_set_value(dict, "126", 126)
attr_dict_set_value(dict, "-2**31", -2**31)
attr_dict_set_value(dict, "2**31 - 1", 2**31 - 1)
attr_dict_set_value(dict, "0.0", 0.0)
attr_dict_set_value(dict, "Float1::MIN", 1.175494e-38)
attr_dict_set_value(dict, "Float2::MIN", Float::MIN)
attr_dict_set_value(dict, "Float2::MAX", Float::MAX)

color = SUColor.create(205, 128, 96)
attr_dict_set_value(dict, "Color", color)

vector = SUVector3d.create(0, 0, 1)
attr_dict_set_value(dict, "Vector3d", vector)

ary = 3.times.collect{rand(100)}
attr_dict_set_value(dict, "Array<int>", ary)
attr_dict_set_value(dict, "Array<String>", ['a', 'b'])
attr_dict_set_value(dict, "Array<mixed>", [1, 2.0, 'b', "str", color])
attr_dict_set_value(dict, "Array<nested>", [1, 2.0, [4,5, vector], 'b', "str", color])
attr_dict_set_value(dict, "Array<nested-deep>", [1, [2, [3, [4, [5, 'a']]]]])

#SketchupFFI.attr_dict_set_value(dict, "SUPoint3d", SUPoint3d.create(1,2,3))

puts "saving model.skp"
p model_save_to_file_with_version(
   model[:ptr],
   "model.skp",
   SUModelVersion[:SUModelVersion_SU2017]
)

terminate
