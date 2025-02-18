#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint pulse_im.podspec' to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'pulse_im'
  s.version          = '0.0.1'
  s.summary          = 'pulse_im Flutter plugin.'
  s.description      = <<-DESC
pulse_im Flutter plugin.
                       DESC
  s.homepage         = 'http://example.com'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Your Company' => 'email@example.com' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.vendored_frameworks = 'SDK/*.xcframework'
  s.dependency 'Flutter'
  s.platform = :ios, '8.0'

  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES' }
end
