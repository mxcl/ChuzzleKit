Pod::Spec.new do |s|
  s.name = 'ChuzzleKit'

  `xcodebuild -project #{s.name}.xcodeproj -showBuildSettings` =~ /CURRENT_PROJECT_VERSION = ((\d\.)+\d)/
  abort("No version detected") if $1.nil?

  s.ios.deployment_target = '6.0'
  s.osx.deployment_target = '10.6'
  s.watchos.deployment_target = '2.0'
  s.tvos.deployment_target = '9.0'

  s.version = $1
  s.requires_arc = true
  s.source_files = 'Sources/*.{m,h}'
  s.source = { :git => "https://github.com/mxcl/#{s.name}.git", :tag => s.version }
  s.license = 'MIT'
  s.summary = 'A chuzzled object is `nil` if it is falsy, otherwise it has its falsy parts removed.'

  s.homepage = "http://github.com/mxcl/#{s.name}"
  s.social_media_url = 'https://twitter.com/mxcl'
  s.authors  = { 'Max Howell' => 'mxcl@me.com' }
end
