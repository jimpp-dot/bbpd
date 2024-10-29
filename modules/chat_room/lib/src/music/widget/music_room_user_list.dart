import 'package:shared/shared.dart';
import 'package:chat_room/chat_room.dart';
import 'package:chat_room/k.dart';
import 'package:chat_room/src/roomNavUtil.dart';
import 'package:commonrtc_api/commonrtc_api.dart';
import 'package:flutter/material.dart';

class MusicRoomUserList extends StatefulWidget {
  final ChatRoomData room;
  final bool displayEmoteAtMic;

  const MusicRoomUserList(
      {super.key, required this.room, this.displayEmoteAtMic = true});

  @override
  State<MusicRoomUserList> createState() => _MusicRoomUserListState();
}

class _MusicRoomUserListState extends State<MusicRoomUserList> {
  @override
  Widget build(BuildContext context) {
    List<RoomPosition> onMicUser = _getOnMicUsers();
    List<KtvOffMic> offMicUser = _getOffMicUsers();
    return Container(
      width: Util.width,
      height: 48,
      margin: const EdgeInsetsDirectional.only(start: 16, end: 16),
      padding: const EdgeInsetsDirectional.only(start: 10, end: 10),
      decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.12),
          borderRadius: const BorderRadius.all(Radius.circular(12))),
      child: Row(
        children: <Widget>[
          _buildInviteIcon(),
          Expanded(
            child: CustomScrollView(
              scrollDirection: Axis.horizontal,
              slivers: <Widget>[
                /// 麦上用户
                if (onMicUser.isNotEmpty)
                  SliverFixedExtentList(
                    delegate: FixedExtentSliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                        RoomPosition item = onMicUser.elementAt(index);
                        return _buildOnMicUserItem(item);
                      },
                      childCount: onMicUser.length,
                    ),
                    itemExtent: 44,
                  ),

                /// 分割线
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsetsDirectional.only(
                        top: 12, bottom: 12, start: 5, end: 5),
                    child: Container(
                      alignment: Alignment.center,
                      width: 1,
                      color: Colors.white.withOpacity(0.3),
                    ),
                  ),
                ),

                /// 麦下用户
                if (offMicUser.isNotEmpty)
                  SliverFixedExtentList(
                    delegate: FixedExtentSliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                        KtvOffMic item = offMicUser.elementAt(index);
                        return _buildOffMicUserItem(item);
                      },
                      childCount: offMicUser.length,
                    ),
                    itemExtent: 44,
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // 麦上用户列表
  List<RoomPosition> _getOnMicUsers() {
    List<RoomPosition> onMicUser = [];
    for (int index = 0; index < widget.room.positions.length; index++) {
      RoomPosition item = widget.room.positions[index];
      if (item.uid > 0) {
        onMicUser.add(item);
      }
    }
    return onMicUser;
  }

  // 麦下用户列表
  List<KtvOffMic> _getOffMicUsers() {
    List<KtvOffMic> offMicUser = widget.room.offMicList ?? [];

    return offMicUser;
  }

  // 单个麦上用户
  Widget _buildOnMicUserItem(RoomPosition item) {
    bool isOwner = item.uid == widget.room.config?.uid;
    bool canTap = !(isOwner && (item.uid == Session.uid));

    return Container(
      height: 48,
      alignment: Alignment.center,
      child: Stack(
        clipBehavior: Clip.none,
        alignment: AlignmentDirectional.center,
        children: <Widget>[
          UserIcon(
            room: widget.room,
            position: item,
            size: 32,
            canTap: canTap,
          ),
          _buildRoleLabel(item, isOwner),
        ],
      ),
    );
  }

  /// 房主或者管理员
  Widget _buildRoleLabel(RoomPosition item, bool isOwner) {
    if (isOwner || widget.room.admins.contains(item.uid)) {
      return PositionedDirectional(
        bottom: -6,
        child: Container(
          height: 14,
          alignment: Alignment.center,
          padding: const EdgeInsetsDirectional.only(start: 4, end: 4),
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage(
                R.imagePath(
                    isOwner
                        ? "ktv_room_owner_bg.webp"
                        : "music_room_manager_bg.webp",
                    package: ComponentManager.MANAGER_BASE_ROOM),
              ),
            ),
          ),
          child: Text(
            isOwner ? K.room_owner : K.room_manage,
            style: const TextStyle(
                fontSize: 9,
                fontWeight: FontWeight.w500,
                height: 1.0,
                color: Colors.white),
            maxLines: 1,
          ),
        ),
      );
    }
    return const SizedBox.shrink();
  }

  // 邀请加入房间Icon
  Widget _buildInviteIcon() {
    return Container(
      padding: const EdgeInsetsDirectional.only(end: 4),
      child: Ink(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
              Radius.circular(IconStyles[UserIconStyle.Small]!.width / 2)),
        ),
        child: InkWell(
          onTap: () async {
            ISettingManager settingManager = ComponentManager.instance
                .getManager(ComponentManager.MANAGER_SETTINGS);
            settingManager.share(context, widget.room.rid,
                tp: 1,
                needInApp: true,
                newShareInRoom: true,
                rid: widget.room.rid);
          },
          child: R.img(
            'music/music_room_invite_icon.webp',
            width: 32,
            height: 32,
            package: ComponentManager.MANAGER_BASE_ROOM,
          ),
        ),
      ),
    );
  }

  Widget _buildOffMicUserItem(KtvOffMic item) {
    return Container(
      alignment: Alignment.center,
      child: GestureDetector(
        onTap: () async {
          onOffMicIconTap(item);
        },
        child: SizedBox(
          width: 32,
          height: 32,
          child: CommonAvatar(
            path: "${System.imageDomain}${item.icon}",
            shape: BoxShape.circle,
            size: 32,
          ),
        ),
      ),
    );
  }

  Future onOffMicIconTap(KtvOffMic item) async {
    bool isRoomOwner = (Session.uid == widget.room.config?.uid);
    bool isSelf = (Session.uid == item.uid);
    List<SheetItem> res = [];
    String title;
    if (isSelf) {
      // 自己上麦
      title = K.room_what_do_u_do_to_u;
      res.add(SheetItem(K.room_up_mic, 'mic-join'));
    } else {
      if (isRoomOwner) {
        // 房主看其他人
        title = K.room_what_do_u_do([(item.name)]);
        res.add(SheetItem(K.room_look_info, 'profile'));
        res.add(SheetItem(K.room_tab_item_package, 'gift'));
        res.add(SheetItem(K.follow, 'follow'));
        res.add(SheetItem(K.room_pick_up_mic, 'pick_up_mic'));
        res.add(SheetItem(K.room_kickout, 'kickout'));
      } else {
        // 非房主看他人资料
        return RoomNavUtil.goToImageScreenDialog(context, null, widget.room,
            userId: item.uid);
      }
    }

    SheetCallback? result = await displayModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return RadioBottomSheet(title: title, data: res);
        });
    if (result == null || result.reason == SheetCloseReason.Active) {
      return;
    }

    switch (result.value?.key) {
      case 'mic-join':
        //自己上麦
        if (widget.room.isEightOwner(Session.uid)) {
          widget.room.setRole(ClientRole.Broadcaster);
          return;
        }

        if (widget.room.config?.mode == RoomMode.Lock &&
            Session.uid != widget.room.config?.uid) {
          // 非自由上麦，排麦
          await RoomRepository.queue(
            widget.room.rid,
            RoomConstant.Queue_Join,
            needCertify: true,
            type: widget.room.needVerify,
            newType: widget.room.needVerifyNew,
          );
        } else {
          // 自由上麦，上麦
          await RoomRepository.joinMic(
            widget.room.rid,
            -1,
            uid: 0,
            toastError: true,
            toastSuccess: false,
            needCertify: true,
            type: widget.room.needVerify,
            newType: widget.room.needVerifyNew,
          );
        }
        break;
      case 'profile':
        RoomNavUtil.goToImageScreenDialog(context, null, widget.room,
            userId: item.uid);
        break;
      case 'gift':
        IGiftManager giftManager =
            ComponentManager.instance.getManager(ComponentManager.MANAGER_GIFT);
        giftManager.showRoomGiftPanel(context,
            room: widget.room, uid: item.uid);
        break;
      case 'follow':
        try {
          NormalNull response = await BaseRequestManager.onFollow(
            item.uid.toString(),
            refer: 'room',
            settlementChannel: widget.room.config?.settlementChannel ?? '',
            typeLabel: widget.room.config?.typeName ?? '',
            roomFactoryType: widget.room.config?.originalRFT ?? '',
          );
          if (response.success) {
            if (mounted) {
              Toast.showCenter(context, R.string('followed'));
            }
          } else {
            if (response.msg.isNotEmpty) {
              Fluttertoast.showToast(
                  msg: response.msg, gravity: ToastGravity.CENTER);
            }
          }
        } catch (e) {
          if (mounted) Toast.showCenter(context, e.toString());
        }
        break;
      case 'pick_up_mic':
        RoomRepository.joinMic(widget.room.rid, -1,
            uid: item.uid, needCertify: false);
        Fluttertoast.showToast(
            msg: R.string('room_wait_other_up_mic'),
            gravity: ToastGravity.CENTER);
        break;
      case 'kickout':
        await ChatRoomUtil.kickOut(context, room: widget.room, uid: item.uid);
        break;
      default:
        break;
    }
  }
}
