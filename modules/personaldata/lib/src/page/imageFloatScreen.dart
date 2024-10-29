import 'package:shared/assets.dart';
import 'package:personaldata/assets.dart';
import 'package:personaldata/k.dart';
import 'package:shared/dart_extensions/extensions_common.dart';
import 'dart:async';
import 'package:shared/shared.dart';
import 'package:shared/model/models.dart';
import 'package:flutter/material.dart';
import 'package:personaldata/src/room_user_profile/room_user_profile_logic.dart';
import 'package:personaldata/src/room_user_profile/widget/room_user_profile_base_info_widget.dart';
import 'package:personaldata/src/room_user_profile/widget/room_user_profile_bottom_widget.dart';
import 'package:personaldata/src/room_user_profile/widget/room_user_profile_circle_pic_widget.dart';
import 'package:personaldata/src/room_user_profile/widget/room_user_profile_error_widget.dart';
import 'package:personaldata/src/room_user_profile/widget/room_user_profile_mount_widget.dart';
import 'package:personaldata/src/room_user_profile/widget/room_user_profile_quick_gift_widget.dart';
import 'package:personaldata/src/room_user_profile/widget/room_user_profile_style.dart';
import 'package:personaldata/src/widget/info_card_entrance_widget.dart';

import 'package:personaldata/src/game_master/model/pb/generated/slp_godcard.pb.dart';
import 'package:personaldata/src/game_master/game_master_entrance.dart';
import 'package:personaldata/src/game_master/game_master_game_list_screen.dart';
import 'package:personaldata/src/game_master/game_master_card_list_screen.dart';
import 'package:chat_room/chat_room.dart';

import '../../personaldata.dart';
import '../mystery/mystery_info_panel_v1.dart';
import '../theme/personaldata_themes.dart';
import 'accompany_remember/accompany_remember_manager.dart';
import '../achievement_wall/widget/achievement_wall_entry_widget.dart';
import 'package:get/get.dart';

/// 个人页，浮层展示
/// 最多包含 个人详情/游戏信息/礼物信息/兴趣信息/操作按钮
class ImageFloatScreen extends StatefulWidget {
  static const String RouterName = '/image_float_screen';

  final int uid;
  final int? groupId;
  final ChatRoomData room;
  final int from; //0:房间坑位 1:公屏消息 2:其他，3: 世界频道,4:星舰群聊
  final bool isOffline; // 是否为离线用户
  final int toRid; //去往的房间//livePk
  final String? nameReplace;
  final String? avatarUrlReplace;
  final Color? background;
  const ImageFloatScreen({
    Key? key,
    required this.uid,
    required this.room,
    this.from = 0,
    this.isOffline = false,
    this.toRid = 0,
    this.background,
    this.nameReplace,
    this.avatarUrlReplace,
    this.groupId,
  }) : super(key: key);

  @override
  _ScreenState createState() => _ScreenState();

  static Future show(
    BuildContext context,
    int? uid,
    ChatRoomData? room,
    int? from, {
    bool? isOffline = false,
    int? toRid,
    Color? contentBackground,
    String? nameReplace,
    String? avatarUrlReplace,
    bool? useEmptyRoom = false,
    int? chatGroupId = 0,
  }) {
    if (uid == null || uid <= 0) return Future.value(false);

    if (room == null && useEmptyRoom == true) {
      room = room ?? ChatRoomData.emptyRoom();
      room.chatGroupId = chatGroupId ?? 0;
    }

    return displayModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      disableTapDismissible: true,
      builder: (BuildContext context) {
        return ImageFloatScreen(
          uid: uid,
          room: room!,
          from: from ?? -1,
          isOffline: isOffline ?? false,
          toRid: toRid ?? 0,
          background: contentBackground,
          nameReplace: nameReplace,
          avatarUrlReplace: avatarUrlReplace,
          groupId: chatGroupId,
        );
      },
      maxHeightRatio: 1.0,
      settings: const RouteSettings(name: ImageFloatScreen.RouterName),
    );
  }
}

class _ScreenState extends State<ImageFloatScreen> {
  final ScrollController _scrollController = ScrollController();
  double _shadowOpacity = 0.0;

  late RoomUserProfileLogic _logic;

  @override
  void initState() {
    super.initState();
    _logic = RoomUserProfileLogic(
        room: widget.room,
        uid: widget.uid,
        nameReplace: widget.nameReplace,
        avatarUrlReplace: widget.avatarUrlReplace);
    _logic.load();
    _addScrollControllerListener();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _logic.onClose();
    super.dispose();
  }

  void _addScrollControllerListener() {
    if (!_logic.showBirthdayRemind) return;
    _scrollController.addListener(() {
      double offset = _scrollController.offset;
      if (offset <= 0) {
        _shadowOpacity = 0;
      } else if (offset >= 150) {
        _shadowOpacity = 1;
      } else {
        _shadowOpacity = offset / 150.0;
      }
      setState(() {});
    });
  }

  // 踢出房间
  _kickOut() async {
    await ChatRoomUtil.kickOut(context, room: widget.room, uid: widget.uid);
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: _logic,
      global: false,
      builder: (GetxController controller) {
        if (widget.room.config == null) {
          return const SizedBox.shrink();
        }
        HomeProfileData? profileData = _logic.profileData;
        int deleted = 0;
        if (_logic.isMe == false && profileData != null) {
          deleted = profileData.base.deleted;
        }
        bool isLoadingOrError = _logic.loading == true ||
            _logic.error != null ||
            profileData == null ||
            deleted > 0;
        if (isLoadingOrError) {
          return RoomUserProfileErrorWidget(logic: _logic, deleteCode: deleted);
        }

        return _renderBody();
      },
    );
  }

  Widget _renderBody() {
    HomeProfileData profileData = _logic.profileData!;

    // 标签根据结算频道来，如果结算频道是游戏或王者，则展示在第二位，否则展示在第四位
    bool isGameOrKingSettlementChannel =
        Util.validStr(widget.room.config?.settlementChannel) &&
            (widget.room.config?.settlementChannel == 'game' ||
                widget.room.config?.settlementChannel == 'king');
    bool needGo = true;

    List<Widget> widgets;
    if (_logic.mystery) {
      widgets = [
        SizedBox(height: 56.dp),
        Text(
          widget.nameReplace ?? '',
          style: TextStyle(
            color: R.color.mainTextColor,
            fontSize: 16.0,
            fontWeight: FontWeight.w500,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        SizedBox(height: 8.dp),
        Text(
          K.personal_theone_mystery_desc,
          style: TextStyle(color: R.color.mainTextColor, fontSize: 13),
        ),
        _renderFooterNew(needChat: false),
      ];
    } else if (profileData.hasMysteryInfo()) {
      return MysteryInfoPanelV1(profileData, widget.room, widget.from);
    } else {
      bool isEmotionalMan =
          ['joy-man'].contains(widget.room.config?.settlementChannel);
      bool isBusiness = widget.room.isBusiness;
      bool showVoiceTag = profileData.voiceTag.isNotEmpty;
      bool hasQuickGift = profileData.interactGiftInfos.isNotEmpty;
      List<Widget> children = [];
      if (hasQuickGift) {
        // 嗨歌新用户视角，【快捷送礼】>【动态】
        children = [
          // showGiftBookWidget(),
          _buildMount(),
          if (_logic.showCirclePics) _buildCirclePics(_logic.albumPics!),
          RoomUserProfileQuickGiftWidget(
              uid: widget.uid, gifts: profileData.interactGiftInfos),
        ];
      } else if (isBusiness) {
        // 商业房
        if (isEmotionalMan) {
          //情感男：【标签】>【音色】>【动态】>【守护】>【礼物墙】
          children = [
            // showGiftBookWidget(),
            _buildMount(),
            _buildTagsWidget(profileData),
            if (showVoiceTag) _buildVoiceTagsWidget(profileData),
            if (_logic.showCirclePics) _buildCirclePics(_logic.albumPics!),
            if (_logic.showDefend) _buildDefendListWidget(profileData),
            if (_logic.showGiftWall) _buildGiftWallBannerWidget(profileData),
          ];
        } else if (isGameOrKingSettlementChannel) {
          // 游戏或者王者
          if (_logic.showGameMaster) {
            // 需要显示主播卡的：主播卡 > 动态 > 标签 > 音色 > 守护 > 礼物墙
            children = [
              // showGiftBookWidget(),
              _buildMount(),
              _buildGameMasterCard(_logic.gameMasterCardList!),
              if (_logic.showCirclePics) _buildCirclePics(_logic.albumPics!),
              _buildTagsWidget(profileData),
              if (showVoiceTag) _buildVoiceTagsWidget(profileData),
              if (_logic.showDefend) _buildDefendListWidget(profileData),
              if (_logic.showGiftWall) _buildGiftWallBannerWidget(profileData),
            ];
          } else {
            // 无主播卡
            //【守护】>【标签】>【音色】>【动态】>【礼物墙】
            children = [
              // showGiftBookWidget(),
              _buildMount(),
              if (_logic.showDefend) _buildDefendListWidget(profileData),
              _buildTagsWidget(profileData),
              if (showVoiceTag) _buildVoiceTagsWidget(profileData),
              if (_logic.showCirclePics) _buildCirclePics(_logic.albumPics!),
              if (_logic.showGiftWall) _buildGiftWallBannerWidget(profileData),
            ];
          }
        } else {
          // 其他商业房，【守护】>【动态】>【礼物墙】>【标签】>【音色】
          children = [
            // showGiftBookWidget(),
            _buildMount(),
            if (_logic.showDefend) _buildDefendListWidget(profileData),
            if (_logic.showCirclePics) _buildCirclePics(_logic.albumPics!),
            if (_logic.showGiftWall) _buildGiftWallBannerWidget(profileData),
            _buildTagsWidget(profileData),
            if (showVoiceTag) _buildVoiceTagsWidget(profileData),
          ];
        }
      } else {
        // 非商业房
        // 【动态】>【守护】>【礼物墙】>【标签】>【音色】
        children = [
          // showGiftBookWidget(),
          _buildMount(),
          if (_logic.showCirclePics) _buildCirclePics(_logic.albumPics!),
          if (_logic.showDefend) _buildDefendListWidget(profileData),
          if (_logic.showGiftWall) _buildGiftWallBannerWidget(profileData),
          _buildTagsWidget(profileData),
          if (showVoiceTag) _buildVoiceTagsWidget(profileData),
        ];
      }

      /// PK战绩
      // if (_showSegment) {
      //   _children.add(_buildSegmentBannerWidget());
      // }

      // 陪伴记
      if (_logic.profileSyncData != null &&
          _logic.profileSyncData?.imprint != null &&
          !hasQuickGift) {
        children.add(
            AccompanyRememberManager.getAccompanyRememberItemToRoomInfoCard(
                widget.uid, _logic.profileSyncData!.imprint));
      }

      // 超能力
      //if (!isGame && !_hasQuickGift) {
      //_children.add(_buildSkillsNew());
      //}

      widgets = [
        Container(
          constraints: BoxConstraints(
              maxHeight: 500 * Util.ratio -
                  (_logic.showBirthdayRemind ? 0 : 40.dp + 28)),
          child: ShaderMask(
            shaderCallback: (Rect bounds) {
              return const LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: <Color>[
                  Colors.white,
                  Colors.transparent,
                  Colors.transparent
                ],
                stops: [0.0, 0.02, 1.0],
              ).createShader(bounds);
            },
            blendMode: BlendMode.dstOut,
            child: SingleChildScrollView(
              controller: _scrollController,
              physics: const ClampingScrollPhysics(),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (_logic.showBirthdayRemind) _buildHeaderNew(profileData),
                  _renderTop(profileData),
                  ...children,
                  // if (_showGiftWall) _buildGiftNew(),
                ],
              ),
            ),
          ),
        ),
        _renderFooterNew(needChat: true),
      ];
    }
    return Stack(
      fit: StackFit.passthrough,
      alignment: AlignmentDirectional.bottomCenter,
      children: <Widget>[
        SizedBox(
          width: Util.width,
          child: Stack(
            alignment: AlignmentDirectional.bottomCenter,
            children: [
              _buildCardDecorateBottomAnim(),
              Container(
                margin: EdgeInsetsDirectional.only(top: 57 * Util.ratio),
                decoration: BoxDecoration(
                    color: widget.background ?? R.color.mainBgColor,
                    borderRadius: const BorderRadiusDirectional.only(
                      topStart: Radius.circular(16.0),
                      topEnd: Radius.circular(16.0),
                    )),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // 举报 踢人
                    if (!_logic.showBirthdayRemind)
                      _buildHeaderNew(profileData),
                    ...widgets,
                    Container(
                      height: Util.iphoneXBottom,
                      color: R.colors.popMenuBgColor,
                    )
                  ],
                ),
              ),
              ...[
                if (_logic.showBirthdayRemind)
                  PositionedDirectional(
                    top: 57 * Util.ratio,
                    start: 0,
                    end: 0,
                    child: IgnorePointer(
                      child: AnimatedOpacity(
                        opacity: _shadowOpacity,
                        duration: const Duration(milliseconds: 500),
                        child: R.img(
                            Assets.personaldata$ic_birthday_header_mask_webp,
                            package: ComponentManager.MANAGER_PERSONALDATA,
                            fit: BoxFit.cover),
                      ),
                    ),
                  ),
                PositionedDirectional(
                  top: 8,
                  child: _buildCardDecorate(),
                ),
                // 顶部不可见区域点击返回
                PositionedDirectional(
                  top: 0,
                  child: GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: SizedBox(
                      width: Util.width,
                      height: 57 * Util.ratio,
                    ),
                  ),
                ),
                PositionedDirectional(
                  top: 27,
                  child: _buildAvatar(needGo),
                ),
                if (profileData.hasBusinessCard() && !_logic.mystery)
                  PositionedDirectional(
                    top: 23 * Util.ratio,
                    child: _buildCardHeader(profileData.businessCard.header),
                  ),
                if (!_logic.mystery)
                  PositionedDirectional(
                    top: 27 + 40 * Util.ratio,
                    start: Util.width / 2.0 + 20 * Util.ratio,
                    child: _buildMarryWidget(),
                  ),
              ],
            ],
          ),
        ),
      ],
    );
  }

  /// 顶部按钮、基本信息、关系入口
  Widget _renderTop(HomeProfileData profileData) {
    return Stack(
      alignment: AlignmentDirectional.center,
      clipBehavior: Clip.none,
      children: [
        // 生日提醒背景
        if (_logic.showBirthdayRemind)
          PositionedDirectional(
            top: -(40.dp + 28),
            start: 0,
            end: 0,
            bottom: -48,
            child: ClipRRect(
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(16)),
              child: CachedNetworkImage(
                imageUrl: Util.getRemoteImgUrl(
                    'static/birthday_housekeeper/room_profile_birthday_bg_new3.webp'),
                fit: BoxFit.cover,
              ),
            ),
          ),
        Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // 基本信息
            RoomUserProfileBaseInfoWidget(
                logic: _logic, profileData: profileData),
            // 关系入口
            // InfoCardEntranceWidget(
            //   data: profileData,
            //   uid: widget.uid,
            //   rid: widget.room.rid,
            // ),
            // 分割线
            if (!_logic.showBirthdayRemind)
              Container(
                margin: const EdgeInsetsDirectional.only(start: 20, end: 20),
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(color: R.color.dividerColor, width: 0.5),
                  ),
                ),
              ),
          ],
        ),
        // 成就墙入口
        // if (_logic.hasAchieveBadgeEntrance)
        //   PositionedDirectional(
        //     top: 0,
        //     end: 0,
        //     child: AchievementWallEntryWidget(uid: widget.uid, roomId: widget.room.rid),
        //   ),
      ],
    );
  }

  /// 举报 踢人
  Widget _buildHeaderNew(HomeProfileData profileData) {
    bool showKickOut = widget.uid != Session.uid &&
        (widget.room.purview == Purview.Createor ||
            widget.room.purview == Purview.SuperAdmin) &&
        !(widget.room.config != null &&
            widget.room.config?.property == RoomProperty.Game &&
            widget.room.config?.type == 'juben');
    return Padding(
      padding: EdgeInsetsDirectional.only(
          top: 8.dp, bottom: 32.dp, start: 16, end: 16),
      child: SizedBox(
        height: 28,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            if (profileData.validAudio)
              SoundStadiumButton(
                  audioUrl: profileData.card.audio,
                  duration: Util.parseInt(profileData.card.duration)),
            const SizedBox(
                height: 28, width: 1), // 这一栏不显示任何内容，也需要占据固定高度，否则头像会遮挡下面的内容(名字)

            const Spacer(),
            if (showKickOut)
              InkWell(
                onTap: _kickOut,
                child: Text(
                  K.kick_out,
                  style: TextStyle(fontSize: 13, color: R.color.thirdTextColor),
                ),
              ),
            if (showKickOut && !_logic.isMe)
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
                child: Container(
                  width: 1,
                  height: 12,
                  color: const Color(0xFFF6F7F9),
                ),
              ),
            if (!_logic.isMe)
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                  IPersonalDataManager manager = ComponentManager.instance
                      .getManager(ComponentManager.MANAGER_PERSONALDATA);
                  manager.openReportScreen(context,
                      uid: widget.uid, reportType: ReportType.User);
                },
                child: Text(K.report,
                    style:
                        TextStyle(fontSize: 13, color: R.color.thirdTextColor)),
              ),
          ],
        ),
      ),
    );
  }

  ///守护榜
  Widget _buildDefendListWidget(HomeProfileData profileData) {
    List<HomeProfileDefend> defendList = profileData.defendList;

    if (defendList.isEmpty) {
      return const SizedBox.shrink();
    }

    int num = 4;
    if (Util.width < 375) {
      num = 3;
    }

    return RoomUserProfileInfoContainer(
      title: K.personal_defend,
      child: GestureDetector(
        onTap: () {
          Navigator.pop(context);
          IPersonalDataManager personalDataManager = ComponentManager.instance
              .getManager(ComponentManager.MANAGER_PERSONALDATA);
          personalDataManager
              .showDefendListScreen(context, widget.uid)
              .then((value) {});
        },
        child: SizedBox(
          height: 44,
          width: double.infinity,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              ...defendList
                  .take(num)
                  .map((_) => DefendRelationHeader(
                      iconSize: 44,
                      defendRelationModel:
                          DefendRelationModel.fromBuffModel(_)))
                  .expand((_) => [_, const SizedBox(width: 8)]),
              const Spacer(),
              Text(
                K.personal_people_count(
                    [profileData.base.defendCount.toString()]),
                style: TextStyle(
                  fontSize: 13.0,
                  color: R.color.secondTextColor,
                ),
              ),
              R.img(BaseAssets.shared$icon_next_fq_svg,
                  color: R.color.thirdTextColor,
                  width: 16,
                  height: 16,
                  package: ComponentManager.MANAGER_BASE_CORE),
              const SizedBox(width: 8),
            ],
          ),
        ),
      ),
    );
  }

  /// 主播卡
  Widget _buildGameMasterCard(ResGodCardList cardList) {
    List<Widget> items = [];
    for (var element in cardList.list) {
      items.add(GameMasterEntranceCard(
        element,
        () {
          Navigator.pop(context);
          GameMasterCardListSceen.show(context, widget.uid);
        },
        () {
          // Navigator.pop(context);
          // GameMasterEditScreen.show(context, element.name, 0,);
        },
      ));
    }
    if (widget.uid == Session.uid && cardList.list.length < 3) {
      //主播添加游戏卡片
      items.add(GameMasterEntranceAddCard(
        addGameCard: () {
          // Navigator.pop(context);
          // String fromRoute = appNavigatorObserver.getLast();
          GameMasterGameListSceen.show(context,
              fromRouteName: ImageFloatScreen.RouterName);
        },
      ));
    } else if (cardList.list.isEmpty) {
      //其他人看主播的空卡片
      items.add(GameMasterEntranceEmptyCard(() {
        Navigator.pop(context);
        GameMasterCardListSceen.show(context, widget.uid);
      }));
    }

    return RoomUserProfileInfoContainer(
      title: K.personaldata_gm_master_card,
      child: SizedBox(
        width: double.infinity,
        height: 72,
        child: ListView(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsetsDirectional.only(end: 8),
          children: items,
        ),
      ),
    );
  }

  /// 动态图片
  Widget _buildCirclePics(RepCirclePics albumPics) {
    return RoomUserProfileCirclePicWidget(
        room: widget.room, uid: widget.uid, albumPics: albumPics);
  }

  /// 礼物墙
  Widget _buildGiftWallBannerWidget(HomeProfileData profileData) {
    return RoomUserProfileInfoContainer(
      title: K.gift_wall,
      child: SizedBox(
        width: double.infinity,
        height: 60,
        child: GiftWallBannerWidget(
          uid: profileData.base.uid,
          giftWall: profileData.giftWall,
          room: widget.room,
          giftChange: _logic.reLoad,
        ),
      ),
    );
  }

  ///标签
  Widget _buildTagsWidget(HomeProfileData profileData) {
    List<HomeProfileTagItem> tags = profileData.tag.tags;
    List<String> tagNames = tags.map((e) => e.name).toList();

    //插入职业、学历、身高标签
    if (profileData.card.height > 0) {
      tagNames.insert(0, '${profileData.card.height}cm');
    }
    if (!Util.isNullOrEmpty(profileData.card.education)) {
      tagNames.insert(0, profileData.card.education);
    }
    if (!Util.isNullOrEmpty(profileData.card.industry)) {
      tagNames.insert(0, profileData.card.industry);
    }

    if (tagNames.isEmpty) return const SizedBox.shrink();

    return RoomUserProfileInfoContainer(
      title: K.personal_data_tags,
      child: SizedBox(
          width: double.infinity,
          child: Wrap(
            runSpacing: 8.0,
            spacing: 10,
            children: tags.map((item) {
              return IntrinsicWidth(
                child: Container(
                  padding: const EdgeInsetsDirectional.only(
                    start: 15.0,
                    end: 15.0,
                  ),
                  height: 23,
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      border: Border.all(
                          width: 1,
                          color: PersonaldataR.colors.tagBorderColor
                              .withOpacity(0.5)),
                      borderRadius: BorderRadius.circular(17)),
                  alignment: Alignment.center,
                  child: Text(
                    item.name,
                    style: TextStyle(
                        color: PersonaldataR.colors.tagBorderColor,
                        fontSize: 11.0),
                  ),
                ),
              );
            }).toList(),
          )),
    );
  }

  /// 音色标签
  Widget _buildVoiceTagsWidget(HomeProfileData profileData) {
    if (profileData.voiceTag.isEmpty) {
      return const SizedBox.shrink();
    }

    return RoomUserProfileInfoContainer(
      title: K.personaldata_profile_voice_tag,
      child: SizedBox(
        width: double.infinity,
        height: 32,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext c, int i) {
            HomeProfileVoiceTag model = profileData.voiceTag[i];
            return Stack(
              alignment: Alignment.center,
              children: [
                CachedNetworkImage(
                  imageUrl: model.icon,
                  width: 88,
                  height: 32,
                  cachedWidth: 264,
                  cachedHeight: 96,
                  fit: BoxFit.cover,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 33),
                  child: SizedBox(
                    width: 55,
                    child: Text(
                      model.name,
                      style: const TextStyle(
                          fontSize: 13, color: Color(0xFFFFFFFF)),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                )
              ],
            );
          },
          separatorBuilder: (BuildContext c, int i) => const SizedBox(width: 8),
          itemCount: profileData.voiceTag.length,
        ),
      ),
    );
  }

  /// 展示礼物图鉴入口
  Widget showGiftBookWidget() {
    HomeProfileSyncData? profileSyncData = _logic.profileSyncData;
    if (profileSyncData?.briefInfo != null) {
      IPersonalDataManager personalManager = ComponentManager.instance
          .getManager(ComponentManager.MANAGER_PERSONALDATA);
      return Padding(
        padding: const EdgeInsetsDirectional.only(bottom: 10),
        child: personalManager.getGiftWallPanelWidget(
            widget.uid,
            profileSyncData?.briefInfo.lightNum ?? 0,
            profileSyncData?.briefInfo.total ?? 0,
            profileSyncData?.briefInfo.rank ?? 0,
            profileSyncData?.briefInfo.icon ?? "",
            profileSyncData?.briefInfo.levelList ?? [],
            rid: widget.room.rid,
            refer: widget.uid == Session.uid
                ? 'my_image_float_screen'
                : 'other_image_float_screen',
            roomType: widget.room.config?.type ?? ''),
      );
    }
    return const SizedBox.shrink();
  }

  /// 座驾系列
  Widget _buildMount() {
    HomeProfileSyncData? profileSyncData = _logic.profileSyncData;
    if (profileSyncData != null && profileSyncData.mountSerialData.isNotEmpty) {
      return RoomUserProfileInfoContainer(
        title: '座驾墙',
        child: RoomUserProfileMountWidget(
            uid: widget.uid, mountSerialData: profileSyncData.mountSerialData),
      );
    }
    return const SizedBox.shrink();
  }

  /// 资料卡装扮--半屏特效展示
  Widget _buildCardDecorateBottomAnim() {
    return PositionedDirectional(
      top: 0,
      bottom: 0,
      start: 0,
      end: 0,
      child: _logic.showCardDecorate && !_logic.mystery
          ? IgnorePointer(
              child: DecorateDisplayWidget(
                effect: Decorate(_logic.profileData?.cardDecorate.giftId ?? 0,
                    _logic.profileData?.cardDecorate.vapSize ?? 0),
              ),
            )
          : const SizedBox.shrink(),
    );
  }

  /// 资料卡装扮/贵族名片
  Widget _buildCardDecorate() {
    HomeProfileData? profileData = _logic.profileData;
    if (profileData == null) return const SizedBox.shrink();
    bool showCard = profileData.hasBusinessCard();
    if (_logic.showCardDecorate && !_logic.mystery) {
      // 优先展示资料卡装扮
      return IgnorePointer(
        child: SizedBox(
          width: Util.width,
          height: 70 * Util.ratio,
          child: CachedNetworkImage(
            imageUrl: Util.getRemoteImgUrl(profileData.cardDecorate.image),
            fit: BoxFit.cover,
          ),
        ),
      );
    } else if (showCard && !_logic.mystery) {
      // 贵族名片banner
      if (profileData.businessCard.banner.isNotEmpty) {
        return IgnorePointer(
          child: SizedBox(
            width: Util.width,
            height: 77 * Util.ratio,
            child:
                CachedNetworkImage(imageUrl: profileData.businessCard.banner),
          ),
        );
      }
    }
    return const SizedBox.shrink();
  }

  /// 贵族名片header
  Widget _buildCardHeader(String headerURL) {
    if (headerURL.isNotEmpty) {
      return IgnorePointer(
        child: Container(
          width: 94 * Util.ratio,
          height: 94 * Util.ratio,
          alignment: AlignmentDirectional.topCenter,
          child: CachedNetworkImage(imageUrl: headerURL),
        ),
      );
    }
    return const SizedBox.shrink();
  }

  /// 顶部头像
  Widget _buildAvatar(bool needGo) {
    HomeProfileData? profileData = _logic.profileData;
    String? iconStr;
    if (widget.avatarUrlReplace?.isNotEmpty ?? false) {
      iconStr = widget.avatarUrlReplace;
    } else if (profileData != null) {
      iconStr = profileData.base.icon;
      if (iconStr.trim().isEmpty) {
        if (Util.validList(profileData.base.photos)) {
          iconStr = profileData.base.photos.first;
        }
      }
    }

    if (Util.validStr(widget.nameReplace) ||
        Util.validStr(widget.avatarUrlReplace)) {
      needGo = false;
    }

    if (iconStr != null && iconStr.isNotEmpty) {
      return InkWell(
        onTap: () {
          if (needGo) {
            Navigator.pop(context);
            IPersonalDataManager manager = ComponentManager.instance
                .getManager(ComponentManager.MANAGER_PERSONALDATA);
            manager.openImageScreen(context, widget.uid,
                rid: widget.room.rid, refer: const PageRefer('room'));
          }
        },
        child: Container(
          width: 83 * Util.ratio,
          height: 83 * Util.ratio,
          decoration: BoxDecoration(
            border: Border.all(
                color: profileData?.base.hasFrame() == true
                    ? Colors.transparent
                    : Colors.white,
                width: 3 * Util.ratio),
            borderRadius: BorderRadius.circular(42 * Util.ratio),
          ),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              CommonAvatarWithFrame(
                childWidget: CommonAvatar(
                  path: "${System.imageDomain}$iconStr",
                  size: 80 * Util.ratio,
                  shape: BoxShape.circle,
                ),
                framePath: Util.getFullFramePath(profileData?.base.frame),
                overflow: -5.0,
                headerFrameSize: 80 * Util.ratio + 10,
                liveOnly: profileData?.base.hasLiveOnly() == true
                    ? profileData!.base.liveOnly
                    : null,
                liveLabel: profileData?.base.hasLiveLabelHeader() == true
                    ? profileData!.base.liveLabelHeader
                    : null,
              ),
            ],
          ),
        ),
      );
    }
    return Container();
  }

  ///网赚经纪人头像
  Widget _buildSuperVoiceAgentIcon() {
    double size = 34.0;
    double borderWidth = 2.0;

    return PositionedDirectional(
      end: -10.0 * Util.ratio,
      bottom: 0,
      child: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        clipBehavior: Clip.none,
        children: [
          GradientBorder(
            borderRadius: size / 2.0 * Util.ratio,
            borderWidth: borderWidth * Util.ratio,
            borderGradient: const LinearGradient(
              colors: [Color(0xFF6D5DFF), Color(0xFFC56AFF)],
            ),
            child: Container(
              alignment: AlignmentDirectional.center,
              width: size * Util.ratio,
              height: size * Util.ratio,
              child: CommonAvatar(
                path: Util.getRemoteImgUrl(_logic.profileData!.base.agentIcon),
                size: (size - borderWidth) * Util.ratio,
                shape: BoxShape.circle,
              ),
            ),
          ),
          Container(
            alignment: AlignmentDirectional.center,
            width: 27.0 * Util.ratio,
            height: 12.0 * Util.ratio,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6.0 * Util.ratio),
              gradient: const LinearGradient(
                colors: [Color(0xFF6D5DFF), Color(0xFFC56AFF)],
              ),
            ),
            child: Text(
              K.supervoice_agent,
              style: TextStyle(fontSize: 7 * Util.ratio, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  ///伴侣按钮
  Widget _buildMarryWidget() {
    String? iconStr = _logic.profileData?.marry.relation.img;
    if (!Util.validStr(iconStr)) {
      return const SizedBox.shrink();
    }
    return InkWell(
      onTap: () {
        Navigator.pop(context);
        IRankManager rankManager =
            ComponentManager.instance.getManager(ComponentManager.MANAGER_RANK);
        rankManager.showCompanionRankPage(Constant.context,
            _logic.profileData!.base.uid, 'profile_card_marry');
      },
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          CommonAvatar(
            path: iconStr,
            size: 36 * Util.ratio,
            shape: BoxShape.circle,
          ),
          R.img(
            Assets.personaldata$marry_profile_marry_head_png,
            width: Util.ratio * 36 * 64 / 52,
            height: Util.ratio * 36 * 64 / 52,
            package: ComponentManager.MANAGER_PERSONALDATA,
          ),
        ],
      ),
    );
  }

  /// 底部操作按钮
  _renderFooterNew({required bool needChat}) {
    if (_logic.isMe) {
      return const SizedBox.shrink();
    }
    return RoomUserProfileBottomWidget(
        logic: _logic,
        isOffline: widget.isOffline,
        toRid: widget.toRid,
        needChat: needChat,
        from: widget.from,
        groupId: widget.groupId);
  }
}
