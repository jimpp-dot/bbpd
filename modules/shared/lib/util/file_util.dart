import 'dart:convert';
import 'dart:io';
import 'package:dio/io.dart';
import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';

import 'package:shared/shared.dart';
import 'package:crypto/crypto.dart';
import 'dart:async';
import 'dart:typed_data';

class FileUtil {
  static Future<bool> saveImageToGallery(String url,
      [ProgressCallback? progressCallback]) async {
    try {
      Log.d('Start to save image to gallery, with url: $url');
      Directory dir = Directory(Constant.temporaryDirectory.path);
      await dir.create(recursive: true);

      List<int> bytes = utf8.encode(url);
      Digest digest = sha1.convert(bytes);
      String key = digest.toString().toLowerCase();

      File imageFile = File(join(dir.path, '$key.jpg'));

      File tempFile = File(join(dir.path, '$key.tmp'));

      Dio dio = Dio();
      (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
          (HttpClient client) {
        client.badCertificateCallback =
            (X509Certificate cr, String host, int port) {
          return true;
        };
        client.findProxy = null;
      };
      Log.d('Start to save image to gallery, downloading from $url');
      await dio.download(url, tempFile.path,
          onReceiveProgress: (int received, int total) {
        Log.d(
            'Save image to gallery with download progress: $received / $total');
        if (progressCallback != null) progressCallback(received, total);
      });
      await tempFile.rename(imageFile.path);

      await ImagePicker.saveByteDataImageToGallery(imageFile.readAsBytesSync());
    } catch (e) {
      Log.d('Save image to gallery with error: $e');
      return false;
    }
    return true;
  }

  static Future<bool> saveImageDataToGallery(String content,
      [ProgressCallback? progressCallback]) async {
    try {
      Log.d('Start to saveImageDataToGallery');

      String data = content.split(',')[1];
      Uint8List bytes = const Base64Decoder().convert(data);

      await ImagePicker.saveByteDataImageToGallery(bytes);
    } catch (e) {
      Log.d('saveImageDataToGallery with error: $e');
      return false;
    }
    return true;
  }
}
