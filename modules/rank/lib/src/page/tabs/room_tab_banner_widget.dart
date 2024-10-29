import 'package:shared/assets.dart';
import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import '../../model/pb/generated/slp_tab_banner.pb.dart';
import 'package:pulse_log/pulse_log.dart';

class RoomTabBannerWidget extends StatefulWidget {
  final List<TabBannerItem> banners;
  final String channel;
  final int tabId;

  const RoomTabBannerWidget({
    super.key,
    required this.banners,
    this.channel = '',
    this.tabId = 0,
  });

  @override
  State<RoomTabBannerWidget> createState() => _RoomTabBannerWidgetState();
}

class _RoomTabBannerWidgetState extends State<RoomTabBannerWidget> {
  late SwiperController _controller;

  @override
  void initState() {
    _controller = SwiperController();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  /// banner容器 尺寸 375:112， 以这个为基准，左右边距16，上下边距18。 by 2023.9.14
  double ratio = 112 / 375;
  double verticalMargin = 18.dp;
  double horizontalMargin = 16.dp;
  double dHorizontalOffset = 7.dp; // 深色下 宽缩小
  double dVerticalOffset = 1.5.dp; // 深色下 高缩小
  double paginationBottomMargin = 5.dp; // 指示条

  @override
  Widget build(BuildContext context) {
    if (widget.banners.isEmpty) {
      return const SizedBox();
    }
    return SizedBox(
      width: Util.width,
      height: Util.width * ratio,
      child: Stack(
        children: [
          if (darkMode)
            CachedNetworkImage(
              imageUrl: Util.getRemoteImgUrl('static/core/banner_bg.webp'),
              fit: BoxFit.fill,
            ),
          Padding(
            padding: darkMode
                ? EdgeInsetsDirectional.only(
                    start: horizontalMargin + dHorizontalOffset,
                    end: horizontalMargin + dHorizontalOffset,
                    top: verticalMargin + dVerticalOffset,
                    bottom: verticalMargin + dVerticalOffset,
                  )
                : EdgeInsets.zero,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Swiper(
                itemBuilder: (BuildContext context, int index) {
                  return _buildBanner(context, index);
                },
                itemCount: widget.banners.length,
                pagination: widget.banners.length > 1
                    ? SwiperPagination(
                        alignment: Alignment.bottomCenter,
                        margin: EdgeInsetsDirectional.only(
                          bottom: darkMode
                              ? paginationBottomMargin
                              : verticalMargin + paginationBottomMargin,
                        ),
                        builder: RectSwiperPaginationBuilder(
                          activeColor: Colors.white,
                          color: Colors.white.withOpacity(0.5),
                          size: const Size(9, 3),
                          activeSize: const Size(9, 3),
                          radius: 2,
                        ),
                      )
                    : null,
                autoplay: widget.banners.length > 1,
                loop: widget.banners.length > 1,
                duration: 500,
                autoplayDelay: 5000,
                autoplayDisableOnInteraction: false,
                onTap: _onItemClick,
                onIndexChanged: (int index) {
                  Tracker.instance.track(
                    TrackEvent.channel_banner_pv,
                    properties: {
                      'uid': Session.uid,
                      'channel_type': widget.channel,
                      'banner_num': '${index + 1}'
                    },
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBanner(BuildContext context, int index) {
    TabBannerItem data = widget.banners[index];

    double hMargin = darkMode ? 0 : horizontalMargin;
    double vMargin = darkMode ? 0 : verticalMargin;

    if (Util.validStr(data.image) && Util.validStr(data.url)) {
      return Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            margin:
                EdgeInsets.symmetric(horizontal: hMargin, vertical: vMargin),
            alignment: AlignmentDirectional.center,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: CachedNetworkImage(
                key: ValueKey(data.image),
                imageUrl: Util.getRemoteImgUrl(data.image),
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.cover,
                placeholder: Container(
                  color:
                      darkMode ? Colors.white.withOpacity(0.06) : Colors.white,
                ),
              ),
            ),
          ),
        ],
      );
    }
    return const SizedBox();
  }

  void _onItemClick(int index) {
    Tracker.instance.track(
      TrackEvent.channel_banner_click,
      properties: {
        'uid': Session.uid,
        'channel_type': widget.channel,
        'banner_num': '${index + 1}'
      },
    );
    TabBannerItem item = widget.banners[index];
    if (Util.validStr(item.url)) {
      SchemeUrlHelper.instance()
          .jump(item.url, type: item.type, title: item.title);
      PulseLog.instance.event('click_event', properties: {
        'click_tag': 'home_tab_banner_${item.title}',
      });
    }
  }
}
