import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:pulse_log/src/model/log_body.dart';
import 'package:flutter/foundation.dart';
import 'package:path/path.dart';
import 'package:synchronized/synchronized.dart';

import 'pulse_log.dart';
import 'gatherInterface.dart';
import 'model/log_print.dart';

class Gather implements GatherInterface {
  static const String _dbFileName = 'base_log';
  static const String _dbCrashFileName = 'base_crash_log';
  String userIdentifier;

  String directoryPath;

  RandomAccessFile? _dbFile;

  int _keyIndex = 1;

  bool _isCleaning = false;

  Gather({required this.userIdentifier, required this.directoryPath});

  void _initDB() async {
    String logFilePath = await compute(_genLogFilePath, [directoryPath, _dbFileName]);
    bool logFileExit = File(logFilePath).existsSync();
    File file = File(logFilePath);
    _dbFile = await file.open(mode: FileMode.writeOnlyAppend);
    if (!logFileExit) {
      await _dbFile?.writeString(kFileHeadST);
      await _dbFile?.flush();
      await _writeLog(
          {'type': 'deviceInfo', 'detail': PulseLog.deviceInfo, 'time': DateTime.now().toLocal().toString()});
    }
  }

  Future<bool> _needNewFile() async {
    if (_dbFile != null) {
      int fileLength = await _dbFile!.length();
      if (fileLength >= PulseLog.logFileSize.clamp(kMinLogSize, kMaxLogSize)) {
        _keyIndex = 1;
        // close old file
        await _dbFile?.close();
        _dbFile = null;

        return true;
      } else {
        return false;
      }
    } else {
      return true;
    }
  }

  @override
  Future saveErrorLog(ExceptionBody logBody) async {
    String logFilePath = await compute(_genLogFilePath, [directoryPath, _dbCrashFileName]);
    await _writeErrorLog([logFilePath, logBody]);
  }

  Future _writeErrorLog(List params) async {
    String logFilePath = params[0];
    ExceptionBody logBody = params[1];
    bool logFileExit = File(logFilePath).existsSync();
    File file = File(logFilePath);
    RandomAccessFile dbFile = await file.open(mode: FileMode.writeOnlyAppend);
    if (!logFileExit) {
      await dbFile.writeString(kFileHeadST);
      await dbFile.writeString('''{"key":1,"value":${jsonEncode({
            'type': 'deviceInfo',
            'detail': PulseLog.deviceInfo,
            'time': DateTime.now().toLocal().toString()
          }, toEncodable: (obj) => obj.toString())}}\n''');
    }
    await dbFile
        .writeString('''{"key":1,"value":${jsonEncode(logBody.toMap(), toEncodable: (obj) => obj.toString())}}\n''');
    await dbFile.flush();
    await dbFile.close();
  }

  final _lock = Lock();
  @override
  Future saveLog(LogBody logBody) async {
    _lock.synchronized(() async {
      if (_isCleaning) return;

      if (await _needNewFile()) {
        String logFilePath = await compute(_genLogFilePath, [directoryPath, _dbFileName]);
        bool logFileExit = File(logFilePath).existsSync();
        if (_dbFile == null || !logFileExit) {
          _initDB();
        }
      }

      if (!logBody.canLog) return;

      await _writeLog(logBody.toMap());
    });
  }

  static String _genLogFilePath(List<String> paths) {
    int index = 0;
    Directory dir = Directory(join(paths[0], 'pulse_log'));
    if (!dir.existsSync()) {
      dir.createSync(recursive: true);
      return join(dir.path, '${paths[1]}_$index.db');
    } else {
      try {
        List<FileSystemEntity> files = dir.listSync();
        files = files
            .where((element) => element.path.endsWith('.db') && basename(element.path).startsWith(paths[1]))
            .toList();
        index = _getFileIndex(files);
      } catch (e) {
        logPrint(e.toString());
      }
    }
    return join(dir.path, '${paths[1]}_$index.db');
  }

  static int _getFileIndex(List<FileSystemEntity> files) {
    int index = 0;

    try {
      if (files.isEmpty) {
        return index;
      }

      // 按文件index排序
      files.sort((file1, file2) {
        int file1Index = int.parse(basenameWithoutExtension(file1.path).split('_').last);
        int file2Index = int.parse(basenameWithoutExtension(file2.path).split('_').last);
        return file1Index.compareTo(file2Index);
      });

      // 移除最老的日志记录
      while (files.length > kMaxFileCount) {
        File firstFile = files.removeAt(0) as File;
        if (firstFile.existsSync()) {
          firstFile.delete();
        }
      }

      File lastFile = files.last as File;
      int fileLength = lastFile.lengthSync();
      index = int.parse(basenameWithoutExtension(lastFile.path).split('_').last);
      if (fileLength >= PulseLog.logFileSize.clamp(kMinLogSize, kMaxLogSize)) {
        index += 1;
      }

      return index;
    } on Exception catch (e) {
      logPrint(e.toString());
      return index;
    }
  }

  @override
  void clean() async {
    _isCleaning = true;
    Directory dir = Directory(join(directoryPath, 'pulse_log'));
    await dir.delete(recursive: true);
    if (_dbFile != null) {
      _dbFile?.closeSync();
      _dbFile = null;
    }
    _isCleaning = false;
  }

  @override
  void disable() {
    if (_dbFile != null) {
      _dbFile?.closeSync();
      _dbFile = null;
    }
  }

  Future _writeLog(Map log) async {
    String logString = await compute(_log2String, log);
    await _dbFile?.writeString(logString);
    await _dbFile?.flush();
    _keyIndex += 1;
  }

  static String _log2String(Map log) {
    return '''{"key":1,"value":${jsonEncode(log, toEncodable: (obj) => obj.toString())}}\n''';
  }

  @override
  Future<bool> haveCrash() async {
    String logFilePath = await compute(_genLogFilePath, [directoryPath, _dbCrashFileName]);
    return File(logFilePath).existsSync();
  }

  @override
  Future flush() async {}
}
