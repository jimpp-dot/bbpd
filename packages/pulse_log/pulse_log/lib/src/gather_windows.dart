import 'dart:convert';
import 'dart:io';

import 'package:pulse_log/src/model/log_body.dart';
import 'package:path/path.dart';

import 'pulse_log.dart';
import 'gatherInterface.dart';
import 'model/log_print.dart';

class GatherWindows implements GatherInterface {
  static const String _dbFileName = 'base_log';
  static const String _dbCrashFileName = 'base_crash_log';
  String userIdentifier;

  String directoryPath;

  RandomAccessFile? _dbFile;

  int _keyIndex = 1;

  GatherWindows({required this.userIdentifier, required this.directoryPath});

  void _initDB() async {
    String logFilePath = _genLogFilePath();
    bool logFileExit = File(logFilePath).existsSync();
    File file = File(logFilePath);
    _dbFile = file.openSync(mode: FileMode.writeOnlyAppend);
    if (!logFileExit) {
      _dbFile?.writeStringSync(kFileHeadST);
      _dbFile?.flushSync();
      _writeLog({'type': 'deviceInfo', 'detail': PulseLog.deviceInfo, 'time': DateTime.now().toLocal().toString()});
    }
  }

  @override
  Future saveErrorLog(ExceptionBody logBody) async {
    String logFilePath = _genLogFilePath(logFilePref: _dbCrashFileName);
    bool logFileExit = File(logFilePath).existsSync();
    File file = File(logFilePath);
    RandomAccessFile dbFile = file.openSync(mode: FileMode.writeOnlyAppend);
    if (!logFileExit) {
      dbFile.writeStringSync(kFileHeadST);
      dbFile.writeStringSync('''{"key":$_keyIndex,"value":${jsonEncode({
            'type': 'deviceInfo',
            'detail': PulseLog.deviceInfo,
            'time': DateTime.now().toLocal().toString()
          }, toEncodable: (obj) => obj.toString())}}\n''');
    }
    dbFile.writeStringSync(
        '''{"key":$_keyIndex,"value":${jsonEncode(logBody.toMap(), toEncodable: (obj) => obj.toString())}}\n''');
    dbFile.flushSync();
    dbFile.closeSync();
  }

  @override
  Future saveLog(LogBody logBody) async {
    String logFilePath = _genLogFilePath();
    bool logFileExit = File(logFilePath).existsSync();

    if (_dbFile == null || !logFileExit) {
      _initDB();
    }
    _writeLog(logBody.toMap());
  }

  String _genLogFilePath({String logFilePref = _dbFileName}) {
    int index = 0;
    Directory dir = Directory(join(directoryPath, 'pulse_log'));
    if (!dir.existsSync()) {
      dir.createSync(recursive: true);
    } else {
      List<FileSystemEntity> files = dir.listSync();
      files = files.where((element) => element.path.endsWith('.db') && element.path.startsWith(logFilePref)).toList();
      index = getFileIndex(files);
    }
    return join(dir.path, '${logFilePref}_${userIdentifier}_$index.db');
  }

  int getFileIndex(List<FileSystemEntity> files) {
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
        _keyIndex = 1;
        _dbFile?.closeSync();
        _dbFile = null;
      }

      return index;
    } on Exception catch (e) {
      logPrint(e.toString());
      return index;
    }
  }

  @override
  void clean() async {
    Directory dir = Directory(join(directoryPath, 'pulse_log'));
    await dir.delete(recursive: true);
    if (_dbFile != null) {
      _dbFile?.closeSync();
      _dbFile = null;
    }
  }

  @override
  void disable() {
    if (_dbFile != null) {
      _dbFile?.closeSync();
      _dbFile = null;
    }
  }

  void _writeLog(Map log) {
    _dbFile
        ?.writeStringSync('''{"key":$_keyIndex,"value":${jsonEncode(log, toEncodable: (obj) => obj.toString())}}\n''');
    _dbFile?.flushSync();
    _keyIndex += 1;
  }

  @override
  Future<bool> haveCrash() async {
    String logFilePath = _genLogFilePath(logFilePref: _dbCrashFileName);
    return File(logFilePath).existsSync();
  }

  @override
  Future flush() async {}
}
