import 'dart:async';

import 'package:shared/shared.dart';
import 'package:shared/k.dart';
import 'package:flutter/material.dart';
import '../pbModel/generated/banner_center.pb.dart';

class BannerItem {
  final int id;
  final String title;
  final String icon;
  final String data;
  final String url;
  final String type;
  final int dateline;
  final String position;
  bool hasReport = false;

  BannerItem.fromJson(Map data)
      : id = Util.parseInt(data['id']),
        title = data['title'] ?? '',
        icon = data['icon'] ?? '',
        data = data['data'] ?? '',
        url = data['url'] ?? '',
        dateline = Util.parseInt(data['dateline']),
        type = data['type'] ?? '',
        position = data['position'] ?? 'banner';

  BannerItem.fromActivityCenter(BaseBannerItem item)
      : id = item.id,
        title = item.title,
        icon = item.image,
        data = item.data,
        url = item.url,
        dateline = 0,
        type = item.type,
        position = item.position;
}

class HomeBannerRepo {
  static Future<DataRsp<List<BannerItem>>> getHomeBanner(
      {String? from, bool isNewBanner = false}) async {
    String url = '${System.domain}home/banner?version=1';
    try {
      XhrResponse response =
          await Xhr.getJson(url, throwOnError: false, formatJson: false);
      return DataRsp<List<BannerItem>>.fromXhrResponse(
        response,
        (object) => Util.parseList(
            object, (e) => BannerItem.fromJson(e as Map<String, dynamic>)),
      );
    } catch (e) {
      return DataRsp<List<BannerItem>>(
          msg: R.array('xhr_error_type_array')[6], success: false);
    }
  }
}

/// 活动页
class BannerScreen extends StatefulWidget {
  final Map? params;
  final String? from;

  static const String keyBannerTap = 'bannerTapIds';

  const BannerScreen({super.key, this.params, this.from});

  @override
  _ScreenState createState() => _ScreenState();

  static void show(BuildContext context, {String? from}) {
    if (from == 'room') {
      Tracker.instance
          .track(TrackEvent.click, properties: {'click_page': 'my_activity_2'});
    }
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => BannerScreen(
        from: from,
      ),
      settings: const RouteSettings(name: '/banner'),
    ));
  }
}

class _ScreenState extends State<BannerScreen> {
  late ScrollController _controller;

  List<BannerItem> _data = [];
  bool _loading = true;
  String? _errMsg;
  static const double bannerPaddingTop = 8.0;
  static const double bannerPaddingBottom = 4.0;
  static const double bannerPaddingLeft = 16.0;
  static const double ratio = 76 / 343;
  static final double _width = Util.width - (2 * bannerPaddingLeft);
  static final double _height = _width * ratio;

  @override
  void initState() {
    super.initState();
    _controller = ScrollController();
    _load();
  }

  Future<void> _load() async {
    DataRsp<List<BannerItem>> rsp = await HomeBannerRepo.getHomeBanner(
        from: widget.from, isNewBanner: true);
    _loading = false;
    if (rsp.success) {
      _data = rsp.data ?? [];
      _errMsg = null;
    } else {
      _errMsg = rsp.msg;
    }

    if (mounted) {
      setState(() {});

      if (_data.isNotEmpty) {
        _reportBannerExpose(_data[0]);
      }
    }

    return;
  }

  void setItemTapFlag(BannerItem item) {
    String hasTapIDs = Config.get(BannerScreen.keyBannerTap, '');
    if (!hasTapIDs.contains('${item.id}')) {
      // 未点击过，存起来
      Config.set(BannerScreen.keyBannerTap, '$hasTapIDs${item.id},');
    }
  }

  void _onTap(BannerItem item) {
    setItemTapFlag(item);
    SchemeUrlHelper.instance()
        .jump(item.url, type: item.type, title: item.title);
    _reportBannerClick(item);
  }

  _renderBody() {
    if (_loading) return const Loading();
    if (_errMsg != null) {
      return ErrorData(
        error: _errMsg,
        onTap: () {
          setState(() {
            _errMsg = null;
            _loading = true;
          });
          _load();
        },
      );
    }
    if (_data.isEmpty) {
      return Container(
        alignment: Alignment.topCenter,
        margin: const EdgeInsets.only(top: 150.0),
        child: Text(
          K.there_is_on_act,
          style: const TextStyle(fontSize: 18.0),
        ),
      );
    }
    return ListView.custom(
      controller: _controller,
      itemExtent: _height + bannerPaddingTop + bannerPaddingBottom,
      childrenDelegate: FixedExtentSliverChildBuilderDelegate(
        (BuildContext context, int index) {
          BannerItem item = _data.elementAt(index);
          return ListItemWidget(
            item: item,
            width: _width,
            height: _height,
            bannerPaddingTop: bannerPaddingTop,
            bannerPaddingBottom: bannerPaddingBottom,
            onTapItem: () {
              _onTap(item);
            },
          );
        },
        childCount: _data.length,
        cacheCount: 0,
        onPositionChanged: _handleExposureReport,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(K.activity),
      body: _renderBody(),
    );
  }

  void _handleExposureReport(int firstIndex, int lastIndex) async {
    int maxNum = _data.length;

    for (int i = firstIndex; i <= lastIndex && i < maxNum; i++) {
      if (i >= maxNum) continue;

      BannerItem banner = _data.elementAt(i);
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

  void _reportBannerClick(BannerItem banner) async {
    Tracker.instance.track(TrackEvent.banner_click, properties: {
      'adid': '${banner.id}',
      'banner_position': banner.position
    });
  }
}

class ListItemWidget extends StatelessWidget {
  final VoidCallback onTapItem;
  final BannerItem item;
  final double height;
  final double width;
  final double bannerPaddingTop;
  final double bannerPaddingBottom;

  const ListItemWidget(
      {super.key,
      required this.item,
      required this.onTapItem,
      required this.height,
      required this.width,
      required this.bannerPaddingTop,
      required this.bannerPaddingBottom});

  String _getIcon(String name) {
    if (name.startsWith("http://") || name.startsWith("https://")) {
      return name;
    }
    return "${System.imageDomain}${item.icon}!cover750";
  }

  _renderImage(BuildContext context, BannerItem item) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12.0),
      child: SizedBox(
        width: width,
        height: height,
        child: CachedNetworkImage(
          imageUrl: _getIcon(item.icon),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          EdgeInsets.only(top: bannerPaddingTop, bottom: bannerPaddingBottom),
      child: InkWell(
        onTap: onTapItem,
        child: Center(
          child: _renderImage(context, item),
        ),
      ),
    );
  }
}
