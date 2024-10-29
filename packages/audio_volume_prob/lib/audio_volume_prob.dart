import 'dart:async';

import 'package:flutter/services.dart';

class AudioVolumeProb {
  ///Flutter通过方法调用native
  static const MethodChannel _channel = MethodChannel('ly.plugins.audio_volume_prob');

  ///native发送消息给Flutter
  static const _eventChannel = EventChannel('ly.plugins.audio_volume_prob.event_channel');

  static bool _eventChannelRegistered = false;
  static StreamSubscription? _streamSubscription;

  static void Function(int vad)? onVadUpdated;

  static Future start() async {
    _subscribe();
    await _channel.invokeMethod('start');
  }

  static Future stop() async {
    _unsubscribe();
    await _channel.invokeMethod('stop');
  }

  static void _onEvent(event) {
    if (event is! Map) return;
    Map data = event;
    int vad = data['vad'];
    if (onVadUpdated != null) {
      onVadUpdated!(vad);
    }
  }

  static void _subscribe() {
    if (!_eventChannelRegistered) {
      _eventChannelRegistered = true;
      _streamSubscription = _eventChannel.receiveBroadcastStream().listen(_onEvent);
    }
  }

  static void _unsubscribe() {
    if (_eventChannelRegistered) {
      _streamSubscription?.cancel();
      _streamSubscription = null;
      _eventChannelRegistered = false;
    }
  }
}
