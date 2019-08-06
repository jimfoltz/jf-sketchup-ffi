require_relative "../lib/sketchup_ffi"

include SketchupFFI

SketchupFFI.initialize

model = SUModelRef.new
model_create(model)

name = "Good morning, ☼ ┌─┐ °  ™"
model_set_name model[:ptr], name
model_set_description model[:ptr], "Model₍₁₎"

model_save_to_file_with_version(
  model[:ptr],
  "model.skp",
  SUModelVersion[:SUModelVersion_SU2017]
)

model_release(model)
terminate

