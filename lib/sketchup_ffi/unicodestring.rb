# unicodestring.rb

module SketchupFFI
  attach_function(:SUStringCreate, [SUStringRef], SUResult)
  attach_function(:SUStringGetUTF8, [SUStringRef, :size_t, :buffer_out, :size_ptr], SUResult)
  attach_function(:SUStringGetUTF8Length, [SUStringRef, :size_ptr], SUResult)
  attach_function(:SUStringRelease, [SUStringRef], SUResult)
  attach_function(:SUStringCreateFromUTF8, [SUStringRef, :string], SUResult)
  attach_function(:SUStringCreateFromUTF16, [SUStringRef, :string], SUResult)
  attach_function(:SUStringGetUTF16Length, [SUStringRef, :size_ptr], SUResult)
  attach_function(:SUStringSetUTF8, [SUStringRef, :string], SUResult)
  attach_function(:SUStringSetUTF16, [SUStringRef, :string], SUResult)
  attach_function(:SUStringGetUTF16, [SUStringRef, :size_t, :buffer_out, :size_ptr], SUResult)
  attach_function(:SUStringTrimLeft, [SUStringRef], SUResult)
  attach_function(:SUStringTrimRight, [SUStringRef], SUResult)
  attach_function(:SUStringCompare, [SUStringRef, SUStringRef, :int_ptr], SUResult)

  # string helper
  def self.get_string(ref)
    n = FFI::MemoryPointer.new(:size_t)
    res = SketchupFFI.string_get_utf8_length(ref[:ptr], n)
    str = FFI::MemoryPointer.new(:buffer_out, n.read_int + 1)
    res = SketchupFFI.string_get_utf8(ref[:ptr], n.read_int + 1, str, n)
    str.read_string
  end
end
