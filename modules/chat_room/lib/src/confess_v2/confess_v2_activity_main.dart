import 'dart:math' as math;
import 'package:shared/shared.dart';
import 'package:chat_room/assets.dart';
import 'package:chat_room/chat_room.dart';
import 'package:chat_room/src/confess_v2/confess_v2_util.dart';
import 'package:chat_room/src/confess_v2/model/confess_v2_view_model.dart';
import 'package:chat_room/src/confess_v2/widgets/components/confess_v2_gift_fly_widget.dart';
import 'package:chat_room/src/confess_v2/widgets/confess_v2_send_gift_page.dart';
import 'package:flutter/material.dart';
import 'widgets/confess_v2_headline_page.dart';
import 'package:provider/provider.dart' hide Selector;

/// 表白活动v2入口主页面
/// 逻辑：
/// 1、可以被表白的用户只能是当前麦位上的用户，且只能单选。当麦位上的用户下麦后，则该处的用户列表也跟随变动
/// 2、选择对应用户后，下方的可送礼物状态只对应当前麦位用户的，不同麦位用户的可送礼物数据相互独立
class ConfessV2ActivityMain extends StatefulWidget {
  final ChatRoomData room;

  const ConfessV2ActivityMain({super.key, required this.room});

  @override
  _ConfessV2ActivityMainState createState() => _ConfessV2ActivityMainState();
}

class _ConfessV2ActivityMainState extends State<ConfessV2ActivityMain>
    with TickerProviderStateMixin {
  late ConfessV2ViewModel _vindicateModel;

  late List<Widget> _tabPages;
  late ExtendedTabController _tabController;

  @override
  void dispose() {
    _vindicateModel.dispose();
    _tabController.removeListener(_onTabChanged);
    _tabController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    Tracker.instance
        .track(TrackEvent.love_users_enter, properties: {'uid': Session.uid});
    _vindicateModel = ConfessV2ViewModel(0)..init(widget.room);
    _tabPages = [
      const ConfessV2SendGiftPage(),
      const ConfessV2HeadlinePage(),
    ];

    safeRun(() {
      _tabController =
          ExtendedTabController(vsync: this, length: 2, initialIndex: 0);
      _tabController.addListener(_onTabChanged);
    });
  }

  void _onTabChanged() {
    if (_tabController.indexIsChanging) return;
    refresh();
  }

  @override
  Widget build(BuildContext context) {
    double width = Util.width;
    double topBarBgHeight = 65.dp;
    double topBarTopMargin = 10.dp;
    double topBarOverlapBody = 1.dp;
    double bodyBgImgHeight = 540.dp;
    double bodyHeight = bodyBgImgHeight - (Util.isIphoneX ? 0 : 34.dp);
    double totalHeight =
        topBarTopMargin + topBarBgHeight - topBarOverlapBody + bodyHeight;
    ConfessV2Util.widgetHeight = totalHeight;
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: _vindicateModel),
        ChangeNotifierProvider.value(value: _vindicateModel.squareViewModel),
        ChangeNotifierProvider.value(value: _vindicateModel.sendGiftViewModel),
      ],
      builder: (context, child) {
        return SizedBox(
          height: totalHeight,
          child: Stack(
            children: [
              _buildTopBar(width, topBarBgHeight, topBarTopMargin),
              PositionedDirectional(
                top:
                    topBarTopMargin + topBarBgHeight - topBarOverlapBody - 4.dp,
                child: SizedBox(
                    width: width,
                    height: bodyHeight + 4.dp,
                    child: _buildBody(context)),
              ),
              PositionedDirectional(
                start: 0,
                top: 0,
                end: 0,
                bottom: 0,
                child: IgnorePointer(
                  child: ConfessV2GiftFlyWidget(
                    key: _vindicateModel.sendGiftViewModel.giftFlyWidgetKey,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildTopBar(double width, double height, double topMargin) {
    return SizedBox(
      width: width,
      height: height + topMargin,
      child: Stack(
        children: [
          PositionedDirectional(
            top: topMargin,
            child: Transform(
              alignment: Alignment.center,
              transform:
                  Matrix4.rotationY(_tabController.index == 0 ? 0 : math.pi),
              child: R.img(RoomAssets.chat_room$confess_v2_bg_tab_bar_webp,
                  width: width, height: height, fit: BoxFit.fill),
            ),
          ),
          SizedBox(
            height: 54.dp,
            child: CommonTabBar(
              indicatorWeight: 0,
              labelPadding: EdgeInsetsDirectional.zero,
              tabs: [
                R.img(
                  _tabController.index == 0
                      ? RoomAssets.chat_room$confess_v2_tab_travel_sel_png
                      : RoomAssets.chat_room$confess_v2_tab_travel_nor_png,
                  width: width / 2,
                  height: 54.dp,
                  fit: BoxFit.fill,
                ),
                R.img(
                  _tabController.index == 0
                      ? RoomAssets.chat_room$confess_v2_tab_headline_nor_png
                      : RoomAssets.chat_room$confess_v2_tab_headline_sel_png,
                  width: width / 2,
                  height: 54.dp,
                  fit: BoxFit.fill,
                ),
              ],
              controller: _tabController,
              indicatorSize: TabBarIndicatorSize.tab,
              indicator: const BoxDecoration(color: Colors.transparent),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    bool isLoading =
        context.select<ConfessV2ViewModel, bool>((model) => model.isLoading);
    return isLoading
        ? const Center(
            child: Loading(),
          )
        : ExtendedTabBarView(
            controller: _tabController,
            children: _tabPages,
          );
  }
}
