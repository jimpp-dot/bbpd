import 'package:shared/shared.dart';
import 'package:shared/widget/sound_fast_ware.dart';
import 'package:chat_room/src/base/punish/model/punish_beans.dart'
    hide UserPunish;
import 'package:chat_room/src/base/punish/widget/punish_stick_widget.dart';
import 'package:chat_room/src/biz_plugin/crosspk/model/repo.dart';
import 'package:chat_room/src/protobuf/generated/punish.pb.dart';
import 'package:chat_room/src/protobuf/generated/room_cross_pk.pb.dart';
import 'package:flutter/cupertino.dart';

import '../../../../assets.dart';
import '../../../../k.dart';
import '../../../chatRoomData.dart';

class CrossPkUserIcon extends StatefulWidget {
  final bool isAudience;
  final UserPunish? punish;
  final RoomCrossPkRoleInfo? item;
  final ChatRoomData room;
  final bool showMainIcon;

  const CrossPkUserIcon(
      {Key? key,
      this.isAudience = false,
      this.punish,
      this.item,
      this.showMainIcon = false,
      required this.room})
      : super(key: key);

  @override
  CrossPkUserIconState createState() {
    return CrossPkUserIconState();
  }
}

class CrossPkUserIconState extends State<CrossPkUserIcon> {
  double iconWidth = 36;

  @override
  Widget build(BuildContext context) {
    List<Widget> widgets = [];

    if (widget.item == null) {
      widgets.add(
        R.img(
          widget.showMainIcon
              ? RoomAssets.chat_room$crosspk_matching_icon_main_webp
              : RoomAssets.chat_room$crosspk_matching_icon_webp,
          width: iconWidth,
          height: iconWidth,
        ),
      );
    } else {
      Widget iconWidget;
      if (!Util.validStr(widget.item!.icon)) {
        iconWidget = R.img(
          widget.showMainIcon
              ? RoomAssets.chat_room$crosspk_matching_icon_main_webp
              : RoomAssets.chat_room$crosspk_matching_icon_webp,
          width: iconWidth,
          height: iconWidth,
        );
      } else {
        iconWidget = CommonAvatar(
          path: widget.item!.icon,
          shape: BoxShape.circle,
          size: iconWidth,
        );
      }

      /// 惩罚的头像马赛克
      if (Util.validList(widget.punish?.punish)) {
        int index = widget.punish!.punish.indexWhere((element) =>
            (element.uid == widget.item!.uid) &&
            (parseSystemPunishType(element.type) == SystemPunishType.mask));
        if (index >= 0) {
          iconWidget = ImageBlurWidget(
            borderRadius: iconWidth / 2,
            child: iconWidget,
          );
        }
      }

      widgets.add(
        GestureDetector(
          child: iconWidget,
          onTap: () async {
            if (Session.uid == widget.item!.uid) {
              /// 点击自己无响应
              return;
            } else if (widget.isAudience == true) {
              /// 非PK主播点击
              if (widget.item!.rid == widget.room.rid) {
                //当前房间
                _openPersonalDialog(widget.item!.uid, 0);
              } else {
                //连麦主播房间
                _openPersonalDialog(widget.item!.uid, widget.item!.rid);
              }
            } else {
              /// 参与PK的主播点击另一方的头像，开麦/闭麦
              List<SheetItem> res = [];
              if (widget.item!.micStatus == 2) {
                res.add(SheetItem(K.live_pk_open_mic, "openJoinMic"));
              } else {
                res.add(SheetItem(K.live_pk_close_mic, "closeJoinMic"));
              }

              if (res.isNotEmpty) {
                String title = K.room_operate_options;
                SheetCallback? result = await displayModalBottomSheet(
                    context: this.context,
                    builder: (BuildContext context) {
                      return RadioBottomSheet(title: title, data: res);
                    });
                if (result == null ||
                    result.reason == SheetCloseReason.Active) {
                  return;
                }
                if (result.value?.key == 'openJoinMic' ||
                    result.value?.key == 'closeJoinMic') {
                  int option;
                  if (result.value?.key == 'closeJoinMic') {
                    option = 1;
                  } else {
                    option = 0;
                  }
                  CrossPKRepo.pkQuiet(
                      widget.room.rid, widget.item!.uid, option);
                }
              }
            }
          },
        ),
      );

      /// 惩罚
      if (Util.validList(widget.punish?.punish)) {
        // 搞笑头像框
        int index = widget.punish!.punish.indexWhere((element) =>
            (element.uid == widget.item!.uid) &&
            (parseSystemPunishType(element.type) == SystemPunishType.header));
        if (index >= 0) {
          UserPunishItem userPunish = widget.punish!.punish[index];
          String frameImage = Util.getRemoteImgUrl(userPunish.content);
          double overflow = -5.0;
          if (iconWidth <= 44) {
            // 小麦位的头像框适配
            overflow = -3.0;
          }
          widgets.add(
            PositionedDirectional(
              start: overflow,
              end: overflow,
              top: overflow,
              bottom: overflow,
              child: IgnorePointer(
                child: CachedNetworkImage(
                  imageUrl: frameImage,
                  errorWidget: Container(),
                ),
              ),
            ),
          );
        }

        // 贴纸条
        int paperIndex = widget.punish!.punish.indexWhere((element) =>
            (element.uid == widget.item!.uid) &&
            (parseSystemPunishType(element.type) == SystemPunishType.paper));
        if (paperIndex >= 0) {
          widgets.add(PunishPaperWidget(
              size: iconWidth,
              count: widget.punish!.punish[paperIndex].paperCount));
        }
      }

      ///麦上光圈
      widgets.add(ValueListenableBuilder(
        valueListenable: widget.room.speakers,
        builder: (context, speakers, child) {
          return SoundEffectWidget(
            isSpeaking: speakers.containsKey(widget.item!.uid) &&
                widget.item!.rid != widget.room.rid,
            aniColor: R.color.mainBrandColor,
            width: iconWidth,
            borderWidth: 3.0,
          );
        },
      ));

      //禁麦或者被禁麦
      String forBiddenIcon = '';
      if (widget.item!.micStatus == 2) {
        //被关麦
        if (widget.item!.rid == widget.room.rid) {
          forBiddenIcon = 'live/room_live_pk_mic_be_forbiden.webp'; //被禁了
        } else {
          forBiddenIcon = 'live/room_live_pk_mic_forbiden.webp'; //禁了别人
        }
      }
      if (forBiddenIcon.isNotEmpty) {
        widgets.add(
          PositionedDirectional(
            end: 0.0,
            bottom: 0.0,
            child: IgnorePointer(
              child: R.img(
                forBiddenIcon,
                width: 10.0,
                height: 10.0,
                package: ComponentManager.MANAGER_BASE_ROOM,
              ),
            ),
          ),
        );
      }
    }

    return SizedBox(
      width: iconWidth,
      height: iconWidth,
      child: Stack(
        clipBehavior: Clip.none,
        alignment: AlignmentDirectional.center,
        children: widgets,
      ),
    );
  }

  void _openPersonalDialog(int uid, int toRid) {
    IPersonalDataManager manager = ComponentManager.instance
        .getManager(ComponentManager.MANAGER_PERSONALDATA);
    manager.openImageFloatScreenDisplayModalBottomSheet(
        context, uid, widget.room, 0,
        toRid: toRid);
  }
}
