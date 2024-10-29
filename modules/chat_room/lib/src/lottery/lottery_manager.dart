import 'dart:async';
import 'dart:math';
import 'package:shared/shared.dart';
import 'package:flutter/material.dart' hide DateUtils;
import 'package:chat_room/src/lottery/widget/lottery_congratulations_dialog.dart';
import 'package:chat_room/src/lottery/widget/lottery_onekey_join_dialog.dart';
import 'package:chat_room/src/lottery/widget/lottery_winning_result_dialog.dart';
import '../../chat_room.dart';
import 'lottery_repository.dart';
import 'model/lottery_model.dart';
import '../base/config.dart' as Config;

/// 房间抽奖业务
class LotteryManager {
  static const bool debug = false;
  static const String tag = 'LotteryManager';

  LotteryManager._();

  static LotteryManager? _instance;

  static LotteryManager _sharedInstance() {
    return _instance ??= LotteryManager._();
  }

  static LotteryManager get instance => _sharedInstance();

  /// 是否应该显示"限时抽奖"悬浮圆框
  bool shouldShowLotteryFloat(int rid) {
    if (debug)
      Log.d(
          '$tag#shouldShowLotteryFloat, _roomId: $_roomId, rid: $rid, lottery: $_lottery');
    return isSameRoom(rid) && (_lottery?.isEnd == false);
  }

  Lottery? _lottery;

  /// 正在开奖房间的ID
  int get _roomId => _lottery?.rid ?? -1;

  /// 抽奖关键字
  String get words => _lottery?.words ?? '';

  /// 抽奖开始
  bool onLotteryStart(Map data) {
    if (debug) Log.d('$tag#onLotteryStart, data: $data');
    LotteryStart start = LotteryStart.fromJson(data);
    if (start.expire) return false;
    _lottery = Lottery(start.rid, start.lotteryId, start.remain, start.words);
    _startLotteryCountDown();
    return true;
  }

  /// 抽奖结束
  void onLotteryEnd(Map data) {
    if (debug)
      Log.d('$tag#onLotteryEnd, doing, data: $data, _lottery: $_lottery');
    LotteryEnd end = LotteryEnd.fromJson(data);
    if (!(_lottery?.isSame(end) ?? false)) return;
    if ((_lottery?.isDrawn ?? false)) {
      /// 结束的时候，已经开过奖，或者当前用户不是中奖者
      _lottery = null;
      _remainTime = 0;
    } else {
      /// 结束的时候，由于网络问题及其他问题，客户端先接收到end事件，然后再接收到draw事件
      _lottery?.end();
    }
    if (debug) Log.d('$tag#onLotteryEnd, done, data: $data');
  }

  /// 倒计时剩余时间
  int _remainTime = 0;

  /// 倒计时剩余时间
  int get remainTime => _remainTime;

  /// 抽奖活动是否正在进行中
  bool isLotteryOnGoing(int roomId) {
    return isSameRoom(roomId) && (_lottery?.isOnGoing ?? false);
  }

  /// 抽奖房间与用户当前所在房间，是不是在同一个房间
  bool isSameRoom(int? roomId) {
    return _roomId == (roomId ?? -2);
  }

  /// 是否为相同的抽奖
  bool isSameLottery(int? lotteryId) {
    return (_lottery?.lotteryId ?? -1) == (lotteryId ?? -2);
  }

  Timer? _timer;

  /// 开始抽奖倒计时
  void _startLotteryCountDown() {
    _endLotteryCountDown();
    if (_lottery == null || (_lottery?.remain ?? 0) <= 0) return;
    _remainTime = _lottery!.remain;
    if (debug) Log.d('$tag, roomId; $_roomId, remainTime: $_remainTime');
    eventCenter.emit(RoomConstant.Event_Room_Lottery_Count_Down);
    _timer = Timer.periodic(
        const Duration(milliseconds: DateUtils.secondInMilliseconds), (timer) {
      _remainTime -= 1;
      eventCenter.emit(RoomConstant.Event_Room_Lottery_Count_Down);
      if (debug) Log.d('$tag, roomId; $_roomId, remainTime: $_remainTime');
      if (_remainTime <= 0) _endLotteryCountDown();
    });
  }

  /// 停止抽奖倒计时
  void _endLotteryCountDown() {
    _remainTime = 0;
    if (_timer == null) return;
    if (_timer!.isActive) _timer!.cancel();
    _timer = null;
  }

  /// 接收到文本信息
  void onReceiveContent(Config.MessageContent? content, int roomId) {
    /// 抽奖活动已结束
    if (!isLotteryOnGoing(roomId)) return;

    /// 当前接收到的信息，不是当前用户发送的
    if ((content?.user?.uid ?? -1) != Session.uid) return;
    _joinLottery(roomId, content?.message);
  }

  /// 参与抽奖
  Future<void> _joinLottery(int roomId, String? words) async {
    if (_lottery?.words.isNotEmpty != true) return;
    if (_lottery!.words != words) return;
    BaseResponse response = await LotteryRepository.joinLottery(roomId);
    if (debug)
      Log.d(
          '$tag#_joinLottery, success: ${response.success}, message: ${response.msg}');
  }

  /// 处理抽奖事件
  bool handleLotteryEvent(State state, String type, dynamic data) {
    bool hit = false;
    switch (type) {
      case RoomConstant.Event_Room_Lottery_Start:
        hit = true;
        _showJoinLotteryDelay(state);
        break;
      case RoomConstant.Event_Room_Lottery_End:
        hit = true;
        break;
      case EventConstant.WebsocketEventMessage:
        hit = _handleSocketEvent(state, data);
        break;
      default:
        hit = false;
        break;
    }
    return hit;
  }

  /// 抽奖开始，弹出一键参与对话框
  void _showJoinLotteryDelay(State state) {
    if (!state.mounted) return;
    final int roomId = ChatRoomData.getInstance()?.rid ?? -1;
    Future.delayed(Duration(milliseconds: Random().nextInt(30) * 100), () {
      if (!state.mounted) return;
      ChatRoomData? room = ChatRoomData.getInstance();
      if (roomId != (room?.rid ?? -2)) return;

      /// 房间切换了
      if (!state.mounted) return;
      LotteryOneKeyJoinDialog.show(state.context, room!);
    });
  }

  /// 处理Socket事件
  bool _handleSocketEvent(State state, dynamic data) {
    if (debug) {
      Log.d(
          '$tag#_handleSocketEvent, doing, lottery.room.id: $_roomId, current.room.id: ${ChatRoomData.getInstance()?.rid}');
    }
    if (!Session.isLogined || data == null) return false;
    Map<String, dynamic> res = data;
    String name = res['name'] ?? '';
    switch (name) {
      case RoomConstant.Event_Room_Lottery_Draw:
        if (debug) {
          Log.d(
              '$tag#Event_Room_Lottery_Draw, doing, lottery.room.id: $_roomId, current.room.id: ${ChatRoomData.getInstance()?.rid}');
        }
        if (!isSameRoom(ChatRoomData.getInstance()?.rid)) return false;
        if (debug) Log.d('$tag#Event_Room_Lottery_Draw, done');
        return _handleLotteryDrawEvent(state, res);
      case RoomConstant.Event_Room_Lottery_Start:
        return _handleLotteryStartEvent(state, res);
      default:
        return false;
    }
  }

  /// 处理进入房间后，Socket下发的，抽奖开始事件
  bool _handleLotteryStartEvent(State state, Map<String, dynamic> res) {
    var data = res['data'];
    return data != null && onLotteryStart(data);
  }

  /// 处理开奖事件
  bool _handleLotteryDrawEvent(State state, Map<String, dynamic> res) {
    var data = res['data'];
    if (data != null) {
      LotteryDraw draw = LotteryDraw.fromJson(data);
      return _onLotteryDraw(state, draw);
    }
    return false;
  }

  /// 处理开奖
  bool _onLotteryDraw(State state, LotteryDraw draw) {
    if (debug) Log.d('$tag#_onLotteryDraw, doing');
    if (!(_lottery?.isSame(draw) ?? false)) return false;
    if (_lottery?.isEnd ?? false) {
      _lottery = null;
    } else {
      _lottery?.draw();
    }
    if (draw.isNormalUser) {
      /// 普通用户
      if (state.mounted) LotteryCongratulationsDialog.show(state.context, draw);
      if (debug) Log.d('$tag#_onLotteryDraw, normal user attach');
      return true;
    }
    if (draw.isCreatorOrReception) {
      /// 房主或接待
      if (state.mounted) LotteryWinningResultDialog.show(state.context, draw);
      if (debug) Log.d('$tag#_onLotteryDraw, creator or reception attach');
      return true;
    }
    return false;
  }

  /// 处理房间在后台情况下，抽奖数据状态
  bool handleLotteryDrawWhenRoomInBackground(dynamic data) {
    Map<String, dynamic> res = data;
    String name = res['name'] ?? '';
    if (name == RoomConstant.Event_Room_Lottery_Draw) {
      var data0 = res['data'];
      if (data0 != null) {
        LotteryDraw draw = LotteryDraw.fromJson(data0);
        if (!(_lottery?.isSame(draw) ?? false)) return false;
        if (_lottery?.isEnd ?? false) {
          _lottery = null;
        } else {
          _lottery?.draw();
        }
      }
      return true;
    }
    return false;
  }

  /// 释放[LotteryManager]持有的所有资源
  void release() {
    if (debug) {
      Log.d(
          '$tag#release, doing, lottery.room.id: $_roomId, current.room.id: ${ChatRoomData.getInstance()?.rid}');
    }
    if (!isSameRoom(ChatRoomData.getInstance()?.rid)) return;
    _endLotteryCountDown();
    _remainTime = 0;
    _lottery = null;
    if (debug) Log.d('$tag#release, done.');
  }
}
