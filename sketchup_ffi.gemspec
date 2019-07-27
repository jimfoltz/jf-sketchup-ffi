require './lib/sketchup_ffi/version'

Gem::Specification.new do |s|
  s.name = 'sketchup_ffi'
  s.version = SketchupFFI::VERSION
  s.licenses = ['MIT']
  s.summary = 'A Ruby FFI wrapper for the SketchUp SDK.'
  s.authors = ['Jim Foltz']
  s.email = 'jim.foltz@gmail.com'
  s.homepage = 'https://github.com/jimfoltz/jf-sketchup-ffi'
  s.files = Dir['lib/**/*.rb']
end

