import 'package:chat_room/assets.dart';
import 'package:chat_room/k.dart';
import 'dart:math';

import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:chat_room/src/base/page/data/room_data_overview.dart';
import 'package:chat_room/src/base/page/data/room_data_total_screen.dart';
import 'package:chat_room/src/base/page/data/room_detail_data_screen.dart';
import 'package:chat_room/src/base/repo/room_api.dart';
import 'package:chat_room/src/protobuf/generated/room_data.pb.dart';

///房间管理数据首页
class RoomAdminDataPage extends StatefulWidget {
  final int uid;
  final int rid;

  const RoomAdminDataPage(this.uid, this.rid, {super.key});

  @override
  _RoomAdminDataPageState createState() => _RoomAdminDataPageState();
}

class _RoomAdminDataPageState extends State<RoomAdminDataPage>
    with TickerProviderStateMixin {
  ExtendedTabController? _tabController;
  late List<String> _titles;
  late List<Widget> _tabsWidget;

  ExtendedTabController? _rankTabController;
  List<Widget>? _rankTabsWidget;
  ResRoomData? _resRoomData;

  bool _disposed = false;

  @override
  void initState() {
    super.initState();
    _disposed = false;
    _titles = [K.room_current_phase, K.room_today, K.room_near_seven_day];
    _tabsWidget = _titles.map((item) => Tab(child: Text(item))).toList();
    safeRun(
      () => _tabController = ExtendedTabController(
          initialIndex: 0, length: _tabsWidget.length, vsync: this),
    );
    _loadData();
  }

  @override
  void dispose() {
    _disposed = true;
    _tabController?.dispose();
    _rankTabController?.removeListener(_rankOnTabChanged);
    _rankTabController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsetsDirectional.only(
          start: 20, end: 20, top: 12, bottom: max(Util.iphoneXBottom, 20)),
      color: R.color.secondBgColor,
      child: _buildContentWidget(),
    );
  }

  _loadData() async {
    _resRoomData = await RoomApi.getRoomAdminData(widget.uid, widget.rid);

    if (_disposed) return;

    if (mounted) {
      if (_resRoomData!.success) {
        _rankTabsWidget = _resRoomData!.data.rankTab.map((item) {
          return Tab(child: Text(item.title));
        }).toList();
        safeRun(
          () => _rankTabController = ExtendedTabController(
              initialIndex: 0, length: _rankTabsWidget!.length, vsync: this)
            ..addListener(_rankOnTabChanged),
        );
      }
      setState(() {});
    }
  }

  _buildContentWidget() {
    if (_resRoomData == null) {
      return const Loading();
    }
    if (!_resRoomData!.success) {
      return ErrorData(
        error: _resRoomData!.msg,
        onTap: _loadData,
      );
    }

    if (_resRoomData!.data.state == 0) {
      return _buildEnableWidget();
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildTopWidget(),
        const SizedBox(height: 20),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              K.room_phase_rank,
              style: R.textStyle.medium16,
            ),
            const SizedBox(width: 4),
            Text(
              '(${Utility.formatDateToHourAndMin(_resRoomData!.data.phaseStart.toInt())}-${Utility.formatDateToHourAndMin(_resRoomData!.data.phaseEnd.toInt())})',
              style: R.textStyle.regular14
                  .copyWith(color: R.color.secondTextColor, fontSize: 13),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Expanded(child: _buildRankWidget())
      ],
    );
  }

  _buildEnableWidget() {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Container(
            color: R.color.mainBgColor,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: 36,
                  padding: const EdgeInsetsDirectional.only(start: 12),
                  alignment: AlignmentDirectional.centerStart,
                  child: Text(
                    K.room_data_page,
                    style: R.textStyle.medium16,
                  ),
                ),
                Container(height: 1, color: R.color.secondBgColor),
                const SizedBox(height: 16),
                Row(
                  children: [
                    _buildEnableItem(0),
                    _buildEnableItem(1),
                    _buildEnableItem(2),
                  ],
                ),
                const SizedBox(height: 23),
                Container(
                  padding: const EdgeInsetsDirectional.only(
                      start: 12, end: 12, top: 8, bottom: 8),
                  decoration: ShapeDecoration(
                    shape: const StadiumBorder(),
                    color: R.color.mainBrandColor.withOpacity(0.08),
                  ),
                  child: Text(
                    _resRoomData!.data.stateDesc,
                    style: R.textStyle.medium12
                        .copyWith(color: R.color.mainBrandColor),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
        const Spacer(),
      ],
    );
  }

  _buildEnableItem(int index) {
    List<String> titles = [
      K.room_data_able1,
      K.room_data_able2,
      K.room_data_able3
    ];
    List<String> icons = [
      RoomAssets.chat_room$ic_room_data1_svg,
      RoomAssets.chat_room$ic_room_data2_svg,
      RoomAssets.chat_room$ic_room_data3_svg,
    ];
    return Expanded(
      flex: 1,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: ShapeDecoration(
              shape: const StadiumBorder(),
              gradient: LinearGradient(colors: R.color.mainBrandGradientColors),
            ),
            child: R.img(icons[index], color: Colors.white),
          ),
          const SizedBox(height: 4),
          Text(
            titles[index],
            style:
                R.textStyle.regular14.copyWith(color: R.color.secondTextColor),
          ),
        ],
      ),
    );
  }

  _buildTopWidget() {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12), color: R.color.mainBgColor),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 36,
            alignment: AlignmentDirectional.centerStart,
            padding: const EdgeInsetsDirectional.only(top: 12, end: 20),
            child: Row(
              children: [
                Expanded(
                  child: CommonTabBar(
                    tabs: _tabsWidget,
                    controller: _tabController,
                    marginStart: 0,
                    indicatorSize: TabBarIndicatorSize.label,
                    isScrollable: true,
                    labelColor: R.color.mainTextColor,
                    unselectedLabelColor: R.color.secondTextColor,
                    labelStyle: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: R.color.mainTextColor,
                    ),
                    unselectedLabelStyle: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: R.color.secondTextColor,
                    ),
                    labelPadding:
                        const EdgeInsetsDirectional.only(start: 10, end: 10),
                    indicator: CommonUnderlineTabIndicator(
                      borderSide:
                          BorderSide(width: 2.0, color: R.color.mainBrandColor),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    if (_tabController?.index == 0) {
                      RoomDetailDataScreen.show(
                        System.context,
                        widget.rid,
                        _resRoomData!.data.phaseStart.toInt(),
                        _resRoomData!.data.phaseEnd.toInt(),
                      );
                    }
                    if (_tabController?.index == 1) {
                      RoomDataTotalScreen.show(context, widget.rid, index: 0);
                    }
                    if (_tabController?.index == 2) {
                      RoomDataTotalScreen.show(context, widget.rid,
                          index: 0, timeIndex: 3);
                    }
                  },
                  child: Row(
                    children: [
                      Text(
                        K.room_detail_data,
                        style: R.textStyle.medium12.copyWith(
                            color: R.color.mainBrandColor, fontSize: 13),
                      ),
                      R.img(RoomAssets.chat_room$ic_next_small_svg,
                          color: R.color.mainBrandColor, width: 16, height: 16)
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 121,
            child: NotificationListener<ScrollNotification>(
              onNotification: (ScrollNotification notification) {
                if (notification is ScrollUpdateNotification) {
                  double offset = notification.metrics.pixels;
                  double screenWidth = MediaQuery.of(context).size.width;
                  _tabController?.scrollPosition = offset / screenWidth;
                }
                return false;
              },
              child: ExtendedTabBarView(
                controller: _tabController,
                physics: const ClampingScrollPhysics(),
                children: [
                  RoomDataOverview(
                      canSelectItem: false,
                      info: _resRoomData!.data.currentStatistics),
                  RoomDataOverview(
                      canSelectItem: false,
                      info: _resRoomData!.data.todayStatistics),
                  RoomDataOverview(
                      canSelectItem: false,
                      info: _resRoomData!.data.lastSevenDaysStatistics),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  _buildRankWidget() {
    RankTab rankTab =
        _resRoomData!.data.rankTab[_rankTabController?.index ?? 0];
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12), color: R.color.mainBgColor),
      child: Column(
        children: [
          Container(
            height: 36,
            alignment: AlignmentDirectional.centerStart,
            padding: const EdgeInsetsDirectional.only(top: 12, end: 20),
            child: Row(
              children: [
                Expanded(
                  child: CommonTabBar(
                    tabs: _rankTabsWidget!,
                    controller: _rankTabController,
                    marginStart: 0,
                    indicatorSize: TabBarIndicatorSize.label,
                    isScrollable: true,
                    labelColor: R.color.mainTextColor,
                    unselectedLabelColor: R.color.secondTextColor,
                    labelStyle: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: R.color.mainTextColor,
                    ),
                    unselectedLabelStyle: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: R.color.secondTextColor,
                    ),
                    labelPadding:
                        const EdgeInsetsDirectional.only(start: 10, end: 10),
                    indicator: CommonUnderlineTabIndicator(
                      borderSide:
                          BorderSide(width: 2.0, color: R.color.mainBrandColor),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () => BaseWebviewScreen.show(context,
                      url: Util.getHelpUrlWithQStr('k61')),
                  child: R.img(
                    RoomAssets.chat_room$ic_help_svg,
                    color: R.color.mainBrandColor,
                    width: 16,
                    height: 16,
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 32,
            color: const Color(0x1460C8FF),
            alignment: AlignmentDirectional.center,
            child: Text(
              K.room_data_award_tips,
              style: R.textStyle.regular12
                  .copyWith(fontSize: 11, color: R.color.mainBrandColor),
            ),
          ),
          Expanded(
            child: NotificationListener<ScrollNotification>(
              onNotification: (ScrollNotification notification) {
                if (notification is ScrollUpdateNotification) {
                  double offset = notification.metrics.pixels;
                  double screenWidth = MediaQuery.of(context).size.width;
                  _rankTabController?.scrollPosition = offset / screenWidth;
                }
                return false;
              },
              child: ExtendedTabBarView(
                controller: _rankTabController,
                physics: const ClampingScrollPhysics(),
                children: _rankPageWidget(),
              ),
            ),
          ),
          _bottomRankItem(rankTab.myInfo, rankTab.isRoom),
        ],
      ),
    );
  }

  List<Widget> _rankPageWidget() {
    List<Widget> pages = [];
    for (var element in _resRoomData?.data.rankTab ?? []) {
      pages.add(_rankList(element));
    }
    return pages;
  }

  Widget _rankList(RankTab item) {
    return ListView.builder(
      key: PageStorageKey(item.title),
      padding: EdgeInsetsDirectional.zero,
      addAutomaticKeepAlives: false,
      addRepaintBoundaries: false,
      shrinkWrap: false,
      itemCount: item.list.length,
      itemBuilder: (_, index) => _buildItem(item.list[index], item.isRoom),
    );
  }

  Widget _buildItem(RankItem item, bool isRoom) {
    Color color = R.color.thirdTextColor;
    int rank = item.rank;
    String rankStr = '$rank';
    if (rank < 10) {
      rankStr = '0$rankStr';
    }
    if (rank <= 3) {
      color = const Color(0xFFFFD04B);
    }
    return GestureDetector(
      child: SizedBox(
        height: 60,
        child: Row(
          children: [
            Container(
              width: 40,
              alignment: AlignmentDirectional.center,
              child: Text(
                rankStr,
                style: TextStyle(
                  fontSize: 13,
                  fontFamily: Util.numFontFamily,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w800,
                  color: color,
                ),
              ),
            ),
            CommonAvatar(
              path: item.icon,
              size: 40,
              shape: BoxShape.circle,
            ),
            const SizedBox(width: 4),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Flexible(
                    child: Text(
                      item.name,
                      style: R.textStyle.medium14,
                      maxLines: 1,
                    ),
                  ),
                  if (isRoom) const SizedBox(height: 2),
                  if (isRoom)
                    Flexible(
                      child: Text(
                        K.room_reception_person + item.receptionName,
                        style: R.textStyle.regular12
                            .copyWith(color: R.color.secondTextColor),
                        maxLines: 1,
                      ),
                    ),
                ],
              ),
            ),
            const SizedBox(width: 80),
          ],
        ),
      ),
      onTap: () {
        if (isRoom) {
          IRoomManager roomManager = ComponentManager.instance
              .getManager(ComponentManager.MANAGER_BASE_ROOM);
          roomManager.openChatRoomScreenShow(context, item.rid);
        } else {
          IPersonalDataManager personalDataManager = ComponentManager.instance
              .getManager(ComponentManager.MANAGER_PERSONALDATA);
          personalDataManager.openImageScreen(context, item.uid);
        }
      },
    );
  }

  Widget _bottomRankItem(RankItem item, isRoom) {
    Color color = R.color.thirdTextColor;
    int rank = item.rank;
    String rankStr = '$rank';
    if (rank <= 3) {
      color = const Color(0xFFFFD04B);
    }
    if (rank < 10) {
      rankStr = '0$rankStr';
    }

    if (rank > 10) {
      rankStr = K.room_not_on_list;
    }
    return Container(
      height: 72,
      decoration: BoxDecoration(
        color: R.color.mainBgColor,
        borderRadius: const BorderRadiusDirectional.only(
          bottomStart: Radius.circular(12.0),
          bottomEnd: Radius.circular(12.0),
        ),
        boxShadow: [getCardBoxShadow()],
      ),
      child: Row(
        children: [
          Container(
            width: 40,
            alignment: AlignmentDirectional.center,
            child: Text(
              rankStr,
              style: TextStyle(
                fontSize: rank > 10 ? 11 : 13,
                fontFamily: Util.numFontFamily,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w800,
                color: color,
              ),
            ),
          ),
          CommonAvatar(
            path: item.icon,
            size: 40,
            shape: BoxShape.circle,
          ),
          const SizedBox(width: 4),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(
                  child: Text(
                    item.name,
                    style: R.textStyle.medium14,
                    maxLines: 1,
                  ),
                ),
                if (isRoom) const SizedBox(height: 2),
                if (isRoom)
                  Flexible(
                    child: Text(
                      K.room_reception_person + item.receptionName,
                      style: R.textStyle.regular12
                          .copyWith(color: R.color.secondTextColor),
                      maxLines: 1,
                    ),
                  ),
              ],
            ),
          ),
          const SizedBox(width: 14),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                '${item.num}',
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: Util.numFontFamily,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w800,
                ),
              ),
              if (Util.validStr(item.diff))
                Text(
                  item.diff,
                  style: R.textStyle.regular12
                      .copyWith(color: R.color.secondTextColor),
                ),
            ],
          ),
          const SizedBox(width: 12),
        ],
      ),
    );
  }

  _rankOnTabChanged() {
    if (mounted) {
      setState(() {});
    }
  }
}
