import 'dart:math';

import 'package:shared/shared.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:moment/k.dart';
import 'package:moment/src/api/api.dart';
import 'package:moment/src/model/moment_model.dart';
import 'package:provider/provider.dart';

typedef OnCommentTaped = void Function(Comment comment);
typedef OnCommentDelete = void Function(Comment comment);

/// 列表评论
/// 如果返回的评论超过20条且显示超过20条,底部显示查看更多评论
/// 如果返回的评论少于20条,底部显示评论一下
class CommentWidget extends StatelessWidget {
  final int? topicId;
  final int? topicUid;
  final List<Comment>? comments;
  final OnCommentTaped? onCommentTaped;
  final Function? onDisplayInput;

  const CommentWidget({
    super.key,
    this.topicId,
    this.topicUid,
    this.comments,
    this.onCommentTaped,
    this.onDisplayInput,
  });

  @override
  Widget build(BuildContext context) {
    List<Widget> res = [];

    IMomentManager manager =
        ComponentManager.instance.getManager(ComponentManager.MANAGER_MOMENT);
    MomentThemeConfig theme = manager.themeConfig;
    int showCommentNum = 2;
    if (theme.showCommentMore) {
      showCommentNum = 20;
    }

    if (comments != null && comments!.isNotEmpty) {
      // 评论按时间倒序
      comments?.sort((left, right) {
        if (left.time == right.time) {
          return left.commentId!.compareTo(right.commentId!);
        }
        return left.time!.compareTo(right.time!);
      });

      // Log.d("comments.length=${comments.length}");

      comments!
          .getRange(0, min(comments!.length, showCommentNum))
          .forEach((item) {
        res.add(CommentItem(
            comment: item,
            topicId: topicId ?? 0,
            topicUid: topicUid ?? 0,
            maxLines: 3));
      });
    }

    if (comments != null && comments!.length > 20 && res.length == 20) {
      res.add(
        GestureDetector(
          behavior: HitTestBehavior.opaque,
          child: Container(
            padding: const EdgeInsetsDirectional.only(top: 4, start: 0, end: 8),
            child: Text(
              K.comment_check_more,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(color: R.color.mainBrandColor, fontSize: 14),
            ),
          ),
        ),
      );
    } else {
      res.add(
        GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () => onDisplayInput?.call(context),
          child: Container(
            constraints: const BoxConstraints(minWidth: double.infinity),
            padding: const EdgeInsetsDirectional.only(top: 2.0),
            alignment: AlignmentDirectional.centerStart,
            child: Text(
              K.comment_hint,
              style: TextStyle(color: R.colors.mainTextColor, fontSize: 13),
            ),
          ),
        ),
      );
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: res,
    );
  }
}

/// 评论列表页item
class CommentItem extends StatefulWidget {
  final int topicId;
  final int topicUid;
  final Comment comment;
  final int maxLines;

  const CommentItem({
    super.key,
    required this.comment,
    required this.topicId,
    required this.topicUid,
    this.maxLines = 3,
  });

  @override
  _CommentItemState createState() => _CommentItemState();
}

class _CommentItemState extends State<CommentItem> {
  late TapGestureRecognizer _gestureRecognizer;
  late TapGestureRecognizer _gestureRecognizerReply;
  late IMomentManager _momentManager;

  @override
  initState() {
    super.initState();
    _gestureRecognizer = TapGestureRecognizer()..onTap = _onNameTaped;
    _gestureRecognizerReply = TapGestureRecognizer()..onTap = _onReplyNameTaped;
    _momentManager =
        ComponentManager.instance.getManager(ComponentManager.MANAGER_MOMENT);
  }

  _onNameTaped() {
    _gotoImageScreen(widget.comment.uid);
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
    manager.openImageScreen(context, uid, refer: const PageRefer('Comment'));
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
      DataRsp<Comment> response = await Api.cancelComment(
          widget.topicId, widget.topicUid, comment.commentId.toString());
      if (response.success == true && response.data != null) {
        Fluttertoast.showToast(
            msg: K.delete_comment_success, gravity: ToastGravity.CENTER);
        MomentModel momentModel =
            Provider.of<MomentModel>(context, listen: false);
        momentModel.deleteCommentById(widget.topicId, comment.commentId ?? 0);
      } else {
        Fluttertoast.showToast(
            msg: response.msg ?? K.delete_comment_failed,
            gravity: ToastGravity.CENTER);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    String url = widget.comment.content?.split(':').first ?? '';
    bool isAudio = url.startsWith('audio/'); // && url.endsWith('.m4a');//无法确定格式
    if (isAudio) {
      url =
          System.songDomain + (widget.comment.content?.split(':').first ?? '');
    }
    int duration = Util.parseInt(
        (Util.parseInt(widget.comment.content?.split(':').last, 0) / 1000), 0);

    if (isAudio) {
      return Container(
        margin: const EdgeInsets.only(bottom: 7.0),
        child: Row(
          children: [
            RichText(
              softWrap: false,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.start,
              textDirection: TextDirection.ltr,
              maxLines: widget.maxLines,
              text: TextSpan(
                style: secondText,
                children: <TextSpan>[
                  TextSpan(
                    text: widget.comment.displayName,
                    style: mainText,
                    recognizer: _gestureRecognizer,
                  ),
                  if (widget.comment.toName != null &&
                      widget.comment.toName!.isNotEmpty)
                    TextSpan(
                      text: ' ${K.moment_reply}',
                      style: brandText.copyWith(
                          color: _momentManager.themeConfig.replyColor ??
                              R.color.secondaryBrandColor),
                      children: [
                        TextSpan(
                          text: widget.comment.displayToName,
                          style: secondText,
                          recognizer: _gestureRecognizerReply,
                        ),
                      ],
                    ),
                  TextSpan(
                    text: ': ',
                    style: secondText,
                  ),
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
        ),
      );
    } else {
      return GestureDetector(
        onLongPress: () => _deleteComment(widget.comment),
        child: Container(
          constraints: BoxConstraints(minWidth: Util.width),
          margin: const EdgeInsets.only(bottom: 7.0),
          child: RichText(
            softWrap: false,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.start,
            textDirection: TextDirection.ltr,
            maxLines: widget.maxLines,
            text: TextSpan(
              style: secondText,
              children: <TextSpan>[
                TextSpan(
                  text: widget.comment.displayName,
                  style: mainText,
                  recognizer: _gestureRecognizer,
                ),
                if (widget.comment.toName != null &&
                    widget.comment.toName!.isNotEmpty)
                  TextSpan(
                    text: ' ${K.moment_reply}',
                    style: brandText.copyWith(
                        color: _momentManager.themeConfig.replyColor ??
                            R.color.secondaryBrandColor),
                    children: [
                      TextSpan(
                        text: widget.comment.displayToName,
                        style: secondText,
                        recognizer: _gestureRecognizerReply,
                      ),
                    ],
                  ),
                TextSpan(
                  text: ': ',
                  style: secondText,
                ),
                TextSpan(
                  text: (widget.comment.content ?? '').trim(),
                  style: secondText,
                ),
              ],
            ),
          ),
        ),
      );
    }
  }

  TextStyle get mainText {
    return TextStyle(
      color: R.colors.mainTextColor,
      fontSize: 13,
      fontFamily: Util.fontFamily,
    );
  }

  TextStyle get secondText {
    return TextStyle(
      color: R.colors.secondTextColor,
      fontSize: 13,
      fontFamily: Util.fontFamily,
    );
  }

  TextStyle get brandText {
    return TextStyle(
      color: R.color.secondaryBrandColor,
      fontSize: 13,
      fontFamily: Util.fontFamily,
    );
  }
}
