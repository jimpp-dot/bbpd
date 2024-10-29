import 'dart:ui' as ui;
import 'dart:math' as math;

import 'package:shared/shared.dart';
import 'package:flutter/cupertino.dart';
import 'package:moment/k.dart';
import 'package:moment/moment.dart';

/// 动态媒体内容 图片、音频、视频预览
class WeekStatisticMomentMediaWidget extends StatefulWidget {
  final CircleItem moment;

  const WeekStatisticMomentMediaWidget({
    super.key,
    required this.moment,
  });

  @override
  State<WeekStatisticMomentMediaWidget> createState() =>
      _WeekStatisticMomentMediaWidgetState();
}

class _WeekStatisticMomentMediaWidgetState
    extends State<WeekStatisticMomentMediaWidget> {
  ImageBean? _imageBean;

  CircleItem get moment => widget.moment;

  @override
  void initState() {
    super.initState();
    _imageBean = _getImgCover();
  }

  String? get publishTime {
    String? rushPublishTime;
    int time = widget.moment.createTime.toInt();
    if (time == 0) {
      rushPublishTime = null;
    } else {
      DateTime now = DateTime.now();
      DateTime today = DateTime(now.year, now.month, now.day);
      DateTime publishTime =
          DateTime.fromMillisecondsSinceEpoch(time.toInt() * 1000);
      Duration diffTime = now.difference(publishTime);
      Duration diffDay = today.difference(publishTime);

      if (publishTime.isAfter(today)) {
        // 当天
        if (diffTime.inMinutes < 1) {
          // 1分钟内
          rushPublishTime = K.moment_just_now;
        } else if (diffTime.inHours < 1) {
          // 1小时以内
          rushPublishTime = K.moment_minutes_ago(['${diffTime.inMinutes}']);
        } else {
          // 当前超过1小时
          rushPublishTime = K.moment_hours_ago(['${diffTime.inHours}']);
        }
      } else if (diffDay.inDays < 6) {
        // 一周内
        rushPublishTime = K.moment_days_ago(['${diffDay.inDays + 1}']);
      } else {
        // 超过1周
        // rushPublishTime = K.moment_week_ago;
        rushPublishTime = Utility.getDateDiff(time.toInt());
      }
    }
    return rushPublishTime;
  }

  ImageBean? _getImgCover() {
    if (moment.cover.isNotEmpty) {
      String url = moment.cover;
      if (!moment.cover.startsWith(RegExp(r'http(s?)://'))) {
        url = System.imageDomain + url;
      }

      double width = 0.0;
      double height = 0.0;

      // 分割宽高
      List<String> strs = url.split('?');
      if (strs.length == 2) {
        url = strs[0];
        String extra = strs[1];
        List<String> size = extra.split('*');
        if (size.length >= 2) {
          width = Util.parseDouble(size[0]);
          height = Util.parseDouble(size[1]);
        }
      }
      return ImageBean(url: url, width: width, height: height);
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> widgets = [];
    if (_imageBean != null) {
      widgets.add(_ImageWidget(
        url: _imageBean!.cover375 ?? '',
        width: _imageBean!.width,
        height: _imageBean!.height,
        isVideo: moment.aType == 'video',
      ));
    } else if (moment.aType == 'audio' && widget.moment.hasAudio()) {
      widgets.add(AudioButton(
        audioUrl: widget.moment.audio.url,
        duration: widget.moment.audio.duration,
        onAudioStop: (playTime) {},
      ));
    }

    // 地理位置/时间
    if ((widget.moment.location.isNotEmpty) || widget.moment.createTime > 0) {
      widgets.add(Padding(
        padding: EdgeInsets.only(top: widgets.isEmpty ? 0 : 10.dp),
        child: _buildLocationAndTime(widget.moment.location, publishTime),
      ));
    }

    if (widgets.isEmpty) {
      return const SizedBox.shrink();
    }
    return Padding(
      padding: EdgeInsetsDirectional.only(bottom: 6.dp),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: widgets,
      ),
    );
  }

  Widget _buildLocationAndTime(String location, String? time) {
    return Row(
      children: <Widget>[
        if (widget.moment.location.isNotEmpty) ...[
          R.img('ic_location.svg',
              width: 9.dp,
              height: 9.dp,
              color: const Color(0xFF9C9C9C),
              package: ComponentManager.MANAGER_MOMENT),
          Container(
            constraints: const BoxConstraints(maxWidth: 200),
            child: Text(
              widget.moment.location,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: const Color(0xFF9C9C9C),
                fontSize: 9.5.dp,
              ),
            ),
          ),
        ],
        if (time != null && time.isNotEmpty)
          Text.rich(
            TextSpan(
              children: [
                if (widget.moment.location.isNotEmpty)
                  TextSpan(
                    text: '｜ ',
                    style: TextStyle(
                      color: const Color(0xFFEAEAEA).withOpacity(0.8),
                      fontSize: 9.5.dp,
                    ),
                  ),
                TextSpan(
                    text: time,
                    style: TextStyle(
                      color: const Color(0xFF9C9C9C),
                      fontSize: 9.5.dp,
                    )),
              ],
            ),
          )
      ],
    );
  }
}

class _ImageWidget extends StatefulWidget {
  final String url;
  final bool isVideo;
  final double width;
  final double height;

  const _ImageWidget({
    required this.url,
    this.isVideo = false,
    this.height = 0.0,
    this.width = 0.0,
  });

  @override
  State createState() => _ImageWidgetState();
}

class _ImageWidgetState extends State<_ImageWidget> {
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
  void didUpdateWidget(_ImageWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.url != widget.url) {
      _initFuture();
    }
  }

  _initFuture() {
    if (_isImageSizeReady()) {
      return;
    }
    _provider = NetworkImage(widget.url);

    _future = MomentUtils.loadImageByProvider(_provider!);
  }

  @override
  Widget build(BuildContext context) {
    if (widget.url.isEmpty) {
      return Container(
        width: 142.dp,
        height: 185.dp,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.dp),
          color: R.color.secondBgColor,
        ),
      );
    }

    Size size = _getFixedBoxSize(widget.width, widget.height);

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
    return Stack(
      children: <Widget>[
        _buildNetWorkImage(size),
        if (widget.isVideo)
          Positioned.fill(
            child: Container(
              alignment: Alignment.center,
              child: R.img(
                'ic_video_play.svg',
                width: 36.dp,
                height: 36.dp,
                package: ComponentManager.MANAGER_MOMENT,
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildNetWorkImage(Size size) {
    return SizedBox(
      width: size.width,
      height: size.height,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12.dp),
        child: CachedNetworkImage(
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
    return widget.width > 0 && widget.height > 0;
  }
}

Size _getFixedBoxSize(double? width, double? height) {
  if (width != null && height != null && width > 0 && width > 0) {
    double containerWidth = kMaxImageWidth;
    double containerHeight;
    if (width >= height) {
      containerWidth = (2 * kItemWidth + kImagePadding);
      containerHeight = math.max(containerWidth * height / width, kItemWidth);
    } else {
      containerHeight = (2 * kItemWidth + kImagePadding);
      containerWidth = math.max(containerHeight * width / height, kItemWidth);
    }
    return Size(containerWidth, containerHeight);
  } else {
    return Size(150.dp, 150.dp);
  }
}
