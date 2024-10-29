import 'dart:convert';

import 'package:shared/shared.dart';
import 'package:shared/k.dart' as BaseK;
import 'package:shared/model/models.dart';
import 'package:flutter/material.dart';
import 'package:moment/k.dart';
import 'package:moment/moment.dart';
import 'package:moment/src/model/moment_notice_people.dart';
import 'package:moment/src/widget/like_widget.dart';
import 'package:moment/src/widget/moment_item_header.dart';
import 'package:provider/provider.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../widget/comment_detail_item.dart';

/// 朋友圈动态详情页
class MomentDetailScreen extends StatefulWidget {
  static const String MOMENT_DETAIL_ROUTE = '/moment_detail';

  // 是否默认展示评论输入框
  final bool showInput;

  final int topicId;
  final int topicUid;

  // 信息流数据上报，页面来源
  final MomentFlowPage parentPage;

  final VoidCallback? onTopChanged;

  static Future openMomentDetailScreen(
    BuildContext context, {
    Key? key,
    required int topicId,
    required int tUid,
    required MomentFlowPage parentPage,
    bool showInput = false,
    VoidCallback? onTopChanged,
  }) {
    return Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return MomentDetailScreen(
            key: key,
            topicId: topicId,
            topicUid: tUid,
            showInput: showInput,
            parentPage: parentPage,
            onTopChanged: onTopChanged,
          );
        },
        settings: const RouteSettings(name: MOMENT_DETAIL_ROUTE),
      ),
    );
  }

  const MomentDetailScreen(
      {super.key,
      required this.topicId,
      required this.topicUid,
      required this.parentPage,
      this.showInput = false,
      this.onTopChanged});

  @override
  _MomentDetailState createState() => _MomentDetailState();
}

class _MomentDetailState extends State<MomentDetailScreen>
    with WidgetsBindingObserver {
  bool _loading = true;

  String? _errorMessage;
  Moment? _moment;
  ExposureMoment? _exposureItem;

  bool _isCurrentPage = false;

  late MomentFlowPage _reportPage;

  late MomentModel _momentModel;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _momentModel = context.read<MomentModel>();

    _moment = _momentModel.getCachedMoment(widget.topicId);

    _isCurrentPage = true;

    if (widget.parentPage == MomentFlowPage.Follow) {
      _reportPage = MomentFlowPage.FollowToDetail;
    } else if (widget.parentPage == MomentFlowPage.Recommend) {
      _reportPage = MomentFlowPage.RecommendToDetail;
    } else if (widget.parentPage == MomentFlowPage.NetDetail) {
      _reportPage = MomentFlowPage.NetDetailToDetail;
    } else if (widget.parentPage == MomentFlowPage.TopicDetail) {
      _reportPage = MomentFlowPage.TopicDetailToDetail;
    } else if (widget.parentPage == MomentFlowPage.User) {
      _reportPage = MomentFlowPage.UserToDetail;
    } else {
      _reportPage = MomentFlowPage.MomentDetail;
    }
    _loadData();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _isCurrentPage = false;
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.inactive:
        break;
      case AppLifecycleState.resumed:
        if (_isCurrentPage) _onPageVisible(true);
        break;
      case AppLifecycleState.paused: // 应用程序不可见，后台
        if (_isCurrentPage) _endExposure(_moment);
        break;
      case AppLifecycleState.detached:
        break;
    }
  }

  void _loadData() async {
    DataRsp<Moment> response =
        await Api.getMomentDetail(widget.topicUid, widget.topicId);
    if (!mounted) {
      return;
    }
    if (response.success == true) {
      _moment = response.data;
      _errorMessage = null;
      if (_moment != null) {
        trackerViewFlowReport(moment: _moment!, page: _reportPage);
        _momentModel.putCachedMoment(_moment);
      }
    } else {
      _errorMessage = response.msg;
      Fluttertoast.showToast(msg: _errorMessage, gravity: ToastGravity.CENTER);
    }

    _loading = false;
    if (mounted) {
      setState(() {});
    }

    if (widget.showInput == true) {
      // 默认展示评论输入框
      Future.delayed(const Duration(milliseconds: 300), () {
        if (mounted) {
          _displayInput(_moment);
        }
      });
    }
  }

  Future<void> onRefresh() async {
    if (mounted) {
      setState(() {
        _loading = true;
        _loadData();
      });
    }
  }

  _onMoreTaped(Moment moment) async {
    if (!Session.isLogined) {
      ILoginManager manager =
          ComponentManager.instance.getManager(ComponentManager.MANAGER_LOGIN);
      manager.show(context);
      return;
    }
    List<SheetItem> res = [];
    if (Session.uid == moment.uid && widget.onTopChanged != null) {
      if (moment.isTop) {
        res.add(SheetItem(BaseK.K.cancel_set_top, 'cancel_top'));
      } else {
        res.add(SheetItem(
            K.moment_set_top, 'top', null, null, K.moment_set_top_desc));
      }
    }
    if (Session.uid == moment.uid) {
      res.add(SheetItem(K.moment_delete, "delete"));
    } else {
      res.add(SheetItem(K.moment_report, "report"));
    }
    if (moment.isPublic) {
      res.add(SheetItem(K.moment_share, "share"));
    }

    SheetCallback? result = await displayModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return RadioBottomSheet(data: res, suppDarkTheme: true);
        });
    if (result == null || result.reason == SheetCloseReason.Active) {
      return;
    }

    if (result.value?.key == 'delete') {
      await _deleteMoment(moment);
    } else if (result.value?.key == 'report') {
      _reportMoment(moment);
    } else if (result.value?.key == 'share') {
      MomentUtils.shareMoment(context, moment);

      trackerReport(moment: moment, page: _reportPage, clickType: 'repost');
    } else if (result.value?.key == 'top') {
      _setTop(moment, true);
    } else if (result.value?.key == 'cancel_top') {
      _setTop(moment, false);
    }
  }

  Future<void> _setTop(Moment moment, bool top) async {
    var res = await Api.setTop(moment.topicId, top);
    if (res.success) {
      Toast.show(context, top ? K.moment_set_top_ok : K.moment_cancel_ok);
      moment.isTop = top;
      refresh();
      widget.onTopChanged?.call();
    } else {
      Toast.show(context, res.msg);
    }
  }

  /// 评论
  _displayInput(Moment? moment, {Comment? comment}) async {
    if (moment == null) return;
    trackerReport(moment: moment, page: _reportPage, clickType: 'comment');

    MomentModel momentModel = context.read<MomentModel>();
    Comment? result = await CommentInput.showCommentInput(
      context,
      moment: moment,
      hintText: comment?.displayName,
      comment: comment,
      page: _reportPage,
    );
    if (result != null) {
      moment.addComment(result);
      momentModel.putCachedMoment(moment);
      if (mounted) setState(() {});
    }
  }

  /// 删除动态
  _deleteMoment(Moment moment) async {
    bool? result = await RushConfirmDialog.openRushConfirmDialog(
      context,
      title: K.moment_delete_tips,
      negativeButton: RushNegativeButton(
          text: BaseK.K.cancel,
          onPressed: () {
            Navigator.of(context).pop(false);
          }),
      positiveButton: RushPositiveButton(
          text: BaseK.K.confirm,
          onPressed: () {
            Navigator.of(context).pop(true);
          }),
    );

    if (result != null && result) {
      DataRsp response = await Api.deleteMoment(moment.topicId);
      if (response.success == true) {
        trackerReport(moment: moment, page: _reportPage, clickType: 'delete');
        _momentModel.deleteMomentById(moment.topicId);
        if (Navigator.canPop(context)) Navigator.of(context).pop();
      } else {
        Fluttertoast.showToast(msg: response.msg, gravity: ToastGravity.CENTER);
      }
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
      _momentModel.putCachedMoment(_moment);
      if (mounted) {
        setState(() {});
      }
    } else {
      Fluttertoast.showToast(
          msg: response.msg ?? K.delete_comment_failed,
          gravity: ToastGravity.CENTER);
    }
  }

  /// 举报
  void _reportMoment(Moment moment) async {
    IPersonalDataManager manager = ComponentManager.instance
        .getManager(ComponentManager.MANAGER_PERSONALDATA);
    manager.openReportScreen(context,
        uid: moment.uid,
        reportType: ReportType.Moment,
        reportId: moment.topicId);

    trackerReport(moment: moment, page: _reportPage, clickType: 'report');
  }

  _onLikeTaped(Moment moment, bool isLiked) {
    trackerReport(
        moment: moment,
        page: _reportPage,
        clickType: isLiked ? 'like' : 'unlike');

    if (mounted) setState(() {});
  }

  _onSayHiTaped(Moment moment) async {
    String type = 'private';
    MessageContent content = MessageContent(
        'text', SendUser(Session.uid.toString(), Session.name, Session.icon));
    content.content = K.moment_say_hi_v2;
    content.extra = json.encode(MomentUtils.getShareExtra(moment));
    int targetId = moment.uid;
    bool canSendMsgWhenSayHi =
        await BaseRequestManager.checkCanSendMsgWhenSayHi(targetId, type);

    ///判断是否可以给指定用户发消息
    if (canSendMsgWhenSayHi) {
      await Im.sendMessage(type, targetId.toString(), content,
          supportVersion: ImSupportSDKVersions.MOMENT_MESSAGE_SUPPORT_VERSION);
    }
    IChatManager chatManager =
        ComponentManager.instance.getManager(ComponentManager.MANAGER_CHAT);
    chatManager.openUserChatScreen(context,
        type: type,
        targetId: targetId,
        title: moment.name,
        refer: 'moment_detail_hi');

    trackerReport(moment: moment, page: _reportPage, clickType: 'hi');
  }

  /// at 用户点击
  void _onNoticeUserTaped(MomentNoticePeople user) {
    trackerReport(moment: _moment!, page: _reportPage, clickType: 'mention');

    IPersonalDataManager personalDataManager = ComponentManager.instance
        .getManager(ComponentManager.MANAGER_PERSONALDATA);
    personalDataManager.openImageScreen(context, user.uid,
        refer: PageRefer(getFlowPage(_reportPage)));
  }

  _onPageVisible(bool visible) {
    Log.d('_onPageVisible:$visible');
    _isCurrentPage = visible;
    if (visible) {
      _startExposure(_moment);
    } else {
      _endExposure(_moment);
    }
  }

  /// 开始曝光统计
  void _startExposure(Moment? moment) {
    if (moment == null) return;
    // Log.d('_addExposureItem: ${moment.topicId}');
    _exposureItem = ExposureMoment(
      topicId: moment.topicId,
      startExposureTime: DateTime.now(),
      moment: moment,
    );
  }

  /// 结束曝光统计
  void _endExposure(Moment? moment) {
    if (moment == null || _exposureItem == null) return;
    ExposureMoment item = _exposureItem!;
    item.duration =
        DateTime.now().difference(item.startExposureTime).inMilliseconds;
    reportExposureTime(item, _reportPage);
    _exposureItem = null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: R.colors.homeBgColor,
      resizeToAvoidBottomInset: false,
      appBar: _buildAppBar(),
      body: _buildBody(_moment),
      bottomNavigationBar: _buildInputBottom(_moment),
    );
  }

  BaseAppBar _buildAppBar() {
    return BaseAppBar.custom(
      title: Text(K.moment_detail_title,
          style: R.textStyle.title.copyWith(color: R.colors.mainTextColor)),
      backgroundColor: R.colors.homeBgColor,
      backColor: R.colors.mainTextColor,
      statusBrightness: darkMode ? Brightness.dark : Brightness.light,
      actions: <Widget>[
        /// 普通用户
        if (_moment != null && _moment!.userType != UserType.official)
          GestureDetector(
            onTap: () => _onMoreTaped(_moment!),
            behavior: HitTestBehavior.opaque,
            child: Container(
              padding: const EdgeInsetsDirectional.only(end: 16, start: 16),
              alignment: Alignment.center,
              child: R.img(
                'ic_list_more.svg',
                color: R.colors.mainTextColor,
                package: ComponentManager.MANAGER_MOMENT,
                width: 24,
                height: 24,
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildBody(Moment? moment) {
    if (_loading && _moment == null) {
      return const Loading();
    }

    if (_errorMessage != null) {
      return ErrorData(
          error: _errorMessage,
          fontColor: R.colors.secondTextColor,
          onTap: () => onRefresh());
    }

    if (moment == null) {
      return EmptyWidget(
          desc: K.no_more_moment, textColor: R.colors.secondTextColor);
    }

    return VisibilityDetector(
      key: const ValueKey('moment_detail'),
      onVisibilityChanged: (visibilityInfo) {
        if (visibilityInfo.visibleFraction == 0.0) {
          _onPageVisible(false);
        } else if (visibilityInfo.visibleFraction == 1.0) {
          _onPageVisible(true);
        }
      },
      child: CustomScrollView(
        controller: ScrollController(),
        physics: const AlwaysScrollableScrollPhysics(),
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildListDelegate(
              [
                _buildMomentContent(moment),
                _buildCommentTitle(moment),
              ],
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: CommentDetailItem(
                    topicId: widget.topicId,
                    topicUid: widget.topicUid,
                    comment: moment.comments![index],
                    moment: moment,
                    onComment: (comment) =>
                        _displayInput(moment, comment: comment),
                    onCommentDelete: (comment) => _onCommentDelete(comment),
                  ),
                );
              },
              childCount: moment.comments?.length ?? 0,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMomentContent(Moment moment) {
    return Container(
      padding: const EdgeInsetsDirectional.only(
          start: 16, end: 16, top: 0, bottom: 20),
      // cornerRadius: 16,
      margin: const EdgeInsetsDirectional.only(
        start: 16,
        end: 16,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          MomentItemHeader(
            moment: moment,
            showMore: false,
            showFollow: true,
            page: _reportPage,
            supportDark: true,
            onTopChanged: widget.onTopChanged,
          ),

          if (moment.content != null && moment.content!.isNotEmpty)
            Padding(
              padding: const EdgeInsetsDirectional.only(bottom: 12.0, end: 16),
              child: ExpandableText(
                text: moment.content!,
                style: TextStyle(
                    color: R.colors.mainTextColor, fontSize: 16, height: 1.4),
                maxLines: EXPAND_TEXT_LINE,
                expand: false,
                atUsers: moment.atUsers,
                onUserTaped: (user) => _onNoticeUserTaped(user),
              ),
            ),

          MomentMediaWidget(
            moment: moment,
            page: _reportPage,
            isInView: true,
            autoPlayVideo: true,
            supportDark: true,
          ),

          // 标签
          if (moment.tagsTp != null && moment.tagsTp!.isNotEmpty)
            Padding(
              padding: const EdgeInsetsDirectional.only(end: 16, bottom: 8),
              child: NormalTagsWidget(
                moment: moment,
                tags: moment.tagsTp!,
                page: _reportPage,
                tagBgColors: darkMode
                    ? [
                        R.colors.bubbleBgColor,
                        R.colors.bubbleBgColor,
                      ]
                    : R.colors.tagGradientColors,
                tagTextColor: R.colors.mainTextColor,
                supportDark: true,
              ),
            ),

          // 标签
          if (moment.tagsBroadcast != null)
            Padding(
              padding: const EdgeInsetsDirectional.only(end: 16, bottom: 8),
              child: NormalTagsWidget(
                moment: moment,
                tags: [
                  NormalTag(moment.tagsBroadcast!.id, moment.tagsBroadcast!.tag)
                ],
                page: _reportPage,
                supportDark: true,
              ),
            ),

          // 点赞评论数量
          Padding(
            padding: const EdgeInsetsDirectional.only(end: 16),
            child: SayHiWidget(
              moment: moment,
              onLikeTaped: (bool isLiked) => _onLikeTaped(moment, isLiked),
              onSayHiTaped: () => _onSayHiTaped(moment),
              mainTextColor: R.colors.mainTextColor,
              supportDark: true,
            ),
          ),

          const SizedBox(height: 12),

          // 点赞列表
          if (moment.likes != null && moment.likes!.isNotEmpty)
            LikesWidget(
              topicId: moment.topicId,
              topicUid: moment.uid,
              likes: moment.likes!,
              gotoList: true,
              totalNum: moment.getLikesNum,
            ),
        ],
      ),
    );
  }

  Widget _buildCommentTitle(Moment moment) {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Padding(
            padding: const EdgeInsetsDirectional.only(start: 20),
            child: Text(
              K.moment_comment,
              style: TextStyle(color: R.colors.mainTextColor, fontSize: 16),
            ),
          ),
          if (moment.comments == null || moment.comments!.isEmpty)
            Padding(
              padding: const EdgeInsets.only(top: 32),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  EmptyWidget(
                    desc: K.no_comment,
                    textColor: R.colors.secondTextColor,
                    paddingBottom: 20,
                  ),
                  GestureDetector(
                      onTap: () {
                        _displayInput(_moment);
                      },
                      child: Container(
                        height: 41,
                        width: 135,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                colors: R.colors.mainBrandGradientColors,
                                begin: AlignmentDirectional.topStart,
                                end: AlignmentDirectional.bottomEnd),
                            borderRadius: BorderRadius.circular(24)),
                        child: Text(
                          K.moment_first_comment,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: R.colors.brightTextColor,
                              fontSize: 15,
                              fontWeight: FontWeight.w700),
                        ),
                      )),
                ],
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildInputBottom(Moment? moment) {
    if (moment == null) {
      return const SizedBox.shrink();
    }

    return Container(
      color: darkMode ? Colors.transparent : Colors.white,
      padding: EdgeInsets.only(
          top: 6, bottom: MediaQuery.of(context).padding.bottom),
      child: GestureDetector(
        onTap: () => _displayInput(moment, comment: null),
        behavior: HitTestBehavior.opaque,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          height: 40,
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: R.colors.dividerColor),
            borderRadius: BorderRadius.circular(20),
            color: darkMode ? Colors.transparent : R.colors.homeBgColor,
          ),
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          alignment: AlignmentDirectional.centerStart,
          child: Text(
            K.comment_hint,
            style: TextStyle(color: R.colors.thirdTextColor, fontSize: 16),
          ),
        ),
      ),
    );
  }
}
