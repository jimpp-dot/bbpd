import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:shared/k.dart';
import '../pbModel/generated/banner_center.pb.dart';
import 'activity_tab_normal.dart';
import 'activity_tab_show.dart';

/// 活动中心汇聚(支持全屏和半屏)
class ActivityCenterScreen extends StatefulWidget {
  final bool fullScreen;

  const ActivityCenterScreen({super.key, required this.fullScreen});

  @override
  ActivityCenterState createState() {
    return ActivityCenterState();
  }

  /// 全屏展示
  static Future<bool> show(BuildContext context) async {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => const ActivityCenterScreen(
        fullScreen: true,
      ),
      settings: const RouteSettings(name: '/ActivityCenterScreen'),
    ));
    return true;
  }

  /// 半屏展示
  static Future<bool?> showBottom(BuildContext context) async {
    return displayModalBottomSheet(
      context: context,
      maxHeightRatio: 0.7,
      defineBarrierColor: Colors.transparent,
      builder: (context) {
        return ClipRRect(
          borderRadius: const BorderRadiusDirectional.only(
            topStart: Radius.circular(16),
            topEnd: Radius.circular(16),
          ).resolve(Directionality.of(context)),
          child: GestureDetector(
            onTap: () {
              /// do nothing
            },
            child: const ActivityCenterScreen(
              fullScreen: false,
            ),
          ),
        );
      },
    );
  }
}

class ActivityCenterState extends State<ActivityCenterScreen>
    with TickerProviderStateMixin {
  List<BannerCenterTab> tabs = [];
  List<Widget> tabWidgets = [];
  List<Widget> pages = [];
  ExtendedTabController? tabController;
  ScreenStatus _status = ScreenStatus.Loading;

  @override
  void initState() {
    super.initState();
    loadData();
  }

  @override
  void dispose() {
    tabController?.dispose();
    super.dispose();
  }

  void loadData() async {
    /// 新增半屏Banner需求后导致运营把规则搞乱了，这里和服务端协调统一version=4以处理修复这个问题
    String url = '${System.domain}go/yy/room/activityCenter?version=4';
    try {
      XhrResponse response = await Xhr.postPb(
        url,
        {},
      );
      ResBannerCenter rsp = ResBannerCenter.fromBuffer(response.bodyBytes);
      if (rsp.success) {
        if (rsp.data.tabs.isNotEmpty) {
          tabs = rsp.data.tabs;
          for (BannerCenterTab tab in tabs) {
            if (tab.showType == 1 || tab.showType == 2) {
              tabWidgets.add(Tab(
                child: Container(
                  height: 28,
                  padding: const EdgeInsetsDirectional.only(start: 12, end: 12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadiusDirectional.circular(14.5),
                    color: R.color.secondBgColor,
                  ),
                  alignment: AlignmentDirectional.center,
                  child: Text(tab.name),
                ),
              ));
              if (tab.showType == 1) {
                pages.add(ActivityTabNormal(
                  items: tab.items,
                  fullScreen: widget.fullScreen,
                ));
              } else {
                pages.add(ActivityTabShow(
                  items: tab.items,
                  fullScreen: widget.fullScreen,
                ));
              }
            }
          }
          safeRun(
            () => tabController = ExtendedTabController(
                initialIndex: 0, length: tabWidgets.length, vsync: this),
          );
          _status = ScreenStatus.Ready;
        } else {
          _status = ScreenStatus.Empty;
        }
      } else {
        _status = ScreenStatus.Error;
      }
      refresh();
    } catch (e) {
      Log.d('ActivityCenterState load error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: R.color.mainBgColor,
      appBar:
          widget.fullScreen == true ? BaseAppBar(K.base_activity_center) : null,
      body: _buildStatus(),
    );
  }

  Widget _buildStatus() {
    switch (_status) {
      case ScreenStatus.Loading:
        return const Loading();
      case ScreenStatus.Error:
        return const ErrorData();
      case ScreenStatus.Empty:
        return const EmptyWidget();
      case ScreenStatus.Ready:
        return _buildBody();
    }
  }

  Widget _buildBody() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.fullScreen != true)
          Container(
            width: Util.width - 32,
            height: 44,
            margin: const EdgeInsetsDirectional.only(start: 16, end: 16),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                    color: R.color.secondTextColor.withOpacity(0.1), width: 1),
              ),
            ),
            alignment: AlignmentDirectional.center,
            child: Text(
              K.base_activity_center,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: R.color.mainTextColor,
                height: 1.1,
              ),
            ),
          ),
        buildTabs(),
        buildPages(),
      ],
    );
  }

  Widget buildTabs() {
    return CommonTabBar(
      showSplash: false,
      labelPadding: const EdgeInsetsDirectional.only(end: 12),
      controller: tabController,
      isScrollable: true,
      tabs: tabWidgets,
      labelColor: R.color.mainBrandColor,
      unselectedLabelColor: R.color.secondTextColor,
      labelStyle: const TextStyle(
        fontSize: 13,
        fontWeight: FontWeight.w500,
      ),
      unselectedLabelStyle: const TextStyle(
        fontSize: 13,
        fontWeight: FontWeight.w400,
      ),
      indicator: UnderlineTabIndicator(
          borderSide: BorderSide(width: 2.0, color: R.color.mainBgColor)),
      marginStart: 16,
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
}
