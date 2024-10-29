library flt_push;

import 'package:shared/shared.dart';
import 'package:flutter/services.dart';

class FlutterPush {
  ///Flutter通过方法调用native
  static const MethodChannel _methodChannel =
      MethodChannel('ly.plugins.flt_push');

  ///native发送消息给Flutter
  static const _eventChannel =
      EventChannel('ly.plugins.flt_push.event_channel');

  static void init() {
    Log.d('PushChannel.init');
    _listenNativeEvent();
  }

  static void Function(PushTokenInfo tokenInfo)? onPushTokenReceived;

  static void _listenNativeEvent() {
    _eventChannel.receiveBroadcastStream().listen(_onEvent, onError: _onError);
  }

  //接收返回的数据
  static void _onEvent(Object? object) {
    Log.d('PushChannel._onEvent object = $object');
    if (object is! Map) return;
    Map data = object;
    String type = data['type'] ?? '';
    switch (type) {
      case 'EVENT_PUSH_REGISTERED':
        var msg = data['message'];
        if (msg != null && msg is Map) {
          String? token = msg['token'];
          String? vendor = msg['vendor'];
          if (token != null) {
            Log.d(
                'FlutterPush._onEvent EVENT_PUSH_REGISTERED token=$token, vendor=$vendor');
            if (onPushTokenReceived != null) {
              PushTokenInfo info = PushTokenInfo.fromMap(msg);
              onPushTokenReceived!(info);
            }
          }
        }
        break;
      default:
        break;
    }
  }

  static _onError(Object error, StackTrace stackTrace) {
    Log.d('PushChannel._onError');
  }

  static Future<PushTokenInfo?> getTokenInfo() async {
    Map map = await _methodChannel.invokeMethod('getTokenInfo');
    PushTokenInfo pushTokenInfo = PushTokenInfo.fromMap(map);
    if (pushTokenInfo.token == null || pushTokenInfo.token!.isEmpty) {
      return null;
    }
    return pushTokenInfo;
  }

  static Future<bool> initOfflinePush() async {
    return await _methodChannel.invokeMethod("initOfflinePush");
  }
}

class PushTokenInfo {
  String? token;
  String? clientType;
  String? vendor;
  String? uid;

  Map toMap() {
    Map map = {
      'token': token,
      'vendor': vendor,
      'client_type': clientType,
      'uid': uid
    };
    return map;
  }

  PushTokenInfo.fromMap(Map map) {
    token = map['token'];
    vendor = map['vendor'];
    clientType = map['client_type'];
    uid = map['uid'];
  }

  @override
  String toString() {
    return 'token=$token, clientType=$clientType, vendor=$vendor, uid=$uid';
  }
}
