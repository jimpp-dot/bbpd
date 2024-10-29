#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint aliyun_face_plugin.podspec` to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'ali_id_auth'
  s.version          = '2.2.2'
  s.summary          = 'A new Flutter plugin project.'
  s.description      = <<-DESC
A new Flutter plugin project.
                       DESC
  s.homepage         = 'http://example.com'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Your Company' => 'email@example.com' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.public_header_files = 'Classes/**/*.h'
  s.dependency 'Flutter'
  s.platform = :ios, '9.0'

  # Flutter.framework does not contain a i386 slice.
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386' }

  # 实人认证SDK framework库
  s.vendored_frameworks = 'Products/*.xcframework'

  # 系统framework库
  s.frameworks = 'ReplayKit', 'CoreGraphics', 'Accelerate', 'SystemConfiguration', 'AssetsLibrary',
                'CoreTelephony', 'QuartzCore', 'CoreFoundation', 'CoreLocation',
                'ImageIO', 'CoreMedia', 'CoreMotion', 'AVFoundation', 'WebKit',
                'AudioToolbox', 'CFNetwork', 'MobileCoreServices', 'AdSupport'
  # 系统C库              
  s.libraries = 'resolv', 'z', 'c++', 'c++.1', 'c++abi', 'z.1.2.8'

end
