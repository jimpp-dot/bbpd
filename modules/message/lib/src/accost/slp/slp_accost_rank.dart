import 'package:shared/assets.dart';
import 'package:message/k.dart';
import 'package:shared/shared.dart';
import 'package:shared/k.dart' as BaseK;
import 'package:flutter/material.dart';

import 'slp_accost_rank_sub.dart';

class BbAccostRankWidget extends StatefulWidget {
  const BbAccostRankWidget({super.key});

  @override
  State<StatefulWidget> createState() => BbAccostRankState();
}

class BbAccostRankTabModel {
  final String tabName;
  final String rankName;
  final String helpPageKey;
  const BbAccostRankTabModel(this.tabName, this.rankName, this.helpPageKey);
}

class BbAccostRankState extends State<BbAccostRankWidget>
    with SingleTickerProviderStateMixin {
  final List<BbAccostRankTabModel> _tabbarTabs = [
    BbAccostRankTabModel(K.msg_make_friends_king_list, '', 'k125'),
    BbAccostRankTabModel(K.msg_make_friends_potential, 'potential', 'k126')
  ];
  late ExtendedTabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = ExtendedTabController(
        initialIndex: 0, length: _tabbarTabs.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: R.colors.homeBgColor,
      appBar: BaseAppBar.custom(
        statusBrightness: darkMode ? Brightness.dark : Brightness.light,
        backColor: R.colors.mainTextColor,
        backgroundColor: R.colors.homeBgColor,
        title: _buildAppBar(),
        actions: [_buildHelp()],
      ),
      body: TabBarView(
        controller: _tabController,
        children: _tabbarTabs.map((e) {
          return BbAccostRankChannelWidget(rankName: e.rankName);
        }).toList(),
      ),
    );
  }

  Widget _buildHelp() {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        BbAccostRankTabModel tabModel = _tabbarTabs[_tabController.index];
        BaseWebviewScreen.show(context,
            url: Util.getHelpUrlWithQStr(tabModel.helpPageKey));
      },
      child: Container(
        margin: const EdgeInsetsDirectional.only(end: 16),
        alignment: AlignmentDirectional.center,
        child: R.img(
          BaseAssets.ic_help_webp,
          package: ComponentManager.MANAGER_BASE_CORE,
          width: 22,
          height: 22,
          color: R.color.mainTextColor,
        ),
      ),
    );
  }

  Widget _buildAppBar() {
    return CommonTabBar(
      tabs: _tabbarTabs
          .map((e) => Text(e.tabName, style: TextStyle(fontSize: 16.dp)))
          .toList(),
      controller: _tabController,
      labelColor: R.color.mainTextColor,
      isScrollable: true,
      unselectedLabelColor: R.color.secondTextColor,
      labelStyle: TextStyle(
          color: R.color.mainTextColor,
          fontSize: 16,
          fontWeight: FontWeight.w500),
      unselectedLabelStyle: TextStyle(
          color: R.color.secondTextColor,
          fontSize: 16,
          fontWeight: FontWeight.w500),
      indicator: const CommonUnderlineTabIndicator(
          borderSide: BorderSide(width: 3.5, color: Color(0xFF313131)),
          insets: EdgeInsetsDirectional.only(bottom: -4),
          wantWidth: 12.0,
          draggingWidth: 12.0),
      labelPadding: const EdgeInsetsDirectional.only(start: 9, end: 9),
    );
  }
}

class BbAccostRankChannelWidget extends StatefulWidget {
  final String rankName;
  const BbAccostRankChannelWidget({super.key, required this.rankName});

  @override
  _BbAccostRankChannelState createState() => _BbAccostRankChannelState();
}

class _BbAccostRankChannelState extends State<BbAccostRankChannelWidget> {
  final List<Widget> _pagesWidget = [];
  List<String> tabs = [BaseK.K.this_week, BaseK.K.last_week];
  late PageController _pageController;
  int _curIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _curIndex, keepPage: true);
    tabs.forEachIndexed((i, e) {
      _pagesWidget.add(_buildPageItem(i + 1, widget.rankName));
    });
  }

  @override
  Widget build(BuildContext context) {
    return _buildBody();
  }

  Widget _buildBody() {
    return Column(
      children: [
        _buildTabs(),
        _buildPages(),
      ],
    );
  }

  Widget _buildPages() {
    return Expanded(
      child: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: _pageController,
        children: _pagesWidget,
      ),
    );
  }

  Widget _buildTabs() {
    return Container(
      width: 163,
      height: 38,
      margin: const EdgeInsetsDirectional.only(
          start: 20, end: 20, top: 5, bottom: 5),
      padding: const EdgeInsetsDirectional.all(2),
      decoration: const ShapeDecoration(
        color: Color(0xFFF6F7F9),
        shape: StadiumBorder(),
      ),
      child: Row(
        children: tabs.mapIndexed((i, e) => _buildTabItem(i, e)).toList(),
      ),
    );
  }

  Widget _buildTabItem(
    int index,
    String tabLabel,
  ) {
    return Expanded(
      child: GestureDetector(
        onTap: () => _onTabSelected(index),
        child: Container(
          height: 34,
          decoration: ShapeDecoration(
            color: _curIndex == index ? Colors.white : Colors.transparent,
            shape: const StadiumBorder(),
          ),
          alignment: Alignment.center,
          child: Text(
            tabLabel,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: _curIndex == index
                  ? const Color(0xFF202020)
                  : const Color(0xFF202020).withOpacity(0.4),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPageItem(int type, String rankName) {
    return BbAccostRankSubWidget(type, rankName);
  }

  void _onTabSelected(int index) async {
    _curIndex = index;
    _pageController.jumpToPage(index);
    refresh();
  }
}
