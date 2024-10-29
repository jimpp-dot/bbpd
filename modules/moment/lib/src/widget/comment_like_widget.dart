import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:moment/moment.dart';
import 'package:provider/provider.dart';

import '../model/pb/generated/comment.pb.dart';

typedef LikeCallback = void Function(bool isLiked);

/// 评论点赞
class CommentLikeWidget extends StatefulWidget {
  final Comment comment;
  final Moment moment;
  final bool isHotComment;
  final LikeCallback? onLikeTaped;
  final Color? mainTextColor;
  final Color? secondTextColor;
  final bool supportDark;

  const CommentLikeWidget({
    super.key,
    required this.moment,
    required this.comment,
    this.isHotComment = false,
    this.onLikeTaped,
    this.mainTextColor,
    this.secondTextColor,
    this.supportDark = false,
  });

  @override
  _CommentLikeWidgetState createState() => _CommentLikeWidgetState();
}

class _CommentLikeWidgetState extends State<CommentLikeWidget>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => _onLikeTaped(),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            width: widget.isHotComment ? 20 : 28,
            height: widget.isHotComment ? 20 : 28,
            alignment: Alignment.center,
            child: R.img(
              likeIcon(),
              width: widget.isHotComment ? 20 : 28,
              height: widget.isHotComment ? 20 : 28,
              package: ComponentManager.MANAGER_BASE_CORE,
            ),
          ),
          const SizedBox(width: 4),
          NumText(
            '${widget.comment.likeNum}',
            style: TextStyle(
              color: R.colors.secondTextColor,
              fontSize: 13,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  _onLikeTaped() async {
    if (!Session.isLogined) {
      ILoginManager manager =
          ComponentManager.instance.getManager(ComponentManager.MANAGER_LOGIN);
      manager.show(context);
      return;
    }
    ResCommentLike response = await Api.commentLike(widget.comment.topicId ?? 0,
        widget.comment.commentId ?? 0, !widget.comment.isLike);
    if (response.success) {
      MomentModel model = context.read<MomentModel>();
      widget.moment.changeCommentLikeState(widget.comment.commentId ?? 0);
      model.notify();
      if (widget.onLikeTaped != null) {
        widget.onLikeTaped!(false);
      }
    } else {
      Fluttertoast.showToast(msg: response.msg, gravity: ToastGravity.CENTER);
    }
    if (mounted) {
      setState(() {});
    }
  }

  String likeIcon() {
    if (widget.comment.isLike) {
      return darkMode
          ? 'moment/ic_rush_like_dark.webp'
          : 'moment/ic_rush_like.webp';
    }
    return darkMode
        ? 'moment/ic_rush_unlike_dark.webp'
        : 'moment/ic_rush_unlike.webp';
  }
}
