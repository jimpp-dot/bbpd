import 'package:shared/shared.dart';
import 'package:chat_room/src/red_packet/red_packet_widget.dart';

import '../../chat_room.dart';

class PacketConfig {
  int? id;
  int? money; //红包总金额
  int? stay; // 房主设置的倒计时时长,单位分钟
  int countTime = -1; //倒计时剩余时长，单位秒
  RedPacketState? state; //红包状态
  bool hasPrivilege = false; //vip1级升级后获得一次抢红包特权，24小时有效
  int? preVipLevel; //进房时的vip等级

  static const String tag = "PacketConfig";

  PacketConfig.fromJson(Map? json) {
    if (json == null) {
      updateState(RedPacketState.NoPacket, from: "init");
      return;
    }
    id = Util.parseInt(json['id'], -1);
    money = Util.parseInt(json['money'], -1);
    stay = Util.parseInt(json['stay'], 1);
    countTime = Util.parseInt(json['package_left_sec'], -1);
    hasPrivilege = Util.parseBool(json['package_privilege'], false);
    preVipLevel = Session.vipNew;
    if (id! < 0 || money! < 0) {
      state = RedPacketState.NoPacket;
    } else if (hasPrivilege) {
      state = RedPacketState.GrabPrivilege;
    } else if (countTime > 0) {
      state = RedPacketState.CountDown;
    } else {
      state = RedPacketState.GrabNow;
    }
    Log.d(
        tag: tag,
        "enter room ,init configs,id:$id,money:$money,stay:$stay,countTime:$countTime,state:$state,hasPrivilege:$hasPrivilege,preVipLevel:$preVipLevel");
  }

  void updateState(RedPacketState packetState, {String? from}) {
    Log.d(
        tag: tag,
        "update packet state:,currState:*** $packetState ***,changeBy:$from");
    state = packetState;
  }

  void updateStayDura(int stayDura, {String? from}) {
    Log.d(
        tag: tag,
        "update packet duration:*** $stayDura minute ***,changeBy:$from");
    stay = stayDura;
  }

  void updateCountTime(int time, {String? from}) {
    Log.d(
        tag: tag,
        "update packet count time:*** $time seconds ***,changeBy:$from");
    countTime = time;
  }

  void countDownTime() {
    countTime--;
  }

  void achievePrivilege() {
    Log.d(tag: tag, "achievePrivilege");
    hasPrivilege = true;
  }

  void usePrivilege() {
    Log.d(tag: tag, "usePrivilege");
    hasPrivilege = false;
  }

  void handleLevelUp(ChatRoomData room, int currLevel) {
    Log.d(tag: tag, "handleLevelUp,preLevel:$preVipLevel,currLevel:$currLevel");
    if (preVipLevel != null && preVipLevel! >= 2) {
      Log.d(tag: tag, "preVipLevel > 2,return ");
      return;
    }
    if (state == null || state == RedPacketState.NoPacket) {
      Log.d(tag: tag, "no packet ,return  ");
      return;
    }
    if (currLevel >= 2) {
      achievePrivilege();
      preVipLevel = currLevel;
      updateState(RedPacketState.GrabPrivilege, from: "msg by level up");
    } else {
      Log.d(tag: tag, "do nothing");
    }
  }
}
