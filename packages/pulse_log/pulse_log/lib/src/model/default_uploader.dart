import 'dart:convert';
import 'dart:io';

import 'package:pulse_log/pulse_log.dart';
import 'package:crypto/crypto.dart';
import 'package:convert/convert.dart';
import 'package:dio/dio.dart';

import 'log_print.dart';

class DefaultUploader {
  static const String _logTag = 'pulse_logUploader';

  static const String _key = 'bqyaVJzDGgFStBfn';

  static const int _maxLogSize = 30000000;

  DefaultUploader();

  Future<bool> uploadLog(UploadConfig config, File file, bool haveCrash,
      {ProgressCallback? onSendProgress, CancelToken? cancelToken, int? id}) async {
    if (file.lengthSync() > _maxLogSize) {
      logPrint('pulse_log: log file to big');
      return false;
    }

    String url = '${config.logDomain}/ares/api/clientLog/upload';

    logPrint('$_logTag: Start upload Log, Path=${file.path}, url = $url');

    String pkg = config.packageName;
    String uid = config.uid;
    String timeStamp = '${DateTime.now().millisecondsSinceEpoch}';
    String fileMd5 = md5.convert(file.readAsBytesSync()).toString();

    String sign = md5Encryption('$pkg$uid$fileMd5$_key$timeStamp').substring(4, 10);

    Map<String, dynamic> map = {};
    map['file'] = await MultipartFile.fromFile(file.path);
    map['sign'] = sign;
    map['pkg'] = pkg;
    map['uid'] = uid;
    map['fileMd5'] = fileMd5;
    map['timeStamp'] = timeStamp;
    map['haveCrash'] = haveCrash ? 1 : 0;
    if (id != null) {
      map['id'] = id;
    }
    FormData formData = FormData.fromMap(map);
    Dio dio = Dio();
    Response response;

    Options options = Options(headers: {Headers.contentTypeHeader: 'application/zip'});
    try {
      response = await dio.post(url,
          data: formData, options: options, onSendProgress: onSendProgress, cancelToken: cancelToken);
    } on DioError catch (e) {
      logPrint(e.toString());
      return false;
    }

    dynamic data = response.data;

    if (data != null && data is Map) {
      return data['success'] == true;
    }
    return false;
  }

  Future<bool> uploadLogAsync(UploadConfig config, File file, bool haveCrash,
      {ProgressCallback? onSendProgress, CancelToken? cancelToken, int? id}) async {
    if (file.lengthSync() > _maxLogSize) {
      logPrint('pulse_log: log file to big');
      return false;
    }

    String url = '${config.logDomain}/ares/api/clientLog/upload';

    logPrint('$_logTag: Start upload Log, Path=${file.path}, url = $url');

    List params = List.filled(7, -1);
    params[0] = url;
    params[1] = config;
    params[2] = file;
    params[3] = haveCrash;

    if (onSendProgress != null) {
      params[4] = onSendProgress;
    }

    if (cancelToken != null) {
      params[5] = cancelToken;
    }

    if (id != null) {
      params[6] = id;
    }

    return await postFormDataCompute(params);
    // return await compute(postFormDataCompute, params);
  }

  static Future<bool> postFormDataCompute(List params) async {
    String url = params[0];
    UploadConfig config = params[1];
    File file = params[2];
    bool haveCrash = params[3];

    ProgressCallback? onSendProgress = params[4] == -1 ? null : params[4];
    CancelToken? cancelToken = params[5] == -1 ? null : params[5];
    int? id = params[6] == -1 ? null : params[6];

    final fdata = await buildFormaData(config, file, haveCrash, id: id);

    return await postFormData(url, fdata, onSendProgress: onSendProgress, cancelToken: cancelToken);
  }

  static postFormData(
    String url,
    Map<String, dynamic> fdata, {
    ProgressCallback? onSendProgress,
    CancelToken? cancelToken,
  }) async {
    FormData formData = FormData.fromMap(fdata);
    Dio dio = Dio();
    Response response;

    Options options = Options(headers: {Headers.contentTypeHeader: 'application/zip'});
    try {
      response = await dio.post(url,
          data: formData, options: options, onSendProgress: onSendProgress, cancelToken: cancelToken);
    } on DioError catch (e) {
      logPrint(e.toString());
      return false;
    }

    dynamic data = response.data;

    if (data != null && data is Map) {
      return data['success'] == true;
    }
    return false;
  }

  static buildFormaData(UploadConfig config, File file, bool haveCrash, {int? id}) async {
    String pkg = config.packageName;
    String uid = config.uid;
    String timeStamp = '${DateTime.now().millisecondsSinceEpoch}';
    String fileMd5 = md5.convert(file.readAsBytesSync()).toString();

    String sign = md5Encryption('$pkg$uid$fileMd5$_key$timeStamp').substring(4, 10);

    Map<String, dynamic> map = {};
    map['file'] = await MultipartFile.fromFile(file.path);
    map['sign'] = sign;
    map['pkg'] = pkg;
    map['uid'] = uid;
    map['fileMd5'] = fileMd5;
    map['timeStamp'] = timeStamp;
    map['haveCrash'] = haveCrash ? 1 : 0;
    if (id != null) {
      map['id'] = id;
    }
    return map;
  }

  static String md5Encryption(String data) {
    var content = const Utf8Encoder().convert(data);
    var digest = md5.convert(content);
    return hex.encode(digest.bytes).toLowerCase();
  }
}
