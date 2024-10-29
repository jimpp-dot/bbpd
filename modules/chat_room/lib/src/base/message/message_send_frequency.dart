import 'package:chat_room/k.dart';
import 'dart:async';

import 'package:shared/shared.dart';
import 'package:chat_room/chat_room.dart';

///● 发送消息时间间隔限制
// 	○ 当房间人数大于n个人时，开启时间间隔模式（每1分钟检测1次）
// 	○ 在点击输入消息的按钮时，检测距离上一次发出消息的时间间隔，小于间隔时间时，toast提示“您的发言太快啦，喝口水等一下”
// 	○ 房主及vip大于等于5的玩家，间隔为0秒
// 	○ 在麦上的玩家，发言间隔为2秒
// 	○ 麦下，vip大于1小于5的玩家，间隔为3秒
// 	○ 麦下，非vip用户，发言间隔为5秒
// 	○ 直接点表情时，不拦截，但是在聊天频道里不显示表情消息

abstract class _IMsgSendFrequency {
  /// 设置是否开启频率控制
  enableFrequency(bool frequencyControl);

  reset();

  /// 当前是否处于限制状态
  bool get isRestrict;

  /// 发送表情是否处于限制状态：
  /// 1.如果是麦上用户，表情不受限制(因为其本身不会在公屏展现)
  /// 2.如果是麦下用户，则限制
  bool isEmoteRestrict();

  /// 分角色锚定当前发送时间
  anchorSendTime(ChatRoomData? room);

  /// 提示用户
  toastTip();
}

class MsgSendFrequency implements _IMsgSendFrequency {
  static MsgSendFrequency get instance => _getInstance();

  bool _isRestrict = false;

  static MsgSendFrequency? _instance;

  MsgSendFrequency._();

  bool _enableFrequency = false;

  Timer? _timer;

  factory MsgSendFrequency() => _getInstance();

  static MsgSendFrequency _getInstance() {
    _instance ??= MsgSendFrequency._();
    return _instance!;
  }

  @override
  enableFrequency(bool enableFrequency) {
    Log.d('msg send enableFrequency->$enableFrequency', tag: 'MsgSend');
    _enableFrequency = enableFrequency;
  }

  @override
  reset() {
    _isRestrict = false;
    _enableFrequency = false;
    _timer?.cancel();
    _timer = null;
  }

  @override
  anchorSendTime(ChatRoomData? room) {
    if (_enableFrequency != true || room == null) {
      return;
    }
    var duration = _getRestrictDuration(room);
    if (duration == Duration.zero) return;
    _isRestrict = true;
    _timer = Timer(duration, () {
      _isRestrict = false;
    });
  }

  Duration _getRestrictDuration(ChatRoomData room) {
    if (Session.uid == 0) {
      return const Duration(seconds: 5);
    }
    if (room.createor?.uid == Session.uid) {
      return Duration.zero;
    }
    if (Session.vipNew >= 5 || Session.popularityLevel >= 5) {
      return Duration.zero;
    }
    var onPosition = ChatRoomUtil.isUidOnPosition(Session.uid);
    if (onPosition) {
      return const Duration(seconds: 2);
    }
    if ((Session.vipNew >= 1 && Session.vipNew < 5) ||
        (Session.popularityLevel >= 1 && Session.popularityLevel < 5)) {
      return const Duration(seconds: 3);
    }
    return const Duration(seconds: 5);
  }

  @override
  bool get isRestrict => _isRestrict;

  @override
  bool isEmoteRestrict() {
    var onPosition = ChatRoomUtil.isUidOnPosition(Session.uid);
    if (onPosition == true) {
      return false;
    }
    return isRestrict;
  }

  @override
  toastTip() {
    Fluttertoast.showCenter(msg: K.room_msg_frequency_tip);
  }
}
