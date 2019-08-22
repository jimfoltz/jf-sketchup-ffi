# read Options from model
require_relative '../lib/sketchup_ffi'
require_relative "string_helpers"
require_relative "typed_value_helpers"

include SketchupFFI

file = ARGV.shift
#file = "model.skp" if file.nil?

SketchupFFI.initialize

model = SUModelRef.new
if file
  puts "opening model: #{file}"
  model_create_from_file(model, file)
else
  puts "creating model"
  model_create(model)
end

options_mgr = SUOptionsManagerRef.new
model_get_options_manager(model[:ptr], options_mgr)

sz_ptr = FFI::MemoryPointer.new(:size_t)
options_manager_get_num_options_providers(options_mgr[:ptr], sz_ptr)
len = sz_ptr.read(:size_t)
ptr = FFI::MemoryPointer.new(SUStringRef, len)
strs = len.times.collect { |i|
  s = SUStringRef.new(ptr + i * SUStringRef.size)
  string_create(s)
  s
}
count = FFI::MemoryPointer.new(:size_t)
options_manager_get_options_provider_names(options_mgr[:ptr], len, ptr, count)
names = count.read_int.times.collect {|i| get_string(strs[i])}
strs.map {|s| string_release(s)}
p names
puts

provider = SUOptionsProviderRef.new

names.each {|name|
  puts "", name, ""
  options_manager_get_options_provider_by_name(options_mgr[:ptr], name, provider)
  options_provider_get_num_keys(provider[:ptr] , sz_ptr)
  len = sz_ptr.read(:size_t)
  ptr = FFI::MemoryPointer.new(SUStringRef, len)
  strs = len.times.collect {|i| SUStringRef.new(ptr + i * SUStringRef.size)}
  strs.size.times {|i| string_create(strs[i])}
  options_provider_get_keys(provider[:ptr], len, ptr, count)
  keys = count.read_int.times.collect {|i| get_string(strs[i])}
  strs.map {|s| string_release(s)}
  value = SUTypedValueRef.new
  typed_value_create(value)
  keys.each { |key|
    options_provider_get_value(provider[:ptr], key, value)
    puts "  #{key.ljust(20)} = #{typed_value_get_rb_value(value)}"
  }
  typed_value_release(value)
}

model_release(model)
terminate
