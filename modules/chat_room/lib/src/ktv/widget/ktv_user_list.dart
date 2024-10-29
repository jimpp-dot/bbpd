import 'package:shared/shared.dart';
import 'package:chat_room/src/base/util/god_tag_util.dart';
import 'package:chat_room/src/ktv/ktv_music_controller.dart';
import 'package:commonrtc_api/commonrtc_api.dart';
import 'package:flutter/material.dart';

import '../../../chat_room.dart';
import '../../../k.dart';
import '../../roomNavUtil.dart';

class KtvUserList extends StatelessWidget {
  static final double _iconSize = IconStyles[UserIconStyle.Small]?.width ?? 44;

  final ChatRoomData room;

  const KtvUserList({Key? key, required this.room}) : super(key: key);

  // 演唱者UID
  int get singerUid {
    int uid = 0;
    if (room.config?.ktvInfo?.currentSong != null) {
      uid = room.config!.ktvInfo!.currentSong!.uid;
    }
    return uid;
  }

  // 伴唱者UID
  int get chorusUid {
    int uid = 0;
    if (room.config?.ktvInfo?.chorus != null) {
      uid = room.config!.ktvInfo!.chorus!.uid;
    }
    return uid;
  }

  // 麦上用户列表
  List<RoomPosition> _getOnMicUsers() {
    List<RoomPosition> onMicUser = [];
    if (room.isEightPosition) {
      onMicUser.add(RoomPosition.fromCreator(room.createor!));
    }
    for (int index = 0; index < room.positions.length; index++) {
      RoomPosition item = room.positions[index];
      if (item.uid > 0) {
        // 麦上有用户
        // 演唱者需要插到房主后面（房主是否已在队列中）
        if (singerUid > 0 &&
            singerUid != room.config?.uid &&
            singerUid == item.uid) {
          if (onMicUser.isNotEmpty && onMicUser[0].uid == room.config?.uid) {
            // 房主已经添加在列表中，插入到房主后面
            onMicUser.insert(1, item);
          } else {
            onMicUser.insert(0, item);
          }
        } else if (chorusUid > 0 &&
            chorusUid != room.config?.uid &&
            chorusUid == item.uid) {
          /// 伴唱插入到主唱后面
          bool alreadySinger = onMicUser
              .any((element) => (singerUid > 0 && element.uid == singerUid));
          bool alreadyRoomUser = (singerUid != room.config?.uid) &&
              onMicUser.any((element) =>
                  (singerUid > 0 && element.uid == room.config?.uid));
          int insertIndex =
              0 + (alreadySinger ? 1 : 0) + (alreadyRoomUser ? 1 : 0);
          onMicUser.insert(insertIndex, item);
        } else if (room.config?.uid == item.uid) {
          // 房主插入到第一个
          onMicUser.insert(0, item);
        } else {
          onMicUser.add(item);
        }
      }
    }

    // 强制让房主头像展示在最前面，K歌房原本要开房主位，由于后台需要知道房主演唱时的麦序不开房主位，由客户端强制展示
    if (onMicUser.isEmpty || onMicUser[0].uid != room.config?.uid) {
      onMicUser.insert(0, RoomPosition.fromCreator(room.createor!));
    }

    return onMicUser;
  }

  @override
  Widget build(BuildContext context) {
    List<RoomPosition> onMicUser = _getOnMicUsers();

    List<KtvOffMic> offMicUser = room.config?.ktvInfo?.offMicList ?? [];

    return SizedBox(
      width: Util.width,
      height: 60,
      child: Row(
        children: <Widget>[
          _buildInviteIcon(),
          Expanded(
            child: CustomScrollView(
              scrollDirection: Axis.horizontal,
              slivers: <Widget>[
                const SliverPadding(
                  padding: EdgeInsetsDirectional.only(start: 4),
                ),
                // 麦上用户
                if (onMicUser.isNotEmpty)
                  SliverFixedExtentList(
                    delegate: FixedExtentSliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                        RoomPosition item = onMicUser.elementAt(index);
                        return _buildOnMicUserItem(item);
                      },
                      childCount: onMicUser.length,
                    ),
                    itemExtent: _iconSize + 8,
                  ),
                if (offMicUser.isNotEmpty)
                  SliverFixedExtentList(
                    delegate: FixedExtentSliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                        KtvOffMic item = offMicUser.elementAt(index);
                        return buildOffMicUserItem(item);
                      },
                      childCount: offMicUser.length,
                    ),
                    itemExtent: _iconSize + 8,
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOnMicUserItem(RoomPosition item) {
    Widget roleWidget = const SizedBox.shrink();
    Widget? micWidget;
    // 是否为演唱者
    bool isSinger = (singerUid > 0 && item.uid == singerUid);
    if (isSinger || KtvMusicController.getChorusUid() == item.uid) {
      if (item.forbidden || item.micStatus < 1) {
        // 演唱者只显示闭麦标识
        String icon = 'ktv_mic_forbidden_icon.webp';
        micWidget = Row(
          children: <Widget>[
            const Spacer(),
            Container(
              width: 14,
              height: 14,
              decoration: const BoxDecoration(
                  color: Colors.white, shape: BoxShape.circle),
              alignment: Alignment.center,
              child: R.img(
                icon,
                width: 12,
                height: 12,
                package: ComponentManager.MANAGER_BASE_ROOM,
              ),
            ),
            const SizedBox(width: 4),
          ],
        );
      }
      roleWidget = Container(
        height: 14,
        constraints: BoxConstraints(maxWidth: _iconSize),
        margin: EdgeInsetsDirectional.only(top: _iconSize - 14),
        padding: const EdgeInsetsDirectional.only(start: 4, end: 4, top: 3),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
        child: Text(
          isSinger ? K.room_ktv_singer_title : K.room_ktv_chorus,
          style: TextStyle(
            fontSize: 9,
            fontWeight: FontWeight.w500,
            height: 1.0,
            color: isSinger ? const Color(0xFF8369FD) : const Color(0xFFFF4267),
          ),
          maxLines: 1,
        ),
      );
    } else if (item.uid == room.config?.uid) {
      // 房主
      roleWidget = Container(
        height: 14,
        constraints: BoxConstraints(maxWidth: _iconSize),
        margin: EdgeInsetsDirectional.only(top: _iconSize - 14),
        padding: const EdgeInsetsDirectional.only(start: 4, end: 4, top: 3),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(15)),
          image: DecorationImage(
            image: AssetImage(R.imagePath("ktv_room_owner_bg.webp",
                package: ComponentManager.MANAGER_BASE_ROOM)),
            fit: BoxFit.fill,
          ),
        ),
        child: Text(
          K.room_owner,
          style: const TextStyle(
            fontSize: 9,
            fontWeight: FontWeight.w500,
            height: 1.0,
            color: Colors.white,
          ),
          maxLines: 1,
        ),
      );
    } else {
      String icon = 'ktv_in_mic_icon.webp';
      if (item.forbidden || item.micStatus < 1) {
        icon = 'ktv_mic_forbidden_icon.webp';
      }

      micWidget = Row(
        children: <Widget>[
          const Spacer(),
          Container(
            width: 14,
            height: 14,
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            alignment: Alignment.center,
            child: R.img(
              icon,
              width: 12,
              height: 12,
              package: ComponentManager.MANAGER_BASE_ROOM,
            ),
          ),
          const SizedBox(width: 4),
        ],
      );
    }
    String godTagIcon = GodTagUtil.getGodTagByUid(item.uid);
    return Container(
      width: 52,
      height: 60,
      alignment: Alignment.center,
      child: Stack(
        clipBehavior: Clip.none,
        fit: StackFit.loose,
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          UserIcon(
            size: IconSize.small,
            room: room,
            position: item,
            showMicIcon: false,
            children: [roleWidget],
          ),
          if (micWidget != null) micWidget,
          if (!Util.isStringEmpty(godTagIcon))
            PositionedDirectional(
              top: IconSize.small + 5,
              child: R.img(
                Util.getRemoteImgUrl(godTagIcon),
                height: 12,
                fit: BoxFit.fitHeight,
              ),
            ),
        ],
      ),
    );
  }

  // 邀请加入房间Icon
  Widget _buildInviteIcon() {
    return Padding(
      padding: const EdgeInsetsDirectional.only(start: 12, top: 8, bottom: 8),
      child: Ink(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(_iconSize / 2)),
        ),
        child: InkWell(
          onTap: () async {
            ISettingManager settingManager = ComponentManager.instance
                .getManager(ComponentManager.MANAGER_SETTINGS);
            settingManager.share(System.context, room.rid,
                tp: 1, needInApp: true, newShareInRoom: true, rid: room.rid);
          },
          child: R.img(
            'ktv_room_invite_icon.webp',
            width: _iconSize,
            height: _iconSize,
            package: ComponentManager.MANAGER_BASE_ROOM,
          ),
        ),
      ),
    );
  }

  Widget buildOffMicUserItem(KtvOffMic item) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
      child: GestureDetector(
        onTap: () => _onOffMicIconTap(item),
        child: SizedBox(
          width: _iconSize,
          height: _iconSize,
          child: CommonAvatarWithFrame(
            framePath: Util.getFullFramePath(item.frame), // 头像框
            overflow: -3.0,
            childWidget: CommonAvatar(
              path: item.icon,
              shape: BoxShape.circle,
              size: _iconSize,
            ),
          ),
        ),
      ),
    );
  }

  void _onOffMicIconTap(KtvOffMic item) async {
    bool isRoomOwner = (Session.uid == room.config?.uid);
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
        RoomNavUtil.goToImageScreenDialog(System.context, null, room,
            userId: item.uid);
        return;
      }
    }

    SheetCallback? result = await displayModalBottomSheet(
        context: System.context,
        builder: (BuildContext context) {
          return RadioBottomSheet(title: title, data: res);
        });
    if (result == null || result.reason == SheetCloseReason.Active) {
      return;
    }

    switch (result.value?.key) {
      case 'mic-join':
        //自己上麦
        if (room.isEightOwner(Session.uid)) {
          room.setRole(ClientRole.Broadcaster);
          return;
        }

        if (room.config?.mode == RoomMode.Lock &&
            Session.uid != room.config?.uid) {
          // 非自由上麦，排麦
          await RoomRepository.queue(
            room.rid,
            RoomConstant.Queue_Join,
            needCertify: true,
            type: room.needVerify,
            newType: room.needVerifyNew,
          );
        } else {
          // 自由上麦，上麦
          await RoomRepository.joinMic(
            room.rid,
            -1,
            uid: 0,
            toastError: true,
            toastSuccess: false,
            needCertify: true,
            type: room.needVerify,
            newType: room.needVerifyNew,
          );
        }
        break;
      case 'profile':
        RoomNavUtil.goToImageScreenDialog(System.context, null, room,
            userId: item.uid);
        break;
      case 'gift':
        IGiftManager giftManager =
            ComponentManager.instance.getManager(ComponentManager.MANAGER_GIFT);
        giftManager.showRoomGiftPanel(System.context,
            room: room, uid: item.uid);
        break;
      case 'follow':
        try {
          NormalNull response = await BaseRequestManager.onFollow(
            item.uid.toString(),
            refer: 'room',
            settlementChannel: room.config?.settlementChannel ?? '',
            typeLabel: room.config?.typeName ?? '',
            roomFactoryType: room.config?.originalRFT ?? '',
          );
          if (response.success) {
            Fluttertoast.showCenter(msg: R.string('followed'));
          } else {
            if (response.msg.isNotEmpty) {
              Fluttertoast.showToast(
                  msg: response.msg, gravity: ToastGravity.CENTER);
            }
          }
        } catch (e) {
          Fluttertoast.showCenter(msg: e.toString());
        }
        break;
      case 'pick_up_mic':
        RoomRepository.joinMic(room.rid, -1, uid: item.uid, needCertify: false);
        Fluttertoast.showToast(
            msg: R.string('room_wait_other_up_mic'),
            gravity: ToastGravity.CENTER);
        break;
      case 'kickout':
        await ChatRoomUtil.kickOut(System.context, room: room, uid: item.uid);
        break;
      default:
        break;
    }
  }
}
