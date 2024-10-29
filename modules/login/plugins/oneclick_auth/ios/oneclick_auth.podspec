#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint onekey.podspec' to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'oneclick_auth'
  s.version          = '0.0.1'
  s.summary          = '一键登录,目前使用阿里云.'
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
  s.resources = "Assets/*.png"
  s.platform = :ios, '8.0'
  s.vendored_frameworks = 'SDK/*.xcframework' 
  s.weak_frameworks = "Network"
  s.libraries = ["c++"]
  s.pod_target_xcconfig = {'OTHER_LDFLAGS' => ['-ObjC', '-framework', 'YTXOperators']}
end
