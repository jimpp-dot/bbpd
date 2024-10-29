import Flutter
import UIKit

public class SwiftAudioVolumeProbPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "ly.plugins.audio_volume_prob", binaryMessenger: registrar.messenger())
    let instance = SwiftAudioVolumeProbPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    result("iOS " + UIDevice.current.systemVersion)
  }
}
