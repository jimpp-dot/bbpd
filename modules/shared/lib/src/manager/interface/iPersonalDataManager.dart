import 'package:shared/shared.dart';
import 'package:shared/model/models.dart';
import 'package:shared/src/manager/iResourceLoader.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

enum AudioRecordType {
  editAudio, //个人资料修改
  receptionAuth, //接待认证
  receptionShow, //接待才艺展示
  quickReply, // GS语音快捷回复
  common, //其他通用语音上传
}

class ImageScreenTabType {
  static const String info = 'ImageScreen_Tab_Info'; //资料
  static const String zone = 'ImageScreen_Tab_Zone'; // 空间
  static const String skill = 'ImageScreen_Tab_Skill'; //技能
  static const String moment = 'ImageScreen_Tab_Moment'; //朋友圈动态
  static const String guardianRelation =
      'ImageScreen_guardian_relation'; // 守护关系
  static const String game = 'ImageScreen_Tab_Game'; //游戏卡
  static const String create = 'ImageScreen_Tab_Create'; //创作
  static const String accompany_house = 'ImageScreen_Tab_Accompany_House';

  /// 陪伴小屋
}

abstract class IPersonalDataManager extends IResourceLoader {
  /// 显示技能相关UI
  bool showSkill = true;

  /// 定制个人页的显示内容
  /// [showSkill] 展示技能
  /// [showLiteGame] 展示小游戏
  /// [showInterest] 展示兴趣标签
  /// [showMoments] 展示朋友圈
  void customImageScreen({
    bool showSkill = true,
    bool showLiteGame = true,
    bool showInterest = true,
    bool showMoments = false,
    bool showRoleTitle = false,
    bool showDefendBuyEnter = true,
  });

  ///
  void openImageViewScreen(BuildContext context,
      {String image = '', String heroTag = ''});

  ///
  void openImagesViewScreen(BuildContext context,
      {List<Photo> photos, int index, PersonInfo info, bool isFollowed});

  ///
  Future openImageScreen(
    BuildContext context,
    int uid, {
    int rid = 0,
    PageRefer? refer,
    String? initialTabName,
    bool fromMatch = false,
    bool fromSayHiMatch = false,
    bool fromNearby = false,
    bool showMoment = false,
    String? searchContent,
    String? initialTab,
    bool initialScrollToTabBar = false,
  });

  /// 获取房间个人资料卡widget
  Widget getImageFloatScreen(
    BuildContext context, {
    int uid = 0,
    chatRoomData,
    int from = 0,
    Color? background,
    bool isOffline = false,
    int toRid = 0,
    String nameReplace = '',
    String avatarUrlReplace = '',
  });

  /// 打开房间个人资料卡
  Future openImageFloatScreenDisplayModalBottomSheet(
    BuildContext context,
    int uid,
    chatRoomData,
    int from, {
    bool isOffline = false,
    String nameReplace = '',
    String avatarUrlReplace = '',
    bool useEmptyRoom = false,
    int chatGroupId = 0,
    int toRid = 0, // 去往另一个房间
    Widget? dmWidget,
  });

  /// 打开资料修改页
  /// targetPage 再次进入二级目标页面标识，查看更多[ImageModifyScreen]
  Future openImageModifyScreen(
    BuildContext context, {
    String interest = '',
    bool showSignature = true,
    bool showJob = true,
    bool showAudio = true,
    bool crop = false,
    int targetPage = 0,
  });

  ///以showModalBottomSheet方式打开UserDefendBuy,并且操作后给出操作结果
  Future<bool?> openUserDefendBuyShowModalBottomSheet(BuildContext context,
      {int uid = 0});

  Future openNearByScreen(BuildContext context);

  Future openReportScreen(
    BuildContext context, {
    Key? key,
    required ReportType reportType,
    int reportId = 0,
    int uid = 0,
    String category = '',
    List<MessageContent>? msgList,
  });

  /// 打开图片预览页
  Future openImagesPreviewScreen(BuildContext context,
      {List<String>? photos, int selectIndex = 0});

  void showGameInfoPage(BuildContext context, int uid);

  /// 显示礼物墙
  void showGiftWall(BuildContext context, int targetUid,
      {VoidCallback? giftCountChange});

  Future<bool?> showDefendListScreen(BuildContext context, int uid);

  Widget getOnlineMatchWidget();

  void showFastMatchWidget(BuildContext context);

  Future<List<String>?> getFirstMatchGuideIcons();

  Future<Map<String, String>?> getSimpleMatchInfo();

  void showMatchMessageList(BuildContext context);

  Future<Map<String, String>?> getUnReadMatchMessageCount();

  /// 打开录制声音
  Future openAudioRecord(BuildContext context,
      {AudioRecordType? type,
      int duration = 0,
      int minDuration = 0,
      String url = '',
      String bgAsset = '',
      int verifyId = 0,
      Function(String)? uploadedFunc,
      Iterable<Future Function()>? afterUploaded});

  void openCreditRecordScreen(BuildContext context);

  String getJobLabel(int job);

  Widget getPhotos({List? photos, double width = 0, bool enableVideo = false});

  void loadJobs();

  Widget getAudioRecorderWidget(
      {dynamic onCompleted,
      int maximumDuration = 0,
      dynamic onFinish,
      VoidCallback? onStartRecord,
      VoidCallback? onDelete,
      String? audioUrl,
      int duration = 0,
      required double maxBottomMargin,
      int minDuration = 0,
      AudioRecordType? type,
      bool supportDark = false});

  Widget getDefendItem(
      {DefendRelationModel? item,
      int uid = 0,
      double ratio = 0,
      VoidCallback? refresh});

  Widget getSpecialDefendItem(
      {DefendRelationModel? item, int uid = 0, VoidCallback? refresh});

  Future<bool?> openAllDefendRelationScreen(BuildContext context, int uid);

  Future<void> openDefendManagerScreen(BuildContext context);

  Future<void> openDefendSecretGardenScreen(BuildContext context, int uid);

  Widget getDefendMicLineWidget(
      int level, int position, double width, int category);

  String getConstellationByBirthday(String birthday);

  String getAgeDecadeByBirthday(String birthday);

  void openAchieveWallPage(BuildContext context, int uid);

  Future showCpHouseMainPage(BuildContext context, int uid, int locationIndex);

  // ------收藏室------//
  /// 收藏室物品展示组件
  /// [targetUid] 目标用户Uid
  Widget getCollectionDisplayWidget(BuildContext context,
      {int targetUid = 0, List<dynamic>? commodityItems});

  /// 收藏室页面
  /// [targetUid] 目标用户Uid,预留
  Future<bool> showCollectionRoomPage(BuildContext context,
      {int targetUid = 0});

  /// 主播卡推荐页面
  Future<bool?> showGameMasterRankPage(BuildContext context);

  /// 编辑个人扩展资料
  Future<NormalNull> editSingleInfo(Map<String, String> info);

  /// 礼物墙
  void openGiftWallIntimacyScreen(
      BuildContext context, int targetUid, VoidCallback giftCountChange,
      {int firstIndex = 0, int secondTabId = 0});

  /// 礼物墙2.0
  void openGiftWallScreen(BuildContext context, int targetUid,
      {String roomType = '', int rid = 0, int giftId = 0, int initIndex = 0});

  /// 弹窗跳转礼物墙2.0
  void showGiftWallDialog(
      BuildContext context, int targetUid, int giftId, String giftName,
      {String roomType = '', int rid = 0});

  /// 礼物墙入口panel
  Widget getGiftWallPanelWidget(int uid, int lightNum, int totalNum,
      int rankNum, String levelIcon, List<GiftQualityMeta> medalList,
      {String refer = '', String roomType = '', int rid = 0});

  /// 打开我与某人的陪伴记页面
  Future openAccompanyRemember(BuildContext context, int targetUid);

  /// 打开亲密卡主页面
  Future openIntimacyCardPage(BuildContext context);

  /// 亲密卡Im消息卡片
  Widget getIntimateCardIm(MessageContent message, Map extra, bool me,
      String? sentText, Widget? iconView, String? targetName);

  /// 亲密付赠送页面
  /// [toUser] 赠送用户信息
  /// [message] 默认留言
  /// [cardId] 亲密卡id
  Future openIntimacyPayBindPage(BuildContext context,
      {IntimateCardRelationUserInfo? toUser, String? message, int cardId = 0});

  /// 聊愈师首页-主播up列表页
  Future openHealerMainPage(BuildContext context);

  /// 打开集星兑换页
  Future openCpLinkStarExchangePage(BuildContext context);
}
