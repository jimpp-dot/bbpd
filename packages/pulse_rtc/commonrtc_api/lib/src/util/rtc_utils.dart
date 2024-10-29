import 'dart:typed_data';

import '../util/log.dart';
import 'package:dio/io.dart';
import 'package:dio/dio.dart';
import 'dart:io';
import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:convert/convert.dart';

class RtcUtils {
  static String formatTime(int time) {
    int second = time ~/ 1000;
    int m = second ~/ 60;
    int s = second % 60;
    return '${m > 9 ? m.toString() : '0$m'}:${s > 9 ? s.toString() : '0$s'}';
  }

  static Future<Response> download(String url, String savePath) async {
    var start = DateTime.now();
    Dio dio = Dio();
    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate = (HttpClient client) {
      client.badCertificateCallback = (X509Certificate cr, String host, int port) {
        return true;
      };
      client.findProxy = null;
    };

    Response response = await dio.download(url, savePath);
    var end = DateTime.now();

    Duration duration = end.difference(start);
    rtcLog('download duration(ms): ${duration.inMilliseconds},url->$url,savePath=$savePath');
    return response;
  }

  static String md5String(String data) {
    var content = const Utf8Encoder().convert(data);
    var digest = md5.convert(content);
    return hex.encode(digest.bytes).toLowerCase();
  }

  static int md5Int(String data) {
    return md5String(data).hashCode;
  }

  static Map parseSEIData(Uint8List data) {
    try {
      return jsonDecode(String.fromCharCodes(data.toList()));
    } catch (e) {
      return {};
    }
  }
}
