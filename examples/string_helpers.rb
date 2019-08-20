# string helper
def get_string(ref)
  n = FFI::MemoryPointer.new(:size_t)
  res = SketchupFFI.string_get_utf8_length(ref[:ptr], n)
  str = FFI::MemoryPointer.new(:buffer_out, n.read_int + 1)
  res = SketchupFFI.string_get_utf8(ref[:ptr], n.read_int + 1, str, n)
  str.read_string
end
