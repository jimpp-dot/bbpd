import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:ui';
import 'package:pulse_log/src/pulse_log.dart';
import 'package:pulse_log/src/gatherInterface.dart';
import 'package:pulse_log/src/model/log_print.dart';
import 'package:flutter/foundation.dart';
import 'package:path/path.dart';

class LogTaskInfo {
  int taskId; // 任务唯一标识
  Function? callback;

  Completer<LogTaskInfo>? taskCompleter;

  LogTaskInfo(this.taskId, {this.callback});

  factory LogTaskInfo.from(int taskId,
      {Function? callback, StreamController<LogTaskInfo>? controller, Completer<LogTaskInfo>? taskCompleter}) {
    return LogTaskInfo(taskId, callback: callback)..taskCompleter = taskCompleter;
  }
}

class LogTaskQueue {
  static final Map<String, LogTaskQueue> _instance = {};

  static LogTaskQueue? getQueue(String key) {
    if (_instance[key] == null) {
      _instance[key] = LogTaskQueue._(key);
    }
    return _instance[key];
  }

  static bool isQueuesDone(String key) {
    bool ret = true;
    for (var element in _instance.keys) {
      if (element.contains(key)) {
        ret = getQueue(key)?.isDone() ?? true;
      }
    }
    return ret;
  }

  LogTaskQueue._(this.queueId);

  List<LogTaskInfo> _taskList = [];
  bool _isCancelQueue = false;
  bool _isTaskRunning = false;
  String queueId;
  VoidCallback? onDone;

  addTask(Function? callback) {
    _isCancelQueue = false;
    LogTaskInfo taskInfo = LogTaskInfo.from(DateTime.now().millisecondsSinceEpoch,
        callback: callback, controller: StreamController<LogTaskInfo>(), taskCompleter: Completer<LogTaskInfo>());
    _taskList.add(taskInfo);

    _runTask();

    return taskInfo.taskCompleter!.future;
  }

  void cancelTask() {
    _taskList = [];
    _isCancelQueue = true;
    _isTaskRunning = false;
  }

  bool isDone() {
    return (_isCancelQueue || _taskList.isEmpty);
  }

  Future _runTask() async {
    if (_isCancelQueue || _isTaskRunning || _taskList.isEmpty) {
      onDone?.call();
      return;
    }

    /// 取任务
    LogTaskInfo taskInfo = _taskList.first;
    _isTaskRunning = true;
    try {
      await taskInfo.callback?.call();
    } catch (e) {
      print(e);
    } finally {
      _taskList.remove(taskInfo);
      _isTaskRunning = false;
    }

    _runTask();
  }
}

class pulse_logUtils {
  static Future<String> cacheFilePath(String dirPath, String fileName) async {
    Directory dir = Directory(join(dirPath, 'pulse_log'));
    if (!await dir.exists()) {
      await dir.create(recursive: true);
    }
    return join(dir.path, '$fileName.db');
  }

  static Future<String> genLogFilePath(List<String> paths, {bool skipFile = false}) async {
    int index = 0;
    Directory dir = Directory(join(paths[0], 'pulse_log'));
    if (!await dir.exists()) {
      await dir.create(recursive: true);
      return join(dir.path, '${paths[1]}_$index.db');
    } else {
      try {
        List<FileSystemEntity> files = dir.listSync();
        files = files
            .where((element) => element.path.endsWith('.db') && basename(element.path).startsWith(paths[1]))
            .toList();
        index = getFileIndex(files);
        index = skipFile ? ++index : index;
      } catch (e) {
        logPrint(e.toString());
      }
    }
    return join(dir.path, '${paths[1]}_$index.db');
  }

  static int getFileIndex(List<FileSystemEntity> files) {
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

  static String log2String(Map log) {
    return '''{"key":1,"value":${jsonEncode(log, toEncodable: (obj) => obj.toString())}}\n''';
  }

  static bool checkExistFiles(List<String> files) {
    bool ret = false;
    for (var element in files) {
      ret = ret || File(element).existsSync();
    }

    return ret;
  }

  static bool checkDirExistFiles(String dirPath) {
    Directory dir = Directory(join(dirPath, 'pulse_log'));
    if (!dir.existsSync()) {
      return false;
    }

    return dir.listSync().isNotEmpty;
  }

  static runLogTask(Function? callback) {
    LogTaskQueue.getQueue('LogTaskQueue')?.addTask(callback);
  }
}

class LogEvent {
  static String kWriteEvent = 'base_log_write';
  static String kUploadEvent = 'base_log_upload';
}

class LogRecordData {
  LogRecordData();

  final List<Map<int, int>> _writeTimes = [];

  void addData(int time, int size) {
    if (_writeTimes.length > 100) {
      _writeTimes.removeRange(0, 100);
      print('LogRecordData: $time, $size');
    }

    _writeTimes.add({time: size});
  }

  Map<String, num> get argvTime {
    int totalTime = 0;
    int totalSize = 0;
    if (_writeTimes.isNotEmpty) {
      for (Map<int, int> element in _writeTimes) {
        totalSize += element.keys.first;
        totalSize += element.values.first;
      }
      final argv = totalTime / _writeTimes.length;
      return {'argv': argv, 'size': totalSize, 'len': _writeTimes.length};
    }
    return {};
  }
}
