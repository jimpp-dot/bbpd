import 'dart:async';
import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'package:shared/src/pbModel/generated/banban_rank_common.pb.dart';

/// 荣耀榜礼物top3
const String HoursDataRefreshKey = 'HoursDataRefreshKey';
const String ShineDataRefreshKey = 'ShineDataRefreshKey';
const String TicktockKey = 'TicktockKey';

class RankHoursDialogController extends GetxController
    with GetTickerProviderStateMixin {
  final int rid;
  late TabController tabController;
  late TabController hoursTabController;
  late Timer timer;
  List<ResGloryHourRoomRank?> hoursDataList = [null, null, null];
  ResGloryHourRoomRank? shinedata;
  String endTimeStr = '';
  String countdownStr = '';

  RankHoursDialogController(this.rid);

  @override
  void onInit() {
    tabController = TabController(length: 2, vsync: this);
    tabController.addListener(refreshTabIndex);
    hoursTabController =
        TabController(length: hoursDataList.length, vsync: this);
    hoursTabController.addListener(refreshSubTabIndex);

    timer = Timer.periodic(const Duration(seconds: 1), _ticktock);

    loadHoursData(0);

    super.onInit();
  }

  @override
  void onClose() {
    timer.cancel();
    tabController.removeListener(refreshTabIndex);
    hoursTabController.removeListener(refreshSubTabIndex);
    super.onClose();
  }

  void _ticktock(Timer tm) {
    ResGloryHourRoomRank? data = hoursDataList.first;
    if (data == null) {
      return;
    }

    DateTime now = DateTime.now();
    DateTime endTime = DateTime.fromMillisecondsSinceEpoch(
        data.data.deadline.toInt() * 1000,
        isUtc: false);
    if (endTime.isBefore(now)) {
      countdownStr = "00:00";
    } else {
      countdownStr =
          DateFormat.ms().format(DateTime(0).add(endTime.difference(now)));
    }
    update([TicktockKey]);
  }

  void loadHoursData(int giftIndex) async {
    if ([0, 1, 2].contains(giftIndex) == false) {
      return;
    }

    ResGloryHourRoomRank? data;
    try {
      XhrResponse response = await Xhr.postPb(
        "${System.domain}go/yy/rank/gloryHour",
        {
          'rid': '$rid',
          'type': '0',
          'index': giftIndex.toString(),
        },
        throwOnError: true,
      );

      data = ResGloryHourRoomRank.fromBuffer(response.bodyBytes);
      if (data.success) {
        DateTime endTime = DateTime.fromMillisecondsSinceEpoch(
            data.data.deadline.toInt() * 1000,
            isUtc: false);
        endTimeStr = DateFormat.Hm().format(endTime);
      }
    } catch (e) {
      data = ResGloryHourRoomRank(success: false, msg: e.toString());
    }

    hoursDataList[giftIndex] = data;

    update([HoursDataRefreshKey]);
  }

  void loadShineData() async {
    try {
      XhrResponse response = await Xhr.postPb(
        "${System.domain}go/yy/rank/gloryHour",
        {'rid': '$rid', 'type': '1'},
        throwOnError: true,
      );
      shinedata = ResGloryHourRoomRank.fromBuffer(response.bodyBytes);
    } catch (e) {
      shinedata = ResGloryHourRoomRank(success: false, msg: e.toString());
    }

    update([ShineDataRefreshKey]);
  }

  void refreshTabIndex() {
    if (tabController.index == 1 && shinedata == null) {
      loadShineData();
    }
  }

  void refreshSubTabIndex() {
    if (hoursDataList[hoursTabController.index] == null) {
      loadHoursData(hoursTabController.index);
    }
    update([HoursDataRefreshKey]);
  }
}
