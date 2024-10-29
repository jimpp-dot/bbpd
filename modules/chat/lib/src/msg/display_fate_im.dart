import 'dart:convert';
import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import '../../k.dart';
import '../model/pbModel/generated/fate_tips.pb.dart';

/// 接收者且是最后一个消息为系统代发的开场白消息，需要展示开场白提示
class DisplayFateIm extends StatefulWidget {
  final MessageContent message;
  final double maxWidth;
  final bool isLastMsg;
  final String targetUid;

  const DisplayFateIm({
    Key? key,
    required this.message,
    required this.maxWidth,
    required this.isLastMsg,
    required this.targetUid,
  }) : super(key: key);

  @override
  DisplayFateImState createState() {
    return DisplayFateImState();
  }
}

class DisplayFateImState extends State<DisplayFateIm> {
  bool hasSendPrologue = false;
  List<FateImContent> contents = [];

  @override
  void initState() {
    super.initState();
    if (widget.isLastMsg == true) {
      /// 最后一个，需要展示开场白提示
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
    } catch (e, s) {
      Log.e(e, stackTrace: s);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.isLastMsg == true &&
        hasSendPrologue == false &&
        Util.validList(contents)) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildContent(),
          const SizedBox(
            height: 10,
          ),
          buildPrologue(),
        ],
      );
    }
    return buildContent();
  }

  Widget buildContent() {
    return Container(
      decoration: BoxDecoration(
        color: R.colors.secondBgColor,
        borderRadius: BorderRadiusDirectional.circular(15),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Text(
        widget.message.content,
        maxLines: 100,
        softWrap: true,
        style: R.textStyle.body1
            .copyWith(fontSize: 16, color: R.colors.mainTextColor),
      ),
    );
  }

  Widget buildPrologue() {
    return Container(
      width: widget.maxWidth,
      margin: const EdgeInsetsDirectional.only(bottom: 14.0),
      padding: const EdgeInsetsDirectional.only(
          start: 12, end: 12, top: 24, bottom: 24),
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
              color: R.colors.secondTextColor,
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
        width: widget.maxWidth - 24,
        height: 52,
        padding: const EdgeInsetsDirectional.only(start: 12, end: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadiusDirectional.circular(27),
          color: R.colors.secondBgColor,
        ),
        alignment: AlignmentDirectional.center,
        child: Text(
          msg,
          style: TextStyle(
            fontSize: 15,
            color: R.colors.mainTextColor,
            height: 1.1,
          ),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }

  void sendMessage(String msg) {
    MessageContent content = MessageContent(MessageType.Text,
        SendUser(Session.uid.toString(), Session.name, Session.icon));
    content.content = msg;
    Map extra = {'type': 'fate_prologue'};

    /// 加type类型，仅用于数据后台过滤消息用
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
