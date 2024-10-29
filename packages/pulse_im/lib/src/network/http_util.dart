import 'dart:convert';

import 'package:pulse_im/src/socket/local_user_data.dart';
import 'package:pulse_im/src/util/im_config.dart';
import 'package:pulse_im/src/util/im_log.dart';
import 'package:pulse_im/src/util/im_util.dart';
import 'package:crypto/crypto.dart';
import 'package:dio/dio.dart';
import 'dart:io';
import '../util/num_util.dart';

class HttpReqUtil {
  late Dio dio;

  static const String LOG_TAG = "HttpReqUtil";

  HttpReqUtil._() {
    dio = Dio();
  }

  static HttpReqUtil? _instance;

  static HttpReqUtil getInstance() {
    _instance ??= HttpReqUtil._();
    return _instance!;
  }

  Future<Response> getData(String url) async {
    return await dio.get(url);
  }

  Future<Response> postForm(String url, Map<String, Object>? params) async {
    var option = Options(method: "POST", contentType: "application/x-www-form-urlencoded");
    return await dio.post(url, data: params, options: option);
  }

  Future<Response> postJson(String url, Map<String, Object>? params,
      {bool appendCommon = true, bool needSign = true}) async {
    var option = Options(method: "POST", contentType: "application/json");
    if (appendCommon && params != null) {
      params['userid'] = IMUtil.parseInt(LocalUserData.senderUserId);
      params['appid'] = LocalUserData.customAppId ?? IMConfig.APP_ID;
      params['timestamp'] = DateTime.now().millisecondsSinceEpoch ~/ 1000;
    }

    if (needSign && params != null) {
      var sb = StringBuffer();
      List sortedKeys = params.keys.toList()..sort();
      for (var element in sortedKeys) {
        sb
          ..write(element)
          ..write('=')
          ..write(params[element])
          ..write('&');
      }
      String tempStr = sb.toString();
      String sortedString = tempStr.substring(0, tempStr.length - 1);

      var bytes = utf8.encode(sortedString); // data being hashed
      var digest = sha1.convert(bytes);
      params['sign'] = digest.toString();
    }

    return await dio.post(url, data: params, options: option);
  }

  Future<Response> uploadFile(String url, String? contentType, String filePath, String md5) async {
    var imgFile = File(filePath);
    List<int> postData = imgFile.readAsBytesSync();

    return await dio.put(
      url,
      data: Stream.fromIterable(postData.map((e) => [e])),
      options: Options(method: "PUT", contentType: contentType, headers: {"Content-MD5": md5}),
      onSendProgress: (int sent, int total) {
        IMLog.d(LOG_TAG, "OnSendProgress and filePath = $filePath and sent = $sent and total = $total");
      },
      onReceiveProgress: (int sent, int total) {
        IMLog.d(LOG_TAG, "OnReceiveProgress and filePath = $filePath and sent = $sent and total = $total");
      },
    );
  }

//  Future<Response> uploadFile(String url, String filePath, String fileName) async {
//    var postData = FormData.fromMap(
//        {"file": await MultipartFile.fromFile(filePath, filename: fileName)});//file是服务端接受的字段字段，如果接受字段不是这个需要修改
//    var option = Options(method: "POST", contentType: "multipart/form-data");//上传文件的content-type 表单
//    return await dio.post(
//      url,
//      data: postData,
//      options: option,
//      onSendProgress: (int sent, int total) {
//        print("上传进度：" +
//            NumUtil.getNumByValueDouble(sent / total * 100, 2)
//                .toStringAsFixed(2) +
//            "%"); //取精度，如：56.45%
//      },
//    );
//  }

  Future<Response> downloadFile(String resUrl, String savePath) async {
    return await dio.download(resUrl, savePath, onReceiveProgress: (int loaded, int total) {
      print("下载进度：${NumUtil.getNumByValueDouble(loaded / total * 100, 2).toStringAsFixed(2)}%");
    });
  }
}
