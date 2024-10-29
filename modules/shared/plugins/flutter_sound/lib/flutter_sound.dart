import 'dart:async';
import 'dart:core';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:shared/shared.dart';
import 'package:permission_handler/permission_handler.dart';

class FlutterSound {
  static const MethodChannel _channel = MethodChannel('flutter_sound');
  static StreamController<RecordStatus?>? _recorderController;
  static StreamController<PlayStatus?>? _playerController;
  Stream<RecordStatus?> get onRecorderStateChanged =>
      _recorderController!.stream;
  Stream<PlayStatus?> get onPlayerStateChanged => _playerController!.stream;

  bool _isRecording = false;
  bool _isPlaying = false;

  Future<String> setSubscriptionDuration(double sec) async {
    String result = await _channel
        .invokeMethod('setSubscriptionDuration', <String, dynamic>{
      'sec': sec,
    });
    return result;
  }

  Future<void> _setRecorderCallback() async {
    _recorderController ??= StreamController.broadcast();

    _channel.setMethodCallHandler((MethodCall call) {
      switch (call.method) {
        case "updateRecorderProgress":
          Map<String, dynamic> result = json.decode(call.arguments);
          _recorderController!.add(RecordStatus.fromJSON(result));
          break;
        default:
          throw ArgumentError('Unknown method ${call.method} ');
      }
      return Future.value(null);
    });
  }

  Future<void> _setPlayerCallback() async {
    _playerController ??= StreamController.broadcast();

    _channel.setMethodCallHandler((MethodCall call) {
      switch (call.method) {
        case "updateProgress":
          Map<String, dynamic> result = jsonDecode(call.arguments);
          _playerController?.add(PlayStatus.fromJSON(result));
          break;
        case "audioPlayerDidFinishPlaying":
          Map<String, dynamic> result = jsonDecode(call.arguments);
          PlayStatus status = PlayStatus.fromJSON(result);
          if (status.currentPosition != status.duration) {
            status.currentPosition = status.duration;
          }
          _playerController?.add(status);
          _isPlaying = false;
          _removePlayerCallback();
          break;
        default:
          throw ArgumentError('Unknown method ${call.method}');
      }
      return Future.value(null);
    });
  }

  Future<void> _removeRecorderCallback() async {
    if (_recorderController != null) {
      _recorderController!
        ..add(null)
        ..close();
      _recorderController = null;
    }
  }

  Future<void> _removePlayerCallback() async {
    if (_playerController != null) {
      _playerController!
        ..add(null)
        ..close();
      _playerController = null;
    }
  }

  Future<String> startRecorder(String? uri,
      {int sampleRate = 44100, int numChannels = 2, String? recordType}) async {
    try {
      // 权限申请走统一逻辑
      PermissionStatus permissionStatus;
      permissionStatus = await PermissionUtil.checkAndRequestPermissions(
          Constant.context, Permission.microphone);
      if (permissionStatus != PermissionStatus.granted) {
        return 'permission_granted';
      }

      // if (Platform.isAndroid) {
      //   PermissionStatus permissionStatus;
      //   permissionStatus = await PermissionUtil.checkAndRequestPermissions(
      //       Constant.context, Permission.storage);
      //   if (permissionStatus != PermissionStatus.granted) {
      //     return 'permission_granted';
      //   }
      // }

      String? result =
          await _channel.invokeMethod('startRecorder', <String, dynamic>{
        'path': uri,
        'sampleRate': sampleRate,
        'numChannels': numChannels,
        if (recordType != null && recordType.isNotEmpty)
          'recordType': recordType,
      });
      Log.d('microphone:result:$result');
      if (result == "permission_granted") {
        // 刚刚用户点击获取到了录音权限，还没有录到声音
        return result!;
      }

      if (result == null) {
        throw Exception('Recorder starts failed.');
      }
      _setRecorderCallback();

      if (_isRecording) {
        return '';
      }
      _isRecording = true;
      return result;
    } catch (err) {
      throw Exception(err);
    }
  }

  Future<String> stopRecorder() async {
    if (!_isRecording) {
      return '';
    }

    String result = await _channel.invokeMethod('stopRecorder');
    _isRecording = false;
    _removeRecorderCallback();
    return result;
  }

  Future<String> startPlayer(String uri) async {
    try {
      String result =
          await _channel.invokeMethod('startPlayer', <String, dynamic>{
        'path': uri,
      });
      Log.d('result: $result');

      _setPlayerCallback();

      if (_isPlaying) {
        throw Exception('Player is already playing.');
      }
      _isPlaying = true;

      return result;
    } catch (err) {
      throw Exception(err);
    }
  }

  Future<String> stopPlayer() async {
    if (!_isPlaying) {
      throw Exception('Player already stopped.');
    }
    _isPlaying = false;

    String result = await _channel.invokeMethod('stopPlayer');
    _removePlayerCallback();
    return result;
  }

  Future<String> pausePlayer() async {
    String result = await _channel.invokeMethod('pausePlayer');
    return result;
  }

  Future<String> resumePlayer() async {
    String result = await _channel.invokeMethod('resumePlayer');
    return result;
  }

  Future<String> seekToPlayer(int milliSecs) async {
    String result =
        await _channel.invokeMethod('seekToPlayer', <String, dynamic>{
      'sec': milliSecs,
    });
    return result;
  }

  Future<String> setVolume(double volume) async {
    String result = '';
    if (volume < 0.0 || volume > 1.0) {
      result = 'Value of volume should be between 0.0 and 1.0.';
      return result;
    }

    result = await _channel.invokeMethod('setVolume', <String, dynamic>{
      'volume': volume,
    });
    return result;
  }

  bool get isRecording => _isRecording;
}

class RecordStatus {
  final double currentPosition;

  RecordStatus.fromJSON(Map<String, dynamic> json)
      : currentPosition = double.parse(json['current_position']);

  @override
  String toString() {
    return 'currentPosition: $currentPosition';
  }
}

class PlayStatus {
  final double duration;
  double currentPosition;

  PlayStatus.fromJSON(Map<String, dynamic> json)
      : duration = double.parse(json['duration']),
        currentPosition = double.parse(json['current_position']);

  @override
  String toString() {
    return 'duration: $duration, '
        'currentPosition: $currentPosition';
  }
}
