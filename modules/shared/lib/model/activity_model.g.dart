// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activity_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ActivityLotteryResponse _$ActivityLotteryResponseFromJson(
    Map<String, dynamic> json) {
  return ActivityLotteryResponse(
    data: json['data'] == null
        ? null
        : ActivityAwardModel.fromJson(json['data'] as Map<String, dynamic>),
    success: Util.parseBool(json['success']),
    msg: Util.parseStr(json['msg']),
  );
}

ActivityBannerResponse _$ActivityBannerResponseFromJson(
    Map<String, dynamic> json) {
  return ActivityBannerResponse(
    data: json['data'] == null
        ? null
        : ActivityBannerModel.fromJson(json['data'] as Map<String, dynamic>),
    success: Util.parseBool(json['success']),
    msg: Util.parseStr(json['msg']),
  );
}

ActivityLotteryResultResponse _$ActivityLotteryResultResponseFromJson(
    Map<String, dynamic> json) {
  return ActivityLotteryResultResponse(
    data: Util.parseList(json['data'],
        (e) => ShopMailCommodity.fromJson(e as Map<String, dynamic>)),
    success: Util.parseBool(json['success']),
    msg: Util.parseStr(json['msg']),
  );
}

ActivityUserInfoResponse _$ActivityUserInfoResponseFromJson(
    Map<String, dynamic> json) {
  return ActivityUserInfoResponse(
    data: json['data'] == null
        ? null
        : ActivityUserInfoModel.fromJson(json['data'] as Map<String, dynamic>),
    enable: Util.parseInt(json['enable']),
    success: Util.parseBool(json['success']),
    msg: Util.parseStr(json['msg']),
  );
}

ActivityUserInfoModel _$ActivityUserInfoModelFromJson(
    Map<String, dynamic> json) {
  return ActivityUserInfoModel(
    Util.parseStr(json['name']) ?? '',
    Util.parseStr(json['mobile']) ?? '',
    Util.parseStr(json['address']) ?? '',
  );
}

ActivityAwardModel _$ActivityAwardModelFromJson(Map<String, dynamic> json) {
  return ActivityAwardModel(
    Util.parseList(json['gift_list'],
        (e) => ShopMailCommodity.fromJson(e as Map<String, dynamic>)),
    Util.parseInt(json['normal_status']),
    Util.parseInt(json['advance_status']),
    Util.parseStr(json['desc']) ?? '',
    Util.parseStr(json['title']) ?? '',
  );
}

ActivityBannerModel _$ActivityBannerModelFromJson(Map<String, dynamic> json) {
  return ActivityBannerModel(
    Util.parseStr(json['img']) ?? '',
    Util.parseInt(json['width']),
    Util.parseInt(json['height']),
  );
}

TransInviteInfo _$TransInviteInfoFromJson(Map<String, dynamic> json) {
  return TransInviteInfo(
    Util.parseStr(json['image']) ?? '',
    Util.parseInt(json['width']),
    Util.parseInt(json['height']),
    Util.parseInt(json['id']),
    Util.parseStr(json['jump_type']) ?? '',
    Util.parseStr(json['redirect']) ?? '',
  );
}
