import 'package:shared/shared.dart';
import 'package:shared/widget/sound_fast_ware.dart';
import 'package:flutter/material.dart';
import 'package:chat_room/k.dart';
import 'package:chat_room/chat_room.dart' hide SoundFastWare;
import 'package:were_wolf/src/room/wolfv2/widget/wolf_user_icon.dart';

///
/// 麦位用户头像基础控件,主要包括：
/// 1.基本点击操作(部分实现有chat_room_screen中年实现)
/// 2.基本的用户头像:用户在麦上则未头像,否则等大小的Container
/// 4.说话波纹(待去除)
///
class WolfBaseUserIcon extends StatefulWidget {
  final RoomPosition position;
  final UserIconStyle? style;
  final ChatRoomData room;
  final bool displayEmote;
  final double size;

  const WolfBaseUserIcon({
    super.key,
    required this.room,
    required this.position,
    this.style,
    this.displayEmote = true,
    this.size = 44.0,
  });

  @override
  WolfBaseUserIconState createState() {
    return WolfUserIconState();
  }
}

class WolfBaseUserIconState extends State<WolfBaseUserIcon> {
  @override
  void didUpdateWidget(WolfBaseUserIcon oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget != widget) {
      setState(() {});
    }
  }

  //点击空麦位
  Future<List<SheetItem>> buildEmptyMicSheet(Purview purview) async {
    List<SheetItem> res = [];
    switch (purview) {
      case Purview.Createor:
      case Purview.SuperAdmin:
        if (!widget.room.isMic) {
          res.add(SheetItem(R.string('room_up_mic_self'), "mic-join")); //自己上麦
        }
        res.add(
            SheetItem(R.string('room_pic_other_mic'), "mic-join-other")); //抱人上麦
        break;

      case Purview.Admin:
        if (widget.room.isMic) {
          Fluttertoast.showToast(
              msg: R.string('room_in_mic_limit'), gravity: ToastGravity.CENTER);
          return res;
        }
        res.add(SheetItem(R.string('room_up_mic_self'), "mic-join"));
        break;

      case Purview.Normal:
        if (widget.room.isMic) {
          Fluttertoast.showToast(
              msg: R.string('room_in_mic_limit'), gravity: ToastGravity.CENTER);
          return res;
        }
        if (widget.room.config?.mode == RoomMode.Lock &&
            widget.room.config?.property != RoomProperty.Private) {
          bool? ok = await showDialog(
              barrierDismissible: false,
              context: context,
              builder: (BuildContext context) {
                return ConfirmDialog(
                  title: K.room_notice,
                  content: K.room_sure_to_apply_mic,
                  negativeButton: NegativeButton(
                      text: K.cancel,
                      onPressed: () {
                        Navigator.of(context).pop(false);
                      }),
                  positiveButton: PositiveButton(
                      text: K.sure,
                      onPressed: () {
                        Navigator.of(context).pop(true);
                      }),
                );
              });
          if (ok == true) {
            Map? data = await RoomRepository.queue(
                widget.room.rid, RoomConstant.Queue_Join,
                boss: false,
                isAuction: false,
                needCertify: true,
                type: widget.room.needVerify,
                newType: widget.room.needVerifyNew);
            if (data != null &&
                data.containsKey('certify') &&
                data['certify'] == false) {
              // 未认证
              // do nothing
            } else {
              IRoomManager roomManager = ComponentManager.instance
                  .getManager(ComponentManager.MANAGER_BASE_ROOM);
              dynamic result = await roomManager
                  .openMicUpWaitListBottomPanel(context, room: widget.room);
              return result ?? res;
            }
          }
        } else {
          RoomRepository.joinMic(widget.room.rid, widget.position.position,
              needCertify: true,
              type: widget.room.needVerify,
              newType: widget.room.needVerifyNew);
        }
        break;
    }
    return res;
  }

  //点击自己的麦位
  List<SheetItem> buildSelfSheet() {
    List<SheetItem> res = [];
    res.add(
        SheetItem(R.string('room_leave_mic_lietence'), "mic-leavel")); //下麦旁听
    return res;
  }

  //点击其它人的麦位
  List<SheetItem> buildInMicSheet(Purview purview) {
    List<SheetItem> res = [];
    res.add(SheetItem(R.string('room_look_info'), "profile")); //看资料

    res.add(SheetItem(R.string('room_tab_item_package'), "gift")); //打赏

    res.add(SheetItem(R.string('follow'), "follow")); //关注

    switch (purview) {
      case Purview.Createor:
      case Purview.SuperAdmin:
        IWereWolfManager wereWolfManager = ComponentManager.instance
            .getManager(ComponentManager.MANAGER_WERE_WOLF);
        // 非游戏过程中可以开麦/禁麦
        if (!wereWolfManager.isGaming()) {
          if (widget.position.forbidden) {
            res.add(SheetItem(R.string('room_open_mic'), "mic-unforbidden"));
          } else {
            res.add(SheetItem(R.string('room_close_mic'), "mic-forbidden"));
          }
        }
        res.add(SheetItem(
            R.string('room_leave_mic_lietence'), "mic-leavel")); //下麦旁听
        res.add(SheetItem(R.string('room_kickout'), "kickout")); //踢出房间

        if (purview == Purview.Createor) {
          if (widget.room.admins.contains(widget.position.uid)) {
            res.add(SheetItem(R.string('room_cancel_manage'), "admin.cancel"));
          } else {
            res.add(SheetItem(
                R.string('room_set_reception_manager'), "admin.set.super"));
            res.add(
                SheetItem(R.string('room_set_normal_manager'), "admin.set"));
          }
        }
        break;

      case Purview.Admin:
      case Purview.Normal:
        res.clear();
        IRoomManager roomManager = ComponentManager.instance
            .getManager(ComponentManager.MANAGER_BASE_ROOM);
        roomManager.goToImageScreenDialog(
            context, widget.position, widget.room);
        return res;
    }

    return res;
  }

  onIconTap() async {
    List<SheetItem> res = [];
    Purview purview = widget.room.purview;
    String title = R.string('room_operate_options');

    if (widget.position.uid == 0) {
      //点击空麦位
      res = await buildEmptyMicSheet(purview);
    } else if (widget.position.uid == Session.uid) {
      //点击自己的麦位
      title = R.string('room_what_do_u_do_to_u');
      res = buildSelfSheet();
    } else {
      //点击其它人麦位
      title = R.string('room_what_do_u_do', args: [(widget.position.name)]);
      res = buildInMicSheet(purview);
    }

    if (res.isEmpty) return;

    SheetCallback? result = await displayModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return RadioBottomSheet(title: title, data: res);
        });
    if (result == null || result.reason == SheetCloseReason.Active) {
      return;
    }

    if (result.value?.key == 'mic-leavel') {
      IWereWolfManager wereWolfManager = ComponentManager.instance
          .getManager(ComponentManager.MANAGER_WERE_WOLF);
      // 游戏过程中不能下麦
      if (wereWolfManager.isGaming()) {
        Fluttertoast.showToast(
            msg: R.string('room_cant_leave_mic_in_playing'),
            gravity: ToastGravity.CENTER);
        return;
      }
    }

    ChatRoomUtil.handleIconTap(
        context, widget.room, widget.position, result.value?.key);
  }

  //头像或者对应大小的Container
  Widget _renderIcon(context) {
    if (widget.position.uid > 0) {
      String icon = '';
      icon = widget.position.icon;
      String image = '${System.imageDomain}$icon!head150';
      return Container(
        width: widget.size,
        height: widget.size,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
        ),
        alignment: Alignment.center,
        child: HeadIcon(
          icon: image,
          width: widget.size,
          height: widget.size,
        ),
      );
    } else {
      return Container(
        width: widget.size,
        height: widget.size,
        alignment: Alignment.center,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> res = [];

    ///麦上光圈
    res.add(ValueListenableBuilder(
        valueListenable: widget.room.speakers,
        builder: (context, speakers, child) {
          return SoundEffectWidget(
            isSpeaking: speakers.containsKey(widget.position.uid),
            aniColor: const Color(0xFF00E34B),
            width: widget.size,
            borderWidth: 4.0,
            ring: widget.position.ring,
          );
        }));

    res.add(SizedBox(
        key: widget.position.key,
        width: widget.size,
        child: InkWell(
          onTap: onIconTap,
          child: _renderIcon(context),
        )));

    /// 活动的搞怪头像
    if (widget.position.uid > 0) {
      String? gamesTrickPunishImg =
          widget.room.config?.getGamesTrickPunishImg(widget.position.uid);
      if (gamesTrickPunishImg != null && gamesTrickPunishImg.isNotEmpty) {
        double overflow = -5.0;
        res.add(
          PositionedDirectional(
            start: overflow,
            end: overflow,
            top: overflow,
            bottom: overflow,
            child: IgnorePointer(
              child: CachedNetworkImage(
                imageUrl: gamesTrickPunishImg,
                errorWidget: Container(),
              ),
            ),
          ),
        );
      }
    }

    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: res,
    );
  }
}
