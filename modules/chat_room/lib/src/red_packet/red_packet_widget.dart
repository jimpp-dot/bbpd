import 'package:shared/shared.dart' hide MessageContent, MessageType;
import 'package:chat_room/src/red_packet/packet_config.dart';
import 'package:flutter/material.dart';
import 'package:chat_room/k.dart';
import '../../assets.dart';
import '../../chat_room.dart';
import 'dialog_missed.dart';
import 'dialog_result.dart';
import 'dialog_rules.dart';

enum RedPacketState {
  /// 房间红包状态：没有红包活动/倒计时/特权抢红包/有资格立即抢
  NoPacket,
  CountDown,
  GrabPrivilege,
  GrabNow,
}

typedef OnRedPacketStateChange = void Function(
    ChatRoomData room, RedPacketState state, int duration);

/// 房间红包入口
class RedPacketWidget extends StatefulWidget {
  final ChatRoomData room;
  final ChangeNotifier? timerNotifier;

  const RedPacketWidget({super.key, required this.room, this.timerNotifier});

  @override
  _RedPacketWidgetState createState() => _RedPacketWidgetState();
}

class _RedPacketWidgetState extends State<RedPacketWidget> {
  static const String _tag = "RedPacketWidgetState";
  final Throttle _grabAction = Throttle(duration: const Duration(seconds: 2));

  PacketConfig get _redPacketConfig => widget.room.redPacketConfig!;

  RedPacketState? get _state => _redPacketConfig.state;

  @override
  void initState() {
    super.initState();
    Log.d(tag: _tag, "initState,$_state");
    widget.timerNotifier?.addListener(_onTick);
  }

  @override
  void dispose() {
    widget.timerNotifier?.removeListener(_onTick);
    _grabAction.dispose();
    Log.d(tag: _tag, "dispose");
    super.dispose();
  }

  void _onTick() {
    // 倒计时状态时,才需要响应该回调
    if (_redPacketConfig.state != RedPacketState.CountDown) return;
    if (_redPacketConfig.countTime < 0) {
      _redPacketConfig.state = RedPacketState.GrabNow;
    }
    refresh();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async => _grabAction.call(_onTap),
      child: SizedBox(
        width: 60,
        height: 84,
        child: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: <Widget>[
            R.img(
              RoomAssets.chat_room$red_packet_ic_entrance_bg_webp,
              width: 60,
              height: 84,
              package: ComponentManager.MANAGER_BASE_ROOM,
            ),
            _buildDetail(),
          ],
        ),
      ),
    );
  }

  void _onTap() async {
    if (_state == RedPacketState.CountDown) {
      RulesDialog.show(context, _redPacketConfig.money, _redPacketConfig.stay,
          Session.vipNew >= 2 ? false : true);
    } else if (_state == RedPacketState.GrabNow ||
        _state == RedPacketState.GrabPrivilege) {
      // 抢红包，并弹窗提示结果，重新倒计时
      XhrResponse response = await Xhr.postJson(
          '${System.domain}package/open?rid=${widget.room.rid}&uid=${Session.uid}&packageId=${_redPacketConfig.id}',
          {},
          throwOnError: true);
      Map res = response.value();
      if (res['success'] == true) {
        if (res['money'] != null) {
          Log.d(tag: _tag, "congratulations got ${res['money']}");
          int money = Util.parseInt(res['money']);
          int sec = Util.parseInt(res['sec'], -1);
          _refreshCountTime(sec);
          await ResultDialog.show(context, money);
          Tracker.instance.track(TrackEvent.room_redpacket_get, properties: {
            'rid': widget.room.rid,
            'price': money,
          });
        } else {
          int code = Util.parseInt(res['code']);
          String? msg = Util.parseStr(res['message']);
          int sec = Util.parseInt(res['sec'], -1);
          Log.d(tag: _tag, "failed ,code: $code,message:$msg , countTime:$sec");
          Tracker.instance.track(TrackEvent.room_redpacket_get, properties: {
            'rid': widget.room.rid,
            'price': 0,
          });

          /// 10001:不在当前房间/手慢了，红包派完了/红包已过期，下次要快哦
          /// 10002:未在红包活动开启之后，在房间内停留超过活动要求时长
          /// 10003:很遗憾，没抢到红包
          if (code == 10003) {
            _refreshCountTime(sec);
            await MissedDialog.show(context, msg: msg);
          } else if (code == 10002) {
            if (msg?.isNotEmpty == true) {
              Fluttertoast.showToast(msg: msg);
              _refreshCountTime(sec);
            }
          } else {
            if (msg?.isNotEmpty == true) {
              Fluttertoast.showToast(msg: msg);
            }
          }
        }
      } else {
        String msg = Util.notNullStr(res['msg']);
        if (!Util.isStringEmpty(msg)) {
          Fluttertoast.showToast(msg: msg);
        }
      }
    }
  }

  void _refreshCountTime(int sec) {
    Log.d(tag: _tag, "_refreshCountTime,state:$_state,sec:$sec");
    if (_state == RedPacketState.GrabPrivilege) {
      _redPacketConfig.usePrivilege();
      _redPacketConfig.state =
          sec > 0 ? RedPacketState.CountDown : RedPacketState.GrabNow;
    } else {
      _redPacketConfig.state = RedPacketState.CountDown;
    }
    _redPacketConfig.countTime =
        sec > 0 ? sec : (_redPacketConfig.stay ?? 0) * 60;
  }

  String get _text {
    switch (_state) {
      case RedPacketState.CountDown:
        return TimeUtil.timerText(_redPacketConfig.countTime);
      case RedPacketState.GrabPrivilege:
        return K.room_red_packet_privilege;
      case RedPacketState.GrabNow:
        return K.room_red_packet_grab;
      default:
        return '';
    }
  }

  Widget _buildDetail() {
    return Container(
      width: 60,
      height: 20,
      alignment: Alignment.center,
      child: NumText(
        _text,
        style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w800,
            color: Color(0xFFFF606A)),
      ),
    );
  }
}
