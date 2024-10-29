// ignore_for_file: import_of_legacy_library_into_null_safe
import 'dart:collection';
import 'dart:convert';

import 'package:shared/shared.dart';
import 'package:logger/logger.dart';

import 'stream_log_output.dart';

class AssetDataLog {
  static AssetDataLog? _instance;
  static AssetDataLog? get instance {
    if (_instance == null && Constant.isDevMode) {
      _instance = AssetDataLog();
    }

    return _instance;
  }

  void init() {}

  AssetDataLog() {
    if (Constant.isDevMode) {
      outputEventBuffer = ListQueue();

      output = StreamLogOutput();
      output!.stream.listen((e) {
        if (outputEventBuffer.length == _bufferSize) {
          outputEventBuffer.removeFirst();
        }
        outputEventBuffer.add(e);

        if (outputCallback != null) {
          outputCallback!(e);
        }
      });
    }
  }
  late ListQueue<OutputEvent> outputEventBuffer;
  late StreamLogOutput? output;

  final int _bufferSize = 50;
  OutputCallback? outputCallback;

  void clearAll() {
    outputEventBuffer.clear();
  }

  void add(AssetDataInfo message) {
    if (!Constant.isDevMode) return;

    try {
      Level level = Level.verbose;
      final jsonStr = message.toJson();

      OutputEvent event = OutputEvent(LogEvent(level, jsonStr), [jsonStr]);
      output?.output(event);
    } catch (_) {}
  }
}

enum AssetDataType {
  image,
  animation,
}

class AssetDataInfo {
  final String? url;
  final int? size;
  final String? name;
  final AssetDataType? type;

  const AssetDataInfo(
      {this.url, this.size, this.name, this.type = AssetDataType.image});

  String toJson() {
    return jsonEncode(
        {'url': url ?? '', 'size': size ?? 0, 'name': name ?? ""});
  }

  AssetDataInfo.fromJson(Map data)
      : url = data['url'],
        name = data['name'],
        type = data['type'],
        size = data['size'];
}
