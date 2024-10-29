import 'package:chat_room/assets.dart';
import 'package:chat_room/k.dart';
import 'dart:math';
import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:chat_room/src/base/page/data/room_detail_data_screen.dart';
import 'package:chat_room/src/base/repo/room_api.dart';
import 'package:chat_room/src/protobuf/generated/room_data.pb.dart';
import 'room_data_overview.dart';

/// 时段数据
enum TimeFrameType {
  Day, // 每一天的标题
  FrameBean, // 每个时段的具体数据
}

class TimeFrameBean {
  final List<TabInfo>? info;
  final TimeFrameType type;
  final int startTime;
  final int endTime;

  /// 由上面的数据转换得到的数据
  String? time;
  String? day;
  bool show = false;

  TimeFrameBean(this.type,
      {this.info,
      this.show = false,
      required this.startTime,
      required this.endTime});
}

class TimeFrameWidget extends StatefulWidget {
  final int rid;

  const TimeFrameWidget(this.rid, {super.key});

  @override
  TimeFrameState createState() => TimeFrameState();
}

class TimeFrameState extends State<TimeFrameWidget> {
  final List<TimeFrameBean> _data = [];
  ResRoomPhaseList? _resRoomPhaseList;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  _loadData() async {
    _resRoomPhaseList = await RoomApi.getRoomAdminPhaseList(widget.rid);
    String? curDay;
    if (Util.validList(_resRoomPhaseList!.data.phaseList)) {
      bool firstShow = true;
      for (var element in _resRoomPhaseList!.data.phaseList) {
        String dayStr = getDay(element.phaseStart);
        if (dayStr != curDay) {
          curDay = dayStr;
          TimeFrameBean dayData = TimeFrameBean(
            TimeFrameType.Day,
            startTime: element.phaseStart,
            endTime: element.phaseEnd,
          );
          dayData.day = curDay;
          _data.add(dayData);
        }
        TimeFrameBean dayData = TimeFrameBean(
          TimeFrameType.FrameBean,
          show: firstShow,
          info: element.currentStatistics,
          startTime: element.phaseStart,
          endTime: element.phaseEnd,
        );
        firstShow = false;
        dayData.time =
            '${Utility.formatDateToHourAndMin(element.phaseStart)}-${Utility.formatDateToHourAndMin(element.phaseEnd)}';
        _data.add(dayData);
      }
    }
    if (mounted) {
      setState(() {});
    }
  }

  /// 仅今天/昨天/前天的数据
  String getDay(int start) {
    DateTime now = DateTime.now();
    DateTime today = DateTime(now.year, now.month, now.day, 24);
    int nowTime = today.millisecondsSinceEpoch.toInt() ~/ 1000;
    int oneDay = 86400;

    int diff = nowTime - start;
    if (diff <= oneDay) {
      return K.room_today;
    } else if (diff <= 2 * oneDay) {
      return K.room_yesterday;
    } else {
      return K.room_before_yesterday;
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_resRoomPhaseList == null) {
      return const Loading();
    }
    if (!_resRoomPhaseList!.success) {
      return ErrorData(
        error: _resRoomPhaseList!.msg,
        onTap: _loadData,
      );
    }

    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        if (index == _data.length) {
          return _buildRuleTips();
        } else {
          TimeFrameBean bean = _data[index];
          if (bean.type == TimeFrameType.FrameBean) {
            return _buildInfo(bean);
          } else {
            return _buildDayTitle(bean.day);
          }
        }
      },
      itemCount: _data.length + 1,
    );
  }

  Widget _buildRuleTips() {
    return Padding(
      padding: const EdgeInsetsDirectional.only(
          top: 16, bottom: 16, start: 19, end: 19),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 1,
              color: R.color.mainTextColor.withOpacity(0.1),
            ),
          ),
          const SizedBox(width: 4),
          Text(
            K.room_time_frame_tips,
            style: TextStyle(
              fontSize: 11,
              color: R.color.thirdTextColor,
            ),
          ),
          const SizedBox(width: 4),
          Expanded(
            child: Container(
              height: 1,
              color: R.color.mainTextColor.withOpacity(0.1),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDayTitle(String? day) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(top: 16),
      child: Text(
        day ?? '',
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: R.color.mainTextColor,
        ),
      ),
    );
  }

  Widget _buildInfo(TimeFrameBean info) {
    Widget child;
    if (info.show == true) {
      child = Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildReceptionInfo(info),
          GestureDetector(
            onTap: () {
              RoomDetailDataScreen.show(
                  System.context, widget.rid, info.startTime, info.endTime);
            },
            child: RoomDataOverview(
              info: info.info ?? [],
            ),
          )
        ],
      );
    } else {
      child = _buildReceptionInfo(info);
    }

    return Container(
      clipBehavior: Clip.antiAlias,
      margin: const EdgeInsetsDirectional.only(top: 8, bottom: 4),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        color: R.color.mainBgColor,
      ),
      child: child,
    );
  }

  Widget _buildReceptionInfo(TimeFrameBean info) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        if (mounted) {
          setState(() {
            info.show = !info.show;
          });
        }
      },
      child: SizedBox(
        width: Util.width - 40,
        height: 52,
        child: Row(
          children: [
            const SizedBox(width: 12),
            R.img(
              RoomAssets.chat_room$ic_clock_svg,
              width: 24,
              height: 24,
              color: R.color.mainTextColor,
            ),
            const SizedBox(width: 4),
            Expanded(
              child: Text(
                info.time ?? '',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: R.color.mainTextColor,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.only(
                  start: 12, end: 12, top: 12, bottom: 12),
              child: Transform.rotate(
                angle: info.show ? 0 : pi,
                child: R.img(
                  RoomAssets.chat_room$ic_drop_up_svg,
                  width: 16,
                  height: 16,
                  color: R.color.thirdTextColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
