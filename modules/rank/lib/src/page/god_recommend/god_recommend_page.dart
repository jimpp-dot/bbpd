import 'package:rank/assets.dart';
import 'package:rank/k.dart';
import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:rank/src/api/api.dart';
import 'package:rank/src/model/pb/generated/god_recommend.pb.dart';

import 'god_recommend_list.dart';

/// 主播推荐页面
class GodRecommendPage extends StatefulWidget {
  const GodRecommendPage({super.key});

  static Future show(BuildContext context) {
    return Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => const GodRecommendPage(),
      settings: const RouteSettings(name: '/GodRecommendPage'),
    ));
  }

  @override
  State<GodRecommendPage> createState() => _GodRecommendPageState();
}

class _GodRecommendPageState extends State<GodRecommendPage>
    with BaseScreenStateMixin, SingleTickerProviderStateMixin {
  final List<BodyGodRecommendTab_TabItem> _tabs = [];

  final GlobalKey _filterKey = GlobalKey();
  final List<String> _filterTags = [
    K.filter_all,
    K.filter_male,
    K.filter_female
  ];
  final List<String> _filterIcons = [
    '',
    Assets.rank$god_ic_male_svg,
    Assets.rank$god_ic_female_svg
  ];

  final Map<int, GameInfo> _gameInfoMap = {};

  ExtendedTabController? _tabController;

  /// 筛选类型：0-全部 1-男生 2-女生
  int _filterType = 0;

  @override
  void initState() {
    super.initState();
    _loadTabs();
  }

  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: R.colors.homeBgColor,
      padding: EdgeInsetsDirectional.only(top: Util.statusHeight),
      child: Column(
        children: [
          _buildAppBar(),
          Expanded(child: buildStatusContent()),
        ],
      ),
    );
  }

  void _loadTabs() async {
    RspGodRecommendTab resp = await Api.getGodRecommendTabs();
    if (resp.success && resp.data.tabList.isNotEmpty) {
      _tabs.clear();
      for (var item in resp.data.tabList) {
        if (item.cid > 0) {
          _gameInfoMap[item.cid] = GameInfo(
            cid: item.cid,
            icon: Util.squareResize(item.icon, 50),
            levelNames: {for (var e in item.levelConfig) e.id: e.title},
            colors: Util.parseColors(item.gradientColors),
          );
        }
        _tabs.add(item);
        // if (item.show) {
        //   _tabs.add(item);
        // }
      }
      _tabController = ExtendedTabController(length: _tabs.length, vsync: this);
      setScreenReady();
    } else {
      setScreenError(errorMsg: resp.msg, errorMsgColor: R.colors.mainTextColor);
    }
  }

  Widget _buildAppBar() {
    Color color = (darkMode ? Colors.white : Colors.black).withOpacity(0.9);
    return SizedBox(
      width: Util.width,
      height: 44.dp,
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          PositionedDirectional(
            start: 6.dp,
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () => Navigator.pop(context),
              child: Padding(
                padding: EdgeInsets.all(10.dp),
                child: R.img(Assets.rank$ic_back_svg,
                    width: 24.dp, height: 24.dp, color: color),
              ),
            ),
          ),
          Text(
            K.god_recommend,
            style: TextStyle(
                color: color, fontSize: 17.dp, fontWeight: FontWeight.w500),
          ),
          PositionedDirectional(
            end: 16.dp,
            child: _buildMatchBtn(),
          ),
        ],
      ),
    );
  }

  Widget _buildMatchBtn() {
    return GestureDetector(
      onTap: _matchGangUpRoom,
      child: Container(
        width: 78.dp,
        height: 24.dp,
        alignment: AlignmentDirectional.center,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Assets.rank$god_bg_match_gang_up_webp),
            fit: BoxFit.fill,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            R.img(Assets.rank$god_ic_lightning_webp,
                width: 16.dp, height: 16.dp),
            Text(
              K.match_gang_up,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 12.dp,
                  fontWeight: FontWeight.w400),
            ),
          ],
        ),
      ),
    );
  }

  /// 匹配开黑房间
  void _matchGangUpRoom() async {
    RspGodRecommendGangUp resp = await Api.matchGangUpRoom();
    if (resp.success && resp.data.rid > 0) {
      IRoomManager roomManager = ComponentManager.instance
          .getManager(ComponentManager.MANAGER_BASE_ROOM);
      roomManager.openChatRoomScreenShow(context, resp.data.rid);
    } else {
      Fluttertoast.showCenter(msg: resp.msg);
    }
  }

  @override
  Widget buildContent() {
    return Column(
      children: [
        _buildTabs(),
        Expanded(child: _buildPages()),
      ],
    );
  }

  Widget _buildTabs() {
    return Container(
      height: 44.dp,
      alignment: AlignmentDirectional.center,
      padding:
          EdgeInsetsDirectional.only(start: 16.dp, bottom: 12.dp, end: 16.dp),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            child: AnimTabBar(
              titles: _tabs.map((e) => e.title).toList(),
              isScrollable: true,
              controller: _tabController,
              selectedFontSize: 18.dp,
              selectedFontColor: R.colors.mainTextColor,
              selectedFontWeight: FontWeight.bold,
              unselectedFontSize: 14.dp,
              unselectedFontColor: R.colors.secondTextColor,
              unselectedFontWeight: FontWeight.normal,
              spacing: 10.dp,
              showIndicator: false,
              alignment: AlignmentDirectional.bottomCenter,
            ),
          ),
          _buildFilter(),
        ],
      ),
    );
  }

  Widget _buildFilter() {
    return QuickTapFilterWidget(
      onTap: () {
        CommonPopupWindow.showPopWindow(
          context,
          '',
          _filterKey,
          offset: 10.dp,
          start: Util.width - 136.dp,
          popWidget: _buildFilterList(),
        );
      },
      child: SizedBox(
        width: 70.dp,
        child: Row(
          key: _filterKey,
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            if (_filterType > 0)
              R.img(_filterIcons[_filterType], width: 24.dp, height: 24.dp),
            Text(
              _filterTags[_filterType],
              style: TextStyle(
                  color: R.colors.secondTextColor,
                  fontSize: 14.dp,
                  fontWeight: FontWeight.w400),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPages() {
    return NotificationListener<ScrollNotification>(
      onNotification: (ScrollNotification notification) {
        if (notification is ScrollUpdateNotification) {
          double offset = notification.metrics.pixels;
          double screenWidth = MediaQuery.of(context).size.width;
          _tabController?.scrollPosition = offset / screenWidth;
        }
        return false;
      },
      child: TabBarView(
        controller: _tabController,
        children: _tabs
            .map((item) => GodRecommendList(
                cid: item.cid,
                filterType: _filterType,
                gameInfoMap: _gameInfoMap))
            .toList(),
      ),
    );
  }

  Widget _buildFilterList() {
    return Container(
      width: 120.dp,
      height: 140.dp,
      padding: EdgeInsetsDirectional.all(10.dp),
      decoration: BoxDecoration(
        color: R.colors.mainBgColor,
        borderRadius: BorderRadius.all(Radius.circular(8.dp)),
      ),
      child: Column(
        children: [
          _buildFilterItem(0, K.filter_all),
          _buildFilterItem(1, K.filter_male, icon: Assets.rank$god_ic_male_svg),
          _buildFilterItem(2, K.filter_female,
              icon: Assets.rank$god_ic_female_svg),
        ],
      ),
    );
  }

  Widget _buildFilterItem(int value, String title, {String? icon}) {
    return QuickTapFilterWidget(
      onTap: () {
        Navigator.of(context).pop();
        if (_filterType == value) return;
        _filterType = value;
        refresh();
      },
      child: SizedBox(
        width: 110.dp,
        height: 40.dp,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon == null
                ? SizedBox(width: 24.dp, height: 24.dp)
                : R.img(icon, width: 24.dp, height: 24.dp),
            SizedBox(width: 5.dp),
            Text(
              title,
              style: TextStyle(
                  color: R.colors.mainTextColor,
                  fontSize: 13.dp,
                  fontWeight: FontWeight.w400),
            ),
          ],
        ),
      ),
    );
  }
}

class GameInfo {
  final int cid;
  final String icon;
  final Map<int, String> levelNames;
  final List<Color> colors;

  GameInfo(
      {required this.cid,
      required this.icon,
      required this.levelNames,
      required this.colors});
}
