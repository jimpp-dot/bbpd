import 'package:shared/assets.dart';
import 'package:shared/shared.dart';
import 'package:chat_room/chat_room.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:personaldata/k.dart';
import 'package:personaldata/src/room_user_profile/room_user_profile_logic.dart';

/// 房间用户资料卡基本信息
class RoomUserProfileBaseInfoWidget extends StatelessWidget {
  final RoomUserProfileLogic logic;
  final HomeProfileData profileData;

  const RoomUserProfileBaseInfoWidget({super.key, required this.logic, required this.profileData});

  ChatRoomData get _room => logic.room;

  RoomUserProfileLogic get _logic => logic;

  @override
  Widget build(BuildContext context) {
    return _buildInformationNew();
  }

  /// 个人信息/简介等
  Widget _buildInformationNew() {
    return Container(
      width: Util.width,
      alignment: AlignmentDirectional.topCenter,
      padding: const EdgeInsetsDirectional.only(start: 16, end: 16, bottom: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: _logic.hasAchieveBadgeEntrance ? 59.0 : 0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  child: _buildName(profileData.base.name, profileData.base.title),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // 个人资料卡靓ID展示
              if (profileData.base.prettyUid > 0)
                Padding(
                  padding: const EdgeInsetsDirectional.only(end: 5),
                  child: Row(
                    children: [
                      R.img(
                        BaseAssets.shared$bb_pretty_id_webp,
                        width: 16,
                        height: 16,
                        package: ComponentManager.MANAGER_BASE_CORE,
                        fit: BoxFit.fitHeight,
                      ),
                      const SizedBox(width: 4),
                      ColorfulNickName(
                        isPrettyId: true,
                        textBuild: (bool show, {Key? key, Paint? paint}) {
                          return NumText(
                            profileData.base.prettyUid.toString(),
                            key: key,
                            softWrap: true,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.start,
                            style: const TextStyle(
                              color: Color(0xFFFD7B08),
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                            ),
                          );
                        },
                      )
                    ],
                  ),
                )
              else
                Text('ID:  ${profileData.base.uid}', style: TextStyle(color: R.color.secondTextColor, fontSize: 11)),
              // if (Util.validStr(profileData.base.distance))
              //   Padding(
              //     padding: const EdgeInsetsDirectional.only(start: 20),
              //     child: Text(
              //       profileData.base.distance,
              //       style:
              //           TextStyle(color: R.color.secondTextColor, fontSize: 11),
              //     ),
              //   )
            ],
          ),
          const SizedBox(height: 6),
          Wrap(
            alignment: WrapAlignment.start,
            spacing: 4,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: _labels(profileData),
          ),
          _buildSignAndGameId(profileData),
        ],
      ),
    );
  }

  Widget _buildName(String name, int titleNew) {
    return Text(
      name,
      style: TextStyle(color: R.color.mainTextColor, fontSize: 16.0, fontWeight: FontWeight.w500),
      overflow: TextOverflow.ellipsis,
      maxLines: 1,
    );
  }

  List<Widget> _labels(HomeProfileData profileData) {
    List<Widget> labels = [];
    int sex = profileData.base.sex; //(sex == 1 ? '男' : '女')
    int year = profileData.base.age;
    int popularityLevel = profileData.base.popularityLevel;
    int vip = profileData.base.vipLevel;

    labels.addAll(generalTagList(true));

    /// 性别年龄
    labels.add(UserSexAndAgeWidget(sex: sex, age: year));

    if (!NobilityUtil.titleIsInvalid(profileData.base.title)) {
      /// 爵位
      labels.add(UserNobilityWidget(titleNew: profileData.base.title));
    }

    if (popularityLevel > 0) {
      /// 人气
      labels.add(UserPopularity(popularityLevel: popularityLevel));
    }

    if (vip > 0) {
      /// vip
      labels.add(UserVipWidget(vip: vip, isGrey: profileData.base.icongray));
    }

    /// 成就勋章
    if (profileData.base.hasAchieveWear() && profileData.base.achieveWear.image.isNotEmpty) {
      labels.add(ActivityBadgeWidget(
        icon: profileData.base.achieveWear.image,
        height: 26,
      ));
    }

    /// 新贵
    if (Util.parseBool(profileData.base.newNoble)) {
      labels.add(const NewNobleWidget());
    }

    /// 归因新用户标签
    if (Session.joinBroker == true && profileData.hasRookieTag()) {
      labels.add(UserNewTransferWidget(
          sevenNew: profileData.rookieTag.sevenNew, payLevel: profileData.rookieTag.payLevel, padding: EdgeInsetsDirectional.zero));
    }

    /// 骑士守护
    labels.add(UserKnightWidget(knightLevel: profileData.base.knightLevel, padding: EdgeInsetsDirectional.zero));
    if (profileData.base.consumeLabel && _room.isBusiness && (_room.isReception || _room.isCreator)) {
      labels.add(TextLabelWidget.consumeLabel);
    }
    if (profileData.base.rechargeLabel && _room.isBusiness && (_room.isReception || _room.isCreator)) {
      labels.add(TextLabelWidget.rechargeLabel);
    }

    /// 小闹钟标签
    if (ChatUtil.isCanShowAlarmLabel(profileData.base.littleAlarm)) {
      labels.add(TextLabelWidget.smallAlarmLabel(profileData.base.littleAlarm));
    }

    /// 点唱标签
    IRoomManager manager = ComponentManager.instance.getManager(ComponentManager.MANAGER_BASE_ROOM);
    if (manager.isCanShowJukeboxLabel(profileData.base.jukebox)) {
      labels.add(TextLabelWidget.smallAlarmLabel(profileData.base.jukebox));
    }

    /// 明星歌手
    if (profileData.base.starSinger > 0) {
      labels.add(UserStarSingerWidget(height: 26, level: profileData.base.starSinger, padding: EdgeInsetsDirectional.zero));
    }

    /// 明星加V
    if (profileData.base.starVerifyTag == 1 || profileData.base.starVerifyTag == 2 || profileData.base.starVerifyTag == 3) {
      labels.add(UserStarVerifyWidget(padding: EdgeInsetsDirectional.zero, starVerifyTag: profileData.base.starVerifyTag));
    }

    ///ka标签
    if (profileData.base.kaWhiteIcon) {
      labels.add(const KaTagWidget());
    }

    /// 七夕勋章
    if (profileData.base.hasSevenLoveTag() && profileData.base.sevenLoveTag > 0) {
      labels.add(SevenLoveWidget(
        rank: profileData.base.sevenLoveTag,
      ));
    }

    /// 当前穿戴的运营活动勋章
    if (profileData.base.hasBadgeIconInUse() && profileData.base.badgeIconInUse.isNotEmpty) {
      labels.add(ActivityBadgeWidget(
        icon: profileData.base.badgeIconInUse,
        height: 26,
      ));
    }

    /// 周星大人物标签
    if (profileData.base.hasWeekStar() && profileData.base.weekStar == 1) {
      labels.add(
        SizedBox(
          width: 52,
          height: 14,
          child: GradientBorder(
            borderGradient: const LinearGradient(
              begin: AlignmentDirectional.topStart,
              end: AlignmentDirectional.bottomEnd,
              colors: [Color(0xFFFFCEE3), Color(0xFFFFEBF3), Color(0xFFFFE5F0)],
            ),
            borderRadius: 7,
            borderWidth: 1,
            child: Center(
              child: Container(
                  width: 50,
                  height: 12,
                  alignment: AlignmentDirectional.center,
                  decoration: const BoxDecoration(
                      // border: Border.all(color: Color(0xFFFFCEE3), width: 0.7),
                      borderRadius: BorderRadius.all(Radius.circular(6)),
                      gradient: LinearGradient(
                        colors: [Color(0xFFFF6E6E), Color(0xFFFF6CD2)],
                      )),
                  child: YouSheText(K.personaldata_weak_star_tag,
                      textAlign: TextAlign.center, style: const TextStyle(color: Colors.white, fontSize: 8))),
            ),
          ),
        ),
      );
    }

    HomeProfileSyncData? profileSyncData = _logic.profileSyncData;

    /// 游戏主播标签
    if (profileSyncData != null && profileSyncData.tagIcon.isNotEmpty) {
      labels.add(SizedBox(
        height: 26,
        child: CachedNetworkImage(
          imageUrl: "${System.imageDomain}${profileSyncData.tagIcon}",
          fit: BoxFit.fitHeight,
        ),
      ));
    }

    labels.addAll(generalTagList(false));

    // 我的好哥哥
    if (!Util.isStringEmpty(profileData.base.holdHandIcon)) {
      labels.add(R.img(Util.getRemoteImgUrl(profileData.base.holdHandIcon), height: 22));
    }

    return labels;
  }

  List<Widget> generalTagList(bool front) {
    List<CommonTagData> commonTags = _logic.commonTags;
    List<Widget> widgets = [];
    if (commonTags.isNotEmpty) {
      // Log.d(tag: "generalTag", "total length:${commonTags.length}");
      for (int i = 0; i < commonTags.length; i++) {
        if (front && commonTags[i].location == 0) {
          // Log.d(tag: "generalTag", "add to front:${commonTags[i].toString()}");
          widgets.add(CommonTagWidget(
            data: commonTags[i],
            inProfilePage: true,
            needMarginEnd: false,
          ));
        } else if (!front && commonTags[i].location == 1) {
          // Log.d(tag: "generalTag", "add to end:${commonTags[i].toString()}");
          widgets.add(CommonTagWidget(
            data: commonTags[i],
            inProfilePage: true,
            needMarginEnd: false,
          ));
        }
      }
    }
    return widgets;
  }

  //游戏ID及签名
  Widget _buildSignAndGameId(HomeProfileData profileData) {
    String gameType = '';
    String gameZone = '';
    String gameId = '';

    if (_room.config?.type == 'chook') {
      gameType = K.personal_game_chook;
    } else if (_room.config?.type == 'king') {
      gameType = K.personal_game_king;
    }

    if (profileData.hasGame()) {
      gameZone = profileData.game.gameZone;
      if (gameZone == 'qq') {
        gameZone = K.personal_game_qq_area;
      } else if (gameZone == 'weichat') {
        gameZone = K.personal_game_wechat_area;
      }

      gameId = profileData.game.gameId;
    }
    String sign = profileData.base.sign;

    if ((gameType.isNotEmpty) && (gameId.isNotEmpty && gameZone.isNotEmpty)) {
      //游戏ID
      return Container(
          padding: const EdgeInsetsDirectional.only(top: 8.0, bottom: 0.0),
          alignment: AlignmentDirectional.topCenter,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                '$gameType $gameZone',
                textScaleFactor: 1.0,
                style: TextStyle(
                  fontSize: 13.0,
                  color: R.color.secondTextColor,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.start,
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    '${K.game_id}：$gameId',
                    textScaleFactor: 1.0,
                    style: TextStyle(
                      fontSize: 13.0,
                      color: R.color.secondTextColor,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.start,
                  ),
                  const SizedBox(width: 12),
                  GestureDetector(
                    onTap: () {
                      Clipboard.setData(ClipboardData(text: gameId));
                      Fluttertoast.showToast(msg: K.game_id_copied, gravity: ToastGravity.BOTTOM);
                    },
                    child: Text(
                      K.copy_game_id,
                      textScaleFactor: 1.0,
                      style: TextStyle(
                        fontSize: 12.0,
                        color: R.color.mainBrandColor,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.start,
                    ),
                  ),
                ],
              )
            ],
          ));
    } else if (sign.isNotEmpty) {
      //签名
      return Container(
        padding: const EdgeInsetsDirectional.only(top: 8.0, bottom: 0.0),
        alignment: AlignmentDirectional.center,
        child: Text(
          sign,
          textScaleFactor: 1.0,
          style: TextStyle(
            fontSize: 13.0,
            color: R.color.secondTextColor,
          ),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.start,
        ),
      );
    } else {
      return const SizedBox.shrink();
    }
  }
}
