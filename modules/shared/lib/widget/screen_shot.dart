import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../shared.dart';

/// 截屏widget
class ScreenShot extends StatefulWidget {
  final Widget child;
  final ScreenshotController controller;

  const ScreenShot({super.key, required this.controller, required this.child});

  @override
  _ScreenShotState createState() => _ScreenShotState();
}

class _ScreenShotState extends State<ScreenShot> {
  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      key: widget.controller._globalKey,
      child: widget.child,
    );
  }
}

class ScreenshotController {
  final GlobalKey _globalKey = GlobalKey();

  ScreenshotController();

  /// 截屏为ui.Image
  Future<ui.Image?> captureAsUiImage(
      {double pixelRatio = 1,
      Duration delay = const Duration(milliseconds: 50)}) async {
    return Future.delayed(delay, () async {
      try {
        RenderRepaintBoundary boundary = _globalKey.currentContext
            ?.findRenderObject() as RenderRepaintBoundary;
        ui.Image image = await boundary.toImage(pixelRatio: pixelRatio);
        return image;
      } catch (e) {
        Log.d(e);
      }
      return null;
    });
  }

  /// 截屏
  Future<Uint8List?> capture(
      {double pixelRatio = 1,
      Duration delay = const Duration(milliseconds: 50)}) async {
    return Future.delayed(delay, () async {
      try {
        ui.Image? image = await captureAsUiImage(
          delay: Duration.zero,
          pixelRatio: pixelRatio,
        );
        ByteData? byteData =
            await image!.toByteData(format: ui.ImageByteFormat.png);
        Uint8List pngBytes = byteData!.buffer.asUint8List();
        return pngBytes;
      } catch (e) {
        Log.d(e);
      }
      return null;
    });
  }

  /// 截屏并保持到文件
  /// 如果路径文件存在，内容会被覆盖
  Future<File?> captureAndSave(
      {required String filePath,
      double pixelRatio = 1,
      format = ui.ImageByteFormat.png,
      Duration delay = const Duration(milliseconds: 50)}) async {
    try {
      var file = File(filePath);
      if (!await file.exists()) {
        await file.create(recursive: true);
      }

      Uint8List? pngBytes = await capture(pixelRatio: pixelRatio, delay: delay);
      if (pngBytes == null) {
        return null;
      }
      return file.writeAsBytes(pngBytes, flush: true);
    } catch (e) {
      Log.d(e);
    }
    return null;
  }
}
