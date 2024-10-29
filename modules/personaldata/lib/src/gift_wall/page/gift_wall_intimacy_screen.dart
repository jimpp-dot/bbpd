/*
 *
 *  Created by yao.qi on 2022/9/7 上午11:27
 *  Copyright (c) 2019 - 2022 . All rights reserved.
 *  Last modified 2022/9/7 上午11:22
 *
 */

import 'package:shared/shared.dart';
import 'package:chat_room/chat_room.dart';
import 'package:flutter/material.dart';
import 'package:personaldata/src/gift_wall/model/gift_wall_api.dart';
import 'package:personaldata/src/gift_wall/page/gift_wall_limit_screen.dart';
import 'package:personaldata/src/gift_wall/page/gift_wall_normal_screen.dart';

import '../../../k.dart';
import '../../page/intimacyListScreen.dart';
import '../widget/gift_wall_statistics_widget.dart';

// 礼物墙主页（分三个TAB，普通、图鉴、地图）
class GiftWallIntimacyScreen extends StatefulWidget {
  final int targetUid;
  final VoidCallback? giftCountChange;
  final bool bottomSheet;
  final ChatRoomData? room;

  final int firstIndex;
  final int secondTabId;

  const GiftWallIntimacyScreen(this.targetUid, this.giftCountChange,
      {Key? key,
      this.bottomSheet = false,
      this.room,
      this.firstIndex = 0,
      this.secondTabId = 0})
      : super(key: key);

  @override
  State<GiftWallIntimacyScreen> createState() => _GiftWallIntimacyScreenState();

  // 全屏展示
  static Future show(
      BuildContext context, int targetUid, VoidCallback? giftCountChange,
      {int firstIndex = 0, int secondTabId = 0}) {
    Tracker.instance.track(TrackEvent.view_giftwall, properties: {
      'rid': 0,
      'target_uid': targetUid,
      'room_type': 0,
    });
    return Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => GiftWallIntimacyScreen(
                targetUid, giftCountChange,
                firstIndex: firstIndex, secondTabId: secondTabId)));
  }

  // 非全屏展示
  static Future<int> showBottomSheet(
      BuildContext context, int targetUid, ChatRoomData? room,
      {int firstIndex = 0, int secondTabId = 0}) async {
    Tracker.instance.track(TrackEvent.view_giftwall, properties: {
      'rid': room?.rid ?? 0,
      'target_uid': targetUid,
      'room_type': describeEnum(room?.config?.types),
    });

    return await displayModalBottomSheet(
      context: context,
      maxHeightRatio: 0.75,
      builder: (BuildContext context) {
        return GestureDetector(
          onTap: () {},
          child: ClipRRect(
            borderRadius:
                const BorderRadius.vertical(top: Radius.circular(10.0)),
            child: GiftWallIntimacyScreen(
              targetUid,
              null,
              bottomSheet: true,
              room: room,
              firstIndex: firstIndex,
              secondTabId: secondTabId,
            ),
          ),
        );
      },
    );
  }
}

class _GiftWallIntimacyScreenState extends State<GiftWallIntimacyScreen>
    with
        AutomaticKeepAliveClientMixin,
        TickerProviderStateMixin<GiftWallIntimacyScreen> {
  ScrollController? _scrollController;
  TabController? _tabController;
  final GlobalKey _normalTabKey = GlobalKey();
  bool _loading = true;
  String _errorMsg = '';
  final List<String> _tabList = [
    K.personal_gift_wall_limit_time_tab,
    K.personal_gift_wall_normal_tab_v2,
  ];
  final List<GlobalKey> _pageKeys = [];
  GiftWallStatics? _data;
  int _flag = 0;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _load();
  }

  @override
  void dispose() {
    _scrollController?.dispose();
    super.dispose();
  }

  /// 礼物墙统计
  Future<void> _load() async {
    int version =
        Util.parseInt(Config.get('Gift_Wall_Limit_Page_${Session.uid}'));
    GiftWallStaticsRes rsp = await GiftWallApi.getBBGiftWallListStatisticsResp(
        widget.targetUid, version);
    if (rsp.success == true) {
      _errorMsg = '';
      _data = rsp.data;
      _flag = rsp.flag;
      _initTabController();
    } else {
      _errorMsg = rsp.msg;
    }
    _loading = false;
    if (mounted) {
      setState(() {});
    }
  }

  void _initTabController() {
    safeRun(
      () => _tabController = ExtendedTabController(
        length: _tabList.length,
        initialIndex: widget.firstIndex,
        vsync: this,
      )..addListener(_onTabChanged),
    );
    for (int i = 0; i < _tabList.length; i++) {
      _pageKeys.add(GlobalKey());
    }
  }

  void _onTabChanged() {
    if (_tabController?.indexIsChanging == true) return;
  }

  _giftCountChange() {
    _load();
    if (widget.giftCountChange != null) {
      widget.giftCountChange!();
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: BaseAppBar.custom(
        statusBrightness: darkMode ? Brightness.dark : Brightness.light,
        backgroundColor: Colors.transparent,
        backColor: R.colors.mainTextColor,
        leading: const BackButton(color: Colors.white),
        title: Text(K.gift_wall,
            style: const TextStyle(
                fontSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.w500)),
        actions: <Widget>[
          // if (!widget.bottomSheet)
          //   InkWell(
          //     onTap: () {
          //       IntimacyListScreen.show(context, widget.targetUid);
          //     },
          //     child: Container(
          //       padding: const EdgeInsetsDirectional.only(start: 8, end: 8),
          //       alignment: Alignment.center,
          //       child: R.img('mate/gift_wall/ic_rank.svg',
          //           width: 22,
          //           height: 22,
          //           package: ComponentManager.MANAGER_PERSONALDATA,
          //           color: R.color.mainTextColor),
          //     ),
          //   ),
          InkWell(
            onTap: () {
              BaseWebviewScreen.show(context,
                  url: Util.getHelpUrlWithQStr('k91'));
            },
            child: Container(
              padding: const EdgeInsetsDirectional.only(start: 8, end: 8),
              margin: const EdgeInsetsDirectional.only(end: 8),
              alignment: Alignment.center,
              child: R.img(
                'titlebar/ic_titlebar_question.svg',
                color: R.color.mainTextColor,
                width: 24,
                height: 24,
                package: ComponentManager.MANAGER_BASE_CORE,
              ),
            ),
          ),
        ],
      ),
      body: _buildBody(),
    ).withCommonBg();
  }

  Widget _buildBody() {
    if (_loading) {
      return const Loading();
    }

    if (Util.validStr(_errorMsg)) {
      return ErrorData(
        fontColor: Colors.white,
        onTap: () {
          _errorMsg = '';
          _loading = true;
          setState(() {});
          _load();
        },
      );
    }

    if (_data == null) {
      return const EmptyWidget(
        textColor: Colors.white,
      );
    }

    return CommonNestedScrollView(
        controller: _scrollController,
        headerSliverBuilder: (context, boxIsScrolled) {
          return [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsetsDirectional.only(bottom: 10),
                child: GiftWallStatisticsWidget(
                  data: _data,
                  flag: _flag,
                  hideUser: widget.bottomSheet,
                ),
              ),
            ),
          ];
        },
        // body: Column(
        //   crossAxisAlignment: CrossAxisAlignment.start,
        //   children: <Widget>[
        //     _buildTabBar(),
        //     const SizedBox(height: 10),
        //     Expanded(
        //       child: TabBarView(
        //         controller: _tabController,
        //         children: _buildSubPage(),
        //       ),
        //     ),
        //   ],
        // ),

        body: GiftWallNormalScreen(
          key: _normalTabKey,
          targetUid: widget.targetUid,
          room: widget.room,
          giftCountChange: _giftCountChange,
          scrollController: _scrollController,
          tabId: widget.secondTabId,
        )

        // innerScrollPositionKeyBuilder: () {
        //   var index = "GiftWallTab_";
        //   if (_tabController?.index != null) {
        //     if (_tabController!.index == 1) {
        //       index += _tabController!.index.toString();
        //       int secondIndex = 0;
        //       if (_normalTabKey.currentState != null && _normalTabKey.currentState is GiftWallNormalState) {
        //         secondIndex = (_normalTabKey.currentState as GiftWallNormalState).curIndex;
        //       }
        //       index += secondIndex.toString();
        //     } else {
        //       index += _tabController!.index.toString();
        //     }
        //   }
        //   return Key(index);
        // },
        );
  }

  Widget _buildTabBar() {
    return Container(
      height: 44,
      alignment: AlignmentDirectional.centerStart,
      child: CommonTabBar(
        isScrollable: true,
        controller: _tabController,
        tabs: _tabList.map((e) => Tab(child: Text(e))).toList(),
        labelColor: R.color.mainTextColor,
        unselectedLabelColor: R.color.secondTextColor,
        labelStyle: TextStyle(
            color: R.color.mainTextColor,
            fontSize: 18,
            fontWeight: FontWeight.w500),
        unselectedLabelStyle: TextStyle(
            color: R.color.secondTextColor,
            fontSize: 16,
            fontWeight: FontWeight.w500),
        labelPadding: const EdgeInsets.symmetric(horizontal: 8),
        indicator: CommonUnderlineTabIndicator(
          borderSide: BorderSide(width: 3.0, color: R.color.mainBrandColor),
          wantWidth: 16,
          draggingWidth: 12,
          insets: const EdgeInsetsDirectional.only(bottom: 3),
        ),
        marginStart: 12,
      ),
    );
  }

  List<Widget> _buildSubPage() {
    List<Widget> pages = [
      NestedScrollViewInnerScrollPositionKeyWidget(
        const Key('GiftWallTab_0'),
        GiftWallLimitScreen(
          targetUid: widget.targetUid,
          room: widget.room,
          giftCountChange: _giftCountChange,
        ),
      ),
      GiftWallNormalScreen(
        key: _normalTabKey,
        targetUid: widget.targetUid,
        room: widget.room,
        giftCountChange: _giftCountChange,
        scrollController: _scrollController,
        tabId: widget.secondTabId,
      ),
      /*NestedScrollViewInnerScrollPositionKeyWidget(
        Key('GiftWallTab_2'),
        GiftWallListGraphicScreen(widget.targetUid),
      ),
      if (AppConfig.showTravelGift) NestedScrollViewInnerScrollPositionKeyWidget(
        Key('GiftWallTab_3'),
        GiftWallLoveTravelScreen(widget.targetUid),
      )*/
    ];
    return pages;
  }

  @override
  bool get wantKeepAlive => true;
}
