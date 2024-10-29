import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'dart:typed_data';
import 'package:flutter/material.dart';

import 'package:shared/shared.dart';
import 'package:shared/k.dart';
import 'package:shared/src/tool/imagecrop/imageCropScreen.dart';
import 'package:image_picker/image_picker.dart';

typedef UploadCompleteCallback = bool Function(String name, Map origin);

class CommonImageUpload {
  final BuildContext context;
  final String uploadUrl;
  final ImageSource source;
  final Widget? child;
  final ValueChanged<String>? onError;
  final UploadCompleteCallback? onComplete;
  final Map<String, String>? postFields;
  final bool crop;
  final Size minSize;
  final double cropAspectRatio;

  CommonImageUpload(this.context,
      {required this.uploadUrl,
      required this.source,
      this.child,
      this.onError,
      this.onComplete,
      this.postFields,
      required this.crop,
      required this.minSize,
      this.cropAspectRatio = 1.0});

  dynamic uploadingFile;
  bool _lock = false;

  void switchImage() async {
    if (_lock) return;

    dynamic pickFile;
    try {
      _lock = true;
      pickFile = await ImagePicker.pickImage(
        source: source,
        maxWidth: 1440.0,
        maxHeight: 1920.0,
      );

      //裁剪图片
      if (pickFile != null && crop) {
        Map? mapData = await ImageCropScreen.cropImage(
            context, pickFile, minSize, cropAspectRatio);
        if (mapData != null && mapData.length > 1) {
          pickFile = mapData['image'];
        } else {
          pickFile = null;
        }
      }
    } catch (e) {
      Log.d(e);
      Fluttertoast.showToast(
          msg: K.select_photo_error_retry, gravity: ToastGravity.CENTER);
    }
    _lock = false;

    if (pickFile == null) return;
    _upload(pickFile);
  }

  static bool _badCertificateCallback(
      X509Certificate cr, String host, int port) {
    return true;
  }

  static const String _BOUNDARY_PRE_TAG = "--boundary-xxxxxxxx.";
  static const String _BOUNDARY_PREFIX = "--";

  void _writeln(StringBuffer sb) {
    sb.write("\r\n");
  }

  Future<void> _upload(dynamic imageFile) async {
    if (imageFile == null) return;

    uploadingFile = imageFile;

    int length;
    Stream<List<int>>? stream;
    if (imageFile is File) {
      stream = imageFile.openRead();
      length = imageFile.lengthSync();
    } else if (imageFile is Uint8List) {
      length = imageFile.lengthInBytes;
    } else {
      return;
    }

    try {
      final HttpClient client = HttpClient();
      client.badCertificateCallback = _badCertificateCallback;
      client.findProxy = null;
      if (Constant.isDevMode && (Constant.proxy?.isNotEmpty ?? false)) {
        client.findProxy = (url) {
          return HttpClient.findProxyFromEnvironment(url, environment: {
            "https_proxy": 'http://${Constant.proxy}',
            "http_proxy": 'http://${Constant.proxy}'
          });
        };
      }
      String urlWithParams = _withUrl(uploadUrl);
      final Uri uri = Uri.parse(urlWithParams);
      HttpClientRequest request = await client.postUrl(uri);

      Random random = Random();
      String boundary =
          _BOUNDARY_PRE_TAG + random.nextInt(4294967296).toString();

      List<int> bytes = [];
      StringBuffer data = StringBuffer();

      if (postFields != null) {
        postFields!.forEach((String name, String value) {
          data.write(_BOUNDARY_PREFIX);
          data.write(boundary);
          _writeln(data);
          data.write('Content-Disposition: form-data; name=$name');
          _writeln(data);
          _writeln(data);
          data.write(value);
          _writeln(data);
        });
      }

      data.write(_BOUNDARY_PREFIX);
      data.write(boundary);
      _writeln(data);
      data.write('Content-Disposition: form-data; filename="image.jpg"');
      _writeln(data);
      data.write("Content-Type: image/jpeg");
      _writeln(data);
      _writeln(data);
      bytes.addAll(utf8.encode(data.toString()));

      request.headers.add(HttpHeaders.contentTypeHeader,
          "multipart/form-data; boundary=$boundary");
      request.headers.add('user-token', Session.token);
      request.contentLength =
          length + bytes.length + boundary.length + _BOUNDARY_PREFIX.length + 2;

      request.add(bytes);

      if (imageFile is File) {
        int byteCount = 0;
        Stream<List<int>> stream2 = stream!.transform(
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
            .timeout(const Duration(seconds: 15))
            .catchError((e) {
          Log.d("addStream catchError");
          Log.d(e);
        });
      } else if (imageFile is Uint8List) {
        request.add(imageFile.toList());
      }

      bytes.clear();
      data.clear();
      _writeln(data);
      data.write(_BOUNDARY_PREFIX);
      data.write(boundary);
      bytes.addAll(utf8.encode(data.toString()));
      request.add(bytes);

      final HttpClientResponse response = await request.close();
      StringBuffer responseData = StringBuffer();
      response.transform(utf8.decoder).listen((String contents) {
        Log.d("upload response --------------------------- ");
        Log.d("upload data $contents");
        responseData.write(contents);
      }, onDone: () {
        Log.d("upload onDone");
        if (onComplete != null) {
          String body = responseData.toString();
          Map jsonData;
          try {
            jsonData = json.decode(body);
          } catch (e) {
            _onError(K.server_return_error_retry);
            uploadingFile = null;
            return;
          }
          if (jsonData.containsKey("success") && jsonData['success'] == true) {
            String? img = jsonData['data']['img_bg'];
            img = img ?? jsonData['data']['name'];
            onComplete!(img ?? '', jsonData);
          } else {
            _onError(jsonData['msg']);
          }
        }

        uploadingFile = null;
      }, onError: (error, stack) {
        Log.d("upload onError");
        Log.d(error);
        Log.d(stack);
        _onError(K.upload_error_retry);
        uploadingFile = null;
      });
      Log.d(
          "Upload complete, statusCode: ${response.statusCode}, length: ${response.contentLength}");
    } catch (e) {
      _onError(K.upload_error_retry);
      uploadingFile = null;
    }
  }

  _onError([String? errorMessage]) {
    if (onError != null) {
      onError!(errorMessage ?? '');
    } else {
      Fluttertoast.showToast(
          msg: errorMessage ?? K.upload_error_retry,
          gravity: ToastGravity.CENTER);
    }
  }
}

int _queryIndex = 0;

String _withUrl(String url) {
  _queryIndex++;
  Map<String, String> args = {
    'package': Constant.packageName,
    '_ipv': Util.isVerify ? '1' : '0',
    '_platform': (Platform.isIOS ? 'ios' : 'android'),
    '_index': _queryIndex.toString(),
    '_model': DeviceInfo.model,
    '_timestamp': (DateTime.now().millisecondsSinceEpoch ~/ 1000).toString()
  };
  List<String> keys = args.keys.toList(growable: false);
  keys.sort();

  List<String> hashArgs = [];
  for (var key in keys) {
    if (args[key] != null) {
      hashArgs.add("$key=${args[key]!}");
    }
  }
  args['_sign'] = Util.md5Encryption('${hashArgs.join('&')}!rilegoule#');

  List<String> query = [];
  args.forEach((String key, String val) {
    query.add("$key=${Uri.encodeComponent(val)}");
  });

  url = url + (url.contains("?") ? '&' : '?') + query.join('&');
  return url;
}
