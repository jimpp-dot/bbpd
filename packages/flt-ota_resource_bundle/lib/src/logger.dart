import 'package:flutter/foundation.dart';

abstract class OtaLogBase {
  void d(dynamic msg, {String? tag, int wrapWidth = -1, bool prettyJson = false});
  void w(dynamic msg, {String? tag, int wrapWidth = -1, bool prettyJson = false});
  void i(dynamic msg, {String? tag});
  void v(dynamic msg, {String? tag});
  void e(dynamic msg,
      {StackTrace? stackTrace, String? tag, int wrapWidth = -1, bool upload = true, FlutterErrorDetails? details});
}

OtaLogBase? otaAssetBundleLogger;
