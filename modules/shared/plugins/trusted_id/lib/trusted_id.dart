import 'dart:async';

import 'package:flutter/services.dart';

class TrustedID {
  static const MethodChannel _channel = MethodChannel('ly.plugins.trusted_id');

  static Future<String> getQueryID(String channel, {String? extra}) async {
    final String? id = await _channel.invokeMethod('getQueryID', {
      'channel': channel,
      'extra': extra ?? ''
    }).timeout(const Duration(seconds: 5), onTimeout: () {
      return '';
    });
    return id ?? '';
  }

  static Future<String> get getOpenAnmsID async {
    final String id = await _channel
        .invokeMethod('getOpenAnmsID')
        .timeout(const Duration(seconds: 5), onTimeout: () {
      return '';
    });
    return id;
  }

  static void setConfig(String key, String value) {
    _channel.invokeMethod('setConfig', {'key': key, 'value': value});
  }

  static void setData(String key, String value) {
    _channel.invokeMethod('setData', {'key': key, 'value': value});
  }
}
