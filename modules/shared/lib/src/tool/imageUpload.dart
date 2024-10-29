import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'dart:typed_data';

import 'package:shared/shared.dart';
import 'package:shared/component/progress_image.dart';
import 'package:shared/k.dart';

import 'package:dio/io.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';

import 'imagecrop/imageCropScreen.dart';
import 'package:pulse_log/pulse_log.dart';

typedef UploadCompleteCallback = bool? Function(
    String name, int width, int height, Map origin);
typedef DeleteCompleteCallback = void Function(ImageUploadState state);
typedef OnTapFilter = void Function(ImageUploadState state); // 点击事件过滤器
typedef SelectCompleteCallback = void Function(ImageUploadState state);

class ImageUpload extends StatefulWidget {
  const ImageUpload(
      {Key? key,
      required this.uploadUrl,
      required this.source,
      this.child,
      this.postFields,
      this.onError,
      this.onComplete,
      this.crop = false,
      this.minSize,
      this.progressWidth = 100,
      this.progressHeight = 100,
      this.cropAspectRatio = 1.0,
      this.onTapFilter,
      this.onDelete,
      this.onSelect,
      this.onStartUpload,
      this.onPreUpload,
      this.wrapFitBox = true,
      this.onlyGif = 0})
      : super(key: key);

  final String uploadUrl;
  final ImageSource source;
  final Widget? child;
  final ValueChanged<String>? onError;
  final UploadCompleteCallback? onComplete;
  final Map<String, String>? postFields;
  final bool crop;
  final Size? minSize;
  final double progressWidth;
  final double progressHeight;
  final double cropAspectRatio;
  final OnTapFilter? onTapFilter;
  final DeleteCompleteCallback? onDelete;
  final SelectCompleteCallback? onSelect;
  final VoidCallback? onStartUpload;
  final VoidCallback? onPreUpload;
  final bool wrapFitBox;
  final int onlyGif;

  /// 0 or 1 => 仅GIF图片

  @override
  ImageUploadState createState() => ImageUploadState();
}

class ImageUploadState extends State<ImageUpload>
    with AutomaticKeepAliveClientMixin<ImageUpload> {
  final GlobalKey<ProgressImageState> _progressImageKey =
      GlobalKey<ProgressImageState>();
  dynamic uploadingFile;

  bool _lock = false;

  bool _crop = false;
  set crop(bool value) {
    _crop = value;
  }

  /// 0 or 1 => 仅GIF图片
  int _onlyGif = 0;
  set onlyGif(int value) {
    _onlyGif = value;
  }

  @override
  void initState() {
    super.initState();
    crop = widget.crop;
    onlyGif = widget.onlyGif;
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: itemClick,
      child: widget.wrapFitBox == true
          ? FittedBox(
              alignment: Alignment.center,
              child: _renderImage(context),
            )
          : _renderImage(context),
    );
  }

  void itemClick() {
    if (widget.onTapFilter != null) {
      widget.onTapFilter!.call(this);
    } else {
      switchImage();
    }
  }

  /// 兼容老代码 => '替换'和'删除' sheet
  /// 后续若需要其他点击过滤器，please自行实现
  void showDefaultActionSheet(
      {String? sheetTitle,
      bool showExchange = true,
      bool showDelete = true,
      bool showSelect = false}) async {
    List<SheetItem> res = [];
    if (showSelect) {
      res.add(const SheetItem('选中', 'select'));
    }
    if (showExchange) {
      res.add(SheetItem(K.base_operate_replace, 'change'));
    }
    if (showDelete) {
      res.add(SheetItem(K.delete, 'delete'));
    }
    sheetTitle ??= K.base_operate_options;
    SheetCallback? result = await displayModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return RadioBottomSheet(
            title: sheetTitle,
            data: res,
          );
        });

    if (result != null && result.value != null) {
      if (result.value?.key == 'delete') {
        widget.onDelete?.call(this);
      } else if (result.value?.key == 'change') {
        switchImage();
      } else if (result.value?.key == 'select') {
        widget.onSelect?.call(this);
      }
    }
  }

  Future deletePhoto(String photoId) async {
    if (!Util.isStringEmpty(photoId)) {
      await Xhr.postJson("${System.domain}photo/delete", {'id': photoId});
    }
  }

  void switchImage() async {
    if (_lock) return;

    dynamic pickFile;
    try {
      if (widget.onPreUpload != null) widget.onPreUpload!();
      _lock = true;
      pickFile = await ImagePicker.pickImage(
        source: widget.source,
        onlyGif: _onlyGif,
        maxWidth: 1440.0,
        maxHeight: 1920.0,
      );
      if (pickFile != null && (_onlyGif == 1)) {
        if (pickFile.path.endsWith('.gif') || pickFile.path.endsWith('.GIF')) {
          int size = await pickFile.length();
          Log.d("switchImage pickFile -> size:$size");
          if (size > 1.5 * 1024 * 1024) {
            // 图片大于1.5M
            pickFile = null;
            Fluttertoast.showCenter(msg: K.image_picker_size_over_toast);
          }
        } else {
          // 格式不对
          Log.d("switchImage pickFile -> path:${pickFile.path}");
          pickFile = null;
          Fluttertoast.showCenter(msg: K.image_picker_extension_error_toast);
        }
      }

      /// 裁剪图片 (onlyGif 则不裁切)
      if (pickFile != null && _crop && _onlyGif != 1) {
        Map? mapData = await ImageCropScreen.cropImage(
            context, pickFile, widget.minSize, widget.cropAspectRatio);
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

  Widget? _renderImage(BuildContext context) {
    // Log.d('Rebuild image with uploadingFile: $uploadingFile');

    if (uploadingFile != null) {
      return ProgressImage(
          width: widget.progressWidth,
          height: widget.progressHeight,
          key: _progressImageKey,
          builder: (BuildContext context, Size size) {
            if (uploadingFile is File) {
              return Image.file(
                uploadingFile as File,
                width: size.width,
                height: size.height,
                fit: BoxFit.cover,
              );
            } else {
              return Image.memory(
                uploadingFile,
                width: size.width,
                height: size.height,
                fit: BoxFit.cover,
              );
            }
          });
    } else {
      return widget.child;
    }
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

  Future<void> _upload(var imageFile) async {
    if (imageFile == null) return;

    if (mounted) {
      setState(() {
        uploadingFile = imageFile;
      });
    }

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

    HttpClientRequest? request;
    try {
      if (widget.onStartUpload != null) widget.onStartUpload!();
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
      String urlWithParams = _withUrl(widget.uploadUrl);
      final Uri uri = Uri.parse(urlWithParams);
      request = await client.postUrl(uri);

      Random random = Random();
      String boundary =
          _BOUNDARY_PRE_TAG + random.nextInt(4294967296).toString();

      List<int> bytes = [];
      StringBuffer data = StringBuffer();

      if (widget.postFields != null) {
        widget.postFields!.forEach((String name, String value) {
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
        Stream<List<int>>? stream2 = stream?.transform(
          StreamTransformer.fromHandlers(
            handleData: (data, sink) {
              byteCount += data.length;
              Log.d(byteCount);
              sink.add(data);
              Log.d("upload send $byteCount / $length");
              if (_progressImageKey.currentState != null) {
                _progressImageKey.currentState!
                    .setProgress(((byteCount / length) * 100).toInt());
              }
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
            .addStream(stream2!)
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

      /// 增加上传超时，
      final HttpClientResponse response =
          await request.close().timeout(const Duration(seconds: 10));
      StringBuffer responseData = StringBuffer();
      response.transform(utf8.decoder).listen((String contents) {
        Log.d("upload response --------------------------- ");
        Log.d("upload data $contents");
        responseData.write(contents);
      }, onDone: () {
        Log.d("upload onDone");
        if (widget.onComplete != null) {
          String body = responseData.toString();
          Map jsonData;
          try {
            jsonData = json.decode(body);
          } catch (e) {
            _onError(K.server_return_error_retry);
            if (mounted) {
              setState(() {
                uploadingFile = null;
              });
            }
            return;
          }
          // Log.d("upload onDone$jsonData");
          if (jsonData.containsKey("success") && jsonData['success'] == true) {
            widget.onComplete?.call(
                jsonData['data']['name'] ?? '',
                Util.parseInt(jsonData['data']['width']),
                Util.parseInt(jsonData['data']['height']),
                jsonData);
          } else {
            _onError(jsonData['msg']);
          }
        }

        if (mounted) {
          setState(() {
            uploadingFile = null;
          });
        }
      }, onError: (error, stack) {
        Log.d("upload onError");
        Log.d(error);
        Log.d(stack);
        _onError(K.upload_error_retry);
        if (mounted) {
          setState(() {
            uploadingFile = null;
          });
        }
      });
      Log.d(
          "Upload complete, statusCode: ${response.statusCode}, length: ${response.contentLength}");
    } on TimeoutException catch (_) {
      request?.abort();
      Log.d('upload time out');
      timeoutTime++;
      _onError(
          timeoutTime < 2 ? K.upload_error_retry : K.base_upload_error_restart);
      if (mounted) {
        setState(() {
          uploadingFile = null;
        });
      }
    } catch (e) {
      _onError(K.upload_error_retry);
      if (mounted) {
        setState(() {
          uploadingFile = null;
        });
      }
    }
  }

  _onError([String? errorMessage]) {
    if (!mounted) return;

    PulseLog.instance.log(ImageFailBody(ImageAction.upload, widget.uploadUrl,
        errorMessage ?? K.upload_error_retry));

    if (widget.onError != null) {
      widget.onError!(errorMessage ?? '');
    } else {
      Fluttertoast.showToast(
          msg: errorMessage ?? K.upload_error_retry,
          gravity: ToastGravity.CENTER);
    }
  }

  static void writeln(StringBuffer sb) {
    sb.write("\r\n");
  }

  static int timeoutTime = 0;

  static Future uploadImage({
    File? imageFile,
    required String uploadUrl,
    Map<String, String>? postFields,
    ValueChanged<int>? onProgress,
    ValueChanged<String>? onError,
    ValueChanged<Map>? onComplete,
  }) async {
    if (imageFile == null) {
      onError?.call(K.upload_error_retry);
      return null;
    }

    bool exist = await imageFile.exists();
    if (!exist) {
      onError?.call(K.upload_error_retry);
      return null;
    }

    final Stream<List<int>> stream = imageFile.openRead();
    int length = imageFile.lengthSync();

    final HttpClient client = HttpClient();
    client.badCertificateCallback = _badCertificateCallback;
    client.findProxy = null;
    String urlWithParams = _withUrl(uploadUrl);
    final Uri uri = Uri.parse(urlWithParams);
    HttpClientRequest request = await client.postUrl(uri);

    Random random = Random();
    String boundary = _BOUNDARY_PRE_TAG + random.nextInt(4294967296).toString();

    List<int> bytes = [];
    StringBuffer data = StringBuffer();

    if (postFields != null) {
      postFields.forEach((String name, String value) {
        data.write(_BOUNDARY_PREFIX);
        data.write(boundary);
        writeln(data);
        data.write('Content-Disposition: form-data; name=$name');
        writeln(data);
        writeln(data);
        data.write(value);
        writeln(data);
      });
    }

    data.write(_BOUNDARY_PREFIX);
    data.write(boundary);
    writeln(data);
    data.write('Content-Disposition: form-data; filename="image.jpg"');
    writeln(data);
    data.write("Content-Type: image/jpeg");
    writeln(data);
    writeln(data);
    bytes.addAll(utf8.encode(data.toString()));

    request.headers.add(HttpHeaders.contentTypeHeader,
        "multipart/form-data; boundary=$boundary");
    request.headers.add('user-token', Session.token);
    request.contentLength =
        length + bytes.length + boundary.length + _BOUNDARY_PREFIX.length + 2;

    request.add(bytes);

    int byteCount = 0;
    Stream<List<int>> stream2 = stream.transform(
      StreamTransformer.fromHandlers(
        handleData: (data, sink) {
          byteCount += data.length;
          Log.d(byteCount);
          sink.add(data);
          Log.d("upload send $byteCount / $length");
          if (onProgress != null) {
            onProgress(((byteCount / length) * 100).toInt());
          }
        },
        handleError: (error, stack, sink) {
          Log.d("upload send error");
          Log.d(error);
          Log.d(stack.toString());
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
      Log.d("addStream catchError ${e.toString()}");
    });

    bytes.clear();
    data.clear();
    writeln(data);
    data.write(_BOUNDARY_PREFIX);
    data.write(boundary);
    bytes.addAll(utf8.encode(data.toString()));
    request.add(bytes);

    /// 增加上传超时
    try {
      final HttpClientResponse response =
          await request.close().timeout(const Duration(seconds: 10));
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
          if (onError != null) {
            onError(K.server_return_error_retry);
          }
          return;
        }
        if (jsonData.containsKey("success") && jsonData['success'] == true) {
          if (onComplete != null) {
            onComplete(jsonData['data']);
          }
          return jsonData['data'];
        } else {
          if (onError != null) {
            onError(jsonData['msg']);
          }
        }
      }, onError: (error, stack) {
        Log.d("upload onError ${error.toString()}");

        if (onError != null) {
          onError(K.upload_error_retry);
        }
      });

      Log.d("upload ${response.statusCode}");
      Log.d("upload ${response.contentLength}");
    } on TimeoutException catch (_) {
      request.abort();
      Log.d('upload time out');

      timeoutTime++;

      if (onError != null) {
        onError(timeoutTime < 2
            ? K.base_upload_image_timeout
            : K.base_upload_error_restart);
      }
    } catch (e) {
      Log.d(e.toString());
      if (onError != null) {
        onError(K.upload_error_retry);
      }
    }

    Log.d("upload complete --------------------------- ");
  }

  static Future uploadImageUint8List({
    Uint8List? imageData,
    required String uploadUrl,
    ValueChanged<int>? onProgress,
    ValueChanged<String>? onError,
    ValueChanged<Map>? onComplete,
  }) async {
    if (imageData == null) {
      onError?.call(K.upload_error_retry);
      return null;
    }

    try {
      String urlWithParams = _withUrl(uploadUrl);

      Map<String, String> headers = {'user-token': Session.token};
      headers.addAll(Xhr.globalHeaders);
      Log.d(headers);
      Options options = Options(headers: headers);

      Map<String, dynamic> map = {};
      map["file"] = MultipartFile.fromBytes(imageData,
          filename: "image.jpg", contentType: MediaType.parse('image/jpeg'));
      FormData formData = FormData.fromMap(map);
      Dio dio = Dio();
      dio.options.connectTimeout = const Duration(seconds: 5);
      dio.options.receiveTimeout = const Duration(seconds: 10);
      dio.options.sendTimeout = const Duration(seconds: 10);

      if (System.debug) {
        /// 测试环境不校验证书
        (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
            (HttpClient client) {
          client.findProxy = null;
          client.badCertificateCallback =
              (X509Certificate cr, String host, int port) => true;
          return null;
        };
      }

      Response response = await dio.post(
        urlWithParams,
        data: formData,
        options: options,
        onSendProgress: (int progress, int total) {
          Log.d("upload send $progress / $total");
          if (onProgress != null) {
            onProgress(((progress / total) * 100).toInt());
          }
        },
      );

      dynamic data = response.data;
      if (data != null && data is Map) {
        if (data.containsKey("success") && data['success'] == true) {
          Log.d('$data');
          if (onComplete != null) {
            onComplete(data['data']);
          }
        } else {
          if (onError != null) {
            onError(data['msg']);
          }
        }
      } else {
        onError?.call(K.upload_error_retry);
      }
    } catch (e) {
      onError?.call(K.upload_error_retry);
      Log.d(e);
    }

    Log.d("upload complete --------------------------- ");
  }

  static BaseOptions getDefOptions() {
    BaseOptions options = BaseOptions();
    options.connectTimeout = const Duration(seconds: 10);
    options.receiveTimeout = const Duration(seconds: 20);

    Map<String, dynamic> headers = {};
    headers['Accept'] = 'application/json';

    String? platform;
    if (Platform.isAndroid) {
      platform = "Android";
    } else if (Platform.isIOS) {
      platform = "IOS";
    }
    headers['OS'] = platform;
    options.headers = headers;

    return options;
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
