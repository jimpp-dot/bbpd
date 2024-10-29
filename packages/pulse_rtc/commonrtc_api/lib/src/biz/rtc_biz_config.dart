import 'package:commonrtc_api/commonrtc_api.dart';

/// 引擎配置项目
class RtcBizConfig {
  static const int rtcTypeAgora = 1;
  static const int rtcTypeZego = 2;
  static const int rtcTypeCommon = 3;
  static const int rtcTypeTencent = 4;

  static EngineConfig? _agoraConfig;
  static EngineConfig? _zegoConfig;
  static EngineConfig? _commonConfig;
  static EngineConfig? _tencentConfig;

  /// 目前即构使用
  static int? ansMode;

  static EngineConfig get zegoConfig => _zegoConfig!.copyWith(
        appId: _zegoConfig!.appId,
        appSign: _zegoConfig!.appSign,
        isTestEnv: _zegoConfig!.isTestEnv,
        profile: _zegoConfig!.profile,
        enablePlatformView: _zegoConfig!.enablePlatformView,
        enableMultiRoom: _zegoConfig!.enableMultiRoom,
      );

  static EngineConfig get commonConfig => _commonConfig!;

  static EngineConfig get agoraConfig => _agoraConfig!;

  static EngineConfig get tencentConfig => _tencentConfig!.copyWith(
        appId: _tencentConfig!.appId,
        appSign: _tencentConfig!.appSign,
        isTestEnv: _tencentConfig!.isTestEnv,
        profile: _tencentConfig!.profile,
        enablePlatformView: _tencentConfig!.enablePlatformView,
        enableMultiRoom: _zegoConfig!.enableMultiRoom,
      );

  static initConfig({
    EngineConfig? agoraConfig,
    EngineConfig? zegoConfig,
    EngineConfig? commonConfig,
    EngineConfig? tencentConfig,
    bool debugLog = false,
  }) {
    _agoraConfig = agoraConfig;
    _zegoConfig = zegoConfig;
    _commonConfig = commonConfig;
    _tencentConfig = tencentConfig;
    RtcEngine.debug = debugLog;
  }

  static updateConfig({
    EngineConfig? agoraConfig,
    EngineConfig? zegoConfig,
    EngineConfig? commonConfig,
    EngineConfig? tencentConfig,
    bool? debugLog,
  }) {
    if (agoraConfig != null) _agoraConfig = agoraConfig;
    if (zegoConfig != null) _zegoConfig = zegoConfig;
    if (commonConfig != null) _commonConfig = commonConfig;
    if (tencentConfig != null) _tencentConfig = tencentConfig;
    if (debugLog != null) RtcEngine.debug = debugLog;
  }
}
