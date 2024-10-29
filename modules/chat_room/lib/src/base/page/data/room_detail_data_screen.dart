import 'package:chat_room/assets.dart';
import 'package:chat_room/k.dart';
import 'dart:math';

import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:chat_room/src/base/page/data/room_data_overview.dart';
import 'package:chat_room/src/base/page/data/room_data_rank_widget.dart';
import 'package:chat_room/src/base/page/data/room_data_total_screen.dart';
import 'package:chat_room/src/base/page/data/user_property_pie_chart.dart';
import 'package:chat_room/src/base/repo/room_api.dart';
import 'package:chat_room/src/protobuf/generated/room_data.pb.dart';

import 'enter_room_refer_pie_chart.dart';

///时段详情
class RoomDetailDataScreen extends StatefulWidget {
  final int rid;
  final int startTime;
  final int endTime;

  const RoomDetailDataScreen(this.rid, this.startTime, this.endTime,
      {super.key});

  @override
  _RoomDetailDataScreenState createState() => _RoomDetailDataScreenState();

  static show(BuildContext buildContext, int rid, int startTime, int endTime) {
    return Navigator.of(buildContext).push(
      MaterialPageRoute(
        builder: (context) => RoomDetailDataScreen(rid, startTime, endTime),
        settings: const RouteSettings(name: '/RoomDetailDataScreen'),
      ),
    );
  }
}

class _RoomDetailDataScreenState extends State<RoomDetailDataScreen> {
  final GlobalKey<RoomDataRankWidgetState> _rankKey = GlobalKey();
  ResRoomPhaseDetail? _resRoomPhaseDetail;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  @override
  void dispose() {
    super.dispose();
  }

  _loadData() async {
    _resRoomPhaseDetail = await RoomApi.getRoomAdminPhaseDetail(widget.rid,
        start: widget.startTime);
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: R.color.mainBgColor,
      appBar: BaseAppBar(
        K.room_phase_detail_data,
        backgroundColor: R.color.mainBgColor,
        actionTitle: K.room_all_phase,
        actionColor: R.color.mainBrandColor,
        onPressed: () =>
            RoomDataTotalScreen.show(context, widget.rid, index: 1),
      ),
      body: _buildContent(),
    );
  }

  Widget _buildContent() {
    if (_resRoomPhaseDetail == null) {
      return const Loading();
    }
    if (!_resRoomPhaseDetail!.success) {
      return ErrorData(
        error: _resRoomPhaseDetail!.msg,
        onTap: _loadData,
      );
    }
    return Container(
      margin: EdgeInsetsDirectional.only(
          start: 20, end: 20, bottom: max(Util.iphoneXBottom, 20)),
      child: CommonNestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            SliverToBoxAdapter(
              child: _buildTotalWidget(),
            ),
            SliverToBoxAdapter(
              child: Container(
                margin: const EdgeInsetsDirectional.only(bottom: 12),
                child: EnterRoomReferPieChart([
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
                ]),
              ),
            ),
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
          ];
        },
        body: RoomDataRankWidget(
          widget.rid,
          key: _rankKey,
          startTime: widget.startTime,
          showRightAction: true,
        ),
        innerScrollPositionKeyBuilder: _rankKey.currentState == null
            ? null
            : () => _rankKey.currentState!.currentIndexKey(),
        pinnedHeaderSliverHeightBuilder: () => 0,
      ),
    );
  }

  ///总览
  Widget _buildTotalWidget() {
    return Container(
      margin: const EdgeInsetsDirectional.only(top: 8, bottom: 12),
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
                R.img(
                  RoomAssets.chat_room$ic_clock_svg,
                  width: 20,
                  height: 20,
                ),
                const SizedBox(width: 4),
                Text(
                  '${Utility.formatDateToHourAndMin(widget.startTime)}-${Utility.formatDateToHourAndMin(widget.endTime)}',
                  style: R.textStyle.medium16,
                ),
                Expanded(
                  child: Container(),
                ),
                GestureDetector(
                  onTap: () => BaseWebviewScreen.show(context,
                      url: Util.getHelpUrlWithQStr('k60')),
                  child: R.img(
                    RoomAssets.chat_room$ic_help_svg,
                    color: R.color.mainBrandColor,
                    width: 16,
                    height: 16,
                  ),
                )
              ],
            ),
          ),
          RoomDataOverview(
            canSelectItem: false,
            info: _resRoomPhaseDetail!.data.currentStatistics,
          ),
        ],
      ),
    );
  }
}
