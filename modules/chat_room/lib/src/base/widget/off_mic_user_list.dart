import 'package:shared/shared.dart';
import 'package:commonrtc_api/commonrtc_api.dart';
import 'package:flutter/material.dart';

import '../../../chat_room.dart';
import '../../../k.dart';
import '../../roomNavUtil.dart';

class OffMicUserList extends StatefulWidget {
  final ChatRoomData room;

  const OffMicUserList({super.key, required this.room});

  @override
  State<StatefulWidget> createState() {
    return _OffMicUserListState();
  }

  List<KtvOffMic> getOffMicUserList() {
    List<KtvOffMic>? offMicUser = room.offMicList;
    return offMicUser ?? [];
  }
}

class _OffMicUserListState extends State<OffMicUserList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: Util.width,
      height: 48,
      margin: const EdgeInsetsDirectional.only(start: 12, end: 12),
      padding: const EdgeInsetsDirectional.only(start: 8, end: 4),
      decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.12),
          borderRadius: const BorderRadius.all(Radius.circular(12))),
      child: Row(
        children: <Widget>[
          _buildInviteIcon(),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return _buildUserItem(
                    context, widget.getOffMicUserList()[index]);
              },
              itemCount: widget.getOffMicUserList().length,
            ),
          ),
          _buildOffMicNum(),
        ],
      ),
    );
  }

  Widget _buildOffMicNum() {
    /// 隐藏展示房间真实人数的UI
    return const SizedBox.shrink();
    // int num = widget.getOffMicUserList().length;
    // return GestureDetector(
    //   onTap: () async {
    //     RoomNavUtil.openRoomAdminScreen(
    //       context,
    //       rid: widget.room.rid,
    //       purview: widget.room.purview,
    //       types: widget.room.config.types,
    //       fullScreenDialog: true,
    //       uid: widget.room.createor?.uid,
    //     );
    //   },
    //   child: Container(
    //     width: 32,
    //     height: 32,
    //     margin: const EdgeInsetsDirectional.only(start: 8),
    //     decoration: BoxDecoration(
    //       borderRadius: const BorderRadius.all(Radius.circular(8)),
    //       color: Colors.white.withOpacity(0.12),
    //     ),
    //     alignment: AlignmentDirectional.center,
    //     child: Column(
    //       mainAxisSize: MainAxisSize.min,
    //       crossAxisAlignment: CrossAxisAlignment.center,
    //       children: [
    //         Text(
    //           K.room_off_mic_num([(num <= 99 ? '$num' : '99+')]),
    //           style: const TextStyle(
    //             fontSize: 8,
    //             color: Colors.white,
    //           ),
    //           maxLines: 1,
    //         ),
    //         Text(
    //           K.room_off_mic,
    //           style: const TextStyle(
    //             fontSize: 8,
    //             color: Colors.white,
    //           ),
    //           maxLines: 1,
    //         ),
    //       ],
    //     ),
    //   ),
    // );
  }

  Widget _buildInviteIcon() {
    return GestureDetector(
      onTap: () async {
        ISettingManager settingManager = ComponentManager.instance
            .getManager(ComponentManager.MANAGER_SETTINGS);
        settingManager.share(context, widget.room.realRid,
            tp: 1,
            needInApp: true,
            newShareInRoom: true,
            rid: widget.room.realRid);
      },
      child: R.img(
        'room_invite_friend.png',
        width: IconSize.offMic,
        height: IconSize.offMic,
        package: ComponentManager.MANAGER_BASE_ROOM,
      ),
    );
  }

  Widget _buildUserItem(BuildContext context, KtvOffMic item) {
    return GestureDetector(
      onTap: () async {
        onOffMicIconTap(item);
      },
      child: Container(
        width: IconSize.offMic + 2,
        height: IconSize.offMic + 2,
        margin: const EdgeInsetsDirectional.only(start: 8, top: 7, bottom: 7),
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.white10, width: 1),
          ),
          child: CommonAvatarWithFrame(
            framePath: Util.getFullFramePath(item.frame), // 头像框
            overflow: -3.0,
            childWidget: CommonAvatar(
              path: item.icon,
              shape: BoxShape.circle,
              size: IconSize.offMic,
            ),
          ),
        ),
      ),
    );
  }

  void onOffMicIconTap(KtvOffMic item) async {
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
        RoomNavUtil.goToImageScreenDialog(context, null, widget.room,
            userId: item.uid);
        return;
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
              widget.room.realRid, RoomConstant.Queue_Join,
              needCertify: true,
              type: widget.room.needVerify,
              newType: widget.room.needVerifyNew);
        } else {
          // 自由上麦，上麦
          await RoomRepository.joinMic(
            widget.room.realRid,
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
              Toast.showCenter(context, K.followed);
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
        RoomRepository.joinMic(widget.room.realRid, -1,
            uid: item.uid, needCertify: false);
        Fluttertoast.showToast(
            msg: K.room_wait_other_up_mic, gravity: ToastGravity.CENTER);
        break;
      case 'kickout':
        await ChatRoomUtil.kickOut(context, room: widget.room, uid: item.uid);
        break;
      default:
        break;
    }
  }
}
