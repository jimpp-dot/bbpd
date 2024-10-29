import 'dart:collection';
// ignore_for_file: import_of_legacy_library_into_null_safe
import 'dart:convert';

import 'package:shared/shared.dart';
import 'package:shared/util/log/web_console/web_console_manager.dart';
import 'package:shared/util/log/widget/socket_log_console.dart';
import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

import 'stream_log_output.dart';

enum RoomLogType { send, receive, all }

enum SocketType { im, room, chat }

class SocketLog {
  static SocketLog? _instance;
  static SocketLog? get instance {
    if (_instance == null && Constant.isDevMode) {
      _instance = SocketLog();
    }

    return _instance;
  }

  void init() {}

  SocketLog() {
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
        //Info: -FeiLong- 增加一个 Im.chat 的类型
        SocketType socketType = typeFromLogLevel(e.level);
        switch (socketType) {
          case SocketType.im:
            WebConsoleManager.instance.printImSocketLog(e);
            break;
          case SocketType.room:
            WebConsoleManager.instance.printSocketLog(e);
            break;
          case SocketType.chat:
            WebConsoleManager.instance.printChatSocketLog(e);
            break;
        }
      });
    }
  }
  late ListQueue<OutputEvent> outputEventBuffer;
  late StreamLogOutput? output;

  final int _bufferSize = 50;
  OutputCallback? outputCallback;
  RoomLogType filter = RoomLogType.receive;

  void clearAll() {
    outputEventBuffer.clear();
  }

  void add(RoomLogType type, SocketType socketType, dynamic message) {
    if (!Constant.isDevMode) return;
    String? msg;
    if (message is! String) {
      try {
        msg = json.encode(message);
      } catch (e) {
        try {
          msg = json.encode(encodeJson(message));
        } catch (e) {}
      }
    } else {
      msg = message;
    }

    if (msg != null && msg.isNotEmpty) {
      // Issues with log output should NOT influence
      // the main software behavior.
      try {
        Level level = logLevelFromType(socketType);
        String prefixType = type == RoomLogType.receive ? "receive:" : "send:";
        OutputEvent event =
            OutputEvent(LogEvent(level, msg), [prefixType, ...msg.split('\n')]);
        output?.output(event);
      } catch (e, s) {
        debugPrint(e.toString());
        debugPrint(s.toString());
      }
    }
  }

  dynamic encodeJson(dynamic item) {
    if (item == null) {
      return null;
    } else if (item is List) {
      return item.map((e) => encodeJson(e)).toList();
    } else if (item is Map) {
      return item.map((k, v) => MapEntry(k.toString(), encodeJson(v)));
    } else if (item is num || item is String || item is bool) {
      return item;
    } else {
      final toJson = item.toJson;
      if (toJson != null) {
        return encodeJson(toJson());
      } else {
        throw Exception('Cannot encode object of type ${item.runtimeType}');
      }
    }
  }
}
