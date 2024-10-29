import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:isolate';

import 'package:archive/archive_io.dart';
import 'package:pulse_log/src/log_utils.dart';
import 'package:pulse_log/src/model/log_body.dart';
import 'package:flutter/foundation.dart';
import 'package:path/path.dart';

import 'pulse_log.dart';
import 'gatherInterface.dart';
import 'model/log_print.dart';

class ComputeWarp {
  String? directoryPath;
  String? dbBaseName;
  String? dbFileName;
  int? keyIndex = 1;
  int? curLength = 0;
  bool? isCleaning = false;
  bool? isDeflate = true;

  ComputeWarp(
      {this.dbFileName,
      this.dbBaseName,
      this.directoryPath,
      this.keyIndex,
      this.curLength,
      this.isCleaning,
      this.isDeflate});

  Map toMap() {
    return {
      'path': directoryPath,
      'file': dbFileName,
      'base': dbBaseName,
      'index': keyIndex,
      'len': curLength,
      'isClearn': isCleaning,
      'isDeflate': isDeflate
    };
  }

  factory ComputeWarp.fromMap(Map<String, dynamic> map) {
    return ComputeWarp(
        curLength: map['len'],
        dbFileName: map['file'],
        dbBaseName: map['base'],
        directoryPath: map['path'],
        keyIndex: map['index'],
        isDeflate: map['isDeflate']);
  }
}

const int kSendPortKey = 8888; //第二个元素则为 sendPort
const int kTaskKey = 8889; // 第二个元素为task
const int kTaskResult = 8891; //任务返回结果

class CacheLogFile {
  late String filePath;
  late String fileName;
  String? _fullPath;
  RandomAccessFile? cacheFile;

  static final ReceivePort receiveMainPort = ReceivePort();
  static final SendPort sendPortOfProxy = receiveMainPort.sendPort;

  final ReceivePort receivePort = ReceivePort();
  Isolate? isolate;
  SendPort? childPort;

  CacheLogFile(this.filePath, this.fileName);

  bool get shouldFlush => _fileLen >= PulseLog.maxCacheFileLen;

  int _fileLen = 0;
  bool _initializing = false;

  final List<Completer> _taskList = [];

  Future cacheLog(Map log) async {
    await _shouldOpenCacheFile();

    if (log.isEmpty) {
      return Future.value();
    }

    Completer completer = Completer();
    _taskList.add(completer);

    if (isolate == null && !_initializing) {
      _initializing = true;
      isolate = await Isolate.spawn(_writeLog, receivePort.sendPort);
      receivePort.listen((message) {
        if (message[0] == kSendPortKey) {
          childPort = message[1];
          childPort?.send([kTaskKey, log, _fullPath, completer.hashCode]);
        } else if (message[0] == kTaskResult) {
          int len = message[1];
          int code = message[2];
          _fileLen += len;
          final task = _taskList.firstWhere((element) => element.hashCode == code);
          _taskList.remove(task);
          if (!task.isCompleted) {
            task.complete();
          }
        }
      });
    } else if (isolate != null && childPort != null) {
      childPort?.send([kTaskKey, log, _fullPath, completer.hashCode]);
    }

    return completer.future;

    // if (log.isNotEmpty) {
    //   // await cacheFile?.writeString(pulse_logUtils.log2String(log));
    //   // _fileLen = await cacheFile?.length();
    //   // await cacheFile?.flush();
    //   print('cacheLog');
    //   // await compute(_writeLog, [_fullPath, log]);
    // }
  }

  static _writeLog(SendPort mainPort) async {
    mainPort.send([kSendPortKey, sendPortOfProxy]);
    receiveMainPort.listen((message) async {
      if (message[0] == kTaskKey) {
        final logs = message[1];
        final path = message[2];
        final code = message[3];
        int len = 0;

        try {
          final sink = File(path).openWrite(mode: FileMode.writeOnlyAppend);
          final data = utf8.encode(pulse_logUtils.log2String(logs));
          len = data.length;
          sink.add(data);
          await sink.flush();
          await sink.close();
        } catch (e) {
          print(e);
        } finally {
          mainPort.send([kTaskResult, len, code]);
        }
      }
    });
  }

  Future closeFile() async {
    await cacheFile?.close();
    cacheFile = null;
  }

  clean() async {
    await closeFile();
    isolate?.kill(priority: Isolate.immediate);
    isolate = null;
  }

  pause() {
    isolate?.pause(isolate?.pauseCapability);
  }

  resume() {
    isolate?.resume(isolate!.pauseCapability!);
  }

  Future<List<int>?> flushCacheLogs({bool forceFlush = false}) async {
    await _shouldOpenCacheFile();

    final len = await cacheFile?.length() ?? 0;
    if ((len > 0 && len >= PulseLog.maxCacheFileLen) || forceFlush) {
      await cacheFile?.setPosition(0);
      final data = await cacheFile?.read(len);
      await closeFile();
      await File(_fullPath!).delete();
      return data?.toList();
    }
    return null;
  }

  _shouldOpenCacheFile() async {
    if (_fullPath?.isNotEmpty ?? false) {
      if (!File(_fullPath!).existsSync()) {
        _fullPath = null;
        await closeFile();
      }
    }

    _fullPath ??= await pulse_logUtils.cacheFilePath(filePath, fileName);
    cacheFile ??= await File(_fullPath!).open(mode: FileMode.append);
  }
}

class Gather2 implements GatherInterface {
  static const String _dbFileName = 'base_log';
  static const String _dbCrashFileName = 'base_crash_log';
  static const String _dbCacheFileName = 'base_cache_log';

  static late String _directoryPath;

  static RandomAccessFile? _dbFile;

  static int _keyIndex = 1;

  static int _curLength = 0;

  static bool _isCleaning = false;

  static bool _isDisable = false;

  static bool _isWriting = false;

  static final List<Map> _cacheLogs = [];

  static CacheLogFile? _cacheLogFile;

  Gather2({required this.userIdentifier, required this.directoryPath}) {
    _directoryPath = directoryPath;
  }

  String userIdentifier;
  String directoryPath;

  @override
  Future saveErrorLog(ExceptionBody logBody) async {
    if (_isCleaning || _isDisable) return;
    if (!logBody.canLog) return;

    await compute(_writeErrorLog, [_directoryPath, _dbCrashFileName, logBody, PulseLog.isDeflate]);
  }

  static void _writeErrorLog(List params) async {
    String directoryPath = params[0];
    String dbCrashFileName = params[1];
    ExceptionBody logBody = params[2];
    bool isDeflate = params[3];

    String logFilePath = await pulse_logUtils.genLogFilePath([directoryPath, dbCrashFileName]);

    File file = File(logFilePath);
    bool logFileExit = await file.exists();
    RandomAccessFile dbFile = await file.open(mode: FileMode.writeOnlyAppend);
    if (!logFileExit) {
      await _writeDeflateData(
          dbFile,
          '''$kFileHeadST{"key":1,"value":${jsonEncode({
                'type': 'deviceInfo',
                'detail': PulseLog.deviceInfo,
                'time': DateTime.now().toLocal().toString()
              }, toEncodable: (obj) => obj.toString())}}\n''',
          isDeflate: isDeflate);
    }

    await _writeDeflateData(
        dbFile, '''{"key":1,"value":${jsonEncode(logBody.toMap(), toEncodable: (obj) => obj.toString())}}\n''',
        isDeflate: isDeflate);

    await dbFile.flush();
    await dbFile.close();
  }

  @override
  Future saveLog(LogBody logBody) async {
    if (_isCleaning || _isDisable) return;

    if (!logBody.canLog) return;

    //采用文件缓存
    pulse_logUtils.runLogTask(() async {
      await _cacheLogs2File(log: logBody.toMap(), path: directoryPath, name: _dbCacheFileName);
    });

    // _saveLogs(logBody.toMap());
  }

  static _cacheLogs2File({required Map log, required String path, required String name, bool mergefile = false}) async {
    _cacheLogFile ??= CacheLogFile(path, name);

    if (log.isNotEmpty) {
      await _cacheLogFile?.cacheLog(log);
    }

    if ((_cacheLogFile?.shouldFlush ?? false) || mergefile) {
      final data = await _cacheLogFile?.flushCacheLogs(forceFlush: mergefile);
      if (data?.isNotEmpty ?? false) {
        await compute(_mergeflushLogs, [data!, computeWarp]);
      }
    }
  }

  static Future<RandomAccessFile?> _openLog(List<String> paths, ComputeWarp warp) async {
    try {
      String logFilePath = warp.dbFileName != null && warp.dbFileName!.isNotEmpty
          ? warp.dbFileName!
          : await pulse_logUtils.genLogFilePath(paths);
      bool logFileExit = await File(logFilePath).exists();
      if (logFileExit) {
        try {
          final data = File(logFilePath).readAsBytesSync().toList();
          String content = String.fromCharCodes(data);
          //兼容新旧文件
          if (content.isNotEmpty) {
            if ((content.contains(kFileHeadST) && warp.isDeflate!) ||
                (!content.contains(kFileHeadST) && !warp.isDeflate!)) {
              logFilePath = await pulse_logUtils.genLogFilePath(paths, skipFile: true);
              logFileExit = false;
            }
          }
        } finally {}
      }

      final dbFile = await File(logFilePath).open(mode: FileMode.writeOnlyAppend);
      warp.dbFileName = logFilePath;
      if (!logFileExit) {
        await _writeDeflateData(
            dbFile,
            '''$kFileHeadST{"key":1,"value":${jsonEncode({
                  'type': 'deviceInfo',
                  'detail': PulseLog.deviceInfo,
                  'time': DateTime.now().toLocal().toString()
                }, toEncodable: (obj) => obj.toString())}}\n''',
            isDeflate: warp.isDeflate!);
        warp.curLength = 0;
      } else {
        warp.curLength = await dbFile.length();
      }
      return dbFile;
    } catch (e) {
      return null;
    }
  }

  @override
  void clean() async {
    _isCleaning = true;
    _dbFile?.closeSync();
    _dbFile = null;

    pulse_logUtils.runLogTask(() async {
      _cacheLogFile?.closeFile();

      Directory dir = Directory(join(directoryPath, 'pulse_log'));
      if (dir.existsSync()) {
        await dir.delete(recursive: true);
      }
      _isCleaning = false;
    });
  }

  @override
  void disable() {
    _isDisable = true;
    _dbFile?.closeSync();
    _dbFile = null;

    pulse_logUtils.runLogTask(() async {
      _cacheLogFile?.clean();
      _resetFlags();
    });
  }

  @override
  Future<bool> haveCrash() async {
    return pulse_logUtils.checkDirExistFiles(directoryPath);
  }

  @override
  Future flush() async {
    pulse_logUtils.runLogTask(() async {
      await _cacheLogs2File(log: {}, path: directoryPath, name: _dbCacheFileName, mergefile: true);
    });
  }

  static get computeWarp => ComputeWarp(
      keyIndex: _keyIndex,
      curLength: _curLength,
      dbBaseName: _dbFileName,
      directoryPath: _directoryPath,
      isCleaning: _isCleaning,
      isDeflate: PulseLog.isDeflate);

  static _saveLogs(Map log) async {
    _cacheLogs.add(log);
    await _writeLogs();
  }

  static Future _writeLogs({bool forceWrite = false}) async {
    if (_isWriting || _isCleaning || _isDisable) {
      return;
    }

    List<Map> logs = [];
    if (forceWrite) {
      logs = _cacheLogs;
    } else {
      if (_cacheLogs.length > 100) {
        logs = _cacheLogs.getRange(0, 100).toList();
      } else {
        return;
      }
    }

    if (logs.isEmpty) {
      return;
    }

    logPrint('---------> _flushLogs begin');

    _isWriting = true;
    ComputeWarp warp = await compute(_flushLogs, [logs, computeWarp]);
    _keyIndex += 1;
    _curLength += warp.curLength!;
    _isWriting = false;
    _cacheLogs.removeRange(0, logs.length);

    logPrint('---------> _flushLogs end');

    _writeLogs();
  }

  static Future<ComputeWarp> _flushLogs(List params) async {
    List logs = params[0];
    ComputeWarp warp = params[1];
    List<String> logList = logs.map((element) => pulse_logUtils.log2String(element)).toList();
    String logString = logList.join('');

    logPrint('---------> _flushLogs : ${logs.length}');

    var logDatas = _deflateSource(logString, isDeflate: warp.isDeflate!);
    int len = logDatas is String
        ? logDatas.length
        : logDatas is List<int>
            ? logDatas.length
            : 0;

    if (len > 0) {
      final dbFile = await _checkLogSize(len, warp);
      if (dbFile != null) {
        await _writeDeflateData(dbFile, logDatas);
        await dbFile.flush();
        await dbFile.close();
      }
    }

    warp.curLength = len;

    return warp;
  }

  static Future<ComputeWarp> _mergeflushLogs(List params) async {
    List<int> logsData = params[0];
    ComputeWarp warp = params[1];
    if (logsData.isNotEmpty) {
      var logDatas = _deflateSource(logsData, isDeflate: warp.isDeflate!);
      int len = logDatas is String
          ? logDatas.length
          : logDatas is List<int>
              ? logDatas.length
              : 0;

      if (len > 0) {
        final dbFile = await _checkLogSize(len, warp);
        if (dbFile != null) {
          await _writeDeflateData(dbFile, logDatas);
          await dbFile.flush();
          await dbFile.close();
        }
      }

      warp.curLength = len;
    }
    return warp;
  }

  static Future<bool> _needNewFile(int size, RandomAccessFile? dbFile) async {
    if (dbFile != null) {
      int fileLength = await dbFile.length();
      if (fileLength + size >= PulseLog.logFileSize.clamp(kMinLogSize, kMaxLogSize)) {
        _keyIndex = 1;
        // close old file
        await dbFile.flush();
        await dbFile.close();
        dbFile = null;
        return true;
      } else {
        return false;
      }
    } else {
      return true;
    }
  }

  static Future<RandomAccessFile?> _checkLogSize(int size, ComputeWarp warp) async {
    var dbFile = await _openLog([warp.directoryPath!, warp.dbBaseName!], warp);
    if (await _needNewFile(size, dbFile)) {
      warp.dbFileName = null;
      dbFile = await _openLog([warp.directoryPath!, warp.dbBaseName!], warp);
    }
    return dbFile;
  }

  static _resetFlags() {
    _isWriting = false;
    _isCleaning = false;
    _isDisable = false;
  }

  //流式压缩
  static _deflateSource(dynamic source, {bool isDeflate = false}) {
    if (isDeflate) {
      final zip = GZipEncoder();
      if (source is String && source.isNotEmpty) {
        final bytes = zip.encode(
          utf8.encode(source),
        );

        return bytes;
      } else if (source is List<int>) {
        return zip.encode(source);
      }
    }
    return source;
  }

  static _writeDeflateData(RandomAccessFile fileHandle, dynamic data, {bool isDeflate = false}) async {
    var logDatas = _deflateSource(data, isDeflate: isDeflate);
    if (logDatas is String) {
      await fileHandle.writeString(logDatas);
    } else if (logDatas is List<int>) {
      await fileHandle.writeFrom(logDatas);
    }
  }
}
