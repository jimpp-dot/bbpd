import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:path/path.dart';
import 'package:pulse_log/pulse_log.dart';
import 'package:archive/archive_io.dart';
import 'package:shared/shared.dart';
import 'package:shared/protobuf/generated/upload.pb.dart';
import 'package:path_provider/path_provider.dart';

/// 日志上传管理类
class LogUploadManager {
  static bool _isUploading = false;

  static Future<void> uploadLog(int type) async {
    if (_isUploading) return;
    _isUploading = true;
    if (type == 1) {
      // 上传本地日志
      await PulseLog.instance.uploadLogByDefault();
    } else if (type == 2) {
      // 上传声网日志
      await _uploadRTCLog('agora');
    } else if (type == 3) {
      // 上传即构日志
      await _uploadRTCLog('zego');
    }
    _isUploading = false;
  }

  /// 上传RTC日志
  static Future<void> _uploadRTCLog(String type) async {
    try {
      // 1.获取RTC日志保存路径
      Directory? dir = await _getLogRootDir();
      if (dir == null) {
        Log.d('sdCard not mounted');
        return;
      }
      // 2.找出RTC日志文件
      List<String> rtcLogFiles = await _getRTCLogFile(dir, type);
      if (rtcLogFiles.isEmpty) {
        Log.d('not found $type log file');
        return;
      }
      // 3.将所有RTC日志文件压缩
      File? logZipFile =
          await _zipLogFiles(dir, rtcLogFiles, prefix: 'rtc_log_$type');
      if (logZipFile == null || !await logZipFile.exists()) {
        Log.d('zip $type log file error');
        return;
      }
      // 4.上传日志文件压缩包
      await _realUpload(logZipFile);
      // 5.删除日志文件压缩包
      await logZipFile.delete();
    } catch (e) {
      Log.d('upload $type log file error, e=${e.toString()}');
    }
  }

  /// 获取日志跟目录
  static Future<Directory?> _getLogRootDir() async {
    if (Platform.isAndroid) {
      return getExternalStorageDirectory();
    } else if (Platform.isIOS) {
      return getTemporaryDirectory();
    }
    return null;
  }

  /// 获取RTC日志文件
  static Future<List<String>> _getRTCLogFile(Directory dir, String type) async {
    List<String> files = [];
    var list = dir.listSync();
    for (var file in list) {
      if (basename(file.path).startsWith(type)) {
        files.add(file.path);
      }
    }
    return files;
  }

  /// 压缩多个日志文件成一个压缩包
  static Future<File?> _zipLogFiles(Directory dir, List<String> files,
      {String prefix = 'log'}) async {
    File? zipFile;
    try {
      ZipEncoder zipEncoder = ZipEncoder();
      Archive archive = Archive();
      for (String filePath in files) {
        File file = File(filePath);
        var fileBytes = await file.readAsBytes();
        archive.addFile(
            ArchiveFile(basename(file.path), fileBytes.length, fileBytes));
      }
      List<int>? bytes = zipEncoder.encode(archive);
      if (bytes?.isNotEmpty ?? false) {
        zipFile = File(join(join(dir.path, '$prefix.zip')));
        await zipFile.writeAsBytes(bytes!);
      }
    } catch (e) {
      return null;
    }
    return zipFile;
  }

  /// 上传文件到oss服务器
  static Future<void> _realUpload(File logFile) async {
    try {
      RspUploadPromise cfgResp = await _getUploadConfig();
      Log.d('upload config:path=${cfgResp.path} signUrl=${cfgResp.signUrl}');
      if (cfgResp.success &&
          cfgResp.path.isNotEmpty &&
          cfgResp.signUrl.isNotEmpty) {
        Uint8List fileBytes = await logFile.readAsBytes();
        Response resp = await Dio().put(
          cfgResp.signUrl,
          data: Stream.fromIterable(fileBytes.map((e) => [e])),
          options: Options(contentType: 'application/zip'),
        );
        if (resp.statusCode == 200) {
          Log.d('log upload success path=${cfgResp.path}');
          return;
        }
      }
      Log.d('log upload fail');
    } catch (e) {
      Log.d('log upload fail, e=${e.toString()}');
    }
  }

  /// 获取上传配置
  static Future<RspUploadPromise> _getUploadConfig() async {
    String url = '${System.domain}go/yy/tool/getUploadPromise';
    XhrResponse response = await Xhr.postPb(
      url,
      {
        'content_type': 'application/zip',
        'ext': 'zip',
        'upload_type': 'report',
      },
      throwOnError: true,
    );
    try {
      return response.formatProtobuf(RspUploadPromise.create());
    } catch (e) {
      return RspUploadPromise(msg: e.toString(), success: false);
    }
  }
}
