// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'room_task_box.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BoxGiftList _$BoxGiftListFromJson(Map<String, dynamic> json) {
  return BoxGiftList(
    Util.notNullStr(json['gift_name']),
    Util.notNullStr(json['gift_icon']),
    Util.parseInt(json['gift_num']),
  );
}

OpenBoxResult _$OpenBoxResultFromJson(Map<String, dynamic> json) {
  return OpenBoxResult(
    Util.parseInt(json['open_success']),
    Util.parseStr(json['msg']),
    json['result'] == null
        ? null
        : BoxGiftList.fromJson(json['result'] as Map<String, dynamic>),
  );
}
