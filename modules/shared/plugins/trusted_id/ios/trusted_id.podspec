#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint digitalunion.podspec' to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'trusted_id'
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
  s.platform = :ios, '8.0'
  #s.script_phase = { :name => 'Hello World',:script => 'podDir=$SRCROOT;projectDir=${podDir%ios/Pods*};if [ $EFFECTIVE_PLATFORM_NAME == -iphonesimulator ];then cp -rf $projectDir/modules/modules/.vendors/digitalunion/ios/SDK/debug/du.framework $projectDir/modules/modules/.vendors/digitalunion/ios/SDK;else cp -rf $projectDir/modules/modules/.vendors/digitalunion/ios/SDK/release/du.framework $projectDir/modules/modules/.vendors/digitalunion/ios/SDK;fi',:execution_position => :before_compile }

  # Flutter.framework does not contain a i386 slice. Only x86_64 simulators are supported.
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES' }

  s.subspec 'DigitalUnionSDK' do |sss|
  sss.source_files            = ''
  sss.ios.vendored_frameworks = 'SDK/du.xcframework'
  sss.ios.library = 'resolv'

  end
end
