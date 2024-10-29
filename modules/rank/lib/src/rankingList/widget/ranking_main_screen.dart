import 'package:flutter/material.dart';
import 'package:rank/assets.dart';
import 'package:rank/k.dart';
import 'package:rank/src/rankingList/model/ranking_main_screen_bean.dart';
import 'package:rank/src/rankingList/model/ranking_repo.dart';
import 'package:shared/assets.dart';
import 'package:shared/shared.dart';

import 'ranking_main_subtabpage.dart';

/// 全部排行榜页面
/// 包含主播榜、用户榜、活动榜
/// 小时榜、日榜、周榜、pk榜、才艺榜
class RankingMainFullScreen extends StatefulWidget {
  final int rid;
  final String? charmType;
  final String? tabType;

  const RankingMainFullScreen({
    super.key,
    required this.rid,
    this.charmType,
    this.tabType,
  });

  @override
  _RankingMainFullScreenState createState() => _RankingMainFullScreenState();

  /// [tabType] 默认一开始在那个Tab，可以输入子Tab的type
  static openScreen(BuildContext context, int rid, String? charmType, {String? tabType}) async {
    return await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => RankingMainFullScreen(
          rid: rid,
          charmType: charmType,
          tabType: tabType,
        ),
      ),
    );
  }
}

class _RankingMainFullScreenState extends State<RankingMainFullScreen> with BaseScreenStateMixin, TickerProviderStateMixin {
  List<FirstTab> _firstTabList = <FirstTab>[];

  ExtendedTabController? _tabController;

  int _firstTabIndex = 0;
  int _secondTabIndex = 0;

  var _pageKeys = <GlobalKey<RankingMainSubTabPageState>>[];

  int get _tabIndex {
    if (_tabController != null) return _tabController!.index;
    return 0;
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image:
                (R.img(Assets.ranking_main_bg, package: Assets.package, width: Util.width, height: Util.width * 724 / 750) as Image).image,
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            // buildAppBar(),
            _buildAppBar(),
            Expanded(child: buildStatusContent()),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _loadTabs();
  }

  @override
  @protected
  void onTapErrorWidget() {
    setScreenLoading();
    _loadTabs();
  }

  Future<void> _loadTabs() async {
    DataRsp<List<FirstTab>> dataRsp = await RankingRepo.newRankTab();

    if (dataRsp.success == true && !dataRsp.isEmpty) {
      int firstTabIndex = 0;
      int secondTabIndex = 0;
      bool find = false;

      _firstTabList = dataRsp.data ?? [];

      _pageKeys.clear();

      if (_firstTabList.isNotEmpty) {
        _pageKeys = List.generate(
          _firstTabList.length,
          (index) => GlobalKey(),
          growable: false,
        );

        for (int i = 0; i < _firstTabList.length && !find; i++) {
          var sendTabs = _firstTabList[i].list;
          firstTabIndex = i;
          if (sendTabs.isNotEmpty) {
            for (int j = 0; j < sendTabs.length; j++) {
              var tab = sendTabs[j];
              if (tab.type == widget.tabType) {
                secondTabIndex = j;
                find = true;
                break;
              }
            }
          }
        }
      }

      if (find) {
        _firstTabIndex = firstTabIndex;
        _secondTabIndex = secondTabIndex;
      }

      if (_tabController != null) {
        _tabController!.removeListener(_onTabChange);
        _tabController!.dispose();
      }
      safeRun(
        () => _tabController = ExtendedTabController(
          initialIndex: _firstTabIndex,
          length: _firstTabList.length,
          vsync: this,
        )..addListener(_onTabChange),
      );
      setScreenReady();
    } else {
      setScreenError(errorMsg: dataRsp.msg);
    }
  }

  _onTabChange() {
    if (_tabIndex < _pageKeys.length) {
      _pageKeys[_tabIndex].currentState?.loadData();
    }
  }

  Widget _buildAppBar() {
    return SizedBox(
      height: kToolbarHeight + MediaQuery.of(context).padding.top,
      child: Column(
        children: [
          Container(height: MediaQuery.of(context).padding.top),
          Expanded(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Container(
                  width: kToolbarHeight,
                  height: kToolbarHeight,
                  alignment: AlignmentDirectional.centerStart,
                  child: Padding(
                    padding: const EdgeInsetsDirectional.only(start: 20),
                    child: R.img(
                      BaseAssets.ic_titlebar_back_svg,
                      package: ComponentManager.MANAGER_BASE_CORE,
                      width: 24,
                      height: 24,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              if (_firstTabList.isNotEmpty)
                Expanded(
                  // child: _buildTab(),
                  child: Center(
                    child: SizedBox(
                      width: _firstTabList.length.toDouble() * 60,
                      height: kToolbarHeight - 14,
                      // color: Colors.red,
                      child: _buildTab(),
                    ),
                  ),
                ),
              GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () {
                  BaseWebviewScreen.show(context, url: Util.getProductHelpUrl('k82'));
                },
                child: Container(
                  width: 40,
                  alignment: AlignmentDirectional.centerStart,
                  child: R.img(Assets.rank_ranking_knight_group_rule_webp, width: 24, height: 24, package: ComponentManager.MANAGER_RANK),
                ),
              ),
            ],
          ))
        ],
      ),
    );
  }

  @override
  PreferredSizeWidget buildAppBar() {
    return BaseAppBar.custom(
      title: Text(
        K.rank_page_title,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.white),
      ),
      backgroundColor: Colors.transparent,
      backColor: Colors.white,
      actions: [
        GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            BaseWebviewScreen.show(context, url: Util.getProductHelpUrl('k82'));
          },
          child: Container(
            width: 40,
            alignment: AlignmentDirectional.centerStart,
            child: R.img(Assets.rank_ranking_knight_group_rule_webp, width: 24, height: 24, package: ComponentManager.MANAGER_RANK),
          ),
        ),
      ],
    );
  }

  @override
  Widget buildContent() {
    return Column(
      children: [
        const SizedBox(height: 5),
        Expanded(child: _buildPager()),
      ],
    );
    // return Column(
    //   mainAxisSize: MainAxisSize.max,
    //   crossAxisAlignment: CrossAxisAlignment.start,
    //   children: [
    //     _buildTab(),
    //     Expanded(
    //       child: _buildPager(),
    //     ),
    //   ],
    // );
  }

  Widget _buildTab() {
    double tabHeight = 44;
    List<Widget> tabs = <Widget>[];
    const TextStyle unselectedLabelStyle = TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
    );
    for (var element in _firstTabList) {
      tabs.add(Tab(
        child: Container(
          height: tabHeight,
          alignment: AlignmentDirectional.center,
          child: Text(
            element.title,
          ),
        ),
      ));
    }

    return CommonTabBar(
      tabs: tabs,
      isScrollable: false,
      controller: _tabController,
      labelColor: Colors.white,
      labelStyle: const TextStyle(
        color: Colors.white,
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
      unselectedLabelStyle: unselectedLabelStyle,
      unselectedLabelColor: const Color(0x99FFFFFF),
      indicator: const CommonUnderlineTabIndicator(
          borderSide: BorderSide(width: 3.0, color: Colors.white),
          insets: EdgeInsetsDirectional.only(bottom: 4),
          wantWidth: 16,
          draggingWidth: 12.0),
      indicatorWeight: 0,
      marginStart: 16,
      labelPadding: const EdgeInsetsDirectional.only(top: 4, bottom: 4),
    );
  }

  Widget _buildPager() {
    var children = <Widget>[];
    _firstTabList.asMap().forEach((index, value) {
      int initIndex = 0;
      if (index == _firstTabIndex) {
        initIndex = _secondTabIndex;
        _firstTabIndex = 0;
        _secondTabIndex = 0;
      }
      children.add(RankingMainSubTabPage(
        key: _pageKeys[index],
        rid: widget.rid,
        charmType: widget.charmType,
        firstTab: value,
        initIndex: initIndex,
        tabType: value.type,
      ));
    });

    return ExtendedTabBarView(
      controller: _tabController,
      children: children,
    );
  }
}
