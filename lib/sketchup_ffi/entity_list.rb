module SketchupFFI

  attach_function(:SUEntityListCreate, [SUEntityListRef], SUResult)
  attach_function(:SUEntityListRelease, [SUEntityListRef], SUResult)
  attach_function(:SUEntityListBegin, [SUEntityListRef, SUEntityListIteratorRef], SUResult)
  attach_function(:SUEntityListSize, [SUEntityListRef, :size_ptr], SUResult)

end
