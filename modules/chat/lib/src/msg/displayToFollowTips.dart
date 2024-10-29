import 'package:shared/shared.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../k.dart';

/// 提醒关注的引导条，当对方和用户尚未关注且亲密度有所提升时，才会出现
class DisplayToFollowTips extends StatefulWidget {
  final MessageContent message;
  final int uid;

  const DisplayToFollowTips(
      {Key? key, required this.message, required this.uid})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _DisplayToFollowTipsState();
  }
}

class _DisplayToFollowTipsState extends State<DisplayToFollowTips> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsetsDirectional.only(
            start: 20, end: 20, top: 2, bottom: 16),
        child: Align(
          alignment: Alignment.center,
          child: Text.rich(
            TextSpan(children: <InlineSpan>[
              TextSpan(
                  text: K.chat_msg_follow_tips,
                  style: R.textStyle.body2
                      .copyWith(color: R.colors.thirdTextColor)),
              TextSpan(
                  text: " ",
                  style: R.textStyle.body2
                      .copyWith(color: R.colors.thirdTextColor)),
              TextSpan(
                text: K.chat_follow,
                style: R.textStyle.body1
                    .copyWith(fontSize: 13, color: R.colors.highlightColor),
                recognizer: TapGestureRecognizer()..onTap = _onTap,
              )
            ]),
            textAlign: TextAlign.center,
          ),
        ));
  }

  Future<void> _onTap() async {
    // Log.d("私聊 - ${widget.uid.toString()}");
    NormalNull response =
        await BaseRequestManager.onFollow(widget.uid.toString(), refer: 'chat');
    if (response.success) {
      //TODO 发出通知让外面的卡片更新关注状态
      Fluttertoast.showToast(
          msg: R.string('followed'), gravity: ToastGravity.CENTER);
    } else {
      if (response.msg.isNotEmpty) {
        Fluttertoast.showToast(msg: response.msg, gravity: ToastGravity.CENTER);
      }
    }
  }
}
