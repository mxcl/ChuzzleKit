Pod::Spec.new do |s|
  s.name = 'ChuzzleKit'
  s.version = '1.0.3'
  s.requires_arc = true
  s.source_files = '*.{m,h}'
  s.source = { :git => "https://github.com/mxcl/#{s.name}.git", :tag => s.version }
  s.compiler_flags = '-fmodules'
  s.license = 'MIT'
  s.summary = 'A chuzzled object is `nil` if it is falsy, otherwise it has its falsy parts removed.'
end
