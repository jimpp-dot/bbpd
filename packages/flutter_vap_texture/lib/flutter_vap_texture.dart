library flutter_vap_texture;

import 'dart:async';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/rendering.dart';
import 'package:dio/dio.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

typedef VapWidgetCreatedCallback = void Function(FlutterVapController controller);
typedef OnRenderFrame = Function(int frameIndex, int frameTotal);
typedef ErrorCallback = void Function(String message, Object error);

class VapWidget extends StatefulWidget {
  final VapWidgetCreatedCallback? onPlatformViewCreated;
  final VoidCallback? onComplete;
  final Future? delayToShowFuture;
  final OnRenderFrame? onRenderFrame;

  /// 默认hybridComposition为true，部分需要支持截图的场景hybridComposition为false
  final bool hybridComposition;
  final ErrorCallback? onError;

  const VapWidget({
    Key? key,
    this.onPlatformViewCreated,
    this.onComplete,
    this.delayToShowFuture,
    this.onRenderFrame,
    this.onError,
    this.hybridComposition = true,
  }) : super(key: key);

  @override
  _VapWidgetState createState() => _VapWidgetState();
}

class _VapWidgetState extends State<VapWidget> {
  double? _width;
  double? _height;
  FlutterVapController? _flutterVapController;

  @override
  Widget build(BuildContext context) {
    Widget? nativeView;
    if (defaultTargetPlatform == TargetPlatform.android) {
      final Map<String, dynamic> creationParams = <String, dynamic>{
        'touchEnable': false,
      };
      String viewType = 'plugins.flutter.io/vap_view';

      if (widget.hybridComposition == false) {
        nativeView = AndroidView(
          viewType: viewType,
          layoutDirection: TextDirection.ltr,
          creationParams: creationParams,
          creationParamsCodec: const StandardMessageCodec(),
          gestureRecognizers: const <Factory<OneSequenceGestureRecognizer>>{},
          onPlatformViewCreated: _onPlatformViewCreated,
        );
      } else {
        nativeView = PlatformViewLink(
          viewType: viewType,
          surfaceFactory: (
            BuildContext context,
            PlatformViewController controller,
          ) {
            return AndroidViewSurface(
              controller: controller as AndroidViewController,
              gestureRecognizers: const <Factory<OneSequenceGestureRecognizer>>{},
              hitTestBehavior: PlatformViewHitTestBehavior.opaque,
            );
          },
          onCreatePlatformView: (PlatformViewCreationParams params) {
            return PlatformViewsService.initSurfaceAndroidView(
              id: params.id,
              viewType: viewType,
              layoutDirection: TextDirection.ltr,
              creationParams: creationParams,
              creationParamsCodec: const StandardMessageCodec(),
            )
              ..addOnPlatformViewCreatedListener(params.onPlatformViewCreated)
              ..addOnPlatformViewCreatedListener(_onPlatformViewCreated)
              ..create();
          },
        );
      }
    } else if (defaultTargetPlatform == TargetPlatform.iOS) {
      nativeView = UiKitView(
        // key: widget.key,
        viewType: 'plugins.flutter.io/vap_view',
        onPlatformViewCreated: _onPlatformViewCreated,
      );
    }
    if (nativeView != null) {
      return LayoutBuilder(builder: (BuildContext context, BoxConstraints constraints) {
        _width = constraints.constrainWidth();
        _height = constraints.constrainHeight();
        return SizedBox(
          width: _width,
          height: _height,
          // padding: EdgeInsetsDirectional.only(start: 100, end: 50, top: 50, bottom: 50),
          // color: Colors.red.withOpacity(0.5),
          child: nativeView,
        );
      });
    }
    return Text('$defaultTargetPlatform platform version is not implemented yet.');
  }

  @override
  void dispose() {
    print('VapWidget:dispose');
    if (_flutterVapController != null) {
      _flutterVapController!.dispose();
    }
    super.dispose();
  }

  void _onPlatformViewCreated(int id) async {
    if (widget.onPlatformViewCreated == null) {
      return;
    }

    if (widget.delayToShowFuture != null) {
      await widget.delayToShowFuture;
    }

    print('_VapWidgetState._onPlatformViewCreated id = $id');
    _flutterVapController = FlutterVapController._(id,
        onComplete: widget.onComplete, onRenderFrame: widget.onRenderFrame, onError: widget.onError);
    _flutterVapController!.width = _width;
    _flutterVapController!.height = _height;
    widget.onPlatformViewCreated!(_flutterVapController!);
  }
}

class FlutterVapController {
  final VoidCallback? onComplete;
  final OnRenderFrame? onRenderFrame;
  final ErrorCallback? onError;

  FlutterVapController._(int id, {this.onComplete, this.onRenderFrame, this.onError})
      : _channel = MethodChannel('ly.plugins.vap_view.$id') {
    _channel.setMethodCallHandler(_handlerMethod);
  }

  final MethodChannel _channel;

  double? width;
  double? height;

  /// 开始播放vap转制过的mp4视频文件
  ///
  /// [filePath]是完整的文件路径
  ///
  /// [repeatCount]是重复播放次数，值为-1时无限循环播放，为0时正常播放结束不再重复
  ///
  /// 融合信息：图片List
  /// [imgList]：vap支持嵌入图片,图片需要提前下载到本地，传本地路径
  ///
  /// 融合信息：文字List
  /// [textList]：vap支持嵌入文字
  Future startPlay(String filePath,
      {repeatCount = 0, List<String>? imgList, List<String>? textList, String? savePath}) async {
    if (repeatCount == -1 && Platform.isAndroid) {
      repeatCount = 100000;
    }

    String tempFilePath = filePath;
    if (filePath.startsWith('http://') || filePath.startsWith('https://')) {
      if (savePath == null) {
        String cachePath = await getGiftCachePath();
        String fileName = basename(filePath);
        File file = getGiftFile(fileName, cachePath);
        if (await file.exists()) {
          tempFilePath = file.path;
        } else {
          try {
            await download(filePath, file.path);
            tempFilePath = file.path;
          } catch (e) {
            if (onError != null) {
              onError!('empty savePath download failed', e);
            }
            return e;
          }
        }
      } else {
        File file = File(savePath);
        if (await file.exists()) {
          tempFilePath = savePath;
        } else {
          try {
            await download(filePath, savePath);
            tempFilePath = savePath;
          } catch (e) {
            if (onError != null) {
              onError!('download failed', e);
            }
            return e;
          }
        }
      }
    } else {
      File file = File(filePath);
      if (await file.exists() == false) {
        return Exception('local file can not be null!!!');
      }
    }

    Map params = {'filePath': tempFilePath, 'repeatCount': repeatCount, "imgList": imgList, "textList": textList};
    try {
      return await _channel.invokeMethod('startPlay', params);
    } catch (e) {
      print('FlutterVapController.startPlay error = ${e.toString()}');
      print(e);
      if (onError != null) {
        onError!('startPlay error', e);
      }
      return e;
    }
  }

  Future<String> getGiftCachePath() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String baseDir = join(documentsDirectory.path, 'gift_big');
    await Directory(baseDir).create(recursive: true);
    return baseDir;
  }

  File getGiftFile(String fileName, String cachePath) {
    File file = File(join(cachePath, fileName));
    return file;
  }

  Future<Response> download(String url, String savePath) async {
    Dio dio = Dio();
    Response response = await dio.download(url, savePath);
    return response;
  }

  void dispose() async {
    if (Platform.isIOS) {
      try {
        _channel.invokeMethod('dispose');
        print('FlutterVapController.dispose');
      } catch (e) {
        print('FlutterVapController.dispose error = ${e.toString()}');
        print(e);
        if (onError != null) {
          onError!('dispose error', e);
        }
      }
    }
    _channel.setMethodCallHandler(null);
  }

  Future<dynamic> _handlerMethod(MethodCall call) async {
    switch (call.method) {
      case 'onComplete':
        if (onComplete != null) {
          onComplete!();
        }
        break;
      case "onRenderFrame":
        Map params = call.arguments;
        int frameIndex = params['frameIndex'] ?? 0;
        int frameTotal = params['frameTotal'] ?? 0;
        // print('FlutterVapController._handlerMethod onRenderFrame frameIndex = $frameIndex');
        if (onRenderFrame != null) {
          onRenderFrame!(frameIndex, frameTotal);
        }
        break;
      default:
        break;
    }
  }
}
