import 'package:shared/shared.dart';
import 'package:chat_room/k.dart';
import 'package:flutter/material.dart';

typedef TimerCompleteCallback = void Function();

/// 我在这里 麦位提示
///
class UserTip extends StatefulWidget {
  final TimerCompleteCallback? timerCompleteCallback;
  final double height;
  final EdgeInsetsGeometry? margin;

  const UserTip(
      {Key? key, this.height = 24, this.timerCompleteCallback, this.margin})
      : super(key: key);

  @override
  State createState() {
    return UserTipState();
  }
}

class UserTipState extends State<UserTip> {
  int _closeUidTipTimer = 0;

  @override
  void initState() {
    super.initState();
    if (_closeUidTipTimer == 0) {
      _closeUidTipTimer = JsTimer.setTimeout(() {
        if (widget.timerCompleteCallback != null) {
          widget.timerCompleteCallback!();
        }
      }, 5000);
    }
  }

  @override
  void dispose() {
    if (_closeUidTipTimer > 0) JsTimer.clearTimeout(_closeUidTipTimer);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        R.img('uid_tip_cute.webp',
            width: 66, height: 31, package: ComponentManager.MANAGER_BASE_CORE),
        Positioned.fill(
          child: Padding(
            padding: const EdgeInsets.only(top: 4.0),
            child: Text(
              K.room_uid_here,
              style: const TextStyle(
                  fontSize: 12,
                  color: Colors.white,
                  fontWeight: FontWeight.w600),
              textAlign: TextAlign.center,
            ),
          ),
        )
      ],
    );
  }
}
