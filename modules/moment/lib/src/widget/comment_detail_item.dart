import '../../../k.dart';
import 'dart:convert';

import 'package:shared/shared.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../moment.dart';
import 'comment_like_widget.dart';

/// @Author bobzhou
/// @Description
/// @Date 2022-03-29 16:47

/// 动态详情页 评论详情
class CommentDetailItem extends StatefulWidget {
  final Moment moment;
  final Comment comment;
  final OnCommentTaped? onComment;
  final OnCommentDelete? onCommentDelete;
  final int topicId;
  final int topicUid;
  final bool isHotComment;

  const CommentDetailItem(
      {super.key,
      required this.moment,
      required this.comment,
      this.topicId = 0,
      this.topicUid = 0,
      this.onComment,
      this.onCommentDelete,
      this.isHotComment = false});

  @override
  _CommentDetailItemState createState() => _CommentDetailItemState();
}

class _CommentDetailItemState extends State<CommentDetailItem> {
  late TapGestureRecognizer _gestureRecognizerReply;

  @override
  initState() {
    super.initState();
    _gestureRecognizerReply = TapGestureRecognizer()..onTap = _onReplyNameTaped;
  }

  _onReplyNameTaped() {
    _gotoImageScreen(widget.comment.toUid);
  }

  _gotoImageScreen(int? uid) {
    if (uid == null) {
      return;
    }

    IPersonalDataManager manager = ComponentManager.instance
        .getManager(ComponentManager.MANAGER_PERSONALDATA);
    manager.openImageScreen(context, uid, refer: const PageRefer('moment'));
  }

  _displayInput(Comment comment) async {
    if (widget.onComment != null) {
      widget.onComment!(comment);
    }
  }

  _deleteComment(Comment comment) async {
    if (Session.uid != comment.uid && Session.uid != widget.topicUid) {
      return;
    }

    List<SheetItem> res = [];
    res.add(SheetItem(K.moment_delete, "delete"));
    SheetCallback? result = await displayModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return RadioBottomSheet(data: res, suppDarkTheme: true);
        });
    if (result == null || result.reason == SheetCloseReason.Active) {
      return;
    }

    if (result.value?.key == "delete") {
      if (widget.onCommentDelete != null) {
        widget.onCommentDelete!(comment);
      }
    }
  }

  _showReportDialog(Comment? comment) async {
    if (comment == null) {
      return;
    }

    List<SheetItem> res = [];
    res.add(SheetItem(K.moment_report, 'report'));
    SheetCallback? result = await displayModalBottomSheet(
        context: System.context,
        builder: (BuildContext context) {
          return RadioBottomSheet(
              title: K.moment_report_tips, data: res, suppDarkTheme: true);
        });

    if (result != null && result.reason == SheetCloseReason.Active) return;

    try {
      Map jsonMap = {
        'sender_uid': comment.uid,
        'send_ts': comment.time,
        'msg': comment.content,
        'msg_type': 'text'
      };
      XhrResponse response = await Xhr.postJson(
          '${System.domain}cloud/report',
          {
            'type': '11',
            'to': comment.uid.toString(),
            'chat_content': json.encode([jsonMap])
          },
          throwOnError: false);
      if (Util.parseBool(response.value()['success'])) {
        Fluttertoast.showToast(
            msg: K.moment_report_success, gravity: ToastGravity.CENTER);
      } else {
        Fluttertoast.showCenter(msg: response.value()['msg']);
      }
    } catch (e) {
      Fluttertoast.showCenter(msg: e.toString());
    }
  }

  /// 审核中
  TextSpan _inAuditWidget() {
    return TextSpan(
      text: K.moment_in_auditing,
      style: TextStyle(
        fontSize: 13.0,
        color: R.colors.thirdTextColor,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 0, bottom: 12),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              RoundNetIcon(
                url: widget.comment.userIcon,
                size: 39,
                showBorder: false,
                onTap: () => _gotoImageScreen(widget.comment.uid),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 1,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              GestureDetector(
                                  onTap: () =>
                                      _gotoImageScreen(widget.comment.uid),
                                  child: Text.rich(TextSpan(
                                      text: widget.comment.displayName,
                                      style: TextStyle(
                                        color: R.colors.secondTextColor
                                            .withOpacity(0.5),
                                        fontSize: 14,
                                        fontFamily: Util.fontFamily,
                                      ),
                                      children: [
                                        if (widget.comment.isInAudit)
                                          _inAuditWidget()
                                      ]))),
                              const SizedBox(height: 3),
                              if (!widget.isHotComment)
                                Text(widget.comment.publishTime,
                                    style: TextStyle(
                                        color: R.colors.thirdTextColor,
                                        fontSize: 13,
                                        fontFamily: Util.fontFamily)),
                              _buildCommentItem(),
                            ],
                          ),
                        ),
                        CommentLikeWidget(
                            moment: widget.moment,
                            isHotComment: widget.isHotComment,
                            comment: widget.comment,
                            supportDark: true),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCommentItem() => InkWell(
        onTap: () {
          if (widget.comment.uid == Session.uid || widget.isHotComment) {
            return;
          }
          _displayInput(widget.comment);
        },
        onLongPress: () {
          if (widget.isHotComment) {
            return;
          }
          if (Session.uid != widget.comment.uid &&
              Session.uid != widget.topicUid) {
            _showReportDialog(widget.comment);
          } else {
            _deleteComment(widget.comment);
          }
        },
        child: Container(
            padding: const EdgeInsets.symmetric(vertical: 6.0),
            child: _commentContent()),
      );

  ///首评
  Widget _buildCommentTag() {
    Color color = Color(darkMode ? 0xFFC7E265 : 0xFFC7E265);
    return Container(
      height: 18,
      width: 40,
      margin: const EdgeInsetsDirectional.only(start: 12),
      alignment: AlignmentDirectional.center,
      decoration: BoxDecoration(
        color: const Color(0xFF829350).withOpacity(0.6),
        borderRadius: BorderRadius.circular(11),
      ),
      child: Text(K.moment_comment_tag,
          textAlign: TextAlign.center,
          style: TextStyle(
              color: color, fontSize: 12, fontWeight: FontWeight.w500)),
    );
  }

  Widget _commentContent() {
    String url = widget.comment.content?.split(':').first ?? '';
    bool isAudio = url.startsWith('audio/'); // && url.endsWith('.m4a');//无法确定格式
    if (isAudio) {
      url =
          System.songDomain + (widget.comment.content?.split(':').first ?? '');
    }
    int duration = Util.parseInt(
        (Util.parseInt(widget.comment.content?.split(':').last, 0) / 1000), 0);

    return isAudio ? _audioContent(url, duration) : _textContent();
  }

  Row _audioContent(String url, int duration) {
    return Row(
      children: [
        RichText(
          softWrap: false,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.start,
          textDirection: TextDirection.ltr,
          maxLines: 20,
          text: TextSpan(
            children: <InlineSpan>[
              if (widget.comment.toName != null &&
                  widget.comment.toName!.isNotEmpty)
                TextSpan(
                  text: '${K.moment_reply} ',
                  style: TextStyle(
                    color: R.colors.mainTextColor,
                    fontSize: widget.isHotComment ? 12 : 16,
                    fontFamily: Util.fontFamily,
                  ),
                  children: [
                    TextSpan(
                      text: '${widget.comment.displayToName}: ',
                      style: TextStyle(
                        color: darkMode
                            ? const Color(0xFF6FFFFF)
                            : const Color(0xFF956EFF),
                        fontSize: widget.isHotComment ? 12 : 16,
                        fontFamily: Util.fontFamily,
                      ),
                      recognizer: _gestureRecognizerReply,
                    ),
                  ],
                ),
              if (widget.comment.fcState == 1)
                WidgetSpan(child: _buildCommentTag())
            ],
          ),
        ),
        AudioButton(
          style: 1,
          duration: duration,
          audioUrl: url,
          onTap: () {},
          onAudioStop: (int playtime) {},
        ),
      ],
    );
  }

  RichText _textContent() {
    return RichText(
      softWrap: false,
      overflow: TextOverflow.ellipsis,
      textAlign: TextAlign.start,
      textDirection: TextDirection.ltr,
      maxLines: 20,
      text: TextSpan(
        children: <InlineSpan>[
          if (widget.comment.toName != null &&
              widget.comment.toName!.isNotEmpty)
            TextSpan(
              text: '${K.moment_reply} ',
              style: TextStyle(
                color: R.colors.mainTextColor,
                fontSize: 14,
                fontFamily: Util.fontFamily,
              ),
              children: [
                TextSpan(
                  text: '${widget.comment.displayToName}: ',
                  style: TextStyle(
                    color:
                        R.colors.highlightColor.withOpacity(darkMode ? 0.9 : 1),
                    fontSize: 14,
                    fontFamily: Util.fontFamily,
                  ),
                  recognizer: _gestureRecognizerReply,
                ),
              ],
            ),
          TextSpan(
            text: widget.comment.content?.trim(),
            style: TextStyle(
              color: R.colors.mainTextColor,
              fontSize: 14,
              fontFamily: Util.fontFamily,
            ),
          ),
          if (widget.comment.fcState == 1) WidgetSpan(child: _buildCommentTag())
        ],
      ),
    );
  }
}
