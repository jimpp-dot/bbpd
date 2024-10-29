import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shared/dart_extensions/extensions_common.dart';
import 'package:shared/shared.dart';
import 'package:vip/src/level/level_api.dart';
import 'package:vip/src/level/model/card_bean.dart';
import 'package:vip/src/level/model/level_bean.dart';
import 'package:vip/src/level/model/welfare_pond_bean.dart';
import 'package:vip/src/level/page/level_detail_swiper.dart';
import 'package:vip/src/level/page/vip_popularity_guide_page.dart';
import 'package:vip/src/level/page/welfare_history_page.dart';
import 'package:vip/src/level/widget/level_box_card.dart';
import 'package:vip/src/level/widget/level_item_widget.dart';
import 'package:vip/src/level/widget/level_tip_dialog.dart';
import 'package:vip/src/level/widget/level_upgrade_dialog.dart';
import 'package:vip/src/level/widget/welfare_pondItem_widget.dart';
import 'package:vip/src/level/widget/welfare_show_panel.dart';

import '../../../assets.dart';
import '../../../k.dart';

/// vip和人气页面
///
class VipPopularityPageNew extends StatefulWidget {
  final MyLevelTab initialTab;

  const VipPopularityPageNew({super.key, required this.initialTab});

  @override
  VipPopularityPageNewState createState() => VipPopularityPageNewState();

  static Future show(BuildContext context, {required MyLevelTab initialTab}) {
    return Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => VipPopularityPageNew(initialTab: initialTab),
        settings: const RouteSettings(name: 'MyLevelScreen'),
      ),
    );
  }
}

class VipPopularityPageNewState extends State<VipPopularityPageNew>
    with AutomaticKeepAliveClientMixin<VipPopularityPageNew>, TickerProviderStateMixin, VipMixin, VipRenqMixin {
  final ScrollController _scrollController = ScrollController();

  ExtendedTabController? _tabController;

  PageController? _pageController;

  @override
  bool get wantKeepAlive => true;

  // 宝箱接口loading
  bool _loading = true;

  // 宝箱接口error
  String? _errorMessage;

  // 奖池loading
  bool _poolLoading = true;

  // 奖池error
  String? _poolErrorMessage;

  VipLevel? _vipLevel;

  PopularityLevel? _popularityLevel;

  CardData? _cardData;

  late double _bottomBarHeight;

  bool isExpanded = true;

  CardDetailItem? _selectedCard;

  int _initPage = 0;

  List<ShopMailCommodity> _awardPoolList = [];

  final Map<int, List<ShopMailCommodity>> _awardPoolListCache = {};

  String _percentText = '';

  double _lastOffset = 0.0;

  late AnimationController _aniController;
  late Animation<double> _ani;

  double _currPageValue = 0.0;

  int _curTabIndex = 0;

  final double _scrollMaxOffset = _topInfoHeight + 20 + 24;

  static const double _topInfoHeight = 96;

  late bool _isVip;

  @override
  void initState() {
    super.initState();
    _isVip = widget.initialTab == MyLevelTab.Vip;
    _scrollController.addListener(_onScroll);
    safeRun(
      () => _tabController = ExtendedTabController(length: 1, vsync: this)..addListener(_onTabChanged),
    );
    _bottomBarHeight = 48 + Util.iphoneXBottom;

    _initAnimation();
    _loadMainData();
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _tabController?.removeListener(_onTabChanged);
    _scrollController.dispose();
    _aniController.dispose();
    super.dispose();
  }

  void _initAnimation() {
    _aniController = AnimationController(vsync: this, duration: const Duration(milliseconds: 200));
    final CurvedAnimation curve = CurvedAnimation(parent: _aniController, curve: Curves.decelerate);
    _ani = Tween<double>(begin: 0.0, end: 1.0).animate(curve)..addListener(refresh);
  }

  void _onTabChanged() {
    _curTabIndex = _tabController!.index;
    refresh();
    Log.d('---------------------_curTabIndex:$_curTabIndex');
  }

  _onScroll() {
    if (!_scrollController.hasClients) return;
    double max = _scrollMaxOffset;
    Log.d('_onScroll:$isExpanded， max：$max， _scrollController.offset:${_scrollController.offset}');
    if (isExpanded == true && _scrollController.offset >= max - 5) {
      isExpanded = false;
      Log.d('event.onExpandChanged:$isExpanded');
    } else if (isExpanded == false && _scrollController.offset < max - 5) {
      isExpanded = true;
      Log.d('event.onExpandChanged:$isExpanded');
    }

    if (_scrollController.offset > _lastOffset) {
      if (_aniController.status == AnimationStatus.dismissed) {
        _aniController.forward();
      }
    } else {
      if (_aniController.status == AnimationStatus.completed) {
        _aniController.reverse();
      }
    }

    _lastOffset = _scrollController.offset;
    refresh();
  }

  bool get _isMainError => _errorMessage != null;

  _loadMainData() async {
    _errorMessage = null;
    _loading = true;
    List<BaseResponse> respList = await Future.wait(
      [
        _isVip ? LevelApi.getMyLevel() : LevelApi.getMyPopularity(),
        LevelApi.getCardData(_isVip ? 'vip' : 'popular'),
      ],
    );

    for (int i = 0; i < respList.length; i++) {
      if (respList[i].success == false) {
        _errorMessage = respList[i].msg;
        break;
      }
    }

    if (_errorMessage == null) {
      if (_isVip) {
        VipLevelResponse response = respList[0] as VipLevelResponse;
        _vipLevel = response.data;
      } else {
        PopularityResponse response = respList[0] as PopularityResponse;
        _popularityLevel = response.data;
      }
      CardDataResp cardDataResp = respList[1] as CardDataResp;
      _cardData = cardDataResp.data;

      /// vip 人气都是零级的情况
      int index = _cardData!.list.indexWhere((element) => element.cardId == _cardData!.info!.cardId);
      if (index == -1) {
        index = 0;
      }
      _selectedCard = _cardData!.list[index];
      _initPage = index;
      _currPageValue = Util.parseDouble(index);
      _initPageController(index);
    }
    _loading = false;

    if (mounted == true) {
      setState(() {});
      showGuide();
      showUpgradeDialog();
      if (_cardData != null) _loadPool(_selectedCard!.cardId);
    }
  }

  void _initPageController(int initIndex) {
    _pageController = PageController(viewportFraction: viewportFraction(), initialPage: initIndex > 0 ? initIndex : 0);
    _pageController!.addListener(() {
      _currPageValue = _pageController!.page ?? 0;
      refresh();
    });
  }

  double viewportFraction() => 0.83;

  _loadPool(int cardId, {bool showLoading = true}) async {
    if (showLoading) _poolLoading = true;
    _poolErrorMessage = null;

    if (_awardPoolListCache[cardId] != null) {
      _awardPoolList = _awardPoolListCache[cardId]!;
    } else {
      WelfarePondBean beanResp = await LevelApi.getCardPool(cardId);
      if (beanResp.success == true) {
        _awardPoolList = beanResp.data;
        _awardPoolListCache[cardId] = _awardPoolList;
      } else {
        _poolErrorMessage = beanResp.msg;
      }
    }
    _poolLoading = false;
    refresh();
  }

  Widget _buildAppBar() {
    return BaseAppBar.custom(
      statusBrightness: isExpanded ? Brightness.dark : Brightness.light,
      backgroundColor: isExpanded ? Colors.transparent : R.colors.userVipBgColor,
      leading: _buildBack(),
      title: Text(
        (_isVip ? _vipLevel?.name : _popularityLevel?.name) ?? '',
        style: TextStyle(color: isExpanded ? Colors.white : Colors.white, fontSize: 16, fontWeight: FontWeight.w700),
      ),
      actions: [
        _buildHelpWidget(),
      ],
    );
  }

  Widget _buildHelpWidget() {
    return InkWell(
      onTap: _onHelpTaped,
      child: Container(
        padding: const EdgeInsetsDirectional.only(end: 16, start: 16),
        alignment: Alignment.center,
        child: R.img(
          'level/ic_help.svg',
          color: isExpanded ? Colors.white : Colors.black,
          package: ComponentManager.MANAGER_VIP,
          width: 24,
          height: 24,
        ),
      ),
    );
  }

  _onHelpTaped() {
    String url = _isVip ? 'vipQA' : 'popularityQA';
    BaseWebviewScreen.show(context, url: Util.getHelpUrl(url), title: K.explain);
  }

  Widget _buildBack() {
    return InkWell(
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
            'ic_titlebar_back.svg',
            color: isExpanded ? Colors.white : Colors.white,
            width: 24,
            height: 24,
            package: ComponentManager.MANAGER_BASE_CORE,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      backgroundColor: R.colors.userVipBgColor,
      body: Stack(
        children: [
          Positioned.fill(child: R.img(Assets.vip$vip_big_bg, fit: BoxFit.fill, width: Util.width, height: Util.height)),
          PositionedDirectional(
            start: 0,
            end: 0,
            top: 0,
            bottom: 0,
            child: _buildContent(),
          ),
          PositionedDirectional(
            start: 0,
            end: 0,
            top: 0,
            child: _buildAppBar(),
          ),
        ],
      ),
    );
  }

  Widget _buildContent() {
    return Stack(
      children: [
        ExtendedNestedScrollView(
          controller: _scrollController,
          onlyOneScrollInBody: true,
          pinnedHeaderSliverHeightBuilder: () => MediaQuery.of(context).padding.top + kToolbarHeight,
          physics: const ClampingScrollPhysics(),
          headerSliverBuilder: (context, boxIsScrolled) => [SliverToBoxAdapter(child: _buildHeader())],
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // PositionedDirectional(top: -1, child: _buildTab()),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: text18('我的特权', textColor: Colors.white),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: text12('充值升级 VIP等级，开启更多特权', textColor: const Color(0xFF79C5FF)),
                  ),
                  const SizedBox(
                    height: 10,
                  )
                ],
              ),

              Container(
                height: double.infinity,
                padding: const EdgeInsetsDirectional.only(top: 0),
                child: _buildBody(),
              ).toExpanded(),
            ],
          ),
        ),
        // if (_cardData != null && !Util.isStringEmpty(_cardData!.info!.nextLevelNote) && _curTabIndex == 0)
        //   PositionedDirectional(bottom: -1 * _bottomBarHeight * _ani.value, child: _buildBottomBar())
      ],
    );
  }

  Widget _buildBottomBar() {
    return Container(
      height: _bottomBarHeight,
      padding: EdgeInsetsDirectional.only(bottom: Util.iphoneXBottom),
      width: Util.width,
      color: Colors.white.withOpacity(0.95),
      child: Center(
        child: Text(
          _cardData!.info!.nextLevelNote,
          style: const TextStyle(color: Color(0xFFFDA252), fontSize: 16),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: EdgeInsetsDirectional.only(top: MediaQuery.of(context).padding.top + kToolbarHeight + 24, bottom: 20),
      // decoration: BoxDecoration(
      //   image: DecorationImage(
      //     image: AssetImage(R.imagePath("level/level_bg_vip.webp",
      //         package: ComponentManager.MANAGER_VIP)),
      //     fit: BoxFit.fill,
      //   ),
      // ),
      child: _buildUserInfo(),
    );
  }

  Widget _buildTab() {
    return SizedBox(
      width: Util.width,
      height: 48,
      child: Stack(
        children: [
          Column(
            children: [
              Expanded(child: Container(color: isExpanded ? const Color(0xFF1D1E27) : Colors.white)),
              Expanded(child: Container(color: Colors.white)),
            ],
          ),
          Container(
            padding: const EdgeInsetsDirectional.only(bottom: 8),
            child: SubTabScrollWidget(
              controller: _tabController,
              selectColor: const Color(0xFF313131),
              unSelectColor: const Color(0xFF313131).withOpacity(0.4),
              allBgColor: const Color(0xFFF6F7F9),
              selectedBgColor: Colors.white,
              tabLabels: [
                // K.vip_welfare_pond,
                K.vip_level_prerogative,
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBody() {
    if (_loading) {
      return const Loading();
    }

    if (_errorMessage != null) {
      return ErrorData(error: _errorMessage, onTap: () => _loadMainData());
    }

    return _buildPrivilege();

    // return ExtendedTabBarView(
    //   physics: const ClampingScrollPhysics(),
    //   controller: _tabController,
    //   children: _buildSubPage(),
    // );
  }

  List<Widget> _buildSubPage() {
    return [
      // _buildBoxList(),
      _buildPrivilege(),
    ];
  }

  /// 特权
  CustomScrollView _buildPrivilege() {
    return CustomScrollView(
      slivers: [
        if (!Util.isCollectionEmpty(_vipLevel?.nextLvList)) SliverToBoxAdapter(child: _buildNextLevelTipList()),
        // SliverToBoxAdapter(
        //   child: _buildTips(),
        // ),
        SliverToBoxAdapter(
          child: _buildItemList(),
        ),
      ],
    );
  }

  Widget _buildNextLevelTipList() {
    List<Widget> nextViews = [];
    if (_vipLevel?.nextLvList != null) {
      for (int i = 0; i < _vipLevel!.nextLvList.length; i++) {
        nextViews.add(
          Container(
            width: 70,
            margin: const EdgeInsetsDirectional.only(
              start: 5,
              end: 5,
            ),
            child: LevelItemWidget(
              _vipLevel!.nextLvList[i],
              showDesc: false,
            ),
          ),
        );
      }
    }
    return Container(
      decoration: BoxDecoration(
        color: R.color.mainBgColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            offset: Offset(0, 4),
            blurRadius: 12,
            spreadRadius: 0,
            color: Color(0x14000000),
          ),
        ],
      ),
      margin: const EdgeInsetsDirectional.only(start: 20, end: 20, top: 15, bottom: 5),
      padding: const EdgeInsetsDirectional.only(top: 12, bottom: 14),
      child: Column(
        children: [
          Stack(
            alignment: AlignmentDirectional.bottomCenter,
            children: [
              Container(
                width: 120,
                height: 12,
                decoration: const ShapeDecoration(
                  color: Color(0x33EBC15C),
                  shape: StadiumBorder(),
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  R.img(
                    'next_level_tip_star_left.svg',
                    width: 19,
                    height: 20,
                    package: ComponentManager.MANAGER_VIP,
                  ),
                  const SizedBox(width: 3),
                  Text(
                    _vipLevel!.nextLvTx,
                    style: TextStyle(
                      fontSize: 16,
                      color: R.color.mainTextColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(width: 5),
                  R.img(
                    'next_level_tip_star_right.svg',
                    width: 10,
                    height: 10,
                    package: ComponentManager.MANAGER_VIP,
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 14),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: nextViews,
          ),
        ],
      ),
    );
  }

  /// 福利
  CustomScrollView _buildBoxList() {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: _buildBoxTitleTips(),
        ),
        SliverPadding(
          padding: const EdgeInsetsDirectional.only(top: 13),
          sliver: SliverToBoxAdapter(
            child: _buildBox(),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsetsDirectional.only(top: 10, bottom: 16),
          sliver: SliverToBoxAdapter(
            child: _buildAwardPoolTips(),
          ),
        ),
        SliverToBoxAdapter(
          child: _buildAwardPool(),
        )
      ],
    );
  }

  Widget _buildAwardPoolTips() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            const Spacer(),
            Container(
              width: 32,
              height: 4,
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  const Color(0xFFFDA252).withOpacity(0),
                  const Color(0xFFFFCF8A),
                ]),
              ),
            ),
            const SizedBox(width: 4),
            Text(
              K.vip_box_award_pool([(_selectedCard!.cardName)]),
              style: const TextStyle(color: Color(0xFF313131), fontSize: 16, fontWeight: FontWeight.w600),
            ),
            const SizedBox(width: 4),
            Container(
              width: 32,
              height: 4,
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  const Color(0xFFFFCF8A),
                  const Color(0xFFFDA252).withOpacity(0),
                ]),
              ),
            ),
            const Spacer(),
          ],
        ),
        const SizedBox(
          height: 4,
        ),
        Text(
          K.vip_open_box_pool_tips([(_selectedCard!.cardName)]),
          style: TextStyle(color: const Color(0xFF313131).withOpacity(0.6), fontSize: 13),
        )
      ],
    );
  }

  Padding _buildBoxTitleTips() {
    return Padding(
      padding: const EdgeInsetsDirectional.only(start: 20, end: 4, top: 20),
      child: Row(
        children: [
          Text(
            K.vip_login_open_box_every_day,
            style: const TextStyle(color: Color(0xFF313131), fontSize: 16, fontWeight: FontWeight.w600),
          ),
          const Spacer(),
          GestureDetector(
            onTap: () {
              WelfareHistoryPage.show(context, _isVip ? WelfareType.Vip : WelfareType.Popularity);
            },
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  K.vip_welfare_go_history,
                  style: TextStyle(color: const Color(0xFF313131).withOpacity(0.4), fontSize: 13),
                ),
                const SizedBox(width: 2),
                R.img('icon_next_fq.svg',
                    width: 16, height: 16, color: const Color(0xFF313131).withOpacity(0.2), package: ComponentManager.MANAGER_BASE_CORE),
                const SizedBox(width: 6),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildBox() {
    double width = Util.width * viewportFraction();
    double height = 0.68 * width;

    return Stack(
      children: [
        SizedBox(
          height: height + 20,
          child: PageView.builder(
            itemBuilder: (context, index) => _buildBoxItem(index, width, height),
            itemCount: _cardData!.list.length,
            controller: _pageController,
            onPageChanged: (int page) {
              _selectedCard = _cardData!.list[page];
              _loadPool(_cardData!.list[page].cardId, showLoading: false);
            },
          ),
        ),
        if (_selectedCard!.beforeUnOpenNum > 0)
          PositionedDirectional(start: -1, top: height / 2 - 16, child: _buildPrevious(_selectedCard!.beforeUnOpenNum)),
        if (_selectedCard!.nextUnOpenNum > 0)
          PositionedDirectional(end: -1, top: height / 2 - 16, child: _buildNext(_selectedCard!.nextUnOpenNum)),
      ],
    );
  }

  Widget _buildPrevious(int beforeCount) {
    return Container(
      height: 32,
      padding: const EdgeInsetsDirectional.only(start: 4, end: 10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white, width: 1),
        borderRadius: const BorderRadiusDirectional.only(topEnd: Radius.circular(16), bottomEnd: Radius.circular(16)),
        gradient: LinearGradient(colors: [const Color(0xFFFF5F7D), const Color(0xFFFF5F7D).withOpacity(0.5)]),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          R.img('level/level_anim_arrow.webp', width: 16, height: 16, package: ComponentManager.MANAGER_VIP),
          const SizedBox(
            width: 4,
          ),
          Text(
            '$beforeCount',
            style: const TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }

  Widget _buildNext(int nextCount) {
    return Container(
      height: 32,
      padding: const EdgeInsetsDirectional.only(start: 10, end: 4),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white, width: 1),
        borderRadius: const BorderRadiusDirectional.only(topStart: Radius.circular(16), bottomStart: Radius.circular(16)),
        gradient: LinearGradient(colors: [const Color(0xFFFF5F7D).withOpacity(0.5), const Color(0xFFFF5F7D)]),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            '$nextCount',
            style: const TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.w600),
          ),
          const SizedBox(width: 4),
          Transform.rotate(
            angle: pi,
            child: R.img('level/level_anim_arrow.webp', width: 16, height: 16, package: ComponentManager.MANAGER_VIP),
          )
        ],
      ),
    );
  }

  Widget _buildBoxItem(int index, double width, double height) {
    CardDetailItem item = _cardData!.list[index];
    double marginStart = 0.016 * Util.width;
    double marginEnd = 0.016 * Util.width;
    if (index == 0) {
      marginStart = 0.0;
    } else if (index == _cardData!.list.length - 1) {
      marginEnd = 0.0;
    }

    return LevelBoxCard(
      initPage: _initPage,
      item: item,
      index: index,
      marginStart: marginStart,
      marginEnd: marginEnd,
      isVip: _isVip,
      width: width,
      height: height,
      currentCardId: _cardData!.info!.cardId,
      refresh: _loadMainData,
      cardData: _cardData!,
      pageValue: _currPageValue,
    );
  }

  Widget _buildAwardPool() {
    if (_poolLoading == true) {
      return const Loading();
    }

    if (_poolErrorMessage != null) {
      return ErrorData(error: _errorMessage, onTap: () => _loadPool(_selectedCard!.cardId));
    }

    if (_awardPoolList.isEmpty) return const SizedBox.shrink();

    List<Widget> children = [];
    for (int i = 0; i < _awardPoolList.length; ++i) {
      children.add(_buildPoolItem(_awardPoolList[i], i));
    }

    return GridView.count(
      key: GlobalKey(),
      padding: EdgeInsetsDirectional.only(start: 20, end: 20, bottom: 10 + Util.iphoneXBottom),
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 3,
      mainAxisSpacing: 12.0,
      crossAxisSpacing: 12.0,
      childAspectRatio: 104 / 128,
      children: children,
    );
  }

  Widget _buildPoolItem(ShopMailCommodity item, int index) {
    return WelfarePondItemWidget(
      key: ValueKey('$index+${item.cid}'),
      data: item,
      onTap: () => _onPoolItemTaped(item, index),
    );
  }

  _onPoolItemTaped(ShopMailCommodity item, int index) async {
    // 点击事件
    WelfareShowPanel.show(context, data: item);
  }

  Widget _buildTips() {
    return Padding(
      padding: const EdgeInsetsDirectional.only(top: 12, bottom: 12.0),
      child: R.img(
        _isVip ? 'level/bg_upgrade_vip.webp' : 'level/bg_upgrade_popularity.webp',
        package: ComponentManager.MANAGER_VIP,
        height: 18,
      ),
    );
  }

  Widget _buildItemList() {
    if (_isVip) {
      if (_vipLevel == null || _vipLevel!.list.isEmpty) return const SizedBox.shrink();
    } else {
      if (_popularityLevel == null || _popularityLevel!.list.isEmpty) {
        return const SizedBox.shrink();
      }
    }

    List<LevelItem> dataList = _isVip ? _vipLevel!.list : _popularityLevel!.list;
    List<Widget> children = [];
    for (int i = 0; i < dataList.length; ++i) {
      children.add(_buildLevelItem(dataList[i], i));
    }

    return Container(
      padding: EdgeInsetsDirectional.only(start: 20.0, end: 20, bottom: 10 + Util.iphoneXBottom),
      child: GridView.count(
        padding: EdgeInsets.zero,
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        crossAxisCount: 3,
        mainAxisSpacing: 0.0,
        crossAxisSpacing: 12.0,
        childAspectRatio: 104 / 154,
        children: children,
      ),
    );
  }

  Widget _buildLevelItem(LevelItem item, int index) {
    return LevelItemWidget(
      item,
      onTap: () => _onLevelItemTaped(item, index),
    );
  }

  _onLevelItemTaped(LevelItem item, int index) {
    LevelDetailSwiper.show(context, _isVip ? _vipLevel!.list : _popularityLevel!.list, initialIndex: index);
  }

  bool get _canSwitchRole => (_isVip ? _vipLevel!.switchInfo?.can : _popularityLevel!.switchInfo?.can) ?? false;

  Widget _buildUserInfo() {
    if (_isMainError || _loading == true) {
      return const SizedBox.shrink();
    }

    String upgradeText = '';
    if (_isVip) {
      upgradeText = K.vip_vip_upgrade_desc(['${_vipLevel!.diff}']);
    } else {
      upgradeText = K.vip_popular_upgrade_desc(['${_popularityLevel!.diff}']);
    }
    var levelVip = _vipLevel?.level ?? 0;
    var popularityLevel = _popularityLevel?.level ?? 0;
    String assetsImg = 'assets/images/icon_v_${getVipLevelIcon(levelVip)}_vip.png';
    if (_isVip) {
      assetsImg = 'assets/images/icon_v_${getVipLevelIcon(levelVip)}_vip.png';
    } else {
      assetsImg = 'assets/images/vip_rq_${getVipRenQiIcon(popularityLevel)}_icon.png';
    }
    Widget iconVip = R.img(assetsImg, package: Assets.package, width: 100, height: 100);
    return Container(
      padding: const EdgeInsetsDirectional.only(start: 20, end: 5),
      height: _topInfoHeight,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    _isVip
                        ? UserVipNewWidget(vip: levelVip)
                        // : UserPopularity(popularityLevel: popularityLevel),
                        : UserVipNewWidget(vip: popularityLevel),
                    if (levelVip > 0 || popularityLevel > 0) const SizedBox(width: 4),
                    if (_canSwitchRole)
                      GestureDetector(
                        onTap: _showSwitchRoleDialog,
                        child: Container(
                          width: 78,
                          height: 20,
                          alignment: AlignmentDirectional.center,
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(colors: [Color(0xFF7184FF), Color(0xFF4433FF)]),
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          child: Text(
                            _isVip ? K.vip_change_to_popularity_role : K.vip_change_to_vip_role,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 11,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ).paddingOnly(top: 5),
                    const Spacer(),
                  ],
                ),
                const SizedBox(height: 3),
                Text(
                  _percentText,
                  style: const TextStyle(color: Color(0xFFEDFF64), fontSize: 13, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 3),
                _buildIndicator(),
                const SizedBox(height: 3),
                Text(
                  upgradeText,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 11, color: Colors.white.withOpacity(0.7)),
                )
              ],
            ),
          ),
          iconVip
        ],
      ),
    );
  }

  /// 显示切换角色弹框
  void _showSwitchRoleDialog() async {
    var info = _isVip ? _vipLevel!.switchInfo : _popularityLevel!.switchInfo;
    bool? confirm = await LevelTipDialog.show(
      context: context,
      price: info!.price,
      title: info.title ?? '',
      content: info.content ?? '',
      tip: info.tip,
    );
    if (confirm == true) {
      IPayManager payManager0 = ComponentManager.instance.getManager(ComponentManager.MANAGER_PAY);
      SheetCallback? result = await payManager0.showRechargeSheet(context, info.price);
      if (result == null || result.reason == SheetCloseReason.Active || result.value?.key == IPayManager.pTRecharge) {
        return;
      }

      IPayManager payManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_PAY);
      payManager.pay(
        context,
        key: 'switch_vip_popular',
        type: result.value?.key ?? '',
        refer: 'switch_vip_popular',
        args: {
          'money': info.price,
          'type': 'slp-consume',
          'params': {
            'consume_type': 'switch_vip_popular',
            'switch_type': _isVip ? 2 : 1,
          }
        },
        showLoading: false,
        onPayed: () {
          _isVip = !_isVip;
          _loadMainData();
          eventCenter.emit(EventConstant.EventRefreshLevelInfo);
          refresh();
        },
      );
    }
  }

  Widget _buildIndicator() {
    double width = Util.width - 20 - 28 - 64 - 8 - 16;
    double pct = 0.0;
    int diff = 0;
    int current = 0;
    if (_isVip) {
      diff = _vipLevel!.end - _vipLevel!.start;
      current = _vipLevel!.current - _vipLevel!.start;
    } else {
      diff = _popularityLevel!.end - _popularityLevel!.start;
      current = _popularityLevel!.current - _popularityLevel!.start;
    }

    if (diff > 0) {
      pct = current / diff;
      pct = min(1, pct);
      _percentText = '$current/$diff';
    }

    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: 8,
          width: width,
          decoration: BoxDecoration(
            color: const Color(0xFF37373C),
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        Container(
          height: 8,
          width: width * pct,
          decoration: BoxDecoration(
            gradient: const LinearGradient(colors: [Color(0xFF6B6BFF), Color(0xFF69BBFF)]),
            borderRadius: BorderRadius.circular(4),
          ),
        ),
      ],
    );
  }

  void showGuide() {
    bool show = false;
    if (_isVip) {
      show = _vipLevel != null && _vipLevel!.level == 0 && Config.getInt(VipPopularityGuidePage.KEY_VIP_GUIDE, 0) == 0;
    } else {
      show = _popularityLevel != null && _popularityLevel!.level == 0 && Config.getInt(VipPopularityGuidePage.KEY_POPULAR_GUIDE, 0) == 0;
    }
    if (show) {
      VipPopularityGuidePage.show(context, _isVip);
    }
  }

  void showUpgradeDialog() {
    if (_cardData != null && _cardData!.info != null) {
      UpgradeCard? upgradeCard = _cardData!.info!.upgradeCard;
      if (upgradeCard != null && (!Util.isCollectionEmpty(upgradeCard.receive) || !Util.isCollectionEmpty(upgradeCard.unOpen))) {
        LevelUpgradeDialog.showLevelUpgradeDialog(context,
            upgradeCard: upgradeCard, isVip: _isVip, level: _isVip ? _vipLevel!.level : _popularityLevel!.level);
      }
    }
  }
}
