/*
 *
 *  Created by yao.qi on 2022/6/10 下午12:26
 *  Copyright (c) 2019 - 2022 . All rights reserved.
 *  Last modified 2022/6/10 下午12:26
 *
 */

import 'package:shared/shared.dart';
import 'package:json_annotation/json_annotation.dart';

part 'room_quick_reply_msg.g.dart';

@JsonSerializable(explicitToJson: true)
class RoomQuickReplyMsg {
  bool success;
  String? msg;
  List<RoomQuickReplyMsgData>? data;

  RoomQuickReplyMsg(this.success, this.msg, this.data);

  factory RoomQuickReplyMsg.fromJson(Map<String, dynamic> srcJson) =>
      _$RoomQuickReplyMsgFromJson(srcJson);

  Map<String, dynamic> toJson() => _$RoomQuickReplyMsgToJson(this);
}

@JsonSerializable(explicitToJson: true)
class RoomQuickReplyMsgData {
  int id;
  String content;

  RoomQuickReplyMsgData(this.id, this.content);

  factory RoomQuickReplyMsgData.fromJson(Map<String, dynamic> srcJson) =>
      _$RoomQuickReplyMsgDataFromJson(srcJson);

  Map<String, dynamic> toJson() => _$RoomQuickReplyMsgDataToJson(this);
}
