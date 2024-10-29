import 'dart:convert';
import 'dart:io';

import 'package:shared/util/log/http_log.dart';
import 'package:shared/util/log/log_output.dart';
import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';
import 'package:synchronized/extension.dart';

import './connect_status_listener.dart';
import './model/cmd.pb.dart';

class WebConsoleManager {
  static WebConsoleManager? _instance;

  /// create singleton constructor
  WebConsoleManager._internal();

  /// get singleton instance
  static WebConsoleManager get instance {
    _instance ??= WebConsoleManager._internal();
    return _instance!;
  }

  /// toggler of web console
  bool _enableWebConsole = false;
  bool get enableWebConsole => _enableWebConsole;

  bool get enableConsoleLog =>
      _enableWebConsole &&
      null != _currentSocket &&
      _currentSocket!.readyState == WebSocket.open &&
      _logType == LogType.Console;
  bool get enableHttpLog =>
      _enableWebConsole &&
      null != _currentSocket &&
      _currentSocket!.readyState == WebSocket.open &&
      _logType == LogType.Http;
  bool get enableRoomSocketLog =>
      _enableWebConsole &&
      null != _currentSocket &&
      _currentSocket!.readyState == WebSocket.open &&
      _logType == LogType.RoomSocket;
  bool get enableImSocketLog =>
      _enableWebConsole &&
      null != _currentSocket &&
      _currentSocket!.readyState == WebSocket.open &&
      _logType == LogType.ImSocket;
  bool get enableTrackerLog =>
      _enableWebConsole &&
      null != _currentSocket &&
      _currentSocket!.readyState == WebSocket.open &&
      _logType == LogType.Tracker;
  bool get enableChatLog =>
      _enableWebConsole &&
      null != _currentSocket &&
      _currentSocket!.readyState == WebSocket.open &&
      _logType == LogType.ChatSocket;

  bool get isRunning => _isRunning;
  bool _isRunning = false;

  String get connectUrl => _address.isEmpty ? '' : '$_address:$_port';
  String _address = '';
  final int _port = 8989;

  LogType _logType = LogType.Console;

  HttpServer? _server;
  WebSocket? _currentSocket;

  final List<ConnectStatusListener> _connectStatusListeners = [];

  void printConsoleLog(OutputEvent msg) {
    if (enableConsoleLog) {
      _currentSocket!
          .add(jsonEncode({'logLevel': msg.level.name, 'lines': msg.lines}));
    } else if (enableTrackerLog) {
      bool containsSubstring =
          msg.lines.any((line) => line.toLowerCase().contains('track event:'));
      if (containsSubstring) {
        _currentSocket!
            .add(jsonEncode({'logLevel': msg.level.name, 'lines': msg.lines}));
      }
    }
  }

  void printHttpLog(HttpLog log) {
    if (enableHttpLog) {
      // convert Map to json string and send to web console
      _currentSocket!.add(jsonEncode(log.toMap()));
    }
  }

  void printSocketLog(OutputEvent log) {
    if (enableRoomSocketLog) {
      _currentSocket!
          .add(jsonEncode({'logLevel': log.level.name, 'lines': log.lines}));
    }
  }

  void printImSocketLog(OutputEvent log) {
    if (enableImSocketLog) {
      _currentSocket!
          .add(jsonEncode({'logLevel': log.level.name, 'lines': log.lines}));
    }
  }

  //Info: -FeiLong- 增加一个 Im.chat 的类型
  void printChatSocketLog(OutputEvent log) {
    if (enableChatLog) {
      _currentSocket!
          .add(jsonEncode({'logLevel': log.level.name, 'lines': log.lines}));
    }
  }

  void triggerConsoleLog(bool enable) {
    if (enable) {
      _enableWebConsole = true;
      if (_server == null) {
        start();
      } else {
        for (var listner in _connectStatusListeners) {
          listner.onStarted();
        }
      }
    } else {
      _enableWebConsole = false;
      reset();
    }
  }

  void addConnectStatusListner(ConnectStatusListener listner) {
    if (_connectStatusListeners.contains(listner)) {
      return;
    }
    _connectStatusListeners.add(listner);
  }

  void removeConnectStatusListner(ConnectStatusListener listner) {
    _connectStatusListeners.remove(listner);
  }

  Future<bool> reset() async {
    if (null != _currentSocket) {
      await _currentSocket!.close();
      _currentSocket = null;
    }
    if (null != _server) {
      await _server!.close();
      _server = null;
    }
    await _isRunning.synchronized(() {
      _isRunning = false;
    });

    return true;
  }

  Future<bool> start() async {
    if (!_enableWebConsole) {
      return false;
    }
    await _isRunning.synchronized(() {
      if (_isRunning) {
        return;
      }
      _isRunning = true;
    });
    String ip = await _myLocalIp() ?? '';

    if (ip.isNotEmpty) {
      _address = ip;
      // notify all listeners
      for (var listner in _connectStatusListeners) {
        listner.onStarted();
      }
      _server = await HttpServer.bind(ip, _port);
      await for (HttpRequest request in _server!) {
        if (WebSocketTransformer.isUpgradeRequest(request)) {
          WebSocketTransformer.upgrade(request).then((socket) {
            _currentSocket = socket;
            // notify all listeners
            for (var listner in _connectStatusListeners) {
              listner.onConnected();
            }
            _currentSocket!.listen((msg) {
              //Info: -FeiLong-  parsing cmd here
              _parseCmd(msg);
            }, onDone: () {
              _currentSocket = null;
              // notify all listners
              for (var listner in _connectStatusListeners) {
                listner.onDisconnected();
              }
            }, onError: (e) {
              _currentSocket = null;
              // notify all listners
              for (var listner in _connectStatusListeners) {
                listner.onError();
              }
            });
          });
        }
      }
      return true;
    }
    return false;
  }

  Future<String?> _myLocalIp() async {
    final interfaces = await NetworkInterface.list(
        type: InternetAddressType.IPv4, includeLinkLocal: true);
    return interfaces
        .where((e) => e.addresses.first.address.indexOf('192.') == 0)
        .first
        .addresses
        .first
        .address;
  }

  void _parseCmd(dynamic cmd) {
    /// convert String to Cmd class
    try {
      if (cmd is Uint8List) {
        final cmdObj = Cmd.fromBuffer(cmd);
        _parseCmdObject(cmdObj);
      } else if (cmd is String) {
        final cmdObj = Cmd.fromJson(cmd);
        _parseCmdObject(cmdObj);
      }
    } catch (e) {
      debugPrint('parseCmd error: $e');
    }
  }

  void _parseCmdObject(Cmd cmdObj) {
    if (cmdObj.op == Op.SetLogLevel) {
      if (cmdObj.hasData()) {
        final data = cmdObj.data;
        if (data.hasLogLevel()) {
          final level = data.logLevel;
          if (level == LogLevel.Debug) {
            LogOutputHelper.filterLevel = Level.debug;
          } else if (level == LogLevel.Info) {
            LogOutputHelper.filterLevel = Level.info;
          } else if (level == LogLevel.Warning) {
            LogOutputHelper.filterLevel = Level.warning;
          } else if (level == LogLevel.Error) {
            LogOutputHelper.filterLevel = Level.error;
          } else if (level == LogLevel.Wtf) {
            LogOutputHelper.filterLevel = Level.wtf;
          }
        }
      }
    } else if (cmdObj.op == Op.SetLogType) {
      if (cmdObj.hasData()) {
        final data = cmdObj.data;
        if (data.hasLogType()) {
          final type = data.logType;
          _logType = type;
        }
      }
    }
  }
}
