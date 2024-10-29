#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#
Pod::Spec.new do |s|
  s.name             = 'flutter_bugly'
  s.version          = '0.0.1'
  s.summary          = 'A new flutter plugin project.'
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
  s.static_framework = true

  s.ios.deployment_target = '8.0'
  s.subspec 'BuglySDK' do |sss|
    sss.source_files            = ''
    sss.ios.vendored_frameworks = 'SDK/Bugly.xcframework'
    #sss.ios.public_header_files   = 'SocialLibraries/**/*.{h}'
  end
end

