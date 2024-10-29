import 'dart:convert';

import 'package:chat/k.dart';
import 'package:chat/src/model/service_feedback_data.dart';
import 'package:chat/src/page/chat_feedback_page.dart';
import 'package:chat/src/repo/chat_service_repo.dart';
import 'package:flutter/material.dart';
import 'package:shared/shared.dart';

/// 不满意客户服务原因标签和留言入口
class DisplayServiceFeedback extends StatefulWidget {
  final MessageContent message;
  final Map extra;

  const DisplayServiceFeedback(
      {super.key, required this.message, required this.extra});

  @override
  _DisplayServiceFeedbackState createState() => _DisplayServiceFeedbackState();
}

class _DisplayServiceFeedbackState extends State<DisplayServiceFeedback> {
  int _type = 0;
  Map<String, dynamic> _tags = {};
  bool _hasFeedback = false;

  @override
  void initState() {
    super.initState();

    _tags = (widget.extra['tags']) ?? {};

    try {
      String? inline = widget.message.inlineExtra;
      if (inline != null && inline.isNotEmpty) {
        Map? data = json.decode(inline);
        if (data != null) {
          if (data.containsKey('leavemessage'))
            _hasFeedback = data['leavemessage'] == '1';
          if (data.containsKey('tag')) _type = Util.parseInt(data['tag']);
        }
      } else {
        _load();
      }
    } catch (e) {
      Log.d(e);
    }
  }

  _load() async {
    ServiceFeedbackRsp resp = await ChatServiceRepo.getServiceEvaluateData(
        widget.extra['sid'], widget.message.messageUId);
    if (resp.success == true) {
      await _setExtra(resp.data?.leaveMessage ?? 0, resp.data?.tag ?? 0);

      if (mounted) {
        setState(() {
          _hasFeedback = resp.data?.leaveMessage == 1;
          _type = resp.data?.tag ?? 0;
        });
      }
    }
  }

  _setExtra(int feedback, int tag) async {
    String extra = json
        .encode({'leavemessage': feedback.toString(), 'tag': tag.toString()});
    await Im.setMessageExtra(widget.message.messageId, extra);
    eventCenter.emit('MsgExtraChanged',
        {'messageId': widget.message.messageId, 'extra': extra});
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 210.0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            K.please_evaluate_our_service,
            style: R.textStyle.body1.copyWith(color: R.colors.mainTextColor),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            K.you_have_evaluate_not_satisfied,
            style: R.textStyle.body2.copyWith(color: R.colors.mainTextColor),
          ),
          if (_tags.isNotEmpty) ...[
            const SizedBox(
              height: 10,
            ),
            _buildTags(),
          ],
          const SizedBox(
            height: 10,
          ),
          _buildToFeedback(),
        ],
      ),
    );
  }

  Widget _buildTags() {
    List<Widget> res = [];
    _tags.forEach((key, value) {
      res.add(GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () async {
          BaseResponse resp = await ChatServiceRepo.submitServiceTag(
              widget.message.messageUId, widget.extra['sid'], key);
          if (resp.success == true && mounted) {
            setState(() {
              _type = Util.parseInt(key);
            });
          }
        },
        child: Container(
          height: 20,
          padding: const EdgeInsetsDirectional.only(start: 5, end: 5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
                width: 1,
                color: _type == Util.parseInt(key)
                    ? R.colors.highlightColor
                    : R.colors.secondTextColor),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                value,
                style: TextStyle(
                    fontSize: 10,
                    color: _type == Util.parseInt(key)
                        ? R.colors.highlightColor
                        : R.colors.secondTextColor),
              ),
            ],
          ),
        ),
      ));
    });

    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: res,
    );
  }

  Widget _buildToFeedback() {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () async {
        if (_hasFeedback == true ||
            widget.message.messageUId == null ||
            widget.extra['sid'] == null) return;

        bool? comment = await ChatFeedbackPage.show(context,
            uuid: widget.message.messageUId!, sid: widget.extra['sid']);
        if (comment ?? false) {
          await _setExtra(1, _type);

          if (mounted) {
            setState(() {
              _hasFeedback = true;
            });
          }
        }
      },
      child: Container(
        width: 120,
        height: 20,
        alignment: AlignmentDirectional.centerStart,
        child: Text(
          _hasFeedback == true
              ? K.chat_feedback_thanks
              : K.chat_feedback_to_comment,
          style: TextStyle(
              fontSize: 14,
              color: _hasFeedback == true
                  ? R.colors.secondTextColor
                  : R.colors.highlightColor),
        ),
      ),
    );
  }
}
