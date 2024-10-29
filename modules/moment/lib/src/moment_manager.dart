import 'dart:io';

import 'package:shared/shared.dart';
import 'package:shared/model/models.dart';
import 'package:flutter/widgets.dart';
import 'package:moment/moment.dart';
import 'package:moment/src/club/all_club_page.dart';
import 'package:moment/src/page/follow_recommend_list_screen/view.dart';
import 'package:moment/src/page/group_select_screen.dart';
import 'package:moment/src/page/moment_detail_screen.dart';
import 'package:moment/src/page/moment_im_msg_list_screen.dart';
import 'package:moment/src/page/moment_publish_screen.dart';
import 'package:moment/src/page/moment_tag_screen.dart';
import 'package:moment/src/page/square_master_dialog.dart';
import 'package:moment/src/page/topic_detail_screen.dart';
import 'package:moment/src/page/topic_square_page.dart';
import 'package:moment/src/statistic/moment_week_statistic_dialog.dart';
import 'package:moment/src/statistic/moment_week_statistic_page.dart';

import 'club/club_detail_screen.dart';
import 'model/pb/generated/square.pb.dart';
import 'page/global_moment_list/view.dart';
import 'page/moment_likes_screen.dart';
import 'widget/comment_pannel.dart';
import 'package:provider/provider.dart' hide Selector;

class MomentManager extends IMomentManager {
  MomentManager() {
    globalProviders
        .add(ChangeNotifierProvider(create: (_) => MomentModel(), lazy: false));
    globalProviders.add(ChangeNotifierProvider(
        create: (_) => MomentVideoProvider(), lazy: false));
  }

  MomentThemeConfig? _config;

  @override
  MomentThemeConfig get themeConfig => _config ?? MomentThemeConfig();

  @override
  void initThemeConfig(MomentThemeConfig? config) {
    _config = config;
  }

  @override
  void loadStrings() {}

  /// 打开动态详情页
  /// [topicId]  动态id
  /// [topicUid] 动态作者uid
  /// [showInput] 展现输入框
  @override
  Future openMomentDetailScreen(
    BuildContext context, {
    Key? key,
    required int topicId,
    required int topicUid,
    required MomentFlowPage parentPage,
    bool? showInput,
    VoidCallback? onTopChanged,
  }) {
    return MomentDetailScreen.openMomentDetailScreen(
      context,
      topicId: topicId,
      tUid: topicUid,
      showInput: showInput ?? false,
      parentPage: parentPage,
      onTopChanged: onTopChanged,
    );
  }

  /// 打开动态布页
  /// [showGroupSelect] 展现分组选择
  /// [showPlaySelect] 展现约玩标签
  /// [isTwoStep] 标签和发布分开，2个步骤
  /// [caseTag] 凶手案例
  /// [tag] 已选标签
  @override
  Future<Moment?> openMomentPublishScreen(
    BuildContext context, {
    Key? key,
    bool showPlaySelect = false,
    bool isTwoStep = false,
    bool? showGroupSelect,
    dynamic caseTag,
    dynamic appraiserTag,
    String? tag,
    String? from,
    List<File>? initImages,
    File? initVideo,
    Map? tagJson,
    bool needNotify = false,
    int? musicId,
    Map<String, String>? musicVideoParams,
  }) async {
    if (!Session.isLogined) {
      ILoginManager manager =
          ComponentManager.instance.getManager(ComponentManager.MANAGER_LOGIN);
      manager.show(context);
      return null;
    }
    CaseTag? cTag = MomentUtils.getCaseTag(tagJson);
    if (cTag == null && caseTag is CaseTag) {
      cTag = caseTag;
    }
    return MomentPublishScreen.openMomentPublishScreen(
      context,
      key: key,
      showPlaySelect: showPlaySelect,
      showGroupSelect: showGroupSelect ?? themeConfig.showGroupSelect,
      caseTag: cTag,
      appraiserTag: appraiserTag,
      isTwoStep: isTwoStep,
      tag: tag,
      from: from,
      initImages: initImages,
      initVideo: initVideo,
      musicId: musicId,
      musicVideoParams: musicVideoParams,
    );
  }

  /// 发送特定类型的动态
  @override
  Future<String> publishSpecificMoment({
    Key? key,
    String text = '',
    int? type,
    Map<String, dynamic>? ext,
  }) async {
    if (!Session.isLogined) {
      ILoginManager manager =
          ComponentManager.instance.getManager(ComponentManager.MANAGER_LOGIN);
      manager.show(System.context);
      return '未登录';
    }

    PublishMomentModel model = PublishMomentModel(status: PageStatus.None);
    DataRsp<Moment> response = await Api.postMoment('text', Session.uid, text,
        location: model.selectLocation,
        latitude: model.latitude,
        longitude: model.longitude,
        auth: "public",
        tags: model.selectTags,
        gameTag: model.selectPlayTags.value,
        caseTag: model.caseTag,
        isWedding: type == 1,
        ext: ext);

    return response.success == true ? '' : (response.msg ?? '');
  }

  /// 打开动态分组选择界面
  @override
  Future openGroupSelectScreen(BuildContext context,
      {Key? key, GroupItem? select}) {
    return GroupSelectScreen.openGroupSelectScreen(context, select: select);
  }

  /// 打开点赞列表
  /// [topicId]  动态id
  /// [topicUid] 动态作者uid
  @override
  Future openLikeListScreen(BuildContext context,
      {Key? key, required int topicId, required int topicUid}) {
    return MomentLikesScreen.openMomentLikesScreen(context,
        topicUid: topicUid, topicId: topicId);
  }

  /// 打开标签列表
  /// [title] 标题
  /// [tagId] 标签id
  @override
  Future openTagListScreenScreen(
    BuildContext context, {
    Key? key,
    required String title,
    required int tagId,
    dynamic pageType = PageType.Tag,
    String? icon,
    String? pageTypeStr,
  }) {
    PageType pType = pageType;
    PageType? psType = MomentUtils.getPageType(pageTypeStr);
    if (psType != null) {
      pType = psType;
    }
    if (PageType.Tag == pType) {
      return TopicDetailScreen.openTopicDetailScreen(context,
          key: key, tagId: tagId, tagName: title);
    }
    return MomentTagScreen.openMomentTagScreen(context,
        key: key, title: title, id: tagId, type: pType, icon: icon);
  }

  /// 打开约玩列表
  /// [title]  标题
  /// [gameId] 约玩标签游戏id
  @override
  Future openGameTagListScreenScreen(BuildContext context,
      {Key? key, required String title, required int gameId}) {
    return MomentTagScreen.openMomentTagScreen(context,
        key: key, title: title, id: gameId, type: PageType.PlayTag);
  }

  @override
  Future openTopicDetailScreen(BuildContext context,
      {Key? key, required int tagId, String? tagName}) {
    return TopicDetailScreen.openTopicDetailScreen(context,
        key: key, tagId: tagId, tagName: tagName ?? '');
  }

  @override
  Future openCaseTagListScreenScreen(BuildContext context,
      {Key? key, String? title, required int tagId, String? icon}) {
    return MomentTagScreen.openMomentTagScreen(context,
        key: key,
        title: title ?? '',
        id: tagId,
        icon: icon,
        type: PageType.Case);
  }

  @override
  Future openMomentImMsgListScreen(BuildContext context) {
    return MomentImMsgListScreen.openMessageListScreen(context);
  }

  @override
  Widget getTopicListPage(BuildContext context,
      {required int tagId, String? tagName}) {
    return TopicListPage(
        tagId: tagId, pageType: PageType.Tag, tagName: tagName);
  }

  @override
  Future<ResCirclePics> getCirclePics(int uid, int tpid) async {
    return Api.getCirclePics(uid, tpid);
  }

  @override
  Future openMomentFollowRecommendScreen(BuildContext context,
      {bool isNewUser = false, String? refer}) {
    return MomentFollowRecommendListScreen.openMomentFollowRecommendListPage(
        context,
        isNewUser: isNewUser,
        fromRefer: refer);
  }

  @override
  Future openGlobalMomentListScreen(BuildContext context) {
    return GlobalMomentListScreen.openGlobalMomentScreen(context);
  }

  @override
  Widget getFollowButton(
      BuildContext context, bool isFollow, VoidCallback? callback) {
    return FollowButton(
      isFollow: isFollow,
      onFollowTap: () async {
        if (callback != null) {
          callback();
        }
      },
    );
  }

  @override
  Widget getExpandableText(BuildContext context,
      {String? text, TextStyle? style, int? maxLines, bool? expand}) {
    return ExpandableText(
      text: text,
      style: style,
      maxLines: maxLines,
      expand: expand,
    );
  }

  @override
  Future showPhotoViewGalleryScreen(
      BuildContext context, List<ImageBean> images, int index) {
    return PhotoViewGalleryScreen.showPhotoViewGalleryScreen(
      context,
      images: images,
      index: index,
    );
  }

  @override
  Widget getMomentListPage(BuildContext context,
      {bool autoPlayVideo = false, bool showLikeList = false}) {
    return MomentListPage(
        autoPlayVideo: autoPlayVideo, showLikeList: showLikeList);
  }

  @override
  Widget getRecommendPage(BuildContext context,
      {bool isTestPage = false, bool autoPlayVideo = false}) {
    return RecommendPage(isTestPage: isTestPage, autoPlayVideo: autoPlayVideo);
  }

  @override
  Widget getStoryCommentListPage(BuildContext context,
      {int? tagId, String? tagName}) {
    return ChangeNotifierProvider(
      create: (_) => MomentModel(),
      lazy: false,
      child: TopicListPage(
        tagId: tagId ?? 0,
        pageType: PageType.Appraiser,
        tagName: tagName,
      ),
    );
  }

  @override
  void openAppraiserCommentPublishScreen(BuildContext context,
      {int? tagId, String? tagName}) async {
    Log.d('openAppraiserCommentPublishScreen tagid=$tagId tagName=$tagName');
    if (!Session.isLogined) {
      ILoginManager manager =
          ComponentManager.instance.getManager(ComponentManager.MANAGER_LOGIN);
      manager.show(context);
      return;
    }

    IMomentManager momentManager =
        ComponentManager.instance.getManager(ComponentManager.MANAGER_MOMENT);
    Moment? moment = await momentManager.openMomentPublishScreen(context,
        showPlaySelect: false,
        appraiserTag: AppraiserTag(tagId ?? 0, tagName ?? ''),
        tag: tagName ?? '');
    if (moment != null) {
      MomentModel momentModel =
          Provider.of<MomentModel>(context, listen: false);
      momentModel.notify();
    }
  }

  @override
  Future showCommentPanel(BuildContext context, int topicId, int topicUid) {
    return CommentPanel.show(context, topicId, topicUid);
  }

  /// 打开全部俱乐部
  @override
  Future openAllClubScreen(BuildContext context) {
    return AllClubPage.show(context);
  }

  /// 打开游戏俱乐部
  @override
  Future openClubDetailScreen(BuildContext context, int clubId,
      {String? clubName}) {
    return ClubDetailScreen.show(context, clubId, clubName: clubName);
  }

  @override
  Future<DataRsp<Comment>> postComment(
      String topicId, int topicUid, String content,
      {int toUid = 0,
      String ReferCmtId = '0',
      int contentType = 0,
      int startTime = 0,
      int duration = 0}) async {
    return Api.postComment(topicId, topicUid, content,
        toUid: toUid,
        ReferCmtId: ReferCmtId,
        contentType: contentType,
        startTime: startTime,
        duration: duration);
  }

  @override
  Future<DataRsp<dynamic>> cancelComment(
      int topicId, int topicUid, String cmtid) {
    return Api.cancelComment(topicId, topicUid, cmtid);
  }

  @override
  Future<bool> showSmallMoodEntryRedPoint() async {
    ResCircleTabRedPoint resp = await Api.getSmallMoodUnreadNum();
    return resp.success == true && Util.parseInt(resp.data.unreadMoodNum) > 0;
  }

  @override
  Future openTopicSquareScreen(BuildContext context, {String? tab}) {
    return TopicSquarePage.openTopicSquareScreen(context,
        tab: (Util.validStr(tab) ? tab : TopicSquareTab.Recommend));
  }

  @override
  Future<bool?> showSquarePopup(BuildContext context, Object bean) async {
    if (bean is SquarePopupRsp) {
      return SquareMasterDialog.show(context, bean);
    } else {
      return Future.value(false);
    }
  }

  @override
  Future openMomentWeekStatisticPage(BuildContext context) {
    return MomentWeekStatisticPage.launch(context);
  }

  @override
  Future openMomentWeekStatisticDialog(
      BuildContext context, RespGetCfg_GetCfgData data) {
    return MomentWeekStatisticDialog.show(context, data);
  }
}
