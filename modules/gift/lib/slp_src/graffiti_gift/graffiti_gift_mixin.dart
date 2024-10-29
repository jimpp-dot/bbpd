import 'dart:ui';
import 'dart:typed_data';

import 'package:shared/shared.dart';
import 'package:flutter/material.dart' hide Image;

mixin GraffitiGiftMixin<T extends StatefulWidget> on State<T> {
  /// 图片尺寸
  final int _imageSize = 36;

  /// 显示比例
  double get ratio => 1.0;

  /// 图片显示尺寸
  double get imageShowSize => _imageSize * ratio;

  Image? image;

  @override
  void initState() {
    super.initState();
    _loadImage();
  }

  @override
  void didUpdateWidget(T oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (needUpdate(oldWidget)) {
      image = null;
      _loadImage();
    }
  }

  Future<void> _loadImage() async {
    if (!Util.isStringEmpty(icon)) {
      String iconUrl = Util.squareResize(icon!, _imageSize * 2);
      bool success = await CachedImageManager.instance().downloadAsync(iconUrl);
      if (success) {
        try {
          Uint8List dataList = CachedImageManager.instance()
              .getFileByUrl(iconUrl)
              .readAsBytesSync();
          final Codec codec = await instantiateImageCodec(dataList);
          final FrameInfo frameInfo = await codec.getNextFrame();
          image = frameInfo.image;
        } catch (e) {
          Log.d(e);
        }
      }
    }
    onImageLoaded(image != null);
  }

  String? get icon;

  /// 是否需要更新
  bool needUpdate(T oldWidget);

  /// 图片加载完成
  void onImageLoaded(bool success);
}
