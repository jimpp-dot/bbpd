import 'dart:convert';

import 'package:chat/k.dart';
import 'package:shared/shared.dart';
import 'package:flutter/material.dart';

class DisplayDefendBreak extends StatefulWidget {
  final MessageContent message;
  final Map extra;

  const DisplayDefendBreak(
      {super.key, required this.message, required this.extra});

  @override
  DisplayDefendBreakState createState() {
    return DisplayDefendBreakState();
  }
}

class DisplayDefendBreakState extends State<DisplayDefendBreak> {
  static const String StateBreakForce = 'break_force'; // 强制解除
  static const String StateBreakApply = 'break_apply'; // 申请解除
  static const String StateBreakAgree = 'break_agree'; // 已同意
  static const String StateBreakReject = 'break_reject'; // 已拒绝
  static const String StateBreakExpire = 'break_expire'; // 已过期

  String? state;
  late bool isSelfSend;

  @override
  void initState() {
    super.initState();
    state = widget.extra['action'];
    isSelfSend = widget.message.messageDirection != 'RECEIVE';
    if (state == StateBreakApply) {
      /// 申请状态下需要查服务器状态
      loadState();
    }
  }

  void loadState() async {
    ///  返回状态：0-初始，1-已同意，2-已拒绝，-1  已过期
    try {
      XhrResponse response = await Xhr.getJson(
        "${System.domain}defend/getRelationOp?msg_id=${widget.extra['msg_id']}",
        throwOnError: true,
      );
      Map map = response.value();
      bool success = map['success'];
      Map data = map['data'];
      if (success == true) {
        int status = Util.parseInt(data['status']);
        bool needResetMessage = false;
        if (status == 1) {
          state = StateBreakAgree;
          needResetMessage = true;
        } else if (status == 2) {
          state = StateBreakReject;
          needResetMessage = true;
        } else if (status == -1) {
          state = StateBreakExpire;
          needResetMessage = true;
        }

        if (needResetMessage) {
          /// 更新Message，下次不再请求接口查状态了
          widget.extra['action'] = state;
          String extra = json.encode(widget.extra);
          Im.setMessageExtraNew(widget.message.messageId, extra);

          if (mounted) {
            setState(() {});
          }
        }
      }
    } catch (e, s) {
      Log.e(e, stackTrace: s);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 224,
      decoration: BoxDecoration(
          color: R.colors.secondBgColor,
          borderRadius: const BorderRadius.all(Radius.circular(16))),
      padding: const EdgeInsetsDirectional.only(start: 12, end: 12, top: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.message.content,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: R.colors.mainTextColor,
            ),
          ),
          const SizedBox(
            height: 4,
          ),
          buildSubTitle(),
          ...buildAction(),
        ],
      ),
    );
  }

  Widget buildSubTitle() {
    String text;
    if (state == StateBreakForce) {
      if (isSelfSend == true) {
        text = K.chat_you_force_break_defend(['${widget.extra['to_name']}']);
      } else {
        text =
            K.chat_friend_force_break_defend(['${widget.extra['from_name']}']);
      }
    } else {
      if (isSelfSend == true) {
        text = K.chat_you_apply_break_defend(['${widget.extra['to_name']}']);
      } else {
        text =
            K.chat_friend_apply_break_defend(['${widget.extra['from_name']}']);
      }
    }

    return Text(
      text,
      style: TextStyle(
        fontSize: 13,
        color: R.colors.thirdTextColor,
      ),
    );
  }

  List<Widget> buildAction() {
    List<Widget> widgets = [];
    if (state == StateBreakForce) {
      widgets.add(const SizedBox(
        height: 17,
      ));
    } else {
      widgets.add(Container(
        width: 200,
        height: 1,
        margin: const EdgeInsetsDirectional.only(top: 11, bottom: 8),
        color: R.colors.mainTextColor.withOpacity(0.1),
      ));

      if (state == StateBreakApply) {
        if (isSelfSend == true) {
          widgets.add(Row(
            children: [
              const Spacer(),
              SizedBox(
                height: 20,
                child: Text(
                  K.personal_defend_wait_friend_agree,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: R.colors.thirdTextColor,
                  ),
                ),
              ),
              const Spacer(),
            ],
          ));
        } else {
          widgets.add(Row(
            children: [
              const Spacer(),
              GestureDetector(
                onTap: () async {
                  /// 拒绝
                  _action(agree: false);
                },
                child: Container(
                  color: Colors.transparent,
                  width: 94,
                  height: 20,
                  alignment: AlignmentDirectional.center,
                  child: Text(
                    K.chat_reject,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: R.colors.secondTextColor,
                      height: 1.1,
                    ),
                  ),
                ),
              ),
              Container(
                width: 1,
                height: 16,
                color: R.colors.mainTextColor.withOpacity(0.1),
                margin: const EdgeInsetsDirectional.only(start: 5, end: 4),
              ),
              GestureDetector(
                onTap: () async {
                  /// 同意
                  _action(agree: true);
                },
                child: Container(
                  color: Colors.transparent,
                  width: 94,
                  height: 20,
                  alignment: AlignmentDirectional.center,
                  child: Text(
                    K.chat_agree,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: R.colors.highlightColor,
                      height: 1.1,
                    ),
                  ),
                ),
              ),
              const Spacer(),
            ],
          ));
        }
      } else if (state == StateBreakAgree) {
        String text = K.chat_has_agreed;
        if (isSelfSend) {
          text = K.chat_adversary + K.chat_has_agreed;
        }
        widgets.add(Row(
          children: [
            const Spacer(),
            SizedBox(
              height: 20,
              child: Text(
                text,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: R.colors.thirdTextColor,
                ),
              ),
            ),
            const Spacer(),
          ],
        ));
      } else if (state == StateBreakReject) {
        String text = K.chat_has_reject;
        if (isSelfSend) {
          text = K.chat_adversary + K.chat_has_reject;
        }
        widgets.add(Row(
          children: [
            const Spacer(),
            SizedBox(
              height: 20,
              child: Text(
                text,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: R.colors.thirdTextColor,
                ),
              ),
            ),
            const Spacer(),
          ],
        ));
      } else if (state == StateBreakExpire) {
        widgets.add(Row(
          children: [
            const Spacer(),
            SizedBox(
              height: 20,
              child: Text(
                K.chat_has_timeout,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: R.colors.thirdTextColor,
                ),
              ),
            ),
            const Spacer(),
          ],
        ));
      }

      widgets.add(const SizedBox(
        height: 8,
      ));
    }

    return widgets;
  }

  bool actioning = false;

  void _action({bool agree = false}) async {
    if (actioning) {
      return;
    }
    actioning = true;
    try {
      XhrResponse response = await Xhr.postJson(
        "${System.domain}${agree ? 'defend/breakAgree' : 'defend/breakReject'}",
        {'msg_id': '${widget.extra['msg_id']}'},
        throwOnError: false,
      );
      Map map = response.value();
      bool success = map['success'];
      if (success == true) {
        state = agree ? StateBreakAgree : StateBreakReject;
        widget.extra['action'] = state;
        String extra = json.encode(widget.extra);
        Im.setMessageExtraNew(widget.message.messageId, extra);

        if (mounted) {
          setState(() {});
        }
      } else if (Util.validStr(map['msg'])) {
        Fluttertoast.showToast(msg: map['msg']);
      }
    } catch (e, s) {
      Log.e(e, stackTrace: s);
    }
    actioning = false;
  }
}
