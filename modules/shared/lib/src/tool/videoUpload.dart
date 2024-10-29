import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:shared/shared.dart';
import 'package:convert/convert.dart';
import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';

class VideoUpload {
  static VideoUpload? _instance;

  static VideoUpload instance() {
    return _instance ?? VideoUpload();
  }

  add(File video) async {
    await _upload(video);
  }

  static bool _badCertificateCallback(
      X509Certificate cr, String host, int port) {
    return true;
  }

  static const String _BOUNDARY_PRE_TAG = "--boundary-xxxxxxxx.";
  static const String _BOUNDARY_PREFIX = "--";

  /// 朋友圈视频上传接口
  static Future upload({
    required File? file,
    ValueChanged<String>? onError,
    ValueChanged<Map>? onComplete,
    ValueChanged<double>? onUploading,
  }) async {
    //请求url
    if (file == null || await file.exists() == false) {
      onError?.call(R.string('read_file_eeror_retry'));
      return;
    }
    String? uuid;
    String? host;
    Map? postFields; // 生成UUID
    try {
      FileStat stat = await file.stat();
      List<int> content = const Utf8Encoder().convert(
          "${stat.size}.${stat.modified}.${file.path}.${Utility.formatDate(DateTime.now().millisecondsSinceEpoch ~/ 1000)}");
      Digest digest = md5.convert(content);
      uuid = hex.encode(digest.bytes).toLowerCase();
      Log.d(uuid);
    } catch (e) {
      onError?.call(R.string('read_file_eeror_retry'));
      return;
    } // 获取上传token和阿里云地址
    try {
      String url =
          '${System.domain}circle/upload/videoToken?ver=1'; //      String url = 'https://dev-api.yinjietd.com/circle/upload/videoToken';
      XhrResponse response = await Xhr.postJson(
        url,
        {
          'hook': 'flutter_video',
          'uuid': uuid,
        },
        throwOnError: true,
      );
      Map res = response.value();
      host = res['data']['host'];
      postFields = res['data']['params'];
      Log.d(postFields);
    } catch (e) {
      onError?.call(e.toString());
      return;
    } //    Toast.showCenter(System.context, R.string('uploading_video_dont_shutdown_phone'));
    final Stream<List<int>> stream = file.openRead();
    int length = file.lengthSync();
    Log.d("video length = ${length / 1024} KB");
    final HttpClient client = HttpClient();
    client.badCertificateCallback = _badCertificateCallback;
    client.findProxy = null; //host = 'http://192.168.2.20/test.php';
    final Uri uri = Uri.parse(host!);
    HttpClientRequest request = await client.postUrl(uri);
    Random random = Random();
    String boundary = _BOUNDARY_PRE_TAG + random.nextInt(4294967296).toString();
    List<int> bytes = [];
    StringBuffer data = StringBuffer();
    if (postFields != null) {
      postFields.forEach((dynamic name, dynamic value) {
        String postData = value.toString();
        if (name == 'key') {
          postData = '$postData.mov';
        }
        data.write(_BOUNDARY_PREFIX);
        data.write(boundary);
        writeln(data);
        data.write('Content-Disposition: form-data; name="$name"');
        writeln(data);
        writeln(data);
        data.write(postData);
        writeln(data);
      });
    }
    data.write(_BOUNDARY_PREFIX);
    data.write(boundary);
    writeln(data);
    data.write(
        'Content-Disposition: form-data; name="file"; filename="image.mov"');
    writeln(data);
    data.write("Content-Type: application/octet-stream");
    writeln(data);
    writeln(data);
    bytes.addAll(utf8.encode(data.toString()));
    Log.d(data.toString());
    request.headers.add(HttpHeaders.contentTypeHeader,
        "multipart/form-data; boundary=$boundary");
    request.contentLength = length +
        bytes.length +
        boundary.length +
        _BOUNDARY_PREFIX.length * 2 +
        4;
    request.add(bytes);
    int byteCount = 0;
    Stream<List<int>> stream2 = stream.transform(
      StreamTransformer.fromHandlers(
        handleData: (data, sink) {
          byteCount += data.length;
          Log.d(byteCount);
          sink.add(data);
          Log.d("upload send $byteCount / $length");
          if (onUploading != null) {
            onUploading(byteCount / length);
          }
        },
        handleError: (error, stack, sink) {
          Log.d("upload send error");
          onError?.call(R.string('upload_error_retry'));
          Log.d(error);
          Log.d(stack);
        },
        handleDone: (sink) {
          Log.d("upload send done");
          sink.close();
        },
      ),
    );
    await request
        .addStream(stream2)
        .timeout(const Duration(seconds: 60 * 10))
        .catchError((e) {
      Log.d("addStream catchError");
      Log.d(e); //      onError(R.string('upload_error_retry'));
    });
    bytes.clear();
    data.clear();
    writeln(data);
    data.write(_BOUNDARY_PREFIX);
    data.write(boundary);
    data.write(_BOUNDARY_PREFIX);
    writeln(data);
    bytes.addAll(utf8.encode(data.toString()));
    request.add(bytes);
    HttpClientResponse response;
    try {
      response = await request.close();
    } catch (e) {
      onError?.call(e.toString());
      return;
    }
    StringBuffer responseData = StringBuffer();
    response.transform(utf8.decoder).listen((String contents) {
      Log.d("upload response --------------------------- ");
      Log.d("upload data $contents");
      responseData.write(contents);
    }, onDone: () {
      Log.d("upload onDone");
      String body = responseData.toString();
      Map jsonData;
      try {
        jsonData = json.decode(body);
      } catch (e) {
        onError?.call(R.string('server_return_error_retry'));
        return;
      }
      if (jsonData.containsKey("success") && jsonData['success'] == true) {
        if (onComplete != null) {
          onComplete(jsonData['data']);
        }
      } else {
        onError?.call(jsonData['msg'] ?? '');
      }
    }, onError: (error, stack) {
      Log.d("upload onError");
      Log.d(error);
      Log.d(stack);
      onError?.call(R.string('upload_error_retry'));
    });
    Log.d("upload complete --------------------------- ");
    Log.d("upload ${response.statusCode}");
    Log.d("upload ${response.contentLength}");
  }

  static void writeln(StringBuffer sb) {
    sb.write("\r\n");
  }

  _upload(File file) async {
    //请求url
    if (await file.exists() == false) {
      return;
    }
    String? uuid;
    String? host;
    Map? postFields;
    try {
      FileStat stat = await file.stat();
      List<int> content = const Utf8Encoder().convert(
          "${stat.size}.${stat.modified}.${file.path}.${Utility.formatDate(DateTime.now().millisecondsSinceEpoch ~/ 1000)}");
      Digest digest = md5.convert(content);
      uuid = hex.encode(digest.bytes).toLowerCase();
    } catch (e) {
      onError(R.string('read_file_eeror_retry'));
      return;
    }
    try {
      String url = '${System.domain}upload/videoToken';
      XhrResponse response = await Xhr.postJson(
        url,
        {
          'hook': 'flutter_video',
          'uuid': uuid,
        },
        throwOnError: true,
      );
      Map res = response.value();
      host = res['data']['host'];
      postFields = res['data']['params'];
      Log.d(postFields);
    } catch (e) {
      onError(e.toString());
      return;
    } //    Toast.showCenter(System.context, R.string('uploading_video_dont_shutdown_phone'));
    final Stream<List<int>> stream = file.openRead();
    int length = file.lengthSync();
    Log.d("video length = ${length / 1024}");
    final HttpClient client = HttpClient();
    client.badCertificateCallback = _badCertificateCallback;
    client.findProxy = null; //host = 'http://192.168.2.20/test.php';
    final Uri uri = Uri.parse(host!);
    HttpClientRequest request = await client.postUrl(uri);
    Random random = Random();
    String boundary = _BOUNDARY_PRE_TAG + random.nextInt(4294967296).toString();
    List<int> bytes = [];
    StringBuffer data = StringBuffer();
    if (postFields != null) {
      postFields.forEach((dynamic name, dynamic value) {
        String postData = value.toString();
        if (name == 'key') {
          postData = '$postData.mov';
        }
        data.write(_BOUNDARY_PREFIX);
        data.write(boundary);
        writeln(data);
        data.write('Content-Disposition: form-data; name="$name"');
        writeln(data);
        writeln(data);
        data.write(postData);
        writeln(data);
      });
    }
    data.write(_BOUNDARY_PREFIX);
    data.write(boundary);
    writeln(data);
    data.write(
        'Content-Disposition: form-data; name="file"; filename="image.mov"');
    writeln(data);
    data.write("Content-Type: application/octet-stream");
    writeln(data);
    writeln(data);
    bytes.addAll(utf8.encode(data.toString()));
    Log.d(data.toString());
    request.headers.add(HttpHeaders.contentTypeHeader,
        "multipart/form-data; boundary=$boundary");
    request.contentLength = length +
        bytes.length +
        boundary.length +
        _BOUNDARY_PREFIX.length * 2 +
        4;
    request.add(bytes);
    int byteCount = 0;
    Stream<List<int>> stream2 = stream.transform(
      StreamTransformer.fromHandlers(
        handleData: (data, sink) {
          byteCount += data.length;
          Log.d(byteCount);
          sink.add(data);
          Log.d("upload send $byteCount / $length");
        },
        handleError: (error, stack, sink) {
          Log.d("upload send error");
          Log.d(error);
          Log.d(stack);
        },
        handleDone: (sink) {
          Log.d("upload send done");
          sink.close();
        },
      ),
    );
    await request
        .addStream(stream2)
        .timeout(const Duration(seconds: 60 * 10))
        .catchError((e) {
      Log.d("addStream catchError");
      Log.d(e);
    });
    bytes.clear();
    data.clear();
    writeln(data);
    data.write(_BOUNDARY_PREFIX);
    data.write(boundary);
    data.write(_BOUNDARY_PREFIX);
    writeln(data);
    bytes.addAll(utf8.encode(data.toString()));
    request.add(bytes);
    HttpClientResponse response;
    try {
      response = await request.close();
    } catch (e) {
      onError(e.toString());
      return;
    }
    StringBuffer responseData = StringBuffer();
    response.transform(utf8.decoder).listen((String contents) {
      Log.d("upload response --------------------------- ");
      Log.d("upload data $contents");
      responseData.write(contents);
    }, onDone: () {
      Log.d("upload onDone");
      String body = responseData.toString();
      Map jsonData;
      try {
        jsonData = json.decode(body);
      } catch (e) {
        onError(R.string('server_return_error_retry'));
        return;
      }
      if (jsonData.containsKey("success") && jsonData['success'] == true) {
        DropDownAlert.show(
          content: R.string('video_need_check_first'),
          duration: const Duration(seconds: 10),
          style: DropDownAlertStyle.success,
        );
      } else {
        onError(jsonData['msg']);
      }
    }, onError: (error, stack) {
      Log.d("upload onError");
      Log.d(error);
      Log.d(stack);
      onError(R.string('upload_error_retry'));
    });
    Log.d("upload complete --------------------------- ");
    Log.d("upload ${response.statusCode}");
    Log.d("upload ${response.contentLength}");
  }

  static void onError([String? errorMessage]) {
    Fluttertoast.showToast(
      msg: errorMessage ?? R.string('upload_error_retry'),
      gravity: ToastGravity.CENTER,
    );
  }
}
