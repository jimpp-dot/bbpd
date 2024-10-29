import 'dart:core';
import 'dart:io';
import 'dart:math' as Math;
import 'dart:ui' as ui;

import 'package:shared/shared.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../moment.dart';

// 宽度固定为两张图片的宽度（一行三列样式）
final double kMaxImageWidth =
    (Util.width - 32 - 2 * kImagePadding) / 3 * 2 + kImagePadding;
final double kMaxWidth = (Util.width - 32);
final double kItemWidth = (Util.width - 32 - 2 * kImagePadding) / 3;

/// 朋友圈单张图片预览
class MomentSingleImageWidget extends StatefulWidget {
  final String url;
  final GestureTapCallback? onTap;
  final bool isVideo;
  final bool fromFile;
  final double? width;
  final double? height;
  final Moment? moment;
  final String? heroTag;

  const MomentSingleImageWidget({
    super.key,
    required this.url,
    this.onTap,
    this.isVideo = false,
    this.fromFile = false,
    this.height = 0.0,
    this.width = 0.0,
    this.moment,
    this.heroTag,
  });

  @override
  _MomentSingleImageWidgetState createState() =>
      _MomentSingleImageWidgetState();
}

class _MomentSingleImageWidgetState extends State<MomentSingleImageWidget> {
  Future<ui.Image>? _future;
  ImageProvider? _provider;

  @override
  void initState() {
    super.initState();
    _initFuture();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void didUpdateWidget(MomentSingleImageWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.url != widget.url) {
      _initFuture();
    }
  }

  _initFuture() {
    if (_isImageSizeReady()) {
      return;
    }
    if (widget.fromFile) {
      _provider = FileImage(File(widget.url));
    } else {
      _provider = NetworkImage(widget.url);
    }

    _future = MomentUtils.loadImageByProvider(_provider!);
  }

  @override
  Widget build(BuildContext context) {
    if (widget.url.isEmpty) {
      return InkWell(
        onTap: widget.onTap,
        child: Container(
          width: 144,
          height: 180,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: R.colors.secondBgColor,
          ),
        ),
      );
    }

    Size size;
    if (TagType.born == (widget.moment?.tagType ?? '')) {
      size = getFixedSingleImageSize(widget.width, widget.height);
    } else {
      size = getFixedBoxSize(widget.width, widget.height);
    }

    if (_isImageSizeReady()) {
      return _buildContent(size);
    }

    return FutureBuilder<ui.Image>(
      future: _future,
      builder: (BuildContext context, AsyncSnapshot<ui.Image> snapshot) {
        if (snapshot.connectionState == ConnectionState.done &&
            snapshot.hasData) {
          double? width = snapshot.data?.width.toDouble();
          double? height = snapshot.data?.height.toDouble();
          Size size = getFixedBoxSize(width, height);
          return _buildContent(size);
        } else {
          return SizedBox(
            width: size.width,
            height: size.height,
            child: const CupertinoActivityIndicator(),
          );
        }
      },
    );
  }

  Widget _buildLoading(Size size) {
    return SizedBox(
      width: size.width,
      height: size.height,
      child: Container(
        color: R.color.dividerColor
            .withOpacity(R.color.dividerColor.opacity * 0.8),
      ),
    );
  }

  Widget _buildContent(Size size) {
    return InkWell(
      onTap: widget.onTap,
      child: Stack(
        children: <Widget>[
          if (widget.fromFile)
            _buildFileImage(size, _provider!)
          else
            _buildNetWorkImage(size),
          if (widget.isVideo)
            Positioned.fill(
              child: Container(
                alignment: Alignment.center,
                child: R.img(
                  'ic_video_play.svg',
                  width: 36,
                  height: 36,
                  package: ComponentManager.MANAGER_MOMENT,
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildFileImage(Size size, ImageProvider provider) {
    return SizedBox(
      width: size.width,
      height: size.height,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Image(
          image: provider,
          width: size.width,
          height: size.height,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildNetWorkImage(Size size) {
    return SizedBox(
      width: size.width,
      height: size.height,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: widget.heroTag != null && widget.heroTag!.isNotEmpty
            ? Hero(
                tag: widget.heroTag!,
                child: CachedNetworkImage(
                  imageUrl: widget.url,
                  placeholder: _buildLoading(size),
                  width: size.width,
                  height: size.height,
                  cachedWidth: size.width.px,
                  cachedHeight: size.height.px,
                  fit: BoxFit.cover,
                ),
              )
            : CachedNetworkImage(
                imageUrl: widget.url,
                placeholder: _buildLoading(size),
                width: size.width,
                height: size.height,
                cachedWidth: size.width.px,
                cachedHeight: size.height.px,
                fit: BoxFit.cover,
              ),
      ),
    );
  }

  /// 图片宽高是否已知
  bool _isImageSizeReady() {
    return widget.width != null &&
        widget.height != null &&
        widget.width! > 0 &&
        widget.height! > 0;
  }
}

Size getFixedVideoBoxSize(double? width, double? height) {
  if (width != null && height != null && width > 0 && width > 0) {
    double containerWidth = kMaxWidth;
    double containerHeight;
    if (width >= height) {
      containerHeight = containerWidth * height / width;
    } else {
      containerHeight = (2 * kItemWidth + kImagePadding) * 1.2;
      containerWidth = containerHeight * width / height;
    }
    return Size(containerWidth, containerHeight);
  }
  return const Size(150, 150);
}

Size getFixedBoxSize(double? width, double? height) {
  if (width != null && height != null && width > 0 && width > 0) {
    double containerWidth = kMaxImageWidth;
    double containerHeight;
    if (width >= height) {
      containerWidth = (2 * kItemWidth + kImagePadding);
      containerHeight = Math.max(containerWidth * height / width, kItemWidth);
    } else {
      containerHeight = (2 * kItemWidth + kImagePadding);
      containerWidth = Math.max(containerHeight * width / height, kItemWidth);
    }
    return Size(containerWidth, containerHeight);
  } else {
    return const Size(150, 150);
  }
}

Size getFixedSingleImageSize(double? width, double? height) {
  if (width != null && height != null && width > 0 && width > 0) {
    double maxWidthHeight = kMaxWidth;
    double containerWidth = width;
    double containerHeight = height;
    if (containerWidth > maxWidthHeight) {
      double scale = (maxWidthHeight / containerWidth);
      containerWidth = containerWidth * scale;
      containerHeight = containerHeight * scale;
    }
    if (containerHeight > maxWidthHeight) {
      double scale = (maxWidthHeight / containerHeight);
      containerWidth = containerWidth * scale;
      containerHeight = containerHeight * scale;
    }
    return Size(containerWidth, containerHeight);
  } else {
    return const Size(150, 150);
  }
}
