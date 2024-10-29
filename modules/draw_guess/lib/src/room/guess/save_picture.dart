import 'dart:async';
import 'dart:ui' as ui;

import 'package:shared/ota_asset_bundle/ota_asset_bundle.dart';
import 'package:chat_room/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qr_flutter/qr_flutter.dart';

import 'draw_something.dart';
import 'src/audience_painter.dart';

const double _scale = 2.0;
const double _image_width = 375.0 * _scale;
const double _image_height = 667.0 * _scale;

Future<ui.Image> canvasToImage(
  Trace trace,
  String prompt,
  String nickname,
  String avatar,
  String qrData,
) async {
  ui.PictureRecorder recorder = ui.PictureRecorder();
  const ui.Rect rect = ui.Rect.fromLTWH(0, 0, _image_width, _image_height);
  Canvas canvas = Canvas(recorder, rect);

  // 背景图片
  ByteData bgData =
      await otaResourceBundle.load(RoomAssets.chat_room$guess_share_bg_webp);
  final Completer<ui.Image> bgCompleter = Completer();
  ui.decodeImageFromList(
      bgData.buffer.asUint8List(), (image) => bgCompleter.complete(image));
  ui.Image bg = await bgCompleter.future;
  paintImage(
    canvas: canvas,
    rect: rect,
    image: bg,
    fit: BoxFit.contain,
  );
  bg.dispose();

  // title 你画我猜
  ByteData titleData =
      await otaResourceBundle.load(RoomAssets.chat_room$guess_share_title_png);
  final Completer<ui.Image> titleCompleter = Completer();
  ui.decodeImageFromList(titleData.buffer.asUint8List(),
      (image) => titleCompleter.complete(image));
  ui.Image title = await titleCompleter.future;
  paintImage(
    canvas: canvas,
    rect: const Rect.fromLTWH(
        139 * _scale, 31 * _scale, 192 * _scale, 48 * _scale),
    image: title,
    fit: BoxFit.contain,
  );
  title.dispose();

  // desc 这画的啥？猜出来算我输！
  ByteData descData =
      await otaResourceBundle.load(RoomAssets.chat_room$guess_share_desc_png);
  final Completer<ui.Image> descCompleter = Completer();
  ui.decodeImageFromList(
      descData.buffer.asUint8List(), (image) => descCompleter.complete(image));
  ui.Image desc = await descCompleter.future;
  paintImage(
    canvas: canvas,
    rect: const Rect.fromLTWH(
        139 * _scale, 79 * _scale, 220 * _scale, 28 * _scale),
    image: desc,
    fit: BoxFit.contain,
  );
  desc.dispose();

  // 外层画框
  RRect rectOut = RRect.fromRectAndRadius(
    const Rect.fromLTWH(16 * _scale, 124 * _scale, 343 * _scale, 383 * _scale),
    const Radius.circular(12),
  );
  canvas.drawRRect(rectOut, Paint()..color = Colors.white);

  // 内层画布
  Color boardColor = const Color(0xFFFFF4EB);
  RRect rectInner = RRect.fromRectAndRadius(
    const Rect.fromLTWH(28 * _scale, 136 * _scale, 319 * _scale, 319 * _scale),
    const Radius.circular(8),
  );
  canvas.drawRRect(rectInner, Paint()..color = boardColor);
  canvas.save();
  canvas.translate(28 * _scale, 136 * _scale); // 平移canvas的原点到画布的原点
  AudiencePainter audiencePainter =
      AudiencePainter(trace, eraseColor: boardColor);
  audiencePainter.paint(canvas, const ui.Size(319 * _scale, 319 * _scale));
  canvas.restore();

  // 提示：蔬菜
  ui.ParagraphBuilder pb1 = ui.ParagraphBuilder(
    ui.ParagraphStyle(
      fontSize: 15 * _scale,
      textAlign: TextAlign.center,
      maxLines: 1,
    ),
  )
    ..pushStyle(ui.TextStyle(color: const Color(0xFF6D3824)))
    ..addText(prompt);
  ui.Paragraph paragraph1 = pb1.build()
    ..layout(const ui.ParagraphConstraints(width: 129 * _scale));
  canvas.drawParagraph(paragraph1, const Offset(123 * _scale, 470 * _scale));

  // logo
  ByteData logoData =
      await otaResourceBundle.load(RoomAssets.chat_room$guess_share_logo_png);
  final Completer<ui.Image> logoCompleter = Completer();
  ui.decodeImageFromList(logoData.buffer.asUint8List(),
      (ui.Image image) => logoCompleter.complete(image));
  ui.Image logo = await logoCompleter.future;
  paintImage(
    canvas: canvas,
    rect: const Rect.fromLTWH(
        0 * _scale, 20 * _scale, 132 * _scale, 117 * _scale),
    image: logo,
    fit: BoxFit.contain,
  );
  logo.dispose();

  // 底部圆角半透明矩形
  canvas.drawRRect(
    RRect.fromRectAndRadius(
      const Rect.fromLTWH(
          16 * _scale, 523 * _scale, 343 * _scale, 112 * _scale),
      const Radius.circular(12),
    ),
    Paint()..color = const Color(0x29000000),
  );

  // 用户头像
  canvas.drawCircle(
    const Offset((32 + 52 / 2.0) * _scale, (553 + 52 / 2.0) * _scale),
    (52 / 2.0) * _scale,
    Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2 * _scale,
  ); // 白色内边框

  NetworkImage avatarProvider = NetworkImage(avatar);
  Completer<ui.Image> avatarCompleter = Completer();
  ImageStream imageStream = avatarProvider.resolve(const ImageConfiguration());
  imageStream.addListener(ImageStreamListener(
    (ImageInfo imageInfo, bool _) => avatarCompleter.complete(imageInfo.image),
  ));
  ui.Image avatarImage = await avatarCompleter.future;
  canvas.save();
  Rect avatarRect =
      const Rect.fromLTWH(33 * _scale, 554 * _scale, 50 * _scale, 50 * _scale);
  canvas.clipRRect(RRect.fromRectAndRadius(
      avatarRect, const Radius.circular((50 / 2.0) * _scale)));
  paintImage(canvas: canvas, rect: avatarRect, image: avatarImage);
  avatarImage.dispose();
  canvas.restore();

  // 用户昵称
  ui.ParagraphBuilder pb2 = ui.ParagraphBuilder(
    ui.ParagraphStyle(
      fontSize: 20 * _scale,
      fontWeight: FontWeight.w500,
      textAlign: TextAlign.start,
      maxLines: 1,
    ),
  )
    ..pushStyle(ui.TextStyle(color: Colors.white))
    ..addText(nickname);
  ui.Paragraph paragraph2 = pb2.build()
    ..layout(const ui.ParagraphConstraints(width: 100 * _scale));
  canvas.drawParagraph(paragraph2, const Offset(92 * _scale, 554 * _scale));

  // 长按识别，一起来玩！
  ui.ParagraphBuilder pb3 = ui.ParagraphBuilder(ui.ParagraphStyle(
    fontSize: 13 * _scale,
    textAlign: TextAlign.start,
    maxLines: 1,
  ))
    ..pushStyle(ui.TextStyle(color: Colors.white))
    ..addText('长按识别，一起来玩！');
  ui.Paragraph paragraph3 = pb3.build()
    ..layout(const ui.ParagraphConstraints(width: 150 * _scale));
  canvas.drawParagraph(paragraph3, const Offset(92 * _scale, 583 * _scale));

  // 二维码
  canvas.drawRRect(
      RRect.fromRectAndRadius(
        const Rect.fromLTWH(
            263 * _scale, 539 * _scale, 80 * _scale, 80 * _scale),
        const Radius.circular(4.44),
      ),
      Paint()..color = Colors.white); // 白色背景
  ui.Image qr = await QrPainter(
    data: qrData,
    version: QrVersions.auto,
    gapless: true,
  ).toImage(76 * _scale, format: ui.ImageByteFormat.png);
  paintImage(
    canvas: canvas,
    rect: const Rect.fromLTWH(
        265 * _scale, 541 * _scale, 76 * _scale, 76 * _scale),
    image: qr,
    fit: BoxFit.contain,
  );
  qr.dispose();

  ui.Picture picture = recorder.endRecording();
  ui.Image image =
      await picture.toImage(_image_width.toInt(), _image_height.toInt());
  return image;
}
