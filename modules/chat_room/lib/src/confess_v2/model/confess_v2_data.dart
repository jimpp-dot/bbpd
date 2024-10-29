import 'package:shared/shared.dart';
import 'package:chat_room/chat_room.dart';
import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';

part 'confess_v2_data.g.dart';

/// 麦上用户
class ConfessV2RoomPosition {
  GlobalKey? key;

  final RoomPosition roomPosition;

  ConfessV2RoomPosition({
    this.key,
    required this.roomPosition,
  }) {
    key ??= GlobalKey();
  }
}

/// 表白事件触发
/// 当触发失败事件时，next == false , giftId和toUid无值
/// 当触发解锁礼物成功事件时,next == true , giftId和toUid有值
@JsonSerializable(fieldRename: FieldRename.snake)
class ConfessV2EventTouchData {
  /// 是否解锁了下一个阶段
  bool next;

  /// 事件触发文案
  String? text;

  /// 下一阶段礼物的id
  int giftId;

  /// 被打赏人
  int toUid;

  ConfessV2EventTouchData(
      {required this.next,
      this.text,
      required this.giftId,
      required this.toUid});

  factory ConfessV2EventTouchData.fromJson(Map<String, dynamic> json) =>
      _$ConfessV2EventTouchDataFromJson(json);

  Map<String, dynamic> toJson() => _$ConfessV2EventTouchDataToJson(this);
}
