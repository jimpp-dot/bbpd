import 'package:chat_room/k.dart';
import 'package:shared/shared.dart';
import 'package:chat_room/assets.dart';
import 'package:chat_room/chat_room.dart';
import 'package:chat_room/src/live/model/live_pk_one_more_info.dart';
import 'package:flutter/material.dart';

typedef ShowWindowCallback = void Function(bool value);

/// 再来一局
///
class LivePkOneGameAgainPopWindow extends StatefulWidget {
  final ChatRoomData room;
  final LivePKOneMoreInfo? oneGameMore; // 再来一局数据
  final ShowWindowCallback? onShowWindowCallback;

  const LivePkOneGameAgainPopWindow({
    Key? key,
    required this.room,
    this.oneGameMore,
    this.onShowWindowCallback,
  }) : super(key: key);

  @override
  _LivePkOneGameAgainPopWindowState createState() =>
      _LivePkOneGameAgainPopWindowState();
}

class _LivePkOneGameAgainPopWindowState
    extends State<LivePkOneGameAgainPopWindow> {
  final GlobalKey _timerKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    if (widget.oneGameMore == null) return const SizedBox.shrink();

    return Column(
      children: [
        Container(
          padding: const EdgeInsetsDirectional.only(start: 10, end: 10),
          height: 40,
          alignment: AlignmentDirectional.center,
          decoration: const BoxDecoration(
            color: Color(0xB3000000),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child: Row(
            children: [
              CommonAvatar(
                path: widget.room.config?.icon ?? '',
                size: 24,
                shape: BoxShape.circle,
              ),
              _buildTimer(),
            ],
          ),
        ),
        Container(
          transform: Matrix4.rotationX(0.0)..translate(0.0, -4.0, 0.0),
          child: R.img(
            RoomAssets.bomb_poor_fish_drop_down_webp,
            package: ComponentManager.MANAGER_BASE_ROOM,
            width: 12,
            height: 12,
            color: const Color(0xB3000000),
          ),
        ),
      ],
    );
  }

  /// 文案加上倒计时
  Widget _buildTimer() {
    if (widget.oneGameMore?.toUid == Session.uid) {
      return Text(
        K.you_are_invited_to_another_game,
        style: const TextStyle(
            fontSize: 12.0,
            color: Colors.white,
            fontWeight: FontWeight.w600,
            height: 1),
      );
    }

    int diff = 0;
    if (widget.oneGameMore!.expireTime - widget.room.timestamp > 0) {
      diff = widget.oneGameMore!.expireTime - widget.room.timestamp;
    }

    String str = K.live_waiting_for_the_other_party_consent;
    if (diff <= 0 && widget.onShowWindowCallback != null) {
      widget.onShowWindowCallback!(false);
    }
    return TimerWidget(
      key: _timerKey,
      stop: Duration(seconds: diff),
      onTick: () {
        if (diff > 0) {
          diff -= 1;
          if (diff <= 0) {
            if (widget.onShowWindowCallback != null) {
              widget.onShowWindowCallback!(false);
            }
          }
        }
      },
      builder: (context) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              str,
              style: const TextStyle(
                  fontSize: 12.0,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  height: 1),
            ),
            const SizedBox(width: 6),
            Text(
              Util.formatTimeToMinute(diff),
              style: const TextStyle(
                  fontSize: 12.0, color: Colors.white, height: 1),
            )
          ],
        );
      },
    );
  }
}
