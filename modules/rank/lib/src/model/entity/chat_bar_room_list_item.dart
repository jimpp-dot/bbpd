/*
 *
 *  Created by yao.qi on 2022/6/15 下午6:47
 *  Copyright (c) 2019 - 2022 . All rights reserved.
 *  Last modified 2022/6/15 下午6:47
 *
 */

import 'package:shared/shared.dart';
import 'package:json_annotation/json_annotation.dart';

part 'chat_bar_room_list_item.g.dart';

@JsonSerializable()
class ChatBarRoomListItem {
  int rid;
  int uid;
  String name;
  String property;
  String icon;
  int onlineNum;
  List<String> micIcons;
  String typeNameShow;
  String status;
  int source; // 1：最近加入；2：最近活跃；3：好友在玩

  ChatBarRoomListItem({
    required this.rid,
    required this.uid,
    required this.name,
    required this.property,
    required this.icon,
    required this.onlineNum,
    required this.micIcons,
    required this.typeNameShow,
    required this.status,
    required this.source,
  });

  factory ChatBarRoomListItem.fromJson(Map<String, dynamic> json) =>
      _$ChatBarRoomListItemFromJson(json);

  Map<String, dynamic> toJson(instance) => _$ChatBarRoomListItemToJson(this);
}
