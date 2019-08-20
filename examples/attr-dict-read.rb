require_relative '../lib/sketchup_ffi'
require_relative "attr_dict_helpers"

include SketchupFFI

file = ARGV.shift
file = "model.skp" if file.nil?

SketchupFFI.initialize

model = SUModelRef.new
model_create_from_file(model, file)

dict = SUAttributeDictionaryRef.new
model_get_attribute_dictionary(model[:ptr], "My Dictionary", dict)
keys = attr_dict_get_keys(dict)

value = SUTypedValueRef.new
typed_value_create(value)

keys.each { |key|
  attribute_dictionary_get_value(dict[:ptr], key, value)
  n = FFI::MemoryPointer.new(:int)
  typed_value_get_type(value[:ptr], n)
  read_type = SUTypedValueType[n.read(:int)]
  v = SketchupFFI.typed_value_get_rb_value(value)
  puts "#{key.inspect.ljust(20)} => #{v.inspect} <#{v.class}> (read type: #{read_type})"
}

