import 'dart:convert';
import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import '../../k.dart';
import '../model/pbModel/generated/fate_tips.pb.dart';

/// 今日缘分
class DisplayFateTips extends StatefulWidget {
  final MessageContent message;
  final bool isLastMsg;
  final String targetUid;

  const DisplayFateTips(
      {Key? key,
      required this.message,
      required this.isLastMsg,
      required this.targetUid})
      : super(key: key);

  @override
  DisplayFateTipsState createState() {
    return DisplayFateTipsState();
  }
}

class DisplayFateTipsState extends State<DisplayFateTips> {
  late bool receive;
  bool hasSendPrologue = false;
  List<FateImContent> contents = [];

  @override
  void initState() {
    super.initState();
    receive = widget.message.messageDirection == 'RECEIVE';
    if (widget.isLastMsg == true && !receive) {
      /// 是最后一个,且是发送方，需要展示开场白提示（法务：不能给GS弹开场白）
      load();
    }
  }

  void load() async {
    try {
      String url = '${System.domain}go/yy/fate/im';
      XhrResponse response =
          await Xhr.post(url, {}, pb: true, throwOnError: true);
      ResFateIm res = ResFateIm.fromBuffer(response.bodyBytes);
      if (res.success == true && Util.validList(res.contents)) {
        if (mounted && widget.isLastMsg == true) {
          setState(() {
            contents = res.contents;
          });
        }
      }
    } catch (e) {
      Log.d('DisplayFateTipsState load, error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.isLastMsg == true &&
        hasSendPrologue == false &&
        Util.validList(contents)) {
      /// 最后一条消息为【今日缘分】，需要加一个开场白引导
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          buildFateMsg(),
          const SizedBox(
            height: 10,
          ),
          buildPrologue(),
        ],
      );
    }
    return buildFateMsg();
  }

  Widget buildFateMsg() {
    String text = widget.message.content;
    if (!receive) {
      /// 自己发送的，需要更换下文案
      text = K.chat_fate_content;
    }
    return Center(
      child: Container(
        margin: const EdgeInsetsDirectional.only(
            top: 4.0, bottom: 4.0, start: 16, end: 16),
        padding: const EdgeInsetsDirectional.only(
            top: 2.0, bottom: 2.0, start: 12.0, end: 12.0),
        decoration: BoxDecoration(
          color: R.colors.secondBgColor,
          borderRadius: const BorderRadius.all(Radius.circular(10.0)),
        ),
        child: Text(
          text,
          maxLines: 10,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(fontSize: 12.0, color: R.colors.thirdTextColor),
        ),
      ),
    );
  }

  Widget buildPrologue() {
    return Container(
      width: Util.width - 32,
      margin:
          const EdgeInsetsDirectional.only(bottom: 14.0, start: 16, end: 16),
      padding: const EdgeInsetsDirectional.only(
          start: 24, end: 24, top: 24, bottom: 24),
      decoration: BoxDecoration(
        borderRadius: BorderRadiusDirectional.circular(16),
        color: R.colors.mainBgColor,
        boxShadow: [
          BoxShadow(
            offset: const Offset(0.0, 4.0),
            blurRadius: 8.0,
            spreadRadius: 4.0,
            color: R.colors.dividerColor.withOpacity(0.05),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            K.chat_fate_prologue,
            style: TextStyle(
              fontSize: 14,
              color: R.colors.thirdTextColor,
              height: 1.1,
            ),
          ),
          const SizedBox(
            height: 18,
          ),
          buildPrologueButton(contents[0].content, contents[0].id),
          if (contents.length > 1) ...[
            const SizedBox(
              height: 12,
            ),
            buildPrologueButton(contents[1].content, contents[1].id),
          ],
        ],
      ),
    );
  }

  Widget buildPrologueButton(String msg, int id) {
    return GestureDetector(
      onTap: () {
        sendMessage(msg);
        choose(id);
        Tracker.instance.track(TrackEvent.prologue_click_entrance);
      },
      behavior: HitTestBehavior.opaque,
      child: Container(
        width: Util.width - 32 - 48,
        height: 52,
        padding: const EdgeInsetsDirectional.only(start: 28, end: 28),
        decoration: BoxDecoration(
          borderRadius: BorderRadiusDirectional.circular(27),
          color: R.colors.secondBgColor,
        ),
        alignment: AlignmentDirectional.center,
        child: Text(
          msg,
          style: TextStyle(
            fontSize: 16,
            color: R.colors.mainTextColor,
            height: 1.1,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }

  void sendMessage(String msg) {
    MessageContent content = MessageContent(MessageType.Text,
        SendUser(Session.uid.toString(), Session.name, Session.icon));
    content.content = msg;
    Map extra = {'type': 'fate_prologue'}; // 加type类型，仅用于数据后台过滤消息用
    content.extra = json.encode(extra);
    Im.sendMessage(ConversationType.Private, widget.targetUid, content);
    if (mounted) {
      setState(() {
        hasSendPrologue = true;
      });
    }
  }

  void choose(int id) async {
    try {
      String url = '${System.domain}go/yy/fate/imChoose';
      await Xhr.post(url, {'id': '$id'}, pb: true, throwOnError: true);
    } catch (e) {
      Log.d('DisplayFateTipsState choose, error: $e');
    }
  }
}
