import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'dart:ui';

import 'package:shared/shared.dart';
import 'package:path_provider/path_provider.dart';
import 'package:chat_room/src/wedding/mode/room_wedding_beans.dart';

const _LogTag = 'roomWedding';

/// 婚礼相册生成、上传
void saveAndUploadPhoto(
    {required ScreenshotController controller,
    required int wid,
    WeddingState? weddingState,
    String? effectUrl}) async {
  try {
    ui.Image? bgImage = await controller.captureAsUiImage();
    if (bgImage == null) {
      Log.d(tag: _LogTag, 'saveAndUploadPhoto capture bg image error');
      return;
    }

    // 如果是开幕，先上传合成之前的图片
    // if (weddingState == WeddingState.Opening) {
    //   ByteData byteData = await bgImage.toByteData(format: ui.ImageByteFormat.png);
    //   Uint8List imageResult = byteData.buffer.asUint8List();
    //   _uploadImage(wid, WeddingState.Init, imageResult);
    // }

    // 下载动效图片
    File? effectFile;
    if (effectUrl != null && effectUrl.isNotEmpty) {
      String? localPath =
          await DownloadManager.downloadImage(Util.getRemoteImgUrl(effectUrl));
      if (localPath != null && localPath.isNotEmpty) {
        effectFile = File(localPath);
      }
    }
    Uint8List? imageResult;
    if (effectFile != null && await effectFile.exists()) {
      // 图片合成
      Uint8List effectByteData = effectFile.readAsBytesSync();
      Codec codec = await ui.instantiateImageCodec(
          effectByteData.buffer.asUint8List(),
          targetWidth: Util.width.toInt(),
          targetHeight: Util.height.toInt());
      FrameInfo fi = await codec.getNextFrame();
      imageResult = await _composeImage(bgImage, fi.image);
    } else {
      ByteData? byteData =
          await bgImage.toByteData(format: ui.ImageByteFormat.png);
      imageResult = byteData?.buffer.asUint8List();
    }

    if (imageResult == null) {
      Log.d(tag: _LogTag, 'saveAndUploadPhoto imageResult is null');
      return null;
    }
    _uploadImage(wid, weddingState, imageResult);
  } catch (e) {
    Log.d(tag: _LogTag, 'saveAndUploadPhoto error: $e');
  }
}

/// 上传图片
void _uploadImage(
    int wid, WeddingState? weddingState, Uint8List imageResult) async {
  String filePrefix = weddingState?.toString() ?? 'init';
  File resultFile = await _generateImageFile(filePrefix);
  await resultFile.writeAsBytes(imageResult, flush: true);
  Log.d(
      tag: _LogTag,
      'saveAndUploadPhoto generate file success: ${resultFile.path}');

  /// 上传图片
  await ImageUploadState.uploadImage(
      imageFile: resultFile,
      uploadUrl: '${System.domain}upload/image/',
      onError: (String error) {
        Log.d(tag: _LogTag, 'saveAndUploadPhoto _uploadImage error: $error');
      },
      onComplete: (Map data) {
        /// 生成图片URL成功，调用接口保存URL
        String imgUrl = data['name'];
        _savePhoto(wid, imgUrl);
        // 上传成功删除生成的文件
        try {
          resultFile.delete();
        } catch (e) {
          Log.d(
              tag: _LogTag,
              'saveAndUploadPhoto delete resultFile failed: ${resultFile.path}');
        }
      });
}

/// 上传url到服务端
void _savePhoto(int wid, String imgUrl) async {
  bool success = false;
  try {
    XhrResponse xhrResponse =
        await Xhr.postJson('${System.domain}games/wedding/addEssenceImage', {
      'wid': '$wid',
      'image': imgUrl,
    });
    BaseResponse response = BaseResponse.parse(xhrResponse);
    success = response.success;
  } catch (e) {
    Log.d(e);
  }
  if (success) {
    // Fluttertoast.showToast(msg: K.room_capture_tip1);
    Log.d(tag: _LogTag, 'savePhoto success url: $imgUrl');
  } else {
    Log.d(tag: _LogTag, 'savePhoto failed url: $imgUrl');
  }
}

/// 两张照片合成一张
Future<Uint8List?> _composeImage(ui.Image image1, ui.Image image2) async {
  try {
    var pictureRecorder = ui.PictureRecorder();
    var canvas = Canvas(pictureRecorder);
    Paint paint = Paint()
      ..style = PaintingStyle.fill
      ..isAntiAlias = true;

    // 绘制图片
    canvas.drawImage(image1, const Offset(0, 0), paint);

    // 绘制图片
    canvas.drawImage(image2, const Offset(0, 0), paint);

    //下面的代码是生成图片的关键代码，以上绘制文字和圆圈的代码可以忽略不计
    var picture = await pictureRecorder
        .endRecording()
        .toImage(Util.width.toInt(), Util.height.toInt()); //设置生成图片的宽和高
    var pngImageBytes =
        await picture.toByteData(format: ui.ImageByteFormat.png);
    // var imgBytes = Uint8List.view(pngImageBytes.buffer); //这一行和下面这一行都是生成Uint8List格式的图片
    Uint8List? pngBytes = pngImageBytes?.buffer.asUint8List();
    return pngBytes;
  } catch (e) {
    Log.d(e);
  }
  return null;
}

/// 生成婚礼相册保存路径
Future<File> _generateImageFile(String filePrefix) async {
  final Directory directory = await getTemporaryDirectory();
  final Directory imageDirectory =
      await Directory('${directory.path}/wedding/image/')
          .create(recursive: true);
  File file = File(
      '${imageDirectory.path}${filePrefix}_${DateTime.now().millisecondsSinceEpoch}.png');
  if (!await file.exists()) {
    await file.create(recursive: true);
  }
  return file;
}
