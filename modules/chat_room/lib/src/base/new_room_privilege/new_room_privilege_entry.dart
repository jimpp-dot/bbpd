import 'package:shared/shared.dart';
import 'package:chat_room/assets.dart';
import 'package:chat_room/chat_room.dart';
import 'package:chat_room/k.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'new_room_interact_privilege_bottom_sheet.dart';

/// 新人房间特权入口

const int _day = 86400;
const int _hour = 3600;
const int _min = 60;

class NewRoomPrivilegeEntry extends StatefulWidget {
  final ChatRoomData room;

  const NewRoomPrivilegeEntry({super.key, required this.room});

  @override
  State<NewRoomPrivilegeEntry> createState() => _NewRoomPrivilegeEntryState();
}

class _NewRoomPrivilegeEntryState extends State<NewRoomPrivilegeEntry> {
  var timeText = '';
  Timer? _timer;
  int _countDown = 0;

  @override
  void initState() {
    super.initState();
    _countDown = widget.room.newRoomPrivilegeDuration;
    timeText = getDateDiff(_countDown, initial: true);
  }

  String getDateDiff(int time, {bool initial = false}) {
    int diff = time;
    if (diff <= 0) {
      return K.room_has_end;
    } else if (diff > _day) {
      int day = diff ~/ _day;
      return K.room_how_many_days(['$day']);
    } else {
      int hour = diff ~/ _hour;
      int min = (diff ~/ _min) - hour * 60;
      String text =
          '${hour < 10 ? '0$hour' : '$hour'}:${min < 10 ? '0$min' : '$min'}';
      if (initial) {
        _startCountDownTask();
      }
      return text;
    }
  }

  /// 开始倒计时任务
  void _startCountDownTask() {
    _cancelTask();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      _countDown -= 1;
      if (_countDown <= 0) {
        _cancelTask();
        // 时间结束
        timeText = K.room_has_end;
      } else {
        // 未结束，则进行倒计时
        timeText = getDateDiff(_countDown);
      }
      refresh();
    });
  }

  void _cancelTask() {
    if (_timer == null) return;
    if (_timer?.isActive == true) _timer?.cancel();
    _timer = null;
  }

  @override
  void dispose() {
    _cancelTask();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () =>
          NewRoomInteractPrivilegeBottomSheet.show(context, room: widget.room),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          R.img(
            RoomAssets
                .chat_room$new_room_privilege_new_room_privilege_entry_webp,
            width: 46,
            height: 47,
          ),
          const SizedBox(height: 2),
          Container(
            height: 14,
            padding: const EdgeInsets.symmetric(horizontal: 5),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7), color: Colors.black38),
            child: Text(
              timeText,
              style: const TextStyle(color: Colors.white, fontSize: 9),
            ),
          ),
        ],
      ),
    );
  }
}
