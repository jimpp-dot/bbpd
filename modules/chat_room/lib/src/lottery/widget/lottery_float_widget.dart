import 'package:shared/shared.dart';
import 'package:flutter/material.dart' hide DateUtils;
import 'package:chat_room/assets.dart';
import 'package:chat_room/chat_room.dart';
import 'package:chat_room/src/lottery/lottery_manager.dart';
import '../../../k.dart';
import 'lottery_onekey_join_dialog.dart';

/// 公屏抽奖
class LotteryFloatWidget extends StatefulWidget {
  final ChatRoomData room;

  const LotteryFloatWidget({super.key, required this.room});

  @override
  _LotteryFloatWidgetState createState() => _LotteryFloatWidgetState();
}

class _LotteryFloatWidgetState extends State<LotteryFloatWidget> {
  @override
  void initState() {
    super.initState();
    eventCenter.addListener(
        RoomConstant.Event_Room_Lottery_Count_Down, _onCountDown);
  }

  @override
  void dispose() {
    super.dispose();
    eventCenter.removeListener(
        RoomConstant.Event_Room_Lottery_Count_Down, _onCountDown);
  }

  void _onCountDown(String name, dynamic data) {
    if (RoomConstant.Event_Room_Lottery_Count_Down != name) return;
    refresh();
  }

  /// 倒计时时间
  String get _time {
    int remain = LotteryManager.instance.remainTime;
    if (remain <= 0) return K.room_lottery_opening;
    return DateUtils.showMinuteSecond(remain);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        if (!LotteryManager.instance.isLotteryOnGoing(widget.room.rid)) return;
        await LotteryOneKeyJoinDialog.show(context, widget.room);
      },
      child: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          R.img(RoomAssets.chat_room$gb_lottery_float_webp,
              width: 60, height: 84),
          Container(
            width: 60,
            height: 20,
            alignment: AlignmentDirectional.center,
            child: NumText(
              _time,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w800),
            ),
          ),
        ],
      ),
    );
  }
}
