#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint tracker.podspec' to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'thinking_analytics'
  s.version          = '2.8.0'
  s.summary          = '数数埋点.'
  s.description      = <<-DESC
A new flutter plugin project.
                       DESC
  s.homepage         = 'http://example.com'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Your Company' => 'email@example.com' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.public_header_files = 'Classes/**/*.h'
  s.dependency 'Flutter'
  s.dependency 'ThinkingSDK', '2.8.4-beta.6'
  s.platform = :ios, '9.0'
  s.frameworks = ["SystemConfiguration", "Security"]
  s.libraries = ["c++", "z", "sqlite3"]
  s.pod_target_xcconfig = {'OTHER_LDFLAGS' => ['-ObjC']}
end
