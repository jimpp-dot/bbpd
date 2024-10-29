import 'package:flutter/material.dart';
import '../pbModel/generated/banner_center.pb.dart';
import 'package:shared/shared.dart';

/// 活动中心Tab：H5内容平铺
class ActivityTabShow extends StatefulWidget {
  final List<BaseBannerItem> items;
  final bool fullScreen;

  const ActivityTabShow(
      {super.key, required this.items, required this.fullScreen});

  @override
  ActivityTabShowState createState() {
    return ActivityTabShowState();
  }
}

class ActivityTabShowState extends State<ActivityTabShow>
    with TickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  late ExtendedTabController tabController;
  List<Widget> tabWidgets = [];
  List<Widget> pages = [];

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    safeRun(
      () => tabController = ExtendedTabController(
          initialIndex: 0, length: widget.items.length, vsync: this),
    );
    for (BaseBannerItem item in widget.items) {
      tabWidgets.add(Tab(
        child: Text(item.title),
      ));
      pages.add(BaseWebviewScreen(
        url: addScreenSuffix(item.url),
        embeddedWidget: true,
        eagerGesture: true,
      ));
    }
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildTabs(),
        buildPages(),
      ],
    );
  }

  Widget buildTabs() {
    return CommonTabBar(
      showSplash: false,
      labelPadding: const EdgeInsetsDirectional.only(start: 10, end: 10),
      controller: tabController,
      isScrollable: true,
      tabs: tabWidgets,
      labelColor: R.color.mainTextColor,
      unselectedLabelColor: R.color.secondTextColor,
      labelStyle: const TextStyle(
        fontSize: 14,
      ),
      unselectedLabelStyle: const TextStyle(
        fontSize: 14,
      ),
      indicator: CommonUnderlineTabIndicator(
        borderSide: BorderSide(width: 3.0, color: R.color.mainBrandColor),
        insets: const EdgeInsetsDirectional.only(bottom: 5),
        wantWidth: 8,
      ),
      indicatorWeight: 0,
      marginStart: 6,
    );
  }

  Widget buildPages() {
    return Expanded(
      child: TabBarView(
        controller: tabController,
        children: pages,
      ),
    );
  }

  String addScreenSuffix(String url) {
    if (!Util.validStr(url)) {
      return url;
    }
    if (widget.fullScreen == true) {
      return url;
    }
    return '$url${url.contains("?") ? '&' : '?'}half=1';
  }
}
