import 'dart:convert';

import 'package:shared/shared.dart';
import 'package:pulse_log/pulse_log.dart';
import 'package:flutter/material.dart';
import 'package:fmodifier/fmodifier.dart';
import 'package:moment/moment.dart';
import 'package:moment/src/model/moment_notice_people.dart';
import 'package:moment/src/widget/comment_detail_item.dart';
import 'package:moment/src/widget/like_widget.dart';
import 'package:provider/provider.dart' hide Selector;

import '../../k.dart';
import 'moment_item_header.dart';

part 'moment_item.part.dart';

typedef OnMomentDelete = void Function(int topicId);

/// 朋友圈动态item
class MomentItem extends StatefulWidget {
  final int parentTagId;
  final Moment moment;
  final bool canHeadTaped; // 点击头像跳转
  final bool canTagTaped;
  final bool showFollow;
  final bool showDelete;
  final bool showTestData;
  final bool showLikeList; // 是否展示点赞列表（默认展示）
  final bool showCaseContent; //是否显示案例的图片
  final String? topicName;
  final bool showPublishTime;
  final MomentFlowPage page; // 信息流数据上报，页面来源
  final bool? showComment;
  final OnMomentDelete? onMomentDelete;
  final bool isInView;
  final bool autoPlayVideo;
  final bool normalDivideLine;
  final bool canCommentTaped;
  final bool supportDark;
  final double bottomMargin;
  final VoidCallback? onTopChanged;

  const MomentItem({
    super.key,
    required this.page,
    required this.moment,
    this.canHeadTaped = true,
    this.canTagTaped = true,
    this.showFollow = false,
    this.parentTagId = 0,
    this.showDelete = true,
    this.showTestData = false,
    this.showLikeList = false,
    this.showCaseContent = false,
    this.onMomentDelete,
    this.topicName,
    this.showPublishTime = true,
    this.showComment = false,
    this.autoPlayVideo = false,
    this.isInView = false,
    this.normalDivideLine = false,
    this.canCommentTaped = false,
    this.supportDark = false,
    this.bottomMargin = 0.0,
    this.onTopChanged,
  });

  @override
  _MomentItemState createState() {
    return _MomentItemState();
  }
}

class _MomentItemState extends State<MomentItem> {
  late MomentModel momentModel;

  @override
  void initState() {
    super.initState();
    momentModel = context.read<MomentModel>();
  }

  /// 点赞点击
  void _onLikedTaped(bool isLiked) {
    trackerReport(
        moment: widget.moment,
        page: widget.page,
        clickType: isLiked ? 'like' : 'unlike',
        topicName: widget.topicName);
    PulseLog.instance.event('click_event', properties: {
      'click_tag': 'moment_${widget.page}_like_${widget.moment.topicId}',
    });
  }

  /// 打招呼点击
  void _onSayHiTaped(Moment moment) async {
    String type = 'private';

    int targetId = moment.uid;
    bool canSendMsgWhenSayHi =
        await BaseRequestManager.checkCanSendMsgWhenSayHi(targetId, type);

    ///判断是否可以给指定用户发消息
    if (canSendMsgWhenSayHi) {
      MessageContent content = MessageContent(
          'text', SendUser(Session.uid.toString(), Session.name, Session.icon));
      content.content = K.moment_say_hi_v2;
      content.extra = json.encode(MomentUtils.getShareExtra(moment));
      await Im.sendMessage(type, targetId.toString(), content,
          supportVersion: ImSupportSDKVersions.MOMENT_MESSAGE_SUPPORT_VERSION);
    }
    IChatManager chatManager =
        ComponentManager.instance.getManager(ComponentManager.MANAGER_CHAT);
    chatManager.openUserChatScreen(context,
        type: type,
        targetId: targetId,
        title: moment.name,
        refer: 'moment_item_hi');

    trackerReport(
        moment: widget.moment,
        page: widget.page,
        clickType: 'hi',
        topicName: widget.topicName);
    PulseLog.instance.event('click_event', properties: {
      'click_tag': 'moment_${widget.page}_hi_${widget.moment.topicId}',
    });
  }

  void _gotoTagDetail(NormalTag tag) {
    trackerReport(
        moment: widget.moment,
        page: widget.page,
        clickType: 'tag',
        topicName: widget.topicName);

    IMomentManager manager =
        ComponentManager.instance.getManager(ComponentManager.MANAGER_MOMENT);
    manager.openTagListScreenScreen(context,
        tagId: tag.id, title: tag.tag ?? '', pageType: PageType.Tag);
    PulseLog.instance.event('click_event', properties: {
      'click_tag':
          'moment_${widget.page}_tag_${widget.moment.topicId}_${tag.tag}',
    });
  }

  /// 歌友会动态送礼物
  _onGiftTaped() async {
    IGiftManager giftManager =
        ComponentManager.instance.getManager(ComponentManager.MANAGER_GIFT);
    await giftManager.showPrivateGiftPanel(context,
        uid: widget.moment.uid, topicId: widget.moment.topicId.toInt());
    PulseLog.instance.event('click_event', properties: {
      'click_tag': 'moment_${widget.page}_gift_${widget.moment.topicId}',
    });
  }

  /// 评论点击
  _displayInput(BuildContext context) async {
    if (!Session.isLogined) {
      ILoginManager manager =
          ComponentManager.instance.getManager(ComponentManager.MANAGER_LOGIN);
      manager.show(context);
      return;
    }
    trackerReport(
        moment: widget.moment,
        page: widget.page,
        clickType: 'comment',
        topicName: widget.topicName);

    PulseLog.instance.event('click_event', properties: {
      'click_tag': 'moment_${widget.page}_comment_${widget.moment.topicId}',
    });

    Comment? result = await CommentInput.showCommentInput(
      context,
      hintText: '',
      comment: null,
      moment: widget.moment,
      page: widget.page,
      topicName: widget.topicName,
    );

    if (result != null) {
      widget.moment.addComment(result);
      momentModel.putCachedMoment(widget.moment);
    }
  }

  /// 动态点击
  void _onItemTaped(BuildContext context) {
    if (!Session.isLogined) {
      ILoginManager loginManager =
          ComponentManager.instance.getManager(ComponentManager.MANAGER_LOGIN);
      loginManager.show(context);
      return;
    }

    Moment moment = widget.moment;

    IMomentManager manager =
        ComponentManager.instance.getManager(ComponentManager.MANAGER_MOMENT);
    manager.openMomentDetailScreen(context,
        topicId: moment.topicId,
        topicUid: moment.uid,
        parentPage: widget.page,
        onTopChanged: widget.onTopChanged);

    trackerReport(
        moment: widget.moment,
        page: widget.page,
        clickType: 'detail',
        topicName: widget.topicName);
    PulseLog.instance.event('click_event', properties: {
      'click_tag': 'moment_${widget.page}_detail_${widget.moment.topicId}',
    });
  }

  /// at 用户点击
  void _onNoticeUserTaped(MomentNoticePeople user) {
    trackerReport(
        moment: widget.moment,
        page: widget.page,
        clickType: 'mention',
        topicName: widget.topicName);

    IPersonalDataManager personalDataManager = ComponentManager.instance
        .getManager(ComponentManager.MANAGER_PERSONALDATA);
    personalDataManager.openImageScreen(context, user.uid,
        refer: PageRefer(getFlowPage(widget.page)));

    PulseLog.instance.event('click_event', properties: {
      'click_tag':
          'moment_${widget.page}_mention_${widget.moment.topicId}_${user.uid}',
    });
  }

  /// 是否展示普通标签样式，标签在内容下方
  bool get _showNormalTag {
    IMomentManager manager =
        ComponentManager.instance.getManager(ComponentManager.MANAGER_MOMENT);
    return manager.themeConfig.showNormalTag ||
        (MomentFlowPage.Recommend != widget.page &&
            MomentFlowPage.Follow != widget.page);
  }

  Color get _mainTextColor => R.colors.mainTextColor;

  Color get _secondTextColor => R.colors.secondTextColor;

  Color get _thirdTextColor => R.colors.thirdTextColor;

  Color get _brightBgColor => R.colors.brightBgColor;

  Color get _dividerColor => R.colors.dividerColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => _onItemTaped(context),
      child: Container(
        // cornerRadius: 16,
        margin: EdgeInsetsDirectional.only(
            start: 0, end: 0, bottom: widget.bottomMargin),
        padding: EdgeInsetsDirectional.only(
            start: widget.normalDivideLine ? 20 : 16, end: 4, top: 0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            if (widget.showCaseContent && widget.moment.tagsCase != null)
              _JuBenCase(
                  tagsCase: widget.moment.tagsCase!,
                  margin: const EdgeInsets.only(bottom: 10.0)),

            MomentItemHeader(
              moment: widget.moment,
              canHeadTaped: widget.canHeadTaped,
              showFollow: widget.showFollow,
              showDelete: widget.showDelete,
              page: widget.page,
              topicName: widget.topicName,
              mainTextColor: _mainTextColor,
              thirdTextColor: _thirdTextColor,
              brightBgColor: _brightBgColor,
              supportDark: widget.supportDark,
              onMomentDelete: () {
                if (widget.onMomentDelete != null) {
                  widget.onMomentDelete!(widget.moment.topicId);
                }
              },
              onTopChanged: widget.onTopChanged,
            ),

            if (widget.showTestData) _TestData(moment: widget.moment),

            _buildContent(),

            MomentMediaWidget(
              moment: widget.moment,
              canTap: widget.canTagTaped,
              parentTagId: widget.parentTagId,
              showPublishTime: widget.showPublishTime,
              page: widget.page,
              topicName: widget.topicName,
              isInView: widget.isInView,
              autoPlayVideo: widget.autoPlayVideo,
              textColor: _thirdTextColor,
              supportDark: widget.supportDark,
            ),

            // 话题
            if (_showNormalTag &&
                widget.moment.tagsTp != null &&
                widget.moment.tagsTp!.isNotEmpty)
              Padding(
                padding: const EdgeInsetsDirectional.only(end: 16, bottom: 8),
                child: NormalTagsWidget(
                  moment: widget.moment,
                  tags: widget.moment.tagsTp!,
                  canTap: widget.canTagTaped,
                  parentTagId: widget.parentTagId,
                  page: widget.page,
                  topicName: widget.topicName,
                  tagBgColor: _dividerColor,
                  tagBgColors: widget.supportDark
                      ? (darkMode
                          ? [
                              R.colors.bubbleBgColor,
                              R.colors.bubbleBgColor,
                            ]
                          : R.colors.tagGradientColors)
                      : null,
                  tagTextColor: _mainTextColor,
                  supportDark: widget.supportDark,
                ),
              ),

            // 点赞评论数量
            Padding(
              padding: const EdgeInsetsDirectional.only(end: 16, bottom: 12),
              child: SayHiWidget(
                  mainTextColor: _mainTextColor,
                  secondTextColor: _secondTextColor,
                  hiBgColor: _dividerColor,
                  moment: widget.moment,
                  onLikeTaped: (bool isLiked) => _onLikedTaped(isLiked),
                  onCommentTaped: widget.canCommentTaped
                      ? () => _displayInput(context)
                      : null,
                  onSayHiTaped: () => _onSayHiTaped(widget.moment),
                  isGlobalMoment: false,
                  page: MomentFlowPage.SingerClub,
                  onGiftTaped: _onGiftTaped,
                  supportDark: widget.supportDark),
            ),

            // 点赞用户列表
            if (widget.showLikeList &&
                widget.moment.likes != null &&
                widget.moment.likes!.isNotEmpty)
              Container(
                decoration: BoxDecoration(
                  color: _secondTextColor,
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                ),
                margin:
                    const EdgeInsetsDirectional.only(bottom: 8.0, end: 12.0),
                child: LikesWidget(
                  topicId: widget.moment.topicId,
                  topicUid: widget.moment.uid,
                  likes: widget.moment.likes,
                  totalNum: widget.moment.getLikesNum,
                ),
              ),
            // 热门评论
            _buildHotComment(context),
            if (widget.normalDivideLine)
              Padding(
                padding: const EdgeInsetsDirectional.only(
                  start: 0,
                  end: 12,
                ),
                child: Container(
                  height: 0.5,
                  color: R.color.dividerColor,
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildContent() {
    if (TagType.wedding == widget.moment.tagType) {
      return _buildWeddingContent();
    }

    return _buildText();
  }

  /// 文字内容
  Widget _buildText() {
    if ((widget.moment.content == null || widget.moment.content!.isEmpty) &&
        (widget.moment.atUsers == null || widget.moment.atUsers!.isEmpty)) {
      return const SizedBox.shrink();
    }

    return Padding(
      padding: const EdgeInsetsDirectional.only(bottom: 12.0, end: 16),
      child: ExpandableText(
        showTag: !_showNormalTag,
        onTagTap: () => _gotoTagDetail(widget.moment.tagsTp![0]),
        onUserTaped: (user) => _onNoticeUserTaped(user),
        tags: widget.moment.tagsTp,
        text: widget.moment.content,
        style: TextStyle(
            color: _mainTextColor,
            fontSize: 16,
            height: 1.4,
            fontFamily: Util.fontFamily),
        maxLines: EXPAND_TEXT_LINE,
        expand: false,
        atUsers: widget.moment.atUsers,
      ),
    );
  }

  /// 婚礼特定内容
  Widget _buildWeddingContent() {
    return SizedBox(
      height: 96,
      child: Column(
        children: [
          Row(
            children: [
              const Spacer(),
              R.img('circle/moment_wedding_title_left.webp',
                  package: ComponentManager.MANAGER_MOMENT,
                  width: 72,
                  height: 1),
              const SizedBox(width: 5),
              Text(
                DateTime.fromMillisecondsSinceEpoch(
                        widget.moment.tagsWedding!.card!.time * 1000)
                    .toyyyyMMddHHmm(),
                style: TextStyle(
                    fontSize: 10,
                    fontFamily: Util.fontFamily,
                    color: Colors.white,
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(width: 5),
              R.img('circle/moment_wedding_title_right.webp',
                  package: ComponentManager.MANAGER_MOMENT,
                  width: 72,
                  height: 1),
              const Spacer(),
            ],
          ),
          const SizedBox(height: 6),
          Row(
            children: [
              const Spacer(),
              Column(
                children: [
                  CommonAvatar(
                    path: widget.moment.tagsWedding!.card!.manIcon ?? '',
                    shape: BoxShape.circle,
                    size: 40,
                  ).borderExt(Colors.white,
                      width: 2, radius: BorderRadius.circular(22)),
                  Text(
                    widget.moment.tagsWedding!.card!.manName ?? '',
                    textAlign: TextAlign.center,
                    maxLines: 1,
                    style: TextStyle(
                        fontSize: 11,
                        fontFamily: Util.fontFamily,
                        color: Colors.white,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              const SizedBox(width: 32),
              Column(
                children: [
                  CommonAvatar(
                    path: widget.moment.tagsWedding!.card!.womanIcon ?? '',
                    shape: BoxShape.circle,
                    size: 40,
                  ).borderExt(Colors.white,
                      width: 2, radius: BorderRadius.circular(22)),
                  Text(
                    widget.moment.tagsWedding!.card!.womanName ?? '',
                    textAlign: TextAlign.center,
                    maxLines: 1,
                    style: TextStyle(
                        fontSize: 11,
                        fontFamily: Util.fontFamily,
                        color: Colors.white,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              const Spacer(),
            ],
          )
        ],
      ),
    )
        .backgroundExt(R.img('circle/moment_wedding_bg.webp',
            package: ComponentManager.MANAGER_MOMENT))
        .paddingExt(const EdgeInsetsDirectional.only(end: 16));
  }

  /// 热门评论
  Widget _buildHotComment(BuildContext context) {
    if (widget.moment.hotComment == null) {
      return const SizedBox.shrink();
    }
    return Container(
      padding: const EdgeInsetsDirectional.only(start: 2, end: 16),
      child: CommentDetailItem(
          moment: widget.moment,
          comment: widget.moment.hotComment!,
          topicId: widget.moment.topicId,
          topicUid: widget.moment.hotComment?.uid ?? 0,
          isHotComment: true),
    );
  }
}
