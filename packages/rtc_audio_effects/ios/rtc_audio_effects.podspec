#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint base_effect_core.podspec` to validate before publishing.
#

Pod::Spec.new do |s|
    s.name             = 'rtc_audio_effects'
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

    s.ios.deployment_target = '9.0'
    s.xcconfig = { 'OTHER_LDFLAGS' => '-framework RtcAudioEffectCore' }
    s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES' }

    s.subspec 'RtcAudioEffectCoreModule' do |sss|
       sss.source_files            = ''
       sss.ios.vendored_frameworks = 'SDK/RtcAudioEffectCore.xcframework'
    end
end
