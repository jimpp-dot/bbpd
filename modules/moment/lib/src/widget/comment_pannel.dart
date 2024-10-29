import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:moment/moment.dart';

import '../../k.dart';
import 'comment_detail_item.dart';
import 'package:provider/provider.dart' hide Selector;

/// @Author bobzhou
/// @Description 评论面板
/// @Date 2022-03-29 16:20

class CommentPanel extends StatefulWidget {
  final int topicId;
  final int topicUid;

  const CommentPanel(
      {super.key, required this.topicId, required this.topicUid});

  @override
  State<CommentPanel> createState() => _CommentPanelState();

  static Future show(BuildContext context, int topicId, int topicUid) {
    return displayModalBottomSheet(
        context: context,
        isBarrierDismissible: true,
        maxHeightRatio: 1.0,
        defineBarrierColor: Colors.transparent,
        builder: (BuildContext context) {
          return CommentPanel(topicId: topicId, topicUid: topicUid);
        });
  }
}

class _CommentPanelState extends State<CommentPanel>
    with BaseScreenStateMixin<CommentPanel> {
  Moment? _moment;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  void _loadData() async {
    DataRsp<Moment> response =
        await Api.getMomentDetail(widget.topicUid, widget.topicId);
    if (response.success == true) {
      _moment = response.data;
      if (Util.isCollectionEmpty(_moment?.comments)) {
        setScreenEmpty();
      } else {
        setScreenReady();
      }
    } else {
      setScreenError(errorMsg: response.msg);
    }
  }

  @override
  void onTapErrorWidget() {
    super.onTapErrorWidget();
    _loadData();
  }

  @override
  Widget build(BuildContext context) {
    return _wrapContainer(
        Scaffold(
          body: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              _buildTitleBar(K.moment_comment),
              Expanded(child: (buildStatusContent()))
            ],
          ),
          bottomNavigationBar: _buildInputBottom(_moment),
        ),
        maxHeight: 520);
  }

  Widget _buildInputBottom(Moment? moment) {
    if (moment == null) {
      return const SizedBox.shrink();
    }

    return SafeArea(
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 6),
        child: GestureDetector(
          onTap: () => _displayInput(moment, comment: null),
          behavior: HitTestBehavior.opaque,
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            height: 40,
            decoration: BoxDecoration(
              border: Border.all(width: 1, color: R.color.thirdBgColor),
              borderRadius: BorderRadius.circular(20),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            alignment: AlignmentDirectional.centerStart,
            child: Text(
              K.comment_hint,
              style: TextStyle(color: R.color.thirdTextColor, fontSize: 16),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget buildContent() {
    return ListView.builder(
        padding: const EdgeInsets.only(left: 20, right: 20),
        itemBuilder: _itemBuilder,
        itemCount: _moment!.comments!.length);
  }

  Widget _itemBuilder(BuildContext context, int index) {
    return CommentDetailItem(
      topicId: widget.topicId,
      topicUid: widget.topicUid,
      comment: _moment!.comments![index],
      moment: _moment!,
      onComment: (comment) => _displayInput(_moment!, comment: comment),
      onCommentDelete: (comment) => _onCommentDelete(comment),
    );
  }

  /// 评论
  _displayInput(Moment moment, {Comment? comment}) async {
    //trackerReport(moment: moment, page: _reportPage, clickType: 'comment');

    MomentModel momentModel = context.read<MomentModel>();
    Comment? result = await CommentInput.showCommentInput(
      context,
      moment: moment,
      hintText: comment?.displayName,
      comment: comment,
      page: MomentFlowPage.MomentDetail,
    );
    if (result != null) {
      moment.addComment(result);
      momentModel.putCachedMoment(moment);
      if (mounted) setState(() {});
    }
  }

  /// 删除评论
  void _onCommentDelete(Comment comment) async {
    DataRsp<Comment> response = await Api.cancelComment(
        widget.topicId, widget.topicUid, comment.commentId.toString());
    if (response.success == true && response.data != null) {
      Fluttertoast.showToast(
          msg: K.delete_comment_success, gravity: ToastGravity.CENTER);
      _moment?.deleteComment(comment.commentId ?? 0);
      //_momentModel.putCachedMoment(_moment);
      if (mounted) {
        setState(() {});
      }
    } else {
      Fluttertoast.showToast(
          msg: response.msg ?? K.delete_comment_failed,
          gravity: ToastGravity.CENTER);
    }
  }

  Widget _wrapContainer(Widget child, {double maxHeight = 350}) {
    return GestureDetector(
        onTap: () {},
        child: ClipRRect(
          borderRadius:
              const BorderRadiusDirectional.vertical(top: Radius.circular(16.0))
                  .resolve(TextDirection.ltr),
          child: Container(
            clipBehavior: Clip.hardEdge,
            constraints: BoxConstraints(maxHeight: maxHeight),
            decoration: BoxDecoration(color: R.color.mainBgColor),
            child: child,
          ),
        ));
  }

  Widget _buildTitleBar(String title, {bool showBack = false}) {
    return BaseAppBar.custom(
        title: Text(
          title,
          style: TextStyle(
              color: R.color.mainTextColor,
              fontSize: 16,
              fontWeight: FontWeight.w500),
        ),
        backgroundColor: Colors.transparent,
        showBack: showBack);
  }
}
