import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'aliyun_face_plugin_platform_interface.dart';

/// An implementation of [AliyunFacePluginPlatform] that uses method channels.
class MethodChannelAliyunFacePlugin extends AliyunFacePluginPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('ly.plugins.ali_id_auth');

  @override
  Future<String?> getPlatformVersion() async {
    final version =
        await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }

  @override
  Future<void> init() async {
    await methodChannel.invokeMethod<String>('init');
  }

  @override
  Future<String?> getMetaInfos() async {
    final facetMetaInfo =
        await methodChannel.invokeMethod<String>('getMetaInfos');
    return facetMetaInfo;
  }

  @override
  Future<String?> verify(String key, String value) async {
    Map<String, String> params = {key: value};
    final code = await methodChannel.invokeMethod<String>('verify', params);
    return code;
  }
}
