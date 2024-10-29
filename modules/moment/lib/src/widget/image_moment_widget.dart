import 'dart:core';

import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:moment/moment.dart';

const double kImageSize = 84;
const double kImagePadding = 3;

/// 朋友圈图片widget
class MomentImageWidget extends StatefulWidget {
  final List<ImageBean> images;
  final Moment? moment;
  final MomentFlowPage? page; // 页面来源
  final String? topicName; // 页面标签

  const MomentImageWidget(
      {super.key,
      required this.images,
      this.moment,
      this.page,
      this.topicName});

  @override
  _MomentImageWidgetState createState() => _MomentImageWidgetState();
}

class _MomentImageWidgetState extends State<MomentImageWidget> {
  final List<String> _heroTags = [];

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < widget.images.length; ++i) {
      _heroTags.add(
          '${i}_${DateTime.now().microsecondsSinceEpoch}_${widget.images[i].url}');
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.images.isEmpty) {
      return const SizedBox.shrink();
    }

    if (widget.images.length == 1) {
      return MomentSingleImageWidget(
        url: widget.images[0].cover375 ?? '',
        heroTag: _heroTags[0],
        onTap: () => _onImageTaped(context, 0),
        width: widget.images[0].width,
        height: widget.images[0].height,
        moment: widget.moment,
      );
    }

    int crossAxisCount = 3;
    if (widget.images.length == 4) crossAxisCount = 2;

    double width = (Util.width - 32) / 3;

    return SizedBox(
      width: width * crossAxisCount,
      child: GridView.count(
        padding: const EdgeInsets.all(0),
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        crossAxisCount: crossAxisCount,
        mainAxisSpacing: kImagePadding,
        crossAxisSpacing: kImagePadding,
        childAspectRatio: 1.0,
        children: widget.images
            .asMap()
            .map((index, item) =>
                MapEntry(index, _buildImageItem(context, item, index)))
            .values
            .toList(),
      ),
    );
  }

  Widget _buildImageItem(BuildContext context, ImageBean imageBean, int index) {
    String? tag = _heroTags.length > index ? _heroTags[index] : null;

    Widget childWidget = SizedBox(
      width: kImageSize,
      height: kImageSize,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: CachedNetworkImage(
          imageUrl: Util.squareResize(imageBean.url ?? '', 240),
          placeholder: _buildLoading(),
          width: kImageSize,
          height: kImageSize,
          cachedWidth: kImageSize.px,
          // cachedHeight: kImageSize.px,
          fit: BoxFit.cover,
        ),
      ),
    );
    return InkWell(
      onTap: () => _onImageTaped(context, index),
      child: tag != null && tag.isNotEmpty
          ? Hero(tag: tag, child: childWidget)
          : childWidget,
    );
  }

  Widget _buildLoading() {
    return SizedBox(
      width: kImageSize,
      height: kImageSize,
      child: Container(
        color: R.color.dividerColor
            .withOpacity(R.color.dividerColor.opacity * 0.8),
      ),
    );
  }

  /// 动态图片点击
  _onImageTaped(BuildContext context, int index) {
    if (widget.moment == null) return;
    trackerReport(
        moment: widget.moment,
        page: widget.page,
        clickType: 'moment_image',
        topicName: widget.topicName);

    PhotoViewGalleryScreen.showPhotoViewGalleryScreen(
      context,
      images: widget.images,
      index: index,
      heroTags: _heroTags,
      showAlbum: widget.moment == null ? false : true,
      moment: widget.moment!,
      uid: widget.moment!.uid,
      refer: getFlowPage(widget.page),
    );
  }
}
