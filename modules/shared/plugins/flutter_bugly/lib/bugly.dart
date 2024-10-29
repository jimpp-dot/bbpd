import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter/foundation.dart';
import 'package:dog/dog.dart';

class Bugly {
  static const MethodChannel _channel = MethodChannel('flutter_bugly');
  static bool enable = true;

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  static onError(FlutterErrorDetails details) {
    reportError(details.exception, details.stack);
  }

  static setup() {
    if (FlutterError.onError != null) {
      final original = FlutterError.onError!;
      FlutterError.onError = (FlutterErrorDetails details) {
        original(details);
        Bugly.onError(details);
      };
    } else {
      FlutterError.onError = Bugly.onError;
    }
  }

  static Future<void> infoLog(String info) async {
    if (!enable) return;

    _channel.invokeMethod("infoLog", {"info": info});
  }

  static Future<void> reportError(
      dynamic exception, StackTrace? stackTrace) async {
    dog.e(exception, stackTrace: stackTrace);
    if (!enable) return;

    _channel.invokeMethod("reportError", {
      "exception": exception.toString(),
      "stackTrace": stackTrace != null ? stackTrace.toString() : '',
    });
  }

  static Future<void> setUserId(String userId) async {
    _channel.invokeMethod("setUserId", {"userId": userId});
  }
}
