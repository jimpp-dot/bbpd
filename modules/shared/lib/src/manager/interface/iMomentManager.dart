import 'dart:io';

import 'package:shared/shared.dart';
import 'package:shared/model/models.dart';
import 'package:flutter/cupertino.dart';

import '../iResourceLoader.dart';

abstract class IMomentManager extends IResourceLoader {
  MomentThemeConfig get themeConfig;

  void initThemeConfig(MomentThemeConfig config);

  /// 打开动态发布页
  /// [showPlaySelect] 展现约玩标签
  /// [caseTag] 凶手案例
  /// [tag] 已选标签
  /// [isTwoStep] 分两步发布
  /// [from] 上一级界面，数据上报
  /// [musicVideoParams] 发布音乐作品的参数
  Future openMomentPublishScreen(BuildContext context,
      {Key? key,
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
      Map<String, String>? musicVideoParams});

  /// 发送特定类型的动态
  Future<String> publishSpecificMoment({
    Key? key,
    String text = '',
    int? type,
    Map<String, dynamic>? ext,
  });

  /// 打开动态详情页
  /// [topicId]  动态id
  /// [topicUid] 动态作者uid
  /// [showInput] 展现输入框
  Future openMomentDetailScreen(
    BuildContext context, {
    Key? key,
    required int topicId,
    required int topicUid,
    required MomentFlowPage parentPage,
    bool? showInput,
    VoidCallback? onTopChanged,
  });

  /// 打开动态分组选择界面
  Future openGroupSelectScreen(BuildContext context,
      {Key? key, GroupItem? select});

  /// 打开点赞列表
  /// [topicId]  动态id
  /// [topicUid] 动态作者uid
  Future openLikeListScreen(BuildContext context,
      {Key? key, required int topicId, required int topicUid});

  /// 打开标签列表
  /// [title] 标题
  /// [tagId] 标签id
  Future openTagListScreenScreen(BuildContext context,
      {Key? key,
      required String title,
      required int tagId,
      dynamic pageType,
      String? icon,
      String? pageTypeStr});

  /// 打开约玩列表
  /// [title]  标题
  /// [gameId] 约玩标签游戏id
  Future openGameTagListScreenScreen(BuildContext context,
      {Key? key, required String title, required int gameId});

  /// 打开话题详情页
  /// [tagId] 话题id
  /// [tagName] 话题名称
  Future openTopicDetailScreen(BuildContext context,
      {Key? key, required int tagId, required String tagName});

  /// 打开标签列表
  /// [title] 标题
  /// [tagId] 标签id
  Future openCaseTagListScreenScreen(BuildContext context,
      {Key? key, required String title, required int tagId, String? icon});

  /// 打开互动消息通知页面(IM消息源)
  Future openMomentImMsgListScreen(BuildContext context);

  /// 获取话题列表
  Widget getTopicListPage(BuildContext context,
      {required int tagId, String? tagName});

  /// 动态相册
  Future<ResCirclePics> getCirclePics(int uid, int tpid);

  /// 打开动态用户推荐
  Future openMomentFollowRecommendScreen(BuildContext context,
      {bool isNewUser = false, String? refer});

  /// 打开动态广播
  Future openGlobalMomentListScreen(BuildContext context);

  /// 获取关注button
  Widget getFollowButton(
      BuildContext context, bool isFollow, VoidCallback callback);

  /// 获取折叠控件
  Widget getExpandableText(BuildContext context,
      {String? text, TextStyle? style, int? maxLines, bool? expand});

  Future showPhotoViewGalleryScreen(
      BuildContext context, List<ImageBean> images, int index);

  Widget getMomentListPage(BuildContext context,
      {bool autoPlayVideo = false, bool showLikeList = false});

  Widget getRecommendPage(BuildContext context,
      {bool isTestPage = false, bool autoPlayVideo = false});

  /// 获取故事评论列表
  Widget getStoryCommentListPage(BuildContext context,
      {int? tagId, String? tagName});

  void openAppraiserCommentPublishScreen(BuildContext context,
      {int? tagId, String? tagName});

  /// 打开评论列表面板
  Future showCommentPanel(BuildContext context, int topicId, int topicUid);

  /// 打开全部俱乐部
  Future openAllClubScreen(BuildContext context);

  /// 打开游戏俱乐部
  Future openClubDetailScreen(BuildContext context, int clubId,
      {String? clubName});

  /// 评论动态
  Future<DataRsp<Comment>> postComment(
    String topicId,
    int topicUid,
    String content, {
    int toUid = 0,
    String ReferCmtId = '0',
    int contentType = 0,
    int startTime = 0,
    int duration = 0,
  });

  /// 删除动态评论
  Future<DataRsp<dynamic>> cancelComment(
      int topicId, int topicUid, String cmtid);

  /// 是否需要显示小心情
  Future<bool> showSmallMoodEntryRedPoint();

  /// 话题广场
  Future openTopicSquareScreen(BuildContext context, {String? tab});

  /// 广场创作达人弹窗
  Future<bool?> showSquarePopup(BuildContext context, Object bean);

  /// 动态一周统计情报局
  Future openMomentWeekStatisticPage(BuildContext context);

  /// 动态一周统计情报局弹窗
  Future openMomentWeekStatisticDialog(
      BuildContext context, RespGetCfg_GetCfgData data);
}
