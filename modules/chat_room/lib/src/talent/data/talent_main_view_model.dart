import 'package:shared/shared.dart';
import 'package:flutter/cupertino.dart';
import 'package:chat_room/src/base/model/roomConstant.dart';
import 'package:chat_room/src/chatRoomData.dart';

import '../talent_constants.dart';
import 'talent_models.dart';
import 'talent_repo.dart';

class TalentMainViewModel extends ChangeNotifier {
  BroadcasterInfoResp? data;
  late ChatRoomData _room;

  /// 间隔时间的配置项
  static int? chatMsgInterVal;

  /// 是否显示+1的星光动画
  bool _showAwardStarAni = false;

  bool get showAwardStarAni => _showAwardStarAni;

  set showAwardStarAni(bool flag) {
    _showAwardStarAni = flag;
    notifyUI();
  }

  initState(ChatRoomData room) {
    _room = room;
    _room.addListener(
        RoomConstant.Event_Room_Content_Programe, _handleContentPrograme);
    _room.addListener(
        RoomConstant.Event_Room_Star_Refresh, _handleStarNumRefresh);
    _room.addListener(RoomConstant.Event_Room_Talent_Star_Get, _handleStarGet);
  }

  void updateRoom(ChatRoomData room) {
    _room = room;
  }

  _handleContentPrograme(String type, dynamic msg) async {
    Log.d(tag: TAG, 'msg---> content programe msg=$msg');
    try {
      if (msg is! Map || data == null) return;
      var success =
          BroadcasterInfo.parseMsg(msg as Map<String, dynamic>, data!);
      if (success != true) return;
      if (data?.broadcasterInfo?.currentAnchor != null &&
          data!.broadcasterInfo!.currentAnchor!.uid > 0) {
        int follow = await BaseRequestManager.queryFollowStatus(
            data!.broadcasterInfo!.currentAnchor!.uid,
            toastError: false);
        data!.broadcasterInfo!.follow = follow;
      }
      notifyUI();
    } catch (e) {
      Log.d(e);
    }
  }

  _handleStarNumRefresh(String type, dynamic msg) {
    Log.d(tag: TAG, 'msg--->2 StarNumRefresh msg=$msg');
    if (msg is Map) {
      int starNum = Util.parseInt(msg['star_num'], 0);
      if (data?.broadcasterInfo != null) {
        data!.broadcasterInfo!.starNum = starNum;
        notifyUI();
      }
    }
  }

  _handleStarGet(String type, dynamic msg) {
    Log.d(tag: TAG, 'msg---> _handleStarGet msg=$msg');
    if (data != null && msg is Map) {
      _showAwardStarAni = true;
      data!.rewardStarTotalTime = Util.parseInt(msg["reward_star_total_time"]);
      data!.rewardStarStayTime = Util.parseInt(msg["reward_star_stay_time"]);
      data!.rewardStarStayFinish =
          Util.parseBool(msg["reward_star_stay_finish"], false);
      data!.rewardStarIcon = Util.notNullStr(msg["reward_star_icon"]);
      data!.refreshUpdateTime();
      notifyUI();
    }
  }

  @override
  void dispose() {
    _showAwardStarAni = false;
    _room.removeListener(
        RoomConstant.Event_Room_Content_Programe, _handleContentPrograme);
    _room.removeListener(
        RoomConstant.Event_Room_Star_Refresh, _handleStarNumRefresh);
    _room.removeListener(
        RoomConstant.Event_Room_Talent_Star_Get, _handleStarGet);
    chatMsgInterVal = null;
    super.dispose();
  }

  notifyUI() {
    notifyListeners();
  }

  void loadBroadcasterInfo({ValueChanged<String>? onLoadCallback}) async {
    DataRsp<BroadcasterInfoResp> resp =
        await TalentRepo.broadcasterInfo(_room.rid);
    if (true == resp.success && !resp.isEmpty) {
      data = resp.data;
      chatMsgInterVal = data!.chatMsgInterval;
      Log.d(tag: TAG, 'load bd info success,notify ui.');
      notifyUI();
    } else {
      if (data == null) {
        onLoadCallback?.call(resp.msg ?? '');
      }
    }
  }
}
