import 'package:shared/shared.dart';
import 'package:chat_room/k.dart';
import 'package:chat_room/chat_room.dart';
import 'package:chat_room/src/base/punish/punish_model.dart';
import '../gpk_constants.dart';
import '../model/gpk_model.dart';
import '../model/gpk_repo.dart';

import 'gpk_select_model.dart';

/// 创建分组PK设置页面的设置项逻辑层
class GPKCreateController {
  static const int _defaultRule = RULE_GIF_VALUE;

  late int _rid;

  int rule = _defaultRule;

  int minute = 1;
  int second = 0;

  int _coinValid = 0;

  bool get coinValid => _coinValid == 1;

  set coinValid(bool valid) => valid ? _coinValid = 1 : _coinValid = 0;

  /// 网络加载初始化UI界面数据
  GPKConfigData? data;

  PunishModel? punishData;

  /// 选人界面Model数据
  GPKSelPosModel gpkSelPosModel = GPKSelPosModel();

  /// 点击规则弹出的规则列表
  List<SheetItem> ruleSheetItem = [
    SheetItem(K.room_gpk_settings_rule_gif, RULE_GIF_VALUE.toString(),
        K.room_gpk_settings_rule_gif_tip),
    SheetItem(K.room_gpk_settings_rule_vote, RULE_VOTE_NUM.toString(),
        K.room_gpk_settings_rule_vote_tip)
  ];

  GPKCreateController(ChatRoomData room) {
    _rid = room.rid;
    refreshRoomData(room);
  }

  /// 更具房间数据变化，刷新麦位顺序，选人界面时刻变化
  void refreshRoomData(ChatRoomData room) {
    _rid = room.rid;
    gpkSelPosModel.refreshList(room);
  }

  /// 选人后对战页面的静态UI展现（包含"+"）
  List<GPKSelPosItem> campList(GPKCamp camp) {
    var list = gpkSelPosModel.getCampPos(camp);
    if (!gpkSelPosModel.isReachMaxCampNum(camp)) {
      list.add(GPKSelPosItem.idle());
    }
    return list;
  }

  List<int> campUids(GPKCamp camp) {
    return gpkSelPosModel.getCampPos(camp).map((e) => e.uid).toList();
  }

  loadData() async {
    GPKConfigResp resp = await GPKRepo.getPkConfig(_rid, Session.uid);
    if (resp.success == true) {
      data = resp.data;
      rule = data!.pkRule;
      _coinValid = data!.coinValid;
      var duration = Duration(seconds: data!.pkTime);
      minute = duration.inMinutes;
      if (minute == 0) {
        second = duration.inSeconds;
      }
      if (data!.punishId > 0 && data!.hasPunishList()) {
        var selItem = data!.punishMap![data!.punishId];
        if (selItem != null) {
          punishData = selItem;
        }
      }
      Log.d(
          'gpk loadData rule=$rule,minute=$minute,second=$second punishSize=${data?.punishMap?.length}');
    }
    return resp;
  }

  /// PK规则选中文案
  String getRuleSelectText() {
    if (rule == RULE_GIF_VALUE) {
      return K.room_gpk_settings_rule_gif;
    } else {
      return K.room_gpk_settings_rule_vote;
    }
  }

  /// 获取规则提示文案
  String getRuleTip() {
    if (rule == RULE_GIF_VALUE) {
      return K.room_gpk_settings_rule_gif_tip;
    } else {
      return K.room_gpk_settings_rule_vote_tip;
    }
  }

  /// 获取分钟区间
  static List<int> getTimerMinuteSection() {
    var retVal = <int>[];
    for (var i = 0, step = 1; i <= 30; i = i + step) {
      retVal.add(i);
      if (i >= 10) {
        step = 5;
      }
    }
    return retVal;
  }

  /// 获取秒钟区间
  static List<int> getTimerSecondSection() {
    var retVal = <int>[];
    for (var i = 0, step = 5; i <= 60; i = i + step) {
      retVal.add(i);
    }
    return retVal;
  }

  /// PK时间选中文案
  String getTimerSelectText() {
    var buffer = StringBuffer();
    if (minute > 0) {
      buffer.write('$minute${K.room_unit_minute}');
    }
    if (second > 0) {
      buffer.write('$second${K.room_unit_second}');
    }
    return buffer.toString();
  }

  void dispose() {
    gpkSelPosModel.dispose();
  }

  Future<bool> commit() async {
    var totalTime = Duration(minutes: minute).inSeconds + second;
    var leftUids = campUids(GPKCamp.camp1);
    var rightUids = campUids(GPKCamp.camp2);

    if (leftUids.isEmpty || rightUids.isEmpty) {
      Fluttertoast.showToast(msg: K.room_gpk_at_least_one);
      return Future.value(false);
    }

    DataRsp resp = await GPKRepo.setPkConfig(
        rid: _rid,
        uid: Session.uid,
        leftUser: leftUids,
        rightUser: rightUids,
        pkRule: rule,
        coinValid: _coinValid,
        pkTime: totalTime,
        punishId: punishData?.id,
        punishName: punishData?.name);

    if (true != resp.success) {
      if (resp.msg != null && resp.msg!.isNotEmpty) {
        Fluttertoast.showToast(msg: resp.msg);
      }
      return Future.value(false);
    } else if (resp.data != null && resp.data.isNotEmpty) {
      Fluttertoast.showToast(msg: resp.data);
    }

    var pkResp = await GPKRepo.startPk(_rid, Session.uid);

    if (true != pkResp.success) {
      if (pkResp.msg != null && pkResp.msg!.isNotEmpty) {
        Fluttertoast.showToast(msg: pkResp.msg);
      }
      return Future.value(false);
    }
    return Future.value(true);
  }
}
