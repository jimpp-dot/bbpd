import 'dart:math';

import 'package:shared/shared.dart';
import 'package:chat_room/chat_room.dart';
import 'package:chat_room/src/base/widget/user_list_mixin.dart';
import 'package:flutter/material.dart';

/// 普通八麦
class UserListNormal extends StatefulWidget {
  final ChatRoomData room;
  final UserIconStyle iconStyle;

  const UserListNormal({
    Key? key,
    required this.room,
    this.iconStyle = UserIconStyle.Normal,
  }) : super(key: key);

  @override
  _UserListNormalState createState() => _UserListNormalState();
}

class _UserListNormalState extends State<UserListNormal> with UserListMixin {
  @override
  void initConfigs() {
    room = widget.room;
    iconStyle = widget.iconStyle;
    itemWidth = min(36.0 + (IconStyles[iconStyle]?.width ?? IconSize.normal),
        Util.width / 4);
    otherLeftMargin = (Util.width - 4 * itemWidth) / 6;
    firstLeftMargin = 1.5 * otherLeftMargin;
  }

  @override
  Widget buildContent() {
    index = 0;
    int skip = (room.isEightPosition || room.isGuessQueue) ? 0 : 1;
    List<Widget> children = [];
    int len = room.positions.length - skip;
    if (room.isBusinessHeart) {
      len = 8;
    }
    for (int i = 0; i < len; i += 4) {
      children.add(buildRowBottom(context, skip + i, itemWidth));
      if (room.isBusinessHeart && i == 0) {
        children.add(const SizedBox(height: 16));
      }
    }
    return Container(
      margin: EdgeInsetsDirectional.only(
        top: room.config?.types == RoomTypes.RadioDefend ? 8.0 : 4.0,
      ),
      child: Column(
        children: children,
      ),
    );
  }
}
