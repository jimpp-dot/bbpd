import 'package:shared/shared.dart';
import 'package:chat_room/chat_room.dart';
import 'package:flutter/material.dart';
import 'package:personaldata/k.dart';
import 'package:personaldata/src/room_user_profile/room_user_profile_logic.dart';

/// 房间个人资料卡底部按钮
class RoomUserProfileBottomWidget extends StatefulWidget {
  final RoomUserProfileLogic logic;
  final bool isOffline; // 是否为离线用户
  final int toRid; // 去往的房间//livePk
  final bool needChat; // 是否显示聊天按钮
  final int from;
  final int? groupId;

  const RoomUserProfileBottomWidget(
      {super.key,
      required this.logic,
      required this.isOffline,
      required this.toRid,
      required this.needChat,
      required this.from,
      this.groupId});

  @override
  State<RoomUserProfileBottomWidget> createState() =>
      _RoomUserProfileBottomWidgetState();
}

class _RoomUserProfileBottomWidgetState
    extends State<RoomUserProfileBottomWidget> {
  RoomUserProfileLogic get _logic => widget.logic;

  ChatRoomData get _room => widget.logic.room;

  int get _uid => widget.logic.uid;

  /// 抱上麦
  _pickUpMic() async {
    await RoomRepository.joinMic(_room.rid, -1, uid: _uid, needCertify: false);
  }

  @override
  Widget build(BuildContext context) {
    return _renderFooterNew(widget.needChat);
  }

  ///底部
  ///needChat 是否需要chat
  Widget _renderFooterNew(needChat) {
    bool needGift = true;

    // 是否是才艺直播厅
    bool isTalent =
        _room.config?.factoryType == RoomFactoryType.BusinessContent &&
            _room.config?.property == RoomProperty.Business;

    if (!liveRewardAllUserSwitch &&
        _room.config?.types == RoomTypes.Live &&
        !isTalent) {
      // 直播间:
      // 1.普通用户只能给房主打赏
      // 2.房主可以给任意用户打赏
      if ((_room.createor != null && _room.createor!.uid == _uid) ||
          Session.uid == _room.createor?.uid) {
        needGift = true;
      } else {
        needGift = false;
      }
    }

    ///桌球取消打赏按钮
    if (_room.config?.originalRFT == 'laya-billiards') {
      needGift = false;
    }

    bool needFollow = true;
    if ((_logic.avatarUrlReplace?.isNotEmpty ?? false) ||
        (_logic.nameReplace?.isNotEmpty ?? false)) {
      needFollow = false;
    }

    IRoomManager roomManager = ComponentManager.instance
        .getManager(ComponentManager.MANAGER_BASE_ROOM);
    bool showPickUp = !_logic.isMe &&
        !roomManager.isUidOnPosition(_uid) &&
        (_room.purview == Purview.Createor ||
            _room.purview == Purview.SuperAdmin) &&
        !(_room.config != null &&
            _room.config?.property == RoomProperty.Game &&
            _room.config?.type == 'juben');

    int sex = _logic.profileData!.base.sex; //(sex == 1 ? '男' : '女')

    bool showSkill =
        Util.parseBool(_logic.profileData?.generalSettings.showPkSkill);
    bool isOfficial = Session.isOfficialAccount && Session.officialType == 7;
    return Container(
      height: 55.0,
      decoration: BoxDecoration(
        color: R.colors.popMenuBgColor,
        border: _logic.getTabCount() > 2
            ? null
            : Border(top: BorderSide(color: R.color.dividerColor, width: 0.5)),
      ),
      child: Row(
        children: <Widget>[
          if (showPickUp)
            Expanded(
              child: InkWell(
                onTap: _pickUpMic,
                child: Container(
                  alignment: Alignment.center,
                  child: Text(
                    K.personaldata_pick_up_mic,
                    style: TextStyle(
                      color: R.color.mainBrandColor,
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500,
                      fontFamily: Util.fontFamily,
                    ),
                  ),
                ),
              ),
            ),
          if (needFollow)
            Expanded(
              child: InkWell(
                onTap: () {
                  if (!_logic.follow) {
                    //未关注时可关注,不可逆
                    _logic.onFollow(context);
                  }
                },
                child: Container(
                  alignment: Alignment.center,
                  child: Text(
                    _logic.follow ? K.attentioned : K.attention,
                    style: TextStyle(
                      color: _logic.follow
                          ? R.color.secondTextColor
                          : Colors.white,
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500,
                      fontFamily: Util.fontFamily,
                    ),
                  ),
                ),
              ),
            ),
          if (needChat)
            Expanded(
              child: InkWell(
                onTap: () {
                  if (Session.isLogined == false) {
                    ILoginManager loginManager = ComponentManager.instance
                        .getManager(ComponentManager.MANAGER_LOGIN);
                    loginManager.show(context);
                    return;
                  }
                  Navigator.pop(context);

                  IChatManager chatManager = ComponentManager.instance
                      .getManager(ComponentManager.MANAGER_CHAT);
                  chatManager.openUserChatScreen(context,
                      type: 'private',
                      targetId: _uid,
                      title: _logic.profileData!.base.name,
                      refer: 'room');
                },
                child: Container(
                  alignment: Alignment.center,
                  child: Text(
                    K.chat,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500,
                      fontFamily: Util.fontFamily,
                    ),
                  ),
                ),
              ),
            ),
          if (needGift)
            Expanded(
              child: InkWell(
                onTap: () {
                  if (widget.isOffline) {
                    Fluttertoast.showToast(
                        msg: K.user_offline, gravity: ToastGravity.BOTTOM);
                    return;
                  }

                  Navigator.pop(context);

                  IGiftManager giftManager = ComponentManager.instance
                      .getManager(ComponentManager.MANAGER_GIFT);

                  giftManager.showRoomGiftPanel(context,
                      room: _room, uid: _uid);
                },
                child: Container(
                  alignment: Alignment.center,
                  child: Text(
                    _room.rid == 0 && _room.chatGroupId > 0
                        ? K.personal_main_page_send_gift
                        : K.reward, //
                    style: TextStyle(
                      color: widget.isOffline
                          ? R.color.thirdTextColor
                          : Colors.white,
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500,
                      fontFamily: Util.fontFamily,
                    ),
                  ),
                ),
              ),
            ),
          if (widget.toRid > 0)
            Expanded(
              child: InkWell(
                onTap: () {
                  Navigator.pop(context);

                  int rid = widget.toRid;
                  IRoomManager roomManager = ComponentManager.instance
                      .getManager(ComponentManager.MANAGER_BASE_ROOM);
                  roomManager.openChatRoomScreenShow(context, rid);
                },
                child: Container(
                  alignment: Alignment.center,
                  child: Text(
                    sex == 1 ? K.personaldata_he_room : K.personaldata_her_room,
                    style: TextStyle(
                      color: widget.isOffline
                          ? R.color.thirdTextColor
                          : R.color.mainBrandColor,
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500,
                      fontFamily: Util.fontFamily,
                    ),
                  ),
                ),
              ),
            ),
          if (showSkill || isOfficial)
            Expanded(
              child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                  final IRoomManager roomManager0 = ComponentManager.instance
                      .getManager(ComponentManager.MANAGER_BASE_ROOM);
                  roomManager0.openKickRoomRoomMuteBottomSheet(context,
                      uid: _uid,
                      rid: _room.rid,
                      name: _logic.profileData?.base.name ?? '',
                      avatarUrl: _logic.profileData?.base.icon ?? '',
                      isOfficial: isOfficial);
                  Tracker.instance.track(TrackEvent.click,
                      properties: {'click_page': 'click_pk_button'});
                },
                child: Container(
                  alignment: Alignment.center,
                  child: Text(
                    K.personaldata_skill,
                    style: TextStyle(
                      color: widget.isOffline
                          ? R.color.thirdTextColor
                          : Colors.white,
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500,
                      fontFamily: Util.fontFamily,
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
