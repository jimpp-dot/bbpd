import 'package:chat/k.dart';
import 'package:shared/shared.dart';
import 'package:chat/src/msg/config.dart';
import 'package:chat/src/msg/pkMsgType.dart';
import 'package:flutter/material.dart';

class PkMsgItem extends StatefulWidget {
  final MessageContent msg;
  final Map extra;
  final MessageDisplayDirection direction;
  final double maxWidth;

  const PkMsgItem(this.msg, this.extra, this.direction, this.maxWidth,
      {super.key});

  @override
  _PkMsgItemState createState() => _PkMsgItemState();
}

class _PkMsgItemState extends State<PkMsgItem> {
  late PkMsgType _pkMsgType;

  @override
  void initState() {
    super.initState();

    String type = widget.extra['type'];
    _pkMsgType = type == 'pk.challenge.request'
        ? PkMsgType.approveChallenge
        : PkMsgType.confirmResult;
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> buttons = _buildButtons();

    return Container(
      width: widget.maxWidth - 0,
      padding: const EdgeInsets.only(left: 3, right: 3),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 44,
            padding: const EdgeInsets.only(bottom: 15),
            alignment: AlignmentDirectional.centerStart,
            child: Row(
              children: <Widget>[
                Image.asset(
                  '',
                  width: 16,
                  height: 16,
                ),
                Container(
                  width: 6,
                ),
                Expanded(
                  child: Text(
                    widget.extra['desc'] ?? '',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: R.colors.mainTextColor,
                      fontFamily: Util.fontFamily,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
          _pkMsgType == PkMsgType.approveChallenge
              ? _buildChallengeContent()
              : _buildApproveContent(),
          Container(
              padding: const EdgeInsets.only(top: 30, bottom: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: buttons,
              )),
        ],
      ),
    );
  }

  Column _buildChallengeContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          K.i_have_challengeable,
          style: TextStyle(
            fontSize: 14,
            color: R.colors.secondTextColor,
          ),
        ),
        Container(
          height: 10,
        ),
        Row(
          children: <Widget>[
            Text(K.chat_total_revenue,
                style: TextStyle(
                  fontSize: 14,
                  color: R.colors.secondTextColor,
                )),
            NumText(
              '${(widget.extra['win_money'] ~/ 100)}',
              style: TextStyle(
                fontSize: 12.0,
                color: R.colors.mainBrandColor,
                fontWeight: FontWeight.w500,
              ),
            ),
            Container(
              width: 4,
            ),
            Image.asset(
              '',
              width: 16,
              height: 16,
            ),
            Container(
              width: 10,
            ),
            Text(
              K.rate_of_disputes,
              style: TextStyle(
                fontSize: 14,
                color: R.colors.secondTextColor,
              ),
            ),
            NumText(
              '${widget.extra['dispute_percent']}%',
              style: TextStyle(
                fontSize: 12.0,
                color: R.colors.mainBrandColor,
                fontWeight: FontWeight.w600,
              ),
            )
          ],
        ),
      ],
    );
  }

  String _getResultStr(int result) {
    switch (result) {
      case 1:
        return K.pk_i_win;
      case 2:
        return K.pk_draw;
    }
    return '';
  }

  Column _buildApproveContent() {
    return Column(
      children: <Widget>[
        Text(
          K.pk_i_selected +
              _getResultStr(Util.parseInt(widget.extra['result'])) +
              K.are_you_accept_result,
          style: TextStyle(
            fontSize: 14,
            color: R.colors.secondTextColor,
          ),
        ),
      ],
    );
  }

  List<Widget> _buildButtons() {
    List<Widget> buttons = [];
    String buttonLeftText =
        _pkMsgType == PkMsgType.approveChallenge ? K.chat_confirm : K.pk_accept;
    String buttonRightText = _pkMsgType == PkMsgType.approveChallenge
        ? K.chat_reject
        : K.pk_not_accept;

    TextButton leftButton = TextButton(
      onPressed: _onButtonLeft,
      child: Text(
        buttonLeftText,
        style: TextStyle(
          fontSize: 14,
          color: R.colors.mainTextColor,
          fontFamily: Util.fontFamily,
        ).copyWith(fontSize: 12),
      ),
    );
    Widget left = Container(
      height: 28,
      width: 70,
      decoration: BoxDecoration(
          color: R.colors.mainBrandColor,
          borderRadius: const BorderRadius.all(Radius.circular(25))),
      child: leftButton,
    );

    TextButton rightButton = TextButton(
      onPressed: _onButtonRight,
      child: Text(
        buttonRightText,
        style: TextStyle(
          fontSize: 12,
          color: R.colors.mainTextColor,
        ),
      ),
    );
    Widget right = Container(
      height: 28,
      width: 70,
      decoration: BoxDecoration(
          color: R.colors.secondBgColor,
          borderRadius: const BorderRadius.all(Radius.circular(25))),
      child: rightButton,
    );

    buttons.add(left);
    buttons.add(Container(width: 10));
    buttons.add(right);

    return buttons;
  }

  void _onButtonLeft() async {
    // String uid = Session.uid.toString();
    // String challengerId = widget.extra['challenge_uid'].toString();
    // String pkId = widget.extra['pk_id'].toString();
    // String result = widget.extra['result'];
    //暂时不管，后续冲鸭移植过来再处理
//    ChatBase.instance().pkButtonLeft(context, uid, challengerId, pkId, _pkMsgType, result);
  }

  void _onButtonRight() async {
    // String uid = Session.uid.toString();
    // String challengerId = widget.extra['challenge_uid'].toString();
    // String pkId = widget.extra['pk_id'];
    // String result = widget.extra['result'];
    //暂时不管，后续冲鸭移植过来再处理
//    ChatBase.instance().pkButtonRight(context, uid, challengerId, pkId, _pkMsgType, result);
  }
}
