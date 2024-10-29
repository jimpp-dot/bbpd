import 'dart:io';
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:shared/shared.dart';
import 'package:image_size_getter/file_input.dart';
import 'package:image_size_getter/image_size_getter.dart';

class ImageDownloadChecker {
  static const bool _uploadSwitchOpen = !kDebugMode;

  static final String api = '${System.domain}test/imageRecord';

  static void uploadErrorNetImageUrl(String imgUrl) {
    if (!_uploadSwitchOpen || Util.isStringEmpty(imgUrl)) return;

    try {
      Uri uri = Uri.parse(imgUrl);
      // 过滤非oss图片
      if (!uri.host.contains('oss')) return;

      String path = uri.path;
      if (path.contains('!')) {
        path = uri.path.substring(0, uri.path.indexOf('!'));
      }
      Log.d('load image error, upload path = $path');
      // 防止集中同时请求
      Future.delayed(Duration(milliseconds: Random().nextInt(1000)),
          () => Xhr.post(api, {'img': path}));
    } catch (e) {
      Log.d(e);
    }
  }

  static void checkInvalidImage(
      String url, File image, double? width, double? height,
      {StackTrace? trace}) {
    AssetDataLog.instance?.add(AssetDataInfo(url: url));
    if (Constant.inProduction || (width == null && height == null)) return;
    if (width == double.infinity || height == double.infinity) {
      StackTraceUtil.printStackTrace(
        tag: 'not recommended to use double.infinity for image size!',
        url: url,
        trace: trace,
      );
      return;
    }
    int ww = (width ?? 0).px;
    int wh = (height ?? 0).px;
    Size size = ImageSizeGetter.getSize(FileInput(image));
    if ((ww > 0 && size.width / ww > 1.5) ||
        (wh > 0 && size.height / wh > 1.5)) {
      StackTraceUtil.printStackTrace(
        tag: 'invalid image:ww=$ww wh=$wh iw=${size.width} ih=${size.height}',
        url: url,
        trace: trace,
      );
    }
  }
}
