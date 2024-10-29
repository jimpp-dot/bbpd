import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart'
    hide CachedNetworkImage;

class CommonTagData {
  int type;
  String label;
  String icon;
  int textStartPx;
  int fontStyle;
  String fontColor;
  int tagId;
  int location;

  CommonTagData({
    required this.type,
    required this.label,
    required this.icon,
    required this.textStartPx,
    required this.fontStyle,
    this.fontColor = '',
    this.tagId = 0,
    this.location = 0,
  });

  bool get isColorfulName => type == 7;

  @override
  String toString() {
    return 'CommonTagData: tagId=$tagId,type=$type,location=$location, label=$label, icon=$icon, textStartPx=$textStartPx';
  }
}

class CommonTagWidget extends StatelessWidget {
  final CommonTagData data;
  final bool inProfilePage;
  final bool needMarginEnd;

  const CommonTagWidget(
      {super.key,
      required this.data,
      required this.inProfilePage,
      this.needMarginEnd = true});

  @override
  Widget build(BuildContext context) {
    return buildTagByData(data);
  }

  Widget buildTagByData(CommonTagData data) {
    if (data.type == 1) {
      return buildType1(data);
    } else if (data.type == 2) {
      return buildType2(data);
    } else if (data.type == 3) {
      return buildType3(data);
    } else if (data.type == 4) {
      return buildType4(data);
    } else if (data.type == 5) {
      return buildType5(data);
    }

    return const SizedBox.shrink();
  }

  /// 纯图片，高度固定，保持图片的宽高比
  Widget buildType1(CommonTagData data) {
    if (!Util.validStr(data.icon)) {
      return const SizedBox.shrink();
    }
    return Padding(
      padding: EdgeInsetsDirectional.only(end: needMarginEnd ? 3 : 0),
      child: CachedNetworkImage(
        imageUrl: Util.resizeUrl(data.icon, rh: 75),
        height: inProfilePage == true ? 27 : 22,
        fit: BoxFit.fitHeight,
      ),
    );
  }

  /// 图片+文字，图片高度固定，宽度保持图片宽高比缩放，文字从textStartPx开始
  Widget buildType2(CommonTagData data) {
    if (!Util.validStr(data.icon)) {
      return const SizedBox.shrink();
    }

    return Padding(
      padding: EdgeInsetsDirectional.only(end: needMarginEnd ? 3 : 0),
      child: CommonTagStyle2(
        icon: data.icon,
        label: data.label,
        fontStyle: data.fontStyle,
        fontColor: data.fontColor,
        textMarginStart: data.textStartPx,
        inProfilePage: inProfilePage,
      ),
    );
  }

  /// 图片高度固定，宽度根据文字的长度自动拉伸
  Widget buildType3(CommonTagData data) {
    if (!Util.validStr(data.icon)) {
      return const SizedBox.shrink();
    }

    return Padding(
      padding: EdgeInsetsDirectional.only(end: needMarginEnd ? 3 : 0),
      child: CommonTagStyle3(
        icon: data.icon,
        label: data.label,
        fontStyle: data.fontStyle,
        fontColor: data.fontColor,
        inProfilePage: inProfilePage,
        tagId: data.tagId,
      ),
    );
  }

  /// 图片+文字，图片高度固定，宽度保持图片宽高比缩放，文字居中
  Widget buildType4(CommonTagData data) {
    if (!Util.validStr(data.icon)) {
      return const SizedBox.shrink();
    }
    return Padding(
      padding: EdgeInsetsDirectional.only(end: needMarginEnd ? 3 : 0),
      child: CommonTagStyle4(
        icon: data.icon,
        label: data.label,
        fontStyle: data.fontStyle,
        fontColor: data.fontColor,
        inProfilePage: inProfilePage,
      ),
    );
  }

  /// 纯文字
  Widget buildType5(CommonTagData data) {
    return Padding(
      padding: EdgeInsetsDirectional.only(start: 2, end: needMarginEnd ? 3 : 0),
      child: Text(
        data.label,
        style: TextStyle(
            color: Util.validStr(data.fontColor)
                ? Util.parseColor(data.fontColor)
                : const Color(0xFFFCE78D),
            fontSize: 12,
            fontWeight: FontWeight.w600),
      ),
    );
  }
}

/// 图片宽度固定，文字从textMarginStart开始
class CommonTagStyle2 extends StatefulWidget {
  final String icon;
  final String label;
  final int fontStyle;
  final String fontColor;
  final int textMarginStart;
  final bool inProfilePage;

  const CommonTagStyle2({
    super.key,
    required this.icon,
    required this.label,
    required this.fontStyle,
    required this.fontColor,
    required this.textMarginStart,
    required this.inProfilePage,
  });

  @override
  State<CommonTagStyle2> createState() => CommonTagStyle2State();
}

class CommonTagStyle2State extends State<CommonTagStyle2> {
  double ratio = 0;
  ImageStream? _imageStream;
  ImageStreamListener? _imageStreamListener;

  @override
  void initState() {
    super.initState();

    getImageSize();
  }

  @override
  dispose() {
    if (_imageStreamListener != null) {
      _imageStream?.removeListener(_imageStreamListener!);
      _imageStreamListener = null;
    }
    super.dispose();
  }

  void getImageSize() async {
    Image imageNetwork = Image(
        image: CachedNetworkImageProvider(Util.getRemoteImgUrl(widget.icon)));
    _imageStream = imageNetwork.image.resolve(const ImageConfiguration());
    _imageStreamListener = ImageStreamListener(
      (ImageInfo info, bool _) {
        ratio = info.image.width / info.image.height;
        if (mounted) {
          setState(() {});
        }
      },
    );
    _imageStream?.addListener(_imageStreamListener!);
  }

  @override
  Widget build(BuildContext context) {
    if (ratio == 0) {
      return CachedNetworkImage(
        imageUrl: Util.getRemoteImgUrl(widget.icon),
        height: widget.inProfilePage == true ? 27 : 22,
        fit: BoxFit.fitHeight,
      );
    } else {
      return Container(
        height: widget.inProfilePage == true ? 27 : 22,
        width: ratio * (widget.inProfilePage == true ? 27 : 22),
        decoration: BoxDecoration(
          image: DecorationImage(
            image:
                CachedNetworkImageProvider(Util.getRemoteImgUrl(widget.icon)),
            fit: BoxFit.fitHeight,
          ),
        ),
        padding: EdgeInsetsDirectional.only(
            start: widget.textMarginStart.toDouble(), end: 4),
        alignment: AlignmentDirectional.centerStart,
        child: LabelText(
          label: widget.label,
          inProfilePage: widget.inProfilePage,
          fontStyle: widget.fontStyle,
          needOverflow: true,
          fontColor: widget.fontColor,
        ),
      );
    }
  }
}

class CommonTagStyle3 extends StatefulWidget {
  final String icon;
  final String label;
  final int fontStyle;
  final String fontColor;
  final bool inProfilePage;
  final int tagId;

  const CommonTagStyle3(
      {super.key,
      required this.icon,
      required this.label,
      required this.fontStyle,
      required this.fontColor,
      required this.inProfilePage,
      this.tagId = 0});

  @override
  State<CommonTagStyle3> createState() => CommonTagStyle3State();
}

class CommonTagStyle3State extends State<CommonTagStyle3> {
  double ratio = 0;
  ImageStream? _imageStream;
  ImageStreamListener? _imageStreamListener;

  @override
  void initState() {
    super.initState();

    getImageSize();
  }

  @override
  dispose() {
    if (_imageStreamListener != null) {
      _imageStream?.removeListener(_imageStreamListener!);
      _imageStreamListener = null;
    }
    super.dispose();
  }

  void getImageSize() async {
    Image imageNetwork = Image(
        image: CachedNetworkImageProvider(Util.getRemoteImgUrl(widget.icon)));
    _imageStream = imageNetwork.image.resolve(const ImageConfiguration());
    _imageStreamListener = ImageStreamListener(
      (ImageInfo info, bool _) {
        ratio = info.image.width / info.image.height;
        if (mounted) {
          setState(() {});
        }
      },
    );
    _imageStream?.addListener(_imageStreamListener!);
  }

  @override
  Widget build(BuildContext context) {
    if (ratio == 0) {
      return CachedNetworkImage(
        imageUrl: Util.getRemoteImgUrl(widget.icon),
        height: widget.inProfilePage == true ? 27 : 22,
        fit: BoxFit.fitHeight,
      );
    } else {
      ///根据id判断是否是觉醒礼物的标签
      bool isAwake = widget.tagId == 262 || widget.tagId == 263;
      return Stack(
        children: [
          PositionedDirectional(
            start: 0,
            top: 0,
            end: 0,
            bottom: 0,
            child: CachedNetworkImageStretch(
              imageUrl: Util.getRemoteImgUrl(widget.icon),
              centerSlice: isAwake
                  ? const Rect.fromLTWH(20, 6, 2, 2)
                  : const Rect.fromLTWH(6, 6, 2, 2),
              scale: 3.0,
            ),
          ),
          Container(
            padding: EdgeInsetsDirectional.only(
                start: isAwake ? 14 : 4,
                end: 4,
                top: widget.inProfilePage == true ? 7 : (isAwake ? 6 : 5)),
            height: widget.inProfilePage == true ? 27 : (isAwake ? 24 : 22),
            constraints: BoxConstraints(
                minWidth:
                    (widget.inProfilePage == true ? 27 : (isAwake ? 24 : 22)) *
                            ratio -
                        8),
            child: LabelText(
              label: widget.label,
              fontStyle: widget.fontStyle,
              inProfilePage: widget.inProfilePage,
              needOverflow: false,
              fontColor: widget.fontColor,
            ),
          )
        ],
      );
    }
  }
}

/// 图片固定宽度，文字居中展示
class CommonTagStyle4 extends StatefulWidget {
  final String icon;
  final String label;
  final int fontStyle;
  final String fontColor;
  final bool inProfilePage;

  const CommonTagStyle4({
    super.key,
    required this.icon,
    required this.label,
    required this.fontStyle,
    required this.fontColor,
    required this.inProfilePage,
  });

  @override
  State<CommonTagStyle4> createState() => CommonTagStyle4State();
}

class CommonTagStyle4State extends State<CommonTagStyle4> {
  double ratio = 0;
  ImageStream? _imageStream;
  ImageStreamListener? _imageStreamListener;

  @override
  void initState() {
    super.initState();

    getImageSize();
  }

  @override
  dispose() {
    if (_imageStreamListener != null) {
      _imageStream?.removeListener(_imageStreamListener!);
      _imageStreamListener = null;
    }
    super.dispose();
  }

  void getImageSize() async {
    Image imageNetwork = Image(
        image: CachedNetworkImageProvider(Util.getRemoteImgUrl(widget.icon)));
    _imageStream = imageNetwork.image.resolve(const ImageConfiguration());
    _imageStreamListener = ImageStreamListener(
      (ImageInfo info, bool _) {
        ratio = info.image.width / info.image.height;
        if (mounted) {
          setState(() {});
        }
      },
    );
    _imageStream?.addListener(_imageStreamListener!);
  }

  @override
  Widget build(BuildContext context) {
    if (ratio == 0) {
      return CachedNetworkImage(
        imageUrl: Util.getRemoteImgUrl(widget.icon),
        height: widget.inProfilePage == true ? 27 : 22,
        fit: BoxFit.fitHeight,
      );
    } else {
      return Container(
        height: widget.inProfilePage == true ? 27 : 22,
        width: ratio * (widget.inProfilePage == true ? 27 : 22),
        decoration: BoxDecoration(
          image: DecorationImage(
            image:
                CachedNetworkImageProvider(Util.getRemoteImgUrl(widget.icon)),
            fit: BoxFit.fitHeight,
          ),
        ),
        padding: const EdgeInsetsDirectional.only(start: 4, end: 4),
        alignment: AlignmentDirectional.center,
        child: LabelText(
            label: widget.label,
            inProfilePage: widget.inProfilePage,
            fontStyle: widget.fontStyle,
            needOverflow: true,
            fontColor: widget.fontColor),
      );
    }
  }
}

class LabelText extends StatelessWidget {
  final String label;
  final bool inProfilePage;
  final int fontStyle;
  final bool needOverflow;
  final String fontColor;

  const LabelText({
    super.key,
    required this.label,
    required this.inProfilePage,
    required this.fontStyle,
    required this.needOverflow,
    required this.fontColor,
  });

  @override
  Widget build(BuildContext context) {
    if (fontStyle == 1) {
      return YouSheText(
        label,
        style: TextStyle(
          height: 1.2,
          color: Util.validStr(fontColor)
              ? Util.parseColor(fontColor)
              : Colors.white,
          fontSize: inProfilePage ? 11 : 9,
        ),
        maxLines: 1,
        overflow: needOverflow ? TextOverflow.clip : null,
      );
    }

    return Text(
      label,
      style: TextStyle(
        height: 1.2,
        color: Util.validStr(fontColor)
            ? Util.parseColor(fontColor)
            : Colors.white,
        fontSize: inProfilePage ? 11 : 9,
      ),
      maxLines: 1,
      overflow: needOverflow ? TextOverflow.clip : null,
    );
  }
}
