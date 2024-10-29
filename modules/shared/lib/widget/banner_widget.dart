import 'package:shared/assets.dart';
import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:shared/model/banner_model.dart';
import 'package:pulse_log/pulse_log.dart';

/// Banner控件
class BannerWidget extends StatefulWidget {
  final List<BannerModel>? banners;
  final String position;
  final bool fitDark;

  const BannerWidget(this.position, this.banners,
      {super.key, this.fitDark = false});

  @override
  _BannerWidgetState createState() => _BannerWidgetState();
}

class _BannerWidgetState extends State<BannerWidget> {
  late SwiperController _controller;

  @override
  void initState() {
    _controller = SwiperController();
    super.initState();

    if (widget.banners != null && widget.banners!.isNotEmpty) {
      _reportBannerExpose(widget.banners![0]);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  /// banner容器 尺寸 375:112， 以这个为基准，左右边距16，上下边距18。 by 2023.9.14
  double ratio = 112 / 375;
  double verticalMargin = 18;
  double horizontalMargin = 16;
  double dHorizontalOffset = 7; // 深色下 宽缩小
  double dVerticalOffset = 1.5; // 深色下 高缩小
  double paginationBottomMargin = 5.dp; // 指示条

  bool get dark => widget.fitDark && darkMode;

  @override
  Widget build(BuildContext context) {
    if (widget.banners == null) {
      return const SizedBox.shrink();
    }

    /// XXX bannerCount不能太多，否则UI会出bug；经多方商量，个数由服务器端控制
    int bannerCount = widget.banners?.length ?? 0;
    if (bannerCount > 10) bannerCount = 10;

    double bannerWidth = Util.width - 2 * horizontalMargin;
    if (darkMode) {
      bannerWidth -= 2 * dHorizontalOffset;
    }
    double bannerHeight = bannerWidth * ratio;

    return SizedBox(
      width: Util.width,
      height: Util.width * ratio,
      child: Stack(
        children: [
          if (dark)
            CachedNetworkImage(
              imageUrl: Util.getRemoteImgUrl('static/core/banner_bg.webp'),
              fit: BoxFit.fill,
            ),
          Padding(
            padding: dark
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
                  return _buildBanner(
                      context, index, bannerWidth, bannerHeight);
                },
                itemCount: bannerCount,
                pagination: bannerCount > 1
                    ? SwiperPagination(
                        alignment: Alignment.bottomCenter,
                        margin: EdgeInsetsDirectional.only(
                            bottom: dark
                                ? paginationBottomMargin
                                : verticalMargin + paginationBottomMargin),
                        builder: RectSwiperPaginationBuilder(
                          activeColor: Colors.white,
                          color: Colors.white.withOpacity(0.5),
                          size: const Size(9, 3),
                          activeSize: const Size(9, 3),
                          radius: 2,
                        ),
                      )
                    : null,
                autoplay: bannerCount > 1,
                loop: bannerCount > 1,
                duration: 500,
                autoplayDelay: 5000,
                autoplayDisableOnInteraction: false,
                onTap: _onItemClick,
                onIndexChanged: (int index) {
                  if (widget.banners != null &&
                      index < widget.banners!.length) {
                    _reportBannerExpose(widget.banners![index]);
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBanner(BuildContext context, int index, double bannerWidth,
      double bannerHeight) {
    String bannerUrl = widget.banners?[index].image ?? '';

    double hMargin = dark ? 0 : horizontalMargin;
    double vMargin = dark ? 0 : verticalMargin;

    if (Util.validStr(bannerUrl)) {
      return Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            margin: EdgeInsetsDirectional.only(
              start: hMargin,
              end: hMargin,
              top: vMargin,
              bottom: vMargin,
            ),
            alignment: AlignmentDirectional.center,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: CachedNetworkImage(
                key: ValueKey(bannerUrl),
                imageUrl: Util.getRemoteImgUrl(bannerUrl),
                width: bannerWidth,
                height: bannerHeight,
                fit: BoxFit.cover,
                placeholder: Container(
                  color: dark ? Colors.white.withOpacity(0.06) : Colors.white,
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
    if (widget.banners?.isEmpty ?? true) return;
    BannerModel item = widget.banners![index];
    if (item.url.isEmpty) return;
    _reportBannerClick(item);
    SchemeUrlHelper.instance().jump(
        '${item.url}&push_type_id=${widget.position}_banner',
        type: item.type);
    PulseLog.instance.event('click_event', properties: {
      'click_tag': 'banner_${widget.position}_${item.title}',
    });
  }

  void _reportBannerClick(BannerModel banner) async {
    Tracker.instance.track(TrackEvent.banner_click, properties: {
      'adid': '${banner.id}',
      'banner_position': banner.position
    });
  }

  void _reportBannerExpose(BannerModel banner) async {
    if (!banner.hasReport) {
      banner.hasReport = true;
      Tracker.instance.track(TrackEvent.banner_expose, properties: {
        'adid': '${banner.id}',
        'banner_position': banner.position
      });
    }
  }
}
