import 'dart:async';
import 'dart:io';
import 'dart:math';
import 'dart:ui' as flutterui;

import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as ui;

import '../../../ota_asset_bundle/ota_asset_bundle.dart';

class ImageLoader {
  static ui.AssetBundle getAssetBundle() => otaResourceBundle;

  static Future<flutterui.Image> load(String url) async {
    ui.ImageStream stream = ui.AssetImage(url, bundle: getAssetBundle())
        .resolve(ui.ImageConfiguration.empty);
    Completer<flutterui.Image> completer = Completer<flutterui.Image>();

    ImageStreamListener? listener;
    listener = ImageStreamListener((ui.ImageInfo frame, bool synchronousCall) {
      final flutterui.Image image = frame.image;
      completer.complete(image);
      if (listener != null) stream.removeListener(listener);
    });

    stream.addListener(listener);
    return completer.future;
  }

  static Future<flutterui.Image> loadFile(File file) async {
    FileImage fileImage = FileImage(file);
    ui.ImageStream stream = fileImage.resolve(ui.ImageConfiguration.empty);

    Completer<flutterui.Image> completer = Completer<flutterui.Image>();

    ImageStreamListener? listener;
    listener = ImageStreamListener((ui.ImageInfo frame, bool synchronousCall) {
      final flutterui.Image image = frame.image;
      completer.complete(image);
      if (listener != null) stream.removeListener(listener);
    });

    stream.addListener(listener);
    return completer.future;
  }
}

class SignaturePainter extends CustomPainter {
  // point[0] touchDown offset, point[1] touchMoveOffset  point[2] clip square start offset, point[3],image draw size
  final List<Offset> points;
  double cWidth = 400; //clip square width
  double cHeight = 400; //clip square height
  double width; //total width
  double height; //total height
  flutterui.Image? image; // source image

  SignaturePainter(this.points, this.width, this.height, this.cWidth,
      this.cHeight, this.image);

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.blue[200]!
      ..isAntiAlias = true
      ..strokeWidth = 2.0
      ..strokeJoin = StrokeJoin.bevel;

    double dwidth = 0;
    double dheight = 0;

    //draw the background image
    if (image != null) {
      if (image!.width.toDouble() / width > image!.height.toDouble() / height) {
        dwidth = width;
        dheight = image!.height.toDouble() * dwidth / image!.width.toDouble();
      } else {
        dheight = height;
        dwidth = image!.width.toDouble() * dheight / image!.height.toDouble();
      }
      if (points.isNotEmpty) {
        points[3] = Offset(dwidth, dheight);
      }
      canvas.drawImageRect(
          image!,
          Rect.fromLTWH(
              0, 0, image!.width.toDouble(), image!.height.toDouble()),
          Rect.fromLTWH(
              (width - dwidth) / 2, (height - dheight) / 2, dwidth, dheight),
          paint);
    }

    double startX = points[1].dx - points[0].dx + points[2].dx;
    double startY = points[1].dy - points[0].dy + points[2].dy;
    if (startX < 0) {
      startX = 0;
    } else if (startX + cWidth > width) {
      startX = width - cWidth;
    }
    if (startY < 0) {
      startY = 0;
    } else if (startY + cHeight > height) {
      startY = height - cHeight;
    }
    List<Offset> points2 = [
      Offset(startX, startY),
      Offset(startX + cWidth, startY),
      Offset(startX + cWidth, startY + cHeight),
      Offset(startX, startY + cHeight),
    ];

    paint.color = Colors.black.withOpacity(0.4);
    canvas.drawDRRect(
        RRect.fromRectAndRadius(
            Rect.fromLTWH(
                (width - dwidth) / 2, (height - dheight) / 2, dwidth, dheight),
            Radius.zero),
        RRect.fromRectAndRadius(
            Rect.fromLTWH(
                max(startX, (width - dwidth) / 2),
                max(startY, (height - dheight) / 2),
                min(cWidth, dwidth),
                min(cHeight, dheight)),
            Radius.zero),
        paint);

    //draw four corner
    paint.color = Colors.blue;
    paint.strokeWidth = 4;
    double cornerLength = 20;
    //left top corner
    canvas.drawLine(points2[0].translate(paint.strokeWidth / 2, 0),
        points2[0].translate(paint.strokeWidth / 2, cornerLength), paint);
    canvas.drawLine(points2[0], points2[0].translate(cornerLength, 0), paint);

    //right top corner
    canvas.drawLine(points2[1].translate(-paint.strokeWidth / 2, 0),
        points2[1].translate(-paint.strokeWidth / 2, cornerLength), paint);
    canvas.drawLine(points2[1], points2[1].translate(-cornerLength, 0), paint);

    //right bottom corner
    canvas.drawLine(points2[2].translate(-paint.strokeWidth / 2, 0),
        points2[2].translate(-paint.strokeWidth / 2, -cornerLength), paint);
    canvas.drawLine(points2[2], points2[2].translate(-cornerLength, 0), paint);

    //left bottom corner
    canvas.drawLine(points2[3].translate(paint.strokeWidth / 2, 0),
        points2[3].translate(paint.strokeWidth / 2, -cornerLength), paint);
    canvas.drawLine(points2[3], points2[3].translate(cornerLength, 0), paint);
  }

  @override
  bool shouldRepaint(SignaturePainter oldDelegate) {
    return true;
  }
}

///clip point position
enum DownPosition { LEFT_UP, RIGHT_UP, LEFT_DOWN, RIGHT_DOWN }
