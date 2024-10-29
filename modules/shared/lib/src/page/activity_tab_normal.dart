import 'package:flutter/material.dart';
import '../../shared.dart';
import '../pbModel/generated/banner_center.pb.dart';

/// 活动中心Tab：海报展示
class ActivityTabNormal extends StatefulWidget {
  final List<BaseBannerItem> items;
  final bool fullScreen;

  const ActivityTabNormal(
      {super.key, required this.items, required this.fullScreen});

  @override
  ActivityTabNormalState createState() {
    return ActivityTabNormalState();
  }
}

class ActivityTabNormalState extends State<ActivityTabNormal>
    with AutomaticKeepAliveClientMixin {
  final List<BannerItem> _datas = [];
  static const double bannerPaddingTop = 8.0;
  static const double bannerPaddingBottom = 4.0;
  static const double bannerPaddingLeft = 16.0;
  static const double ratio = 76 / 343;
  static final double _width = Util.width - (2 * bannerPaddingLeft);
  static final double _height = _width * ratio;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    for (BaseBannerItem item in widget.items) {
      _datas.add(BannerItem.fromActivityCenter(item));
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ListView.custom(
      itemExtent: _height + bannerPaddingTop + bannerPaddingBottom,
      childrenDelegate: FixedExtentSliverChildBuilderDelegate(
        (BuildContext context, int index) {
          BannerItem item = _datas.elementAt(index);
          return ListItemWidget(
            item: item,
            width: _width,
            height: _height,
            bannerPaddingTop: bannerPaddingTop,
            bannerPaddingBottom: bannerPaddingBottom,
            onTapItem: () {
              _onTap(item, context);
            },
          );
        },
        childCount: _datas.length,
        cacheCount: 0,
        onPositionChanged: _handleExposureReport,
      ),
    );
  }

  void setItemTapFlag(BannerItem item) {
    // 首页发现页未点击第一条banner需要显示小红点
    String hasTapIDs = Config.get(BannerScreen.keyBannerTap, '');
    if (!hasTapIDs.contains('${item.id}')) {
      // 未点击过，存起来 Config.set(BannerScreen.keyBannerTap, '$hasTapIDs${item.id},');
    }
  }

  void _onTap(BannerItem item, BuildContext context) {
    setItemTapFlag(item);
    if (widget.fullScreen != true) {
      Navigator.pop(context);
    }
    SchemeUrlHelper.instance()
        .jump(item.url, type: item.type, title: item.title);
    _reportBannerClick(item);
  }

  void _reportBannerClick(BannerItem banner) async {
    Tracker.instance.track(TrackEvent.banner_click, properties: {
      'adid': '${banner.id}',
      'banner_position': banner.position
    });
  }

  void _handleExposureReport(int firstIndex, int lastIndex) async {
    int maxNum = _datas.length;
    for (int i = firstIndex; i <= lastIndex && i < maxNum; i++) {
      if (i >= maxNum) continue;
      BannerItem banner = _datas.elementAt(i);
      _reportBannerExpose(banner);
    }
  }

  void _reportBannerExpose(BannerItem banner) async {
    if (!banner.hasReport) {
      banner.hasReport = true;
      Tracker.instance.track(TrackEvent.banner_expose, properties: {
        'adid': '${banner.id}',
        'banner_position': banner.position
      });
    }
  }
}
