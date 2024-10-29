import 'dart:math';

import 'package:shared/shared.dart';
import 'package:chat_room/chat_room.dart';
import 'package:chat_room/src/base/util/god_tag_util.dart';
import 'package:chat_room/src/base/widget/room_role_widget.dart';
import 'package:chat_room/src/cplove/heart/cp_heart_pkg_at_mic.dart';
import 'package:flutter/material.dart';

import '../../k.dart';

class UserIconNameWidget extends StatefulWidget {
  final ChatRoomData room;
  final RoomPosition item;
  final double size;
  final double? width;
  final bool boss;
  final String? frameUrl;

  const UserIconNameWidget({
    Key? key,
    required this.room,
    required this.item,
    required this.size,
    this.width,
    this.boss = false,
    this.frameUrl,
  }) : super(key: key);

  @override
  _UserIconNameWidgetState createState() => _UserIconNameWidgetState();
}

class _UserIconNameWidgetState extends State<UserIconNameWidget> {
  @override
  Widget build(BuildContext context) {
    String name;
    RoomUserRole? userRole;
    bool isBoss = false;

    ChatRoomData room = widget.room;
    RoomPosition item = widget.item;

    if (room.config!.reception && item.position == 0) {
      //接待
      if (item.uid == 0) {
        name = K.room_reception;
      } else {
        name = item.name;
        userRole = RoomUserRole.Reception;
      }
    } else if (widget.boss || ChatRoomUtil.isBossChair(item)) {
      isBoss = true;
      if (item.uid == 0) {
        name = K.room_boss;
      } else {
        name = item.name;
        userRole = RoomUserRole.Boss;
      }
    } else {
      if (item.uid == 0) {
        name = K.room_empty_mic_prefix;
      } else {
        name = item.name;
      }
    }

    if (item.uid <= 0 &&
        room.config?.mode != RoomMode.Lock &&
        item.lock == true &&
        room.config?.property != RoomProperty.Private) {
      name = K.room_mic_locked;
    }

    List<Widget> res = [];
    res.add(Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        UserIcon(
          room: room,
          position: item,
          size: widget.size,
          frameUrl: widget.frameUrl,
        ),
        const SizedBox(height: 8),
        _renderNameWithTag(name, isBoss, userRole),
        CpHeartPkgAtMic(
          position: item,
          room: room,
          marginTop: 6,
        ),
      ],
    ));

    // Log.d("widget.room.uid:${widget.room.uid} + "+",uid:${item.uid}");
    if ((room.uid ?? 0) > 0 && item.uid == room.uid && !item.isMystery) {
      res.add(Positioned(
          top: -24,
          child: UserTip(
            timerCompleteCallback: () {
              if (!mounted) return;
              if (widget.room.config == null) return;
              setState(() {
                widget.room.uid = 0;
              });
            },
          )));
    }

    double width = min(36.0 + widget.size, Util.width / 4);

    return SizedBox(
      width: widget.width ?? width,
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: res,
      ),
    );
  }

  Widget _renderNameWithTag(String name, bool isBoss, RoomUserRole? userRole) {
    String? godTagIcon = GodTagUtil.getGodTagByUid(widget.item.uid);
    List<Widget> list = [];
    // 标签
    if (!Util.isStringEmpty(godTagIcon)) {
      list.add(
        Padding(
          padding: const EdgeInsetsDirectional.only(end: 3),
          child: CachedNetworkImage(
            imageUrl: Util.getRemoteImgUrl(godTagIcon),
            height: 12,
            fit: BoxFit.fitHeight,
          ),
        ),
      );
    }
    // 角色
    if (userRole != null) {
      list.add(
        RoomRoleWidget(role: userRole),
      );
    }
    Widget nameWidget = _buildName(name, widget.item, isBoss);
    if (list.isEmpty) {
      return nameWidget;
    } else {
      list.add(Flexible(child: nameWidget));
    }
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: list,
    );
  }

  Widget _buildName(String name, RoomPosition item, bool isBoss) {
    Color textColor = Colors.white;

    if (item.uid == 0 || isBoss) {
      if (item.uid == 0) {
        textColor = Colors.white.withOpacity(0.4);
      }

      if (isBoss) {
        textColor = const Color(0xFFFFE735);
      }

      return Text(
        name.toCharacterBreakStr(),
        maxLines: 1,
        textAlign: TextAlign.center,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
            height: 1.2,
            fontSize: 11,
            color: textColor,
            letterSpacing: 0,
            wordSpacing: 0),
      );
    }

    List<Color> colors = item.colorfulName ?? [];
    if (colors.isEmpty) {
      return Text(
        item.name.toCharacterBreakStr(),
        style: const TextStyle(
          color: Colors.white,
          height: 1.2,
          fontSize: 11.0,
          letterSpacing: 0.0,
          wordSpacing: 0.0,
        ),
        maxLines: 1,
        textAlign: TextAlign.center,
        overflow: TextOverflow.ellipsis,
      );
    }

    return ColorfulNickName(
      colors: colors,
      textBuild: (bool show, {Key? key, Paint? paint}) {
        return Text(
          name.toCharacterBreakStr(),
          key: key,
          maxLines: 1,
          textAlign: TextAlign.center,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            height: 1.2,
            fontSize: 11.0,
            letterSpacing: 0.0,
            wordSpacing: 0.0,
            foreground: paint,
          ),
        );
      },
    );
  }
}
