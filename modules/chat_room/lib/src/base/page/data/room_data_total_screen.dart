import 'package:chat_room/assets.dart';
import 'package:chat_room/k.dart';
import 'dart:math';

import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:chat_room/src/base/page/data/reception_data_widget.dart';
import 'package:chat_room/src/base/page/data/room_data_overview.dart';
import 'package:chat_room/src/base/page/data/room_data_rank_widget.dart';
import 'package:chat_room/src/base/page/data/time_select_sheet.dart';
import 'package:chat_room/src/base/page/data/user_property_pie_chart.dart';
import 'package:chat_room/src/base/repo/room_api.dart';
import 'package:chat_room/src/protobuf/generated/room_data.pb.dart';

import 'enter_room_refer_pie_chart.dart';
import 'time_frame_widget.dart';

///房间管理数据总览
class RoomDataTotalScreen extends StatefulWidget {
  final int initialIndex;
  final int rid;
  final int initialTimeIndex;

  const RoomDataTotalScreen(this.rid,
      {super.key, this.initialIndex = 0, this.initialTimeIndex = 2});

  @override
  _RoomDataTotalScreenState createState() => _RoomDataTotalScreenState();

  static show(BuildContext buildContext, int rid,
      {int index = 0, int timeIndex = 2}) {
    return Navigator.of(buildContext).push(
      MaterialPageRoute(
        builder: (context) => RoomDataTotalScreen(
          rid,
          initialIndex: index,
          initialTimeIndex: timeIndex,
        ),
        settings: const RouteSettings(name: '/RoomDataTotalScreen'),
      ),
    );
  }
}

class _RoomDataTotalScreenState extends State<RoomDataTotalScreen>
    with TickerProviderStateMixin {
  final List<String> _titles = [K.room_data_total, K.room_phase_data];
  late final ExtendedTabController _tabController;
  final GlobalKey<RoomDataRankWidgetState> _rankKey = GlobalKey();
  final GlobalKey<RoomDataRankWidgetState> _rankKey2 = GlobalKey();
  ResRoomPhaseDetail? _resRoomPhaseDetail;
  int timeIndex = 2;
  List<TabInfo>? _tabInfoList;
  TabInfo? _selectTabInfo; //index 1:进房人数 2:付费人数 3:新付费人数 4:房间流水 5：开播时间 6：新增粉丝人数

  @override
  void initState() {
    super.initState();
    timeIndex = widget.initialTimeIndex;
    _tabController = ExtendedTabController(
      length: _titles.length,
      vsync: this,
      initialIndex: min(widget.initialIndex, _titles.length - 1),
    );
    _loadData();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  _loadData() async {
    _resRoomPhaseDetail = await RoomApi.getRoomAdminPhaseDetail(
      widget.rid,
      date: _paramWithIndex(0),
      recent: _paramWithIndex(1),
    );
    if (Util.validList(_resRoomPhaseDetail?.data.currentStatistics)) {
      _tabInfoList = _resRoomPhaseDetail?.data.currentStatistics
          .where((e) => e.show)
          .toList();
    }
    if ((_resRoomPhaseDetail?.success ?? false) &&
        _selectTabInfo == null &&
        Util.validList(_tabInfoList)) {
      _selectTabInfo = _tabInfoList?.first;
    }
    if (mounted) {
      setState(() {});
    }
  }

  int _paramWithIndex(int index) {
    //0:一天 1：多天
    DateTime now = DateTime.now();
    if (index == 0) {
      if (timeIndex < 3) {
        int milliseconds =
            now.subtract(Duration(days: 2 - timeIndex)).millisecondsSinceEpoch;
        return (milliseconds / 1000).ceil();
      }
    } else {
      if (timeIndex == 3) {
        return 7;
      } else if (timeIndex == 4) {
        return 14;
      }
    }
    return 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: R.color.mainBgColor,
      appBar: BaseAppBar(
        K.room_room_data,
        backgroundColor: R.color.mainBgColor,
      ),
      body: _buildContent(),
    );
  }

  Widget _buildContent() {
    return Column(
      children: [
        SubTabScrollWidget(
          controller: _tabController,
          tabLabels: _titles,
          selectedBgColor: R.color.mainBgColor,
          allBgColor: const Color(0x1A313131),
          horizonMargin: 20,
        ),
        Expanded(
          child: Container(
            margin: EdgeInsetsDirectional.only(
                start: 20, end: 20, bottom: max(Util.iphoneXBottom, 20)),
            child: NotificationListener<ScrollNotification>(
              onNotification: (ScrollNotification notification) {
                if (notification is ScrollUpdateNotification) {
                  double offset = notification.metrics.pixels;
                  double screenWidth = MediaQuery.of(context).size.width;
                  _tabController.scrollPosition = offset / screenWidth;
                }
                return false;
              },
              child: ExtendedTabBarView(
                controller: _tabController,
                children: [_totalDataPage(), TimeFrameWidget(widget.rid)],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _totalDataPage() {
    if (_resRoomPhaseDetail == null) {
      return const Loading();
    }
    if (!(_resRoomPhaseDetail?.success ?? false) ||
        !Util.validList(_tabInfoList) ||
        _selectTabInfo == null) {
      return ErrorData(
        error: _resRoomPhaseDetail?.msg,
        onTap: _loadData,
      );
    }

    int tabCount = 0;
    GlobalKey<RoomDataRankWidgetState> key = _rankKey;
    if (_selectTabInfo?.intdex == 4) {
      tabCount = 2;
    }
    if (_selectTabInfo?.intdex == 3) {
      tabCount = 1;
      key = _rankKey2;
    }

    if (tabCount == 0) {
      return CustomScrollView(
        slivers: _buildTopWidget(),
      );
    }

    return CommonNestedScrollView(
      headerSliverBuilder: (context, innerBoxIsScrolled) => _buildTopWidget(),
      body: RoomDataRankWidget(
        widget.rid,
        tabCount: tabCount,
        startTime: 0,
        dateTime: _paramWithIndex(0),
        recent: _paramWithIndex(1),
        key: key,
      ),
      innerScrollPositionKeyBuilder: key.currentState == null
          ? null
          : () => key.currentState!.currentIndexKey(),
      pinnedHeaderSliverHeightBuilder: () => 0,
    );
  }

  List<Widget> _buildTopWidget() {
    List<ReceptionDataBean>? receptionBeanList;
    if (_resRoomPhaseDetail?.data.receptionList.isNotEmpty ?? false) {
      receptionBeanList = _resRoomPhaseDetail!.data.receptionList
          .map((e) => ReceptionDataBean(e))
          .toList();
    }
    return [
      SliverToBoxAdapter(
        child: _buildTotalWidget(),
      ),
      SliverToBoxAdapter(
        child: _buildBarChartWidget(),
      ),
      if (_selectTabInfo?.intdex == 1)
        SliverToBoxAdapter(
          child: Container(
            margin: const EdgeInsetsDirectional.only(bottom: 12),
            child: EnterRoomReferPieChart(
              [
                PieChartBean(
                  num: _resRoomPhaseDetail!.data.enterRoomFromSystem,
                  title: K.room_system_recommend,
                  color: R.color.mainBrandColor,
                ),
                PieChartBean(
                  num: _resRoomPhaseDetail!.data.enterRoomFromFriendPlaying,
                  title: K.room_friend_play,
                  color: const Color(0xFF73DEB3),
                ),
                PieChartBean(
                  num: _resRoomPhaseDetail!.data.enterRoomFromOthers,
                  title: K.room_other_refer,
                  color: const Color(0xFF7585A2),
                ),
              ],
            ),
          ),
        ),
      if (_selectTabInfo?.intdex == 1)
        SliverToBoxAdapter(
          child: Container(
            margin: const EdgeInsetsDirectional.only(bottom: 12),
            child: UserPropertyPieChart(
              genderDataList: [
                PieChartBean(
                  num: _resRoomPhaseDetail!.data.enterRoomMale,
                  title: K.room_male,
                  color: R.color.mainBrandColor,
                ),
                PieChartBean(
                  num: _resRoomPhaseDetail!.data.enterRoomFeMale,
                  title: K.room_female,
                  color: const Color(0xFFDE73C8),
                ),
              ],
              newDataList: [
                PieChartBean(
                  num: _resRoomPhaseDetail!.data.enterRoomMengXin,
                  title: K.room_meng_new,
                  color: const Color(0xFF7585A2),
                ),
                PieChartBean(
                  num: _resRoomPhaseDetail!.data.enterRoomNotMengXin,
                  title: K.room_not_meng_new,
                  color: R.color.mainBrandColor,
                ),
              ],
            ),
          ),
        ),
      if (_selectTabInfo?.intdex == 4 && Util.validList(receptionBeanList))
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsetsDirectional.only(bottom: 12),
            child: ReceptionDataWidget(
              data: receptionBeanList!,
            ),
          ),
        ),
    ];
  }

  ///总览
  Widget _buildTotalWidget() {
    return Container(
      margin: const EdgeInsetsDirectional.only(top: 8, bottom: 12),
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12), color: R.color.mainBgColor),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: onTimeSelectClick,
            child: Container(
              height: 36,
              alignment: AlignmentDirectional.centerStart,
              padding: const EdgeInsetsDirectional.only(start: 12, end: 12),
              child: Row(
                children: [
                  Text(
                    TimeSelectSheet.getStringByIndex(timeIndex),
                    style: R.textStyle.medium16
                        .copyWith(color: R.color.mainBrandColor),
                  ),
                  const SizedBox(width: 4),
                  R.img(
                    RoomAssets.chat_room$ic_arrow_down_svg,
                    width: 20,
                    height: 20,
                    color: R.color.mainBrandColor,
                  ),
                  const Spacer(),
                ],
              ),
            ),
          ),
          RoomDataOverview(
            canSelectItem: true,
            info: _tabInfoList!,
            defaultInfo: _selectTabInfo,
            onItemSelect: (item) {
              _selectTabInfo = item;
              if (mounted) {
                setState(() {});
              }
            },
          ),
        ],
      ),
    );
  }

  void onTimeSelectClick() async {
    int? index =
        await TimeSelectSheet.show(context: context, initIndex: timeIndex);
    if (index != null && index != timeIndex) {
      timeIndex = index;
      _loadData();
    }
  }

  ///柱状图
  Widget _buildBarChartWidget() {
    String unit = K.room_person;
    if (_selectTabInfo?.intdex == 4) {
      unit = K.room_pay_unit;
    } else if (_selectTabInfo?.intdex == 5) {
      unit = K.room_hour;
    }
    List<LastSevenDaysDataInfo>? dataInfo;
    for (var element in _tabInfoList!) {
      if (_selectTabInfo?.intdex == element.intdex) {
        dataInfo = element.sevenDaysInfo;
      }
    }

    if (!Util.validList(dataInfo)) {
      return const SizedBox.shrink();
    }
    List<BarChartBean> beanList;
    if (_selectTabInfo?.intdex == 5) {
      beanList = dataInfo
              ?.map(
                (e) => DoubleBarChartBean(
                  time: Utility.formatDateMonthDay(e.dateTime),
                  num: Util.parseDouble((e.num / 3600).toStringAsFixed(1)),
                ),
              )
              .toList() ??
          [];
    } else {
      beanList = dataInfo
              ?.map(
                (e) => IntBarChartBean(
                  time: Utility.formatDateMonthDay(e.dateTime),
                  num: e.num,
                ),
              )
              .toList() ??
          [];
    }

    return Container(
      margin: const EdgeInsetsDirectional.only(bottom: 12),
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12), color: R.color.mainBgColor),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 36,
            alignment: AlignmentDirectional.centerStart,
            padding: const EdgeInsetsDirectional.only(start: 12, end: 12),
            child: Row(
              children: [
                Text(
                  _selectTabInfo?.name ?? '',
                  style: R.textStyle.medium16,
                ),
                Expanded(child: Container()),
                Text(
                  K.room_unit + unit,
                  style: R.textStyle.medium12
                      .copyWith(color: R.color.thirdTextColor),
                ),
              ],
            ),
          ),
          Container(
            height: 1,
            color: R.color.secondBgColor,
          ),
          Container(
            height: 170,
            margin: const EdgeInsetsDirectional.only(start: 4, end: 4),
            child: BarChartWidget(
              data: beanList,
              selectTime: Utility.formatDateMonthDay(dataInfo!.last.dateTime),
              showNumPerScreen: 7,
            ),
          ),
        ],
      ),
    );
  }
}
