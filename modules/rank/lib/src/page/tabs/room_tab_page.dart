import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:shared/assets.dart';
import 'package:rank/assets.dart';
import 'package:rank/src/model/rankRequestManager.dart';
import 'package:rank/src/page/tabs/room_tab_sex_filter_widget.dart';
import 'package:get/get.dart';

import '../../model/pb/generated/slp_tab_banner.pb.dart' as homeTabBanner;
import '../main_page_controller.dart';
import 'room_sub_page.dart';
import 'room_tab_banner_widget.dart';
import 'package:pulse_log/pulse_log.dart';

const String marryFilter = 'friend-marry';

typedef OnSubTabChange = void Function(int tabId, String filter);

Map<int, int> _typeFilter = {}; // Tab二级过滤

class RoomTabPage extends StatefulWidget {
  final List<CommonSubTab>? tabs;
  final int tabId;
  final String? tabName; // 一级tabName，用户上报，区分不同的一级Tab里有相同的二级tab名称
  final String? bannerChannel;
  final int? style;
  final String? type; //一级tab的type
  final OnSubTabChange? onSubTabChange;
  final bool sliver;
  final Decoration? subTabSelectedDecoration;
  final Decoration? subTabUnSelectedDecoration;
  final Color? subTabIndicatorColor;
  final bool showRank; // 是否显示榜单
  final DefaultItemBuilder? defaultItemBuilder; //支持自定义默认样式的构造器
  final Color? labelColor;
  final Color? unselectedLabelColor;
  final double tabItemHeight;
  final TextStyle? labelStyle;
  final TextStyle? unselectedLabelStyle;

  const RoomTabPage(
    this.tabs, {
    required this.tabId,
    this.tabName,
    this.bannerChannel,
    this.style,
    this.type,
    this.onSubTabChange,
    this.sliver = false,
    super.key,
    this.subTabSelectedDecoration,
    this.subTabUnSelectedDecoration,
    this.subTabIndicatorColor,
    this.showRank = true,
    this.defaultItemBuilder,
    this.labelColor,
    this.unselectedLabelColor,
    this.tabItemHeight = 28,
    this.labelStyle,
    this.unselectedLabelStyle,
  });

  @override
  RoomTabState createState() {
    return RoomTabState();
  }
}

class RoomTabState extends State<RoomTabPage> with TickerProviderStateMixin<RoomTabPage>, ReloadStateMixin {
  TabController? _tabController;
  late GlobalKey tabBarGlobalKey;
  late GlobalKey tabViewGlobalKey;

  late MainPageController mainPageController;

  List<homeTabBanner.TabBannerItem> banners = [];

  bool _loadingByApi = true; // 限制API反复请求

  /// 直播all tab
  bool _showFilterPanel(CommonSubTab tab) {
    return tab.subTab.showFilter && tab.subTab.filterSubList.isNotEmpty;
  }

  /// 过滤的索引
  int get _getFilterIndex {
    return _typeFilter[widget.tabId] ?? 0;
  }

  void _updateFilterSubTab(int index) {
    if (widget.type == null || widget.type!.isEmpty) return;
    _typeFilter[widget.tabId] = index;
    for (CommonSubTab subTab in widget.tabs!) {
      if (index >= 0 && subTab.subTab.filterSubList.isNotEmpty && index < subTab.subTab.filterSubList.length) {
        FilterSubTab filterSubTab = subTab.subTab.filterSubList[index];
        subTab.globalKey = GlobalKey();
        subTab.subTab.tab = filterSubTab.tab;
        subTab.subTab.filter = filterSubTab.filter;
        subTab.subTab.type = filterSubTab.type;
      }
    }
    refresh();
  }

  @override
  void initState() {
    super.initState();
    mainPageController = Get.find<MainPageController>();
    tabBarGlobalKey = GlobalKey();
    tabViewGlobalKey = GlobalKey();
    initTabController();
    _loadRoomListBanner();
  }

  void _loadRoomListBanner() {
    if (Util.isSleeplessPlanetVerify) return;
    _loadingByApi = true;
    // 获取频道banner
    RankRequestManager.getCommonRoomlistBanner(widget.bannerChannel, widget.tabId).then((banner) {
      if (!banner.success) return;
      if (banner.data.items.isNotEmpty) {
        if (mounted) {
          setState(() {
            banners = banner.data.items;
          });
        }
      }
      _loadingByApi = false;
    });
  }

  @override
  void dispose() {
    _tabController?.removeListener(_onTabChanged);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Log.d('widget.tabs!.length:${widget.tabs!.length}');
    // Log.d('widget.sliver:${widget.sliver}');
    if (widget.tabs == null || widget.tabs!.isEmpty) {
      return Container();
    }

    if (widget.sliver == false) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (banners.isNotEmpty) _buildBannerWidget(),
          widget.tabs!.length <= 1 ? const SizedBox.shrink() : _buildTabBar(),
          Expanded(child: _buildTabBarView()),
        ],
      );
    } else {
      return ExtendedNestedScrollView(
        onlyOneScrollInBody: true,
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            if (banners.isNotEmpty)
              SliverList(
                delegate: SliverChildListDelegate([_buildBannerWidget()]),
              ),
            widget.tabs!.length <= 1
                ? const SizedBox.shrink()
                : SliverPersistentHeader(
                    pinned: true,
                    delegate: CustomSliverPersistentHeaderDelegate(_buildTabBar(), 44),
                  ),
          ];
        },
        body: _buildTabBarView(),
      );
    }
  }

  Widget _buildBannerWidget() {
    return RoomTabBannerWidget(
      channel: widget.bannerChannel ?? '',
      banners: banners,
      tabId: widget.tabId,
    );
  }

  Widget _buildTabBar() {
    return Container(
      height: 44.0,
      alignment: AlignmentDirectional.centerStart,
      child: buildTabWidget(),
    );
  }

  Widget _buildTabBarView() {
    return TabBarView(
      key: tabViewGlobalKey,
      physics: const NeverScrollableScrollPhysics(),
      controller: _tabController,
      children: buildTabViews(),
    );
  }

  Widget buildTabWidget() {
    List<Widget> tabs = [];
    for (int i = 0; i < widget.tabs!.length; i++) {
      bool selected = i == _tabController?.index;
      List<Color> textColors = selected
          ? (darkMode ? R.dColor.mainBrandGradientColors : [R.color.mainTextColor, R.color.mainTextColor])
          : [R.colors.secondTextColor, R.colors.secondTextColor];
      Widget child = Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (Util.validStr(widget.tabs![i].icon))
            Padding(
              padding: const EdgeInsetsDirectional.only(end: 2),
              child: CachedNetworkImage(
                imageUrl: Util.squareResize(widget.tabs![i].icon, 50),
                width: 14,
                height: 14,
              ),
            ),
          GradientText(
            widget.tabs![i].title,
            gradient: LinearGradient(colors: textColors),
            style: const TextStyle(fontSize: 12),
          ),
          if (_showFilterPanel(widget.tabs![i])) ...[
            Obx(() {
              return Transform(
                  alignment: Alignment.center,
                  transform: mainPageController.isFilterShowing.value
                      ? (Matrix4.identity()..scale(1.0, 1.0, -1.0))
                      : (Matrix4.identity()..scale(1.0, -1.0, 1.0)),
                  child: Rext.autoStyleImg(Assets.rank$ic_arrow_small_svg, width: 14, height: 14));
            }),
          ],
        ],
      );

      Container tabSelectedContainer = Container(
        height: 42,
        constraints: const BoxConstraints(minWidth: 48),
        alignment: AlignmentDirectional.center,
        padding: const EdgeInsetsDirectional.only(start: 20, end: 20),
        decoration: BoxDecoration(
          image: DecorationImage(
            centerSlice: const Rect.fromLTWH(32, 21, 1, 1),
            image: AssetImage(
              R.imagePath(
                darkMode ? BaseAssets.ic_home_sub_tab_selected_dark_webp : BaseAssets.ic_home_sub_tab_selected_webp,
                package: ComponentManager.MANAGER_BASE_CORE,
              ),
            ),
            scale: 3,
          ),
        ),
        child: child,
      );

      Container tabUnSelectedContainer = Container(
        height: 28,
        alignment: AlignmentDirectional.center,
        padding: const EdgeInsetsDirectional.only(start: 11.5, end: 11.5),
        margin: const EdgeInsetsDirectional.only(start: 8, end: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(width: 0.5, color: R.colors.subTabBorderColor),
        ),
        child: child,
      );

      Tab tab = Tab(child: selected ? tabSelectedContainer : tabUnSelectedContainer);
      tabs.add(tab);
    }

    return CommonTabBar(
      key: tabBarGlobalKey,
      showSplash: false,
      labelPadding: const EdgeInsetsDirectional.all(0),
      controller: _tabController,
      isScrollable: true,
      tabs: tabs,
      onSecondTap: _onSecondTap,
      onTap: handleTabClickReport,
      // labelColor: widget.labelColor ?? R.colors.brightTextColor,
      // unselectedLabelColor: widget.unselectedLabelColor ?? R.colors.secondTextColor,
      labelStyle: widget.labelStyle ?? const TextStyle(fontSize: 12),
      unselectedLabelStyle: widget.unselectedLabelStyle ?? const TextStyle(fontSize: 12),
      marginStart: 16,
      indicator: const BoxDecoration(),
    );
  }

  void _onSecondTap(int index) {
    CommonSubTab commonSubTab = widget.tabs![index];
    if (_showFilterPanel(commonSubTab)) {
      RenderBox? box = tabBarGlobalKey.currentContext?.findRenderObject() as RenderBox?;
      if (box == null) return;
      Offset paintPosition = box.localToGlobal(Offset.zero);
      int oldFilterIndex = _getFilterIndex;
      RoomTabSexFilterWidget.show(context,
          top: paintPosition.dy + 44,
          filterIndex: _getFilterIndex,
          filterList: commonSubTab.subTab.filterSubList, onSexFilterChanged: (filterIndex) {
        if (filterIndex == oldFilterIndex) return;
        _updateFilterSubTab(filterIndex);
      });
    }
  }

  void handleTabClickReport(int index) {
    if (_tabController!.length > index) {
      Tracker.instance.track(TrackEvent.party_page, properties: {'click_tab': widget.tabs![index].title, 'tab_class': '2'});
      PulseLog.instance.event('click_event', properties: {
        'click_tag': 'home_second_tab_${widget.tabs![index].title}',
      });
    }
  }

  int _getDefaultTabIndex() {
    if (_tabController != null && widget.tabs!.length > _tabController!.index) {
      return _tabController!.index;
    }
    int index = 0;

    for (int i = 0; i < widget.tabs!.length; i++) {
      if (widget.tabs![i].isDefault) {
        index = i;
        break;
      }
    }
    return index;
  }

  List<Widget> buildTabViews() {
    List<Widget> pages = [];
    for (int i = 0; i < widget.tabs!.length; i++) {
      RoomSubPage subPage = RoomSubPage(
        key: widget.tabs![i].globalKey,
        type: widget.tabs![i].filter,
        tabName: widget.tabs![i].title,
        gameCategory: widget.tabs![i].gameCategory,
        tabId: widget.tabId,
        firstTabName: widget.tabName,
        firstType: widget.type,
        style: widget.style,
        sliver: false,
        defaultItemBuilder: widget.defaultItemBuilder,
      );
      pages.add(subPage);
    }
    return pages;
  }

  void initTabController() {
    int newLength = widget.tabs?.length ?? 0;
    _tabController?.removeListener(_onTabChanged);
    safeRun(() {
      if ((_typeFilter[widget.tabId] ?? 0) > 0) {
        _updateFilterSubTab(_typeFilter[widget.tabId]!);
      }
      _tabController = TabController(length: newLength, initialIndex: _getDefaultTabIndex(), vsync: this);
      _tabController!.addListener(_onTabChanged);
    });
  }

  @override
  void didUpdateWidget(covariant RoomTabPage oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.tabs == null || widget.tabs!.isEmpty) {
      return;
    }

    if (oldWidget.tabs?.length != widget.tabs!.length) {
      initTabController();
    } else {
      bool needRefreshTab = false;
      for (int i = 0; i < widget.tabs!.length; i++) {
        if (widget.tabs![i].matchKey != oldWidget.tabs?[i].matchKey) {
          needRefreshTab = true;
          break;
        }
      }
      if (needRefreshTab) {
        initTabController();
      }
    }
  }

  String getCurrentFilter() {
    if (widget.tabs != null && widget.tabs!.length > _tabController!.index) {
      if (widget.tabs![_tabController!.index].filter == marryFilter) {
        return '';
      } else {
        return widget.tabs![_tabController!.index].filter;
      }
    }
    return '';
  }

  void _onTabChanged() {
    if (_tabController!.indexIsChanging) return;

    if (widget.onSubTabChange != null) {
      if (widget.tabs != null && widget.tabs!.length > _tabController!.index) {
        widget.onSubTabChange!(widget.tabId, getCurrentFilter());
      }
    }

    reload(force: false, animated: false);

    if (mounted) {
      setState(() {});
    }
  }

  @override
  void reload({bool force = true, animated = true}) {
    if (widget.tabs != null &&
        widget.tabs!.length > _tabController!.index &&
        widget.tabs![_tabController!.index].globalKey?.currentState is ReloadStateMixin) {
      if (!_loadingByApi) {
        _loadRoomListBanner();
      }
      (widget.tabs![_tabController!.index].globalKey?.currentState as ReloadStateMixin).reload(force: force, animated: animated);
    }
  }

  @override
  void scrollToTop({bool animated = true}) {
    if (widget.tabs != null &&
        widget.tabs!.length > _tabController!.index &&
        widget.tabs![_tabController!.index].globalKey?.currentState is ReloadStateMixin) {
      (widget.tabs![_tabController!.index].globalKey?.currentState as ReloadStateMixin).scrollToTop(animated: animated);
    }
  }
}
