import 'package:chat_room/k.dart';
import 'package:chat_room/src/biz_plugin/vote/show/vote_view_model.dart';
import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart' hide Selector;

/// 投票-倒计时widget
class VoteTimeCountDownWidget extends StatefulWidget {
  final double width;
  final double height;
  final double fontSize;

  const VoteTimeCountDownWidget(
      {super.key,
      required this.width,
      required this.height,
      this.fontSize = 15});

  @override
  _VoteTimeCountDownWidgetState createState() =>
      _VoteTimeCountDownWidgetState();
}

class _VoteTimeCountDownWidgetState extends State<VoteTimeCountDownWidget> {
  @override
  Widget build(BuildContext context) {
    int remainTime =
        context.select((VoteViewModel value) => value.remainTime) ?? 0;
    String desc;
    if (remainTime <= 0) {
      desc = K.room_has_end;
    } else {
      String time = Util.formatTimeToMinute(remainTime);
      desc = '${K.vote} $time';
    }
    return Container(
      width: widget.width,
      height: widget.height,
      alignment: AlignmentDirectional.center,
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: R.color.mainBrandGradientColors),
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(20.dp)),
      ),
      child: Text(
        desc,
        style: TextStyle(
            color: Colors.white,
            fontSize: widget.fontSize,
            fontWeight: FontWeight.w500),
      ),
    );
  }
}
