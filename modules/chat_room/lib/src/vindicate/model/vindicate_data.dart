import 'package:shared/shared.dart';
import 'package:chat_room/chat_room.dart';
import 'package:chat_room/src/vindicate/vindicate_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';

part 'vindicate_data.g.dart';

/// 表白活动数据
class VindicateData {
  List<VindicateGiftData>? currentUserGifts;

  final Map<String, List<VindicateGiftData>> _cachedUserGiftsMap = {};

  setUserGiftDataList(
      {required int uid, List<VindicateGiftData>? giftDataList}) {
    if (giftDataList != null || giftDataList!.isNotEmpty) {
      _cachedUserGiftsMap['$uid'] = giftDataList;
    }
  }
}

/// 麦上用户
class VindicateRoomPosition {
  GlobalKey? key;

  final RoomPosition roomPosition;

  VindicateRoomPosition({
    this.key,
    required this.roomPosition,
  }) {
    key ??= GlobalKey();
  }
}

/// 表白活动礼物数据
@JsonSerializable(fieldRename: FieldRename.snake)
class VindicateGiftData {
  int giftId;

  int giftCid;

  String name;

  /// 礼物描述
  String desc;

  int price;

  bool unlocked;

  /// 解锁概率文案
  String probabilityTxt;

  /// 点击上锁礼物时弹出的提示框文案
  String lockTxt;

  /// 当前礼物阶段 【一见倾心、两情相悦、爱意渐浓、相濡以沫】
  String title;

  /// 礼物url拼接
  String get url => VindicateUtil.gitUrl(giftId);

  VindicateGiftData({
    required this.giftId,
    required this.name,
    required this.desc,
    required this.price,
    required this.unlocked,
    required this.probabilityTxt,
    required this.lockTxt,
    required this.giftCid,
    required this.title,
  });

  factory VindicateGiftData.fromJson(Map<String, dynamic> json) =>
      _$VindicateGiftDataFromJson(json);

  Map<String, dynamic> toJson() => _$VindicateGiftDataToJson(this);
}

/// 表白记录数据
@JsonSerializable(fieldRename: FieldRename.snake)
class VindicateRecordData {
  /// 礼物送出者的头像
  String fromIcon;

  String fromName;

  int fromUid;

  /// 礼物接收者头像
  String toIcon;

  String toName;

  int toUid;

  int timestamp;

  /// 事件名称
  String text;

  int giftId;

  /// 礼物url拼接
  String get url => VindicateUtil.gitUrl(giftId);

  String get timeFormat {
    return DateUtils.format(timestamp * 1000, 'yyyy.MM.dd');
  }

  VindicateRecordData(
      {required this.fromIcon,
      required this.fromName,
      required this.toIcon,
      required this.toName,
      required this.timestamp,
      required this.text,
      required this.giftId,
      required this.fromUid,
      required this.toUid});

  factory VindicateRecordData.fromJson(Map<String, dynamic> json) =>
      _$VindicateRecordDataFromJson(json);

  Map<String, dynamic> toJson() => _$VindicateRecordDataToJson(this);
}

/// 表白事件触发
/// 当触发失败事件时，next == false , giftId和toUid无值
/// 当触发解锁礼物成功事件时,next == true , giftId和toUid有值
@JsonSerializable(fieldRename: FieldRename.snake)
class VindicateEventTouchData {
  /// 是否解锁了下一个阶段
  bool next;

  /// 事件触发文案
  String text;

  /// 下一阶段礼物的id
  int giftId;

  /// 被打赏人
  int toUid;

  VindicateEventTouchData(
      {required this.next,
      required this.text,
      required this.giftId,
      required this.toUid});

  factory VindicateEventTouchData.fromJson(Map<String, dynamic> json) =>
      _$VindicateEventTouchDataFromJson(json);

  Map<String, dynamic> toJson() => _$VindicateEventTouchDataToJson(this);
}
