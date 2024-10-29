// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'accompany_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccompanyData _$AccompanyDataFromJson(Map<String, dynamic> json) {
  return AccompanyData(
    Util.parseInt(json['value']),
    Util.parseInt(json['duration']),
    Util.parseInt(json['total_time']),
    Util.parseIcon(json['decorate']),
    Util.parseIcon(json['effect']),
    Util.parseBool(json['truth_enable']),
    Util.parseBool(json['room_is_lock']),
    Util.parseBool(json['room_auto_mic']),
    Util.parseStr(json['foreground']),
  );
}

AccompanyExtraData _$AccompanyExtraDataFromJson(Map<String, dynamic> json) {
  return AccompanyExtraData(
    Util.parseList(
        json['call_list'], (e) => UserBean.fromJson(e as Map<String, dynamic>)),
    Util.parseList(json['banner'],
        (e) => AccompanyTask.fromJson(e as Map<String, dynamic>)),
  );
}

AccompanyTask _$AccompanyTaskFromJson(Map<String, dynamic> json) {
  return AccompanyTask(
    Util.parseStr(json['title']),
    Util.parseInt(json['value']),
    Util.getRemoteImgUrl(Util.parseStr(json['icon'])),
  );
}

AccompanyMysteryGift _$AccompanyMysteryGiftFromJson(Map<String, dynamic> json) {
  return AccompanyMysteryGift(
    Util.parseStr(json['title']),
    Util.parseStr(json['name']),
    Util.parseInt(json['num']),
    Util.getRemoteImgUrl(Util.parseStr(json['pic_url'])),
  );
}
