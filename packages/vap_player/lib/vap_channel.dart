import 'dart:async';
import 'dart:io';

import 'package:flutter/services.dart';

typedef OnRenderFrame = Function(int frameIndex, int frameTotal);

class VapChannel {
  final VoidCallback? onStart;
  final VoidCallback? onComplete;
  final OnRenderFrame? onRenderFrame;

  static int _id = 0;
  static const MethodChannel _sendChannel = MethodChannel('ly.plugins.vap_player');
  
  late MethodChannel _receiveChannel;
  late int _channelId;
  
  VapChannel({this.onStart, this.onComplete, this.onRenderFrame}) {
    _id++;
    _channelId = _id;
    _receiveChannel = MethodChannel('plugins/vap_view_$_channelId');
    _receiveChannel.setMethodCallHandler(_handleMethodCall);
  }

  /// 初始化textureId
  Future<int?> initialize(
      {required String filePath, int? repeatCount, List<String>? imgList, List<String>? textList, Future? delayToShowFuture}) async {
    if (delayToShowFuture != null) {
      await delayToShowFuture;
    }
    if (repeatCount == -1 && Platform.isAndroid) {
      repeatCount = 100000;
    }
    int textureId = await _sendChannel.invokeMethod('create', {
      'channelId': _channelId,
      'filePath': filePath,
      'repeatCount': repeatCount,
      'imgList': imgList,
      'textList': textList,
    });
    return textureId;
  }

  /// dispose
  Future<void> dispose(int textureId) async {
    _receiveChannel.setMethodCallHandler(null);
    Future.delayed(Duration(milliseconds: Platform.isIOS ? 1000 : 0), () async {
      _sendChannel.invokeMethod('dispose', {'textureId': textureId});
    });
  }

  Future _handleMethodCall(MethodCall call) {
    switch (call.method) {
      case 'onVideoStart':
        if (onStart != null) {
          onStart!();
        }
        break;
      case 'onVideoComplete':
        if (onComplete != null) {
          onComplete!();
        }
        break;
      case "onRenderFrame":
        Map params = call.arguments;
        int frameIndex = params['frameIndex'] ?? 0;
        int frameTotal = params['frameTotal'] ?? 0;
        if (onRenderFrame != null) {
          onRenderFrame!(frameIndex, frameTotal);
        }
        break;
      default:
        break;
    }
    return Future.value(null);
  }
}
