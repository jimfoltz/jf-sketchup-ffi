module SketchupFFI

  attach_function(:SUEntityListIteratorCreate, [SUEntityListIteratorRef], SUResult)
  attach_function(:SUEntityListIteratorRelease, [SUEntityListIteratorRef], SUResult)
  attach_function(:SUEntityListIteratorGetEntity, [SUEntityListIteratorRef, SUEntityRef], SUResult)
  attach_function(:SUEntityListIteratorNext, [SUEntityListIteratorRef], SUResult)
  attach_function(:SUEntityListIteratorIsInRange, [SUEntityListIteratorRef, :bool_ptr], SUResult)

end
