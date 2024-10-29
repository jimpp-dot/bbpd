import 'package:chat_room/k.dart';
import 'package:shared/shared.dart';
import 'package:chat_room/assets.dart';
import 'package:chat_room/chat_room.dart';
import 'package:chat_room/src/biz_plugin/grab_hat/grab_hat_operate_dialog.dart';
import 'package:flutter/material.dart';

import 'model/hat_play_data.dart';

class GrabHatProgressWidget extends StatefulWidget {
  final ChatRoomData room;
  final GrabHatPushData data;
  final ValueNotifier<int> timerNotifier;

  const GrabHatProgressWidget({
    super.key,
    required this.room,
    required this.data,
    required this.timerNotifier,
  });

  @override
  State<GrabHatProgressWidget> createState() => _GrabHatProgressWidgetState();
}

class _GrabHatProgressWidgetState extends State<GrabHatProgressWidget> {
  int duration = 0;

  @override
  void initState() {
    super.initState();
    _updateDuration();
    widget.timerNotifier.addListener(_onTick);
  }

  void _updateDuration() {
    duration = widget.data.expire - DateTime.now().secondsSinceEpoch;
  }

  void _onTick() {
    if (--duration < 0) {
      Fluttertoast.showToast(msg: K.room_hat_tip_is_end);
      return;
    }
    refresh();
  }

  @override
  void didUpdateWidget(covariant GrabHatProgressWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.data.expire != widget.data.expire) {
      _updateDuration();
    }
  }

  @override
  void dispose() {
    widget.timerNotifier.removeListener(_onTick);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Tracker.instance.track(TrackEvent.room_grab_hat_float_open);
        GrabHatOperateDialog.show(context, widget.room);
      },
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          R.img(RoomAssets.chat_room$grab_hat_ic_hat_float_bg_webp,
              width: 60, height: 84),
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFFFFF29F), Color(0xFFFF9A2B)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            alignment: AlignmentDirectional.center,
            child: CommonAvatar(
              path: Util.getRemoteImgUrl(widget.data.icon),
              shape: BoxShape.circle,
              size: 36,
              errorWidget: Container(
                width: 36,
                height: 36,
                padding: const EdgeInsetsDirectional.all(8),
                decoration: const BoxDecoration(
                    color: Color(0xFFF995E3), shape: BoxShape.circle),
                child: R.img(
                  RoomAssets.chat_room$grab_hat_ic_hat_mvp_empty_webp,
                  width: 8,
                  height: 12,
                ),
              ),
            ),
          ),
          PositionedDirectional(
            bottom: 0,
            child: Container(
              width: 60,
              height: 20,
              alignment: AlignmentDirectional.center,
              child: NumText(
                TimeUtil.timerText(duration),
                style: const TextStyle(
                    color: Color(0xFFD16800),
                    fontSize: 12,
                    fontWeight: FontWeight.w800),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
