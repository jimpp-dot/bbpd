import 'package:shared/shared.dart';
import 'package:chat_room/chat_room.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:personaldata/src/api/api.dart';
import 'package:personaldata/src/game_master/game_master_edit_screen.dart';
import 'package:personaldata/src/game_master/model/game_master_api.dart';
import 'package:personaldata/src/game_master/model/pb/generated/slp_godcard.pb.dart';

/// 房间个人资料卡片数据管理
class RoomUserProfileLogic extends GetxController {
  final ChatRoomData room;
  final int uid;
  final String? nameReplace;
  final String? avatarUrlReplace;

  bool _me = false;

  RoomUserProfileLogic(
      {required this.room,
      required this.uid,
      required this.nameReplace,
      required this.avatarUrlReplace}) {
    _me = Session.uid == uid;
  }

  IRoomManager get roomManager {
    return ComponentManager.instance
        .getManager(ComponentManager.MANAGER_BASE_ROOM);
  }

  HomeProfileData? _data;
  ResGodCardList? _gameMasterCardList;
  HomeProfileSyncData? _profileSyncData;
  RepCirclePics? _albumPage;
  String? _error;
  bool loading = true;
  bool follow = false;

  HomeProfileData? get profileData => _data;

  ResGodCardList? get gameMasterCardList => _gameMasterCardList;

  HomeProfileSyncData? get profileSyncData => _profileSyncData;

  RepCirclePics? get albumPics => _albumPage;

  String? get error => _error;

  bool get isMe => _me;

  //非诚勿扰神秘人，头像及名称替换为神秘人，不显示资料数据
  bool get mystery =>
      (nameReplace?.isNotEmpty ?? false) ||
      (avatarUrlReplace?.isNotEmpty ?? false);

  // 是否展示资料卡装扮
  bool get showCardDecorate => Util.validStr(_data?.cardDecorate.image);

  // 是否展示生日提醒
  bool get showBirthdayRemind =>
      Util.parseInt(_profileSyncData?.base.isBirthday) == 1;

  bool get showCirclePics => !Util.isCollectionEmpty(_albumPage?.list);

  bool get showGiftWall =>
      _data?.hasGiftWall() == true && _data?.isCloseGiftWall == false;

  bool get showSegment => _data?.hasCpkSummary() == true;

  bool get showGameMaster =>
      _gameMasterCardList != null && _gameMasterCardList!.success;

  bool get showDefend => !Util.isCollectionEmpty(_data?.defendList);

  bool get hasAchieveBadgeEntrance =>
      _data?.achieveBadge != null && _data?.achieveBadge.isNotEmpty == true;

  int get userPosition {
    return roomManager.getPositionByUid(uid);
  }

  // 通用标签
  final List<CommonTagData> commonTags = [];

  @override
  void onInit() {
    super.onInit();
    eventCenter.addListener(GameMasterEditScreen.GameMasterCardDidChangeNotify,
        _gameMasterCardDidChange);
  }

  @override
  void onClose() {
    eventCenter.removeListener(
        GameMasterEditScreen.GameMasterCardDidChangeNotify,
        _gameMasterCardDidChange);
    super.onClose();
  }

  Future<void> load() async {
    List<dynamic> respList = await Api.getHomeProfileMixData(uid, room.rid,
        scene: 1,
        isSuper: room.isSuper,
        onMic: roomManager.isUidOnPosition(uid));
    ResHomeProfile resHomeProfile = respList[0];
    ResCirclePics albumPageResp = respList[1];

    if (resHomeProfile.success) {
      _error = null;
      _data = resHomeProfile.data;
      follow =
          (_data!.base.followRelation == 1 || _data!.base.followRelation == 2);
      UserImageCacheHelper.instance()
          .insert(_data!.base.uid, _data!.base.icon, _data!.base.frame);
      await _checkCommonTagData(_data!);

      if (_data!.base.hasGodcard) {
        _gameMasterCardList = await GameMasterAPI.getGameCardListRes(uid);
      }
      await _loadSyncData(_data!);
    } else {
      _error = resHomeProfile.msg;
    }

    if (albumPageResp.success) {
      _albumPage = albumPageResp.data;
    }

    loading = false;
    if (isClosed) return;
    update();
  }

  _loadSyncData(HomeProfileData profileData) async {
    ResHomeSyncProfile resHomeSyncProfile =
        await BuffApi.getHomeProfileSyncData(uid, room.rid);
    if (resHomeSyncProfile.success && resHomeSyncProfile.hasData()) {
      _profileSyncData = resHomeSyncProfile.data;
      profileData.syncProfileData(resHomeSyncProfile.data);
      follow = (profileData.base.followRelation == 1 ||
          profileData.base.followRelation == 2);
    }
  }

  int getTabCount() {
    int tabCount = 0;
    if (showCirclePics) {
      tabCount++;
    }
    if (showDefend) {
      tabCount++;
    }
    if (showGiftWall) {
      tabCount++;
    }
    if (showGameMaster) {
      tabCount++;
    }
    if (uid != Session.uid && profileSyncData?.imprint.hasOur() == true) {
      tabCount++;
    }
    if (uid == Session.uid &&
        profileSyncData?.imprint.users.isNotEmpty == true) {
      tabCount++;
    }
    return tabCount;
  }

  Future<void> _checkCommonTagData(HomeProfileData profileData) async {
    /// 个人页标签List
    if (profileData.base.tags.isNotEmpty) {
      for (int i = 0; i < profileData.base.tags.length; i++) {
        String tagString = profileData.base.tags[i];
        if (!Util.validStr(tagString)) {
          continue;
        }
        List<String> data = tagString.split(',');
        if (data.isEmpty) {
          continue;
        }

        int tagId = Util.parseInt(data[0], 0);
        if (tagId == 0) {
          continue;
        }
        String label = data.length > 1 ? data[1] : '';
        CommonTagData? tagData =
            await TagDataUtil.getCommonTagData(tagId, label);
        if (tagData != null) {
          commonTags.add(tagData);
        }
      }
    }
  }

  void reLoad() {
    if (isClosed) return;
    if (room.config == null) return;
    load();
  }

  Future onFollow(BuildContext context) async {
    if (Session.isLogined == false) {
      ILoginManager loginManager =
          ComponentManager.instance.getManager(ComponentManager.MANAGER_LOGIN);
      loginManager.show(context);
      return;
    }
    NormalNull response;
    if (follow) {
      response = await BaseRequestManager.unFollow(uid.toString());
    } else {
      String? roomType = room.config?.type;
      response = await BaseRequestManager.onFollow(
        uid.toString(),
        roomType: roomType ?? '',
        refer: 'room_user',
        settlementChannel: room.config?.settlementChannel ?? '',
        typeLabel: room.config?.typeName ?? '',
        roomFactoryType: room.config?.originalRFT ?? '',
      );
    }
    if (isClosed) return;
    if (response.success) {
      follow = !follow;
      update();
      reLoad();
    } else {
      if (response.msg.isNotEmpty) {
        Fluttertoast.showToast(msg: response.msg, gravity: ToastGravity.CENTER);
      }
    }
  }

  void _gameMasterCardDidChange(String type, dynamic data) async {
    if (isClosed) return;
    if (profileData?.base.hasGodcard == true) {
      _gameMasterCardList = await GameMasterAPI.getGameCardListRes(uid);
      update();
    }
  }
}
