import 'dart:convert';

import 'package:shared/assets.dart';
import 'package:flutter/material.dart';
import 'package:shared/shared.dart';

///
/// 客服多轮对话
///
class DisplayServiceMultireply extends StatefulWidget {
  final MessageContent message;
  final Map extra;

  const DisplayServiceMultireply(
      {super.key, required this.message, required this.extra});

  @override
  _DisplayServiceMultireplyState createState() =>
      _DisplayServiceMultireplyState();
}

class _DisplayServiceMultireplyState extends State<DisplayServiceMultireply> {
  _clickAnswer(Map value) async {
    bool isMultiReply = widget.extra['type'] == 'auto-chat-category';

    int id = Util.parseInt(value['id']);
    String? subject = value['subject'];
    if (id <= 0 || subject == null || subject.isEmpty) return;

    // 模拟人为输入
    MessageContent content = MessageContent(
        'text', SendUser(Session.uid.toString(), Session.name, Session.icon));
    content.content = subject;
    content.extra = json.encode({
      'type': 'auto-chat-category-reply',
      'id': id,
      'no_auto_chat': 1, // 不触发自动回复
    });
    await Im.sendMessage(
        ConversationType.Private, widget.message.senderId ?? '', content);

    // 防止后面回复比输入先出来
    await Future.delayed(const Duration(milliseconds: 300));

    Map<String, String> params = {
      'id': id.toString(),
      'service': widget.message.targetId,
    };
    if (isMultiReply &&
        widget.extra['multi_uuid'] != null &&
        !Util.isStringEmpty(widget.extra['multi_uuid'])) {
      params['multi_uuid'] = widget.extra['multi_uuid'];
    }
    try {
      // 多轮对话最后一轮走自动应答逻辑
      await Xhr.postJson(
          System.domain + (isMultiReply ? 'auto/multiReply' : "auto/reply"),
          params,
          throwOnError: false);
    } catch (e) {
      Fluttertoast.showCenter(msg: e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> res = [];
    res.add(
      Padding(
        padding: const EdgeInsets.all(0.0),
        child: Text(
          widget.message.content,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              fontSize: 17.0,
              color: R.colors.mainTextColor,
              fontWeight: FontWeight.bold),
        ),
      ),
    );

    if (widget.extra['list'] != null && widget.extra['list'] is List) {
      widget.extra['list'].forEach((e) {
        res.add(
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
              _clickAnswer(e);
            },
            child: Padding(
              padding: const EdgeInsetsDirectional.only(top: 10.0, end: 12.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          e['subject'] ?? '',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 14.0, color: R.colors.secondTextColor),
                        ),
                      ),
                      R.img(BaseAssets.shared$icon_next_svg,
                          color: R.colors.secondTextColor,
                          width: 15,
                          height: 15,
                          package: ComponentManager.MANAGER_BASE_CORE),
                    ],
                  ),
                  const SizedBox(
                    height: 9,
                  ),
                  Container(
                    height: 0.5,
                    color: R.colors.dividerColor,
                  )
                ],
              ),
            ),
          ),
        );
      });
    }

    return Container(
      padding: const EdgeInsetsDirectional.only(top: 11.0, bottom: 11.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: res,
      ),
    );
  }
}
