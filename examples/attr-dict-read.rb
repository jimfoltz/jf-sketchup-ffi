require_relative '../lib/sketchup_ffi'

include SketchupFFI

file = ARGV.shift
file = "model.skp" if file.nil?

SketchupFFI.initialize

model = SUModelRef.new
model_create_from_file model, file

dict = SUAttributeDictionaryRef.new
model_get_attribute_dictionary model[:ptr], "My Dictionary", dict
keys = SketchupFFI.attr_dict_get_keys dict

value = SUTypedValueRef.new
typed_value_create value

keys.each {|key|
  attribute_dictionary_get_value dict[:ptr], key, value
  v = SketchupFFI.typed_value_get_rb_value(value)
  puts "#{key.inspect.ljust(20)} => #{v.inspect} <#{v.class}>"
}

