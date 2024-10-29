import 'package:shared/shared.dart';
import 'package:shared/model/models.dart';
import 'package:flutter/material.dart';
import 'package:personaldata/personaldata.dart';
import 'package:personaldata/src/collection_room/collection_room_util.dart';
import 'package:personaldata/src/collection_room/page/display/collection_display_widget.dart';
import 'package:personaldata/src/collection_room/page/main/collection_room_main_page.dart';
import 'package:personaldata/src/game_master/game_master_rank_screen.dart';
import 'package:personaldata/src/healer/healer_main_page.dart';
import 'package:personaldata/src/intimate_card/intimate_card_bind_page.dart';
import 'package:personaldata/src/match/online_match_widget.dart';
import 'package:personaldata/src/page/accompany_remember/accompany_remember_oneself_list_screen.dart';
import 'package:personaldata/src/page/all_defend_relation_screen.dart';
import 'package:personaldata/src/page/audio_record_screen.dart';
import 'package:personaldata/src/page/credit_record_screen.dart';
import 'package:personaldata/src/page/defend_relation_manage_screen.dart';
import 'package:personaldata/src/page/game_info_page.dart';
import 'package:personaldata/src/page/reportScreen.dart';
import 'package:personaldata/src/page/userDefendList.dart';
import 'package:personaldata/src/intimate_card/intimate_card_main_page.dart';
import 'package:personaldata/src/personal_util.dart';
import 'package:personaldata/src/star_exchange/cplink_star_exchange_page.dart';
import 'package:personaldata/src/widget/defend_mic_line_widget.dart';
import 'package:personaldata/src/widget/defend_relation_item.dart';

import '../assets.dart';
import 'achievement_wall/page/achievement_wall_screen.dart';
import 'cp_small_house/page/create_house_main_screen.dart';
import 'gift_wall/page/gift_wall_intimacy_screen.dart';
import 'gift_wall_v2/page/gift_wall_center_page.dart';
import 'gift_wall_v2/page/awake_dialog.dart';
import 'gift_wall_v2/widget/gift_wall_panel_widget.dart';
import 'intimate_card/intimate_card_im.dart';
import 'match/match_user_list_page.dart';
import 'match/model/match_bean.dart';
import 'page/defend_secret_garden_screen.dart';
import 'page/imageFloatScreen.dart';
import 'page/imageModify.dart' hide Photos;
import 'page/imageScreen.dart';
import 'page/nearby.dart';
import 'page/userDefend.dart';
import 'widget/audioRecorderWidget.dart';
import 'widget/special_defend_relation_item.dart';

class PersonalDataManager extends IPersonalDataManager {
  @override
  void customImageScreen({
    bool showSkill = true,
    bool showLiteGame = true,
    bool showInterest = true,
    bool showMoments = false,
    bool showRoleTitle = false,
    bool showDefendBuyEnter = true,
  }) {
    ImageScreen.showSkill = showSkill;
    ImageScreen.showLiteGame = showLiteGame;
    ImageScreen.showInterest = showInterest;
    ImageScreen.showMoment = showMoments;
    ImageScreen.showRoleTitle = showRoleTitle;

    this.showSkill = showSkill;
  }

  @override
  void openImageViewScreen(BuildContext context,
      {String image = '', String heroTag = ''}) {
    ImageViewScreen.openImageViewScreen(context, image, heroTag: heroTag);
  }

  @override
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
  }) {
    return ImageScreen.show(
      context,
      uid,
      rid: rid,
      refer: refer,
      fromMatch: fromMatch,
      fromSayHiMatch: fromSayHiMatch,
      fromNearby: fromNearby,
      searchContent: searchContent ?? '',
      initialTab: initialTab ?? '',
    );
  }

  @override
  Widget getImageFloatScreen(BuildContext context,
      {int uid = 0,
      chatRoomData,
      int from = 0,
      bool isOffline = false,
      int toRid = 0,
      Color? background,
      String nameReplace = '',
      String avatarUrlReplace = ''}) {
    return ImageFloatScreen(
      uid: uid,
      room: chatRoomData,
      from: from,
      isOffline: isOffline,
      toRid: toRid,
      background: background,
      nameReplace: nameReplace,
      avatarUrlReplace: avatarUrlReplace,
    );
  }

  @override
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
    int toRid = 0,
    Widget? dmWidget,
  }) {
    return ImageFloatScreen.show(
      context,
      uid,
      chatRoomData,
      from,
      isOffline: isOffline,
      nameReplace: nameReplace,
      avatarUrlReplace: avatarUrlReplace,
      useEmptyRoom: useEmptyRoom,
      chatGroupId: chatGroupId,
      toRid: toRid,
    );
  }

  /// [showJob] 是否展现职业
  /// [showSignature] 是否展现签名
  /// [showAudio] 扩列卡音频信息
  /// [crop] 是否裁剪形象照
  /// [targetPage] 再次进入二级目标页面标识,详细查看[ImageModifyScreen]
  @override
  Future openImageModifyScreen(
    BuildContext context, {
    String interest = '',
    bool showSignature = true,
    bool showJob = true,
    bool showAudio = true,
    bool crop = false,
    int targetPage = 0,
  }) {
    return ImageModifyScreen.showImageModifyScreen(
      context,
      showAudio: showAudio,
      showJob: showJob,
      showSignature: showSignature,
      crop: crop,
      targetPage: targetPage,
    );
  }

  @override
  Future<bool?> openUserDefendBuyShowModalBottomSheet(BuildContext context,
      {int uid = 0}) {
    return UserDefendBuy.showUserDefendBuy(context, uid: uid);
  }

  @override
  void openImagesViewScreen(BuildContext context,
      {List<Photo>? photos,
      int index = 0,
      PersonInfo? info,
      bool isFollowed = false}) {
    SourceData source = SourceData();
    for (int i = 0, len = photos?.length ?? 0; i < len; i++) {
      Photo item = photos![i];
      if (item.type == 'video') {
        source.add(SourceItem(
            SourceTypes.Video, System.imageDomain + (item.path ?? '')));
      } else {
        source.add(SourceItem(SourceTypes.Image,
            '${System.imageDomain}${item.image ?? ''}!skill750'));
      }
    }
    Navigator.of(context).push(
      MaterialPageRoute(
          builder: (BuildContext context) {
            return ImagesViewScreen(
              source: source,
              index: index,
              info: info,
              isFollowed: isFollowed,
            );
          },
          settings: const RouteSettings(name: '/person_images'),
          fullscreenDialog: true),
    );
  }

  @override
  Future openNearByScreen(BuildContext context) {
    return Nearby.openNearByScreen(context);
  }

  /// 打开举报页面
  /// [tpid] 动态id
  /// [rid] 房间id
  /// [category] 交友卡
  /// [reportType] 举报类型
  /// [reportId] 举报对象id
  @override
  Future openReportScreen(
    BuildContext context, {
    Key? key,
    required ReportType reportType,
    int reportId = 0,
    int uid = 0,
    String category = '',
    List<MessageContent>? msgList,
  }) {
    return ReportScreen.show(
      context,
      uid: uid,
      category: category,
      reportType: reportType,
      reportId: reportId,
      msgList: msgList,
    );
  }

  @override
  Future openImagesPreviewScreen(BuildContext context,
      {List<String>? photos, int selectIndex = 0}) {
    SourceData source = SourceData();
    for (int i = 0; i < (photos?.length ?? 0); i++) {
      Photo item = Photo.fromParams(photos![i], '0', '', i);
      source.add(SourceItem(SourceTypes.Image, '${item.image ?? ''}!skill750'));
    }
    return Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) {
          return ImagesViewScreen(
            source: source,
            index: selectIndex,
          );
        },
        settings: const RouteSettings(name: '/person_images'),
        fullscreenDialog: true,
      ),
    );
  }

  @override
  void showGameInfoPage(BuildContext context, int uid) {
    return GameInfoPage.show(context, uid: uid);
  }

  @override
  void showGiftWall(BuildContext context, int targetUid,
      {VoidCallback? giftCountChange}) {
    GiftWallIntimacyScreen.show(context, targetUid, giftCountChange);
  }

  @override
  Future<bool?> showDefendListScreen(BuildContext context, int uid) {
    return openAllDefendRelationScreen(context, uid);
  }

  @override
  Widget getOnlineMatchWidget() {
    return const OnlineMatchPage();
  }

  @override
  void showFastMatchWidget(BuildContext context) {
    FastMatchWidget.show(context);
  }

  @override
  Future<List<String>?> getFirstMatchGuideIcons() async {
    RecommendUserListResponse response =
        await MatchRepository.getRecommendMatchUsers();
    if (response.success == true && response.items != null) {
      List<String> icons = [];
      for (var element in response.items!) {
        icons.add(element.icon ?? '');
      }
      return icons;
    } else {
      return null;
    }
  }

  @override
  Future<Map<String, String>?> getSimpleMatchInfo() async {
    MatchSimpleInfoResponse response =
        await MatchRepository.getMatchSimpleInfo();
    if (response.success == true) {
      Map<String, String> map = <String, String>{};
      map['matchLikeNum'] = '${response.likeNum}';
      map['matchResidueNum'] = '${response.residueNum}';
      map['count'] = '${response.count}';
      return map;
    } else {
      return null;
    }
  }

  @override
  void showMatchMessageList(BuildContext context) {
    MatchUserListPage.show(context);
  }

  @override
  Future<Map<String, String>?> getUnReadMatchMessageCount() async {
    MatchMessageInfoResponse response =
        await MatchRepository.getMatchMessageInfo();
    if (response.success == true) {
      Map<String, String> map = <String, String>{};
      map['time'] = '${response.time}';
      map['count'] = '${response.count}';
      map['message'] = response.message;
      return map;
    } else {
      return null;
    }
  }

  @override
  Future openAudioRecord(BuildContext context,
      {AudioRecordType? type,
      int duration = 0,
      int minDuration = 0,
      String url = '',
      String bgAsset = '',
      int verifyId = 0,
      Function(String)? uploadedFunc,
      Iterable<Future Function()>? afterUploaded}) {

    String newBgAsset = Assets.personaldata$audio_bg_bg ;

    return AudioRecordScreen.show(context,
        type: type ?? AudioRecordType.editAudio,
        duration: duration,
        minDuration: minDuration,
        url: url,
        bgAsset: newBgAsset,
        verifyId: verifyId,
        uploadedFunc: uploadedFunc,
        afterUploaded: afterUploaded);
  }

  @override
  void openCreditRecordScreen(BuildContext context) {
    CreditRecordScreen.show(context);
  }

  @override
  String getJobLabel(int job) {
    return Job.getLabel(job);
  }

  @override
  Widget getPhotos({List? photos, double width = 0, bool enableVideo = false}) {
    return Photos(
      photos: photos != null ? (photos as List<ImageVideoItem>) : [],
      width: width,
      enableVideo: enableVideo,
    );
  }

  @override
  void loadJobs() async {
    if (Job.needInit()) {
      await Job.init();
    }
  }

  @override
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
      bool supportDark = false}) {
    return AudioRecorderWidget(
        onCompleted: onCompleted,
        maximumDuration: maximumDuration,
        onFinish: onFinish,
        onStartRecord: onStartRecord,
        onDelete: onDelete,
        audioUrl: audioUrl,
        duration: duration,
        maxBottomMargin: maxBottomMargin,
        minDuration: minDuration,
        type: type ?? AudioRecordType.editAudio,
        supportDark: supportDark);
  }

  @override
  Widget getDefendItem(
      {DefendRelationModel? item,
      int uid = 0,
      double ratio = 0,
      VoidCallback? refresh}) {
    return DefendRelationItem(
      item: item,
      uid: uid,
      ratio: ratio,
      refresh: refresh,
    );
  }

  @override
  Widget getSpecialDefendItem(
      {DefendRelationModel? item, int uid = 0, VoidCallback? refresh}) {
    return SpecialDefendRelationItem(
      item: item,
      uid: uid,
      refresh: refresh,
    );
  }

  @override
  Future<bool?> openAllDefendRelationScreen(BuildContext context, int uid) {
    return AllDefendRelationScreen.show(context, uid);
  }

  @override
  Future<void> openDefendManagerScreen(BuildContext context) {
    return DefendRelationManageScreen.show(context);
  }

  @override
  Future<void> openDefendSecretGardenScreen(BuildContext context, int uid) {
    return DefendSecretGardenScreen.show(context, uid);
  }

  @override
  Widget getDefendMicLineWidget(
      int level, int position, double width, int category) {
    return DefendMicLineWidget(
      level: level,
      position: position,
      width: width,
      category: category,
    );
  }

  @override
  String getConstellationByBirthday(String birthday) {
    return PersonalUtil.getConstellation(birthday);
  }

  @override
  String getAgeDecadeByBirthday(String birthday) {
    return PersonalUtil.getAgeDecade(birthday);
  }

  @override
  void openAchieveWallPage(BuildContext context, int uid) {
    AchievementWallScreen.show(context, uid: uid);
  }

  @override
  Future showCpHouseMainPage(BuildContext context, int uid, int locationIndex) {
    return CreateHouseMainScreen.show(context,
        uid: uid, initialIndex: locationIndex);
  }

  @override
  Widget getCollectionDisplayWidget(BuildContext context,
      {int targetUid = 0, List<dynamic>? commodityItems}) {
    List<ExhibitCommodityItem> items;
    if (commodityItems != null) {
      items = commodityItems.cast<ExhibitCommodityItem>();
    } else {
      items = [];
    }

    return CollectionDisplayWidget(
      targetUid: targetUid,
      commodityItems: items,
    );
  }

  @override
  Future<bool> showCollectionRoomPage(BuildContext context,
      {int targetUid = 0}) async {
    /// 进入收藏室页面上报
    CollectionRoomUtil.reportEnterCollectionRoomPage();

    final result = await Navigator.of(context).push<bool>(
      MaterialPageRoute(
        builder: (context) => CollectionRoomMainPage(
          targetUid: targetUid,
        ),
        settings: const RouteSettings(name: 'CollectionRoomPage'),
      ),
    );
    return result ?? false;
  }

  @override
  Future<NormalNull> editSingleInfo(Map<String, String> info) async {
    String url = 'go/hisong/account/editFriendCard';
    try {
      Log.d("postData: $info");
      XhrResponse response = await Xhr.post('${System.domain}$url', info,
          throwOnError: false, pb: true);
      Log.d("res: ${response.value()}");
      return NormalNull.fromBuffer(response.bodyBytes);
    } catch (e) {
      return NormalNull(success: false, msg: e.toString());
    }
  }

  @override
  Future<bool?> showGameMasterRankPage(BuildContext context) async {
    return GameMasterRankScreen.show(context);
  }

  @override
  void openGiftWallIntimacyScreen(
      BuildContext context, int targetUid, VoidCallback giftCountChange,
      {int firstIndex = 0, int secondTabId = 0}) {
    GiftWallIntimacyScreen.show(context, targetUid, giftCountChange,
        firstIndex: firstIndex, secondTabId: secondTabId);
  }

  @override
  void openGiftWallScreen(BuildContext context, int targetUid,
      {String roomType = '', int rid = 0, int giftId = 0, int initIndex = 0}) {
    GiftWallCenterPage.show(context, targetUid,
        roomType: roomType, rid: rid, giftId: giftId, initIndex: initIndex);
  }

  @override
  void showGiftWallDialog(
      BuildContext context, int targetUid, int giftId, String giftName,
      {String roomType = '', int rid = 0}) {
    AwakeDialog.show(context, targetUid, giftId, giftName,
        roomType: roomType, rid: rid);
  }

  @override
  Widget getGiftWallPanelWidget(int uid, int lightNum, int totalNum,
      int rankNum, String levelIcon, List<GiftQualityMeta> medalList,
      {String refer = '', String roomType = '', int rid = 0}) {
    return GiftWallPanelWidget(
      uid,
      lightNum,
      totalNum,
      rankNum,
      levelIcon,
      medalList,
      refer: refer,
      roomType: roomType,
      rid: rid,
    );
  }

  @override
  Future openAccompanyRemember(BuildContext context, int targetUid) {
    return AccompanyRememberOneselfListScreen.show(context, targetUid);
  }

  @override
  Future openIntimacyCardPage(BuildContext context) {
    return IntimateCardMainPage.show(context);
  }

  @override
  Widget getIntimateCardIm(MessageContent message, Map extra, bool me,
      String? sentText, Widget? iconView, String? targetName) {
    return IntimateCardIm(
      key: ValueKey(message.messageId),
      message: message,
      extra: extra,
      me: me,
      sentText: sentText,
      iconView: iconView,
      targetName: targetName,
    );
  }

  @override
  Future openIntimacyPayBindPage(BuildContext context,
      {IntimateCardRelationUserInfo? toUser, String? message, int cardId = 0}) {
    return IntimateCardBindPage.launch(context,
        toUserParam: toUser, message: message, cardId: cardId);
  }

  /// 聊愈师首页-主播up列表页
  @override
  Future openHealerMainPage(BuildContext context) async {
    return HealerMainPage.launch(context);
  }

  @override
  Future openCpLinkStarExchangePage(BuildContext context) {
    return CpLinkStarExchangePage.show(context);
  }
}
