// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card_bean.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CardDataResp _$CardDataRespFromJson(Map<String, dynamic> json) {
  return CardDataResp(
    success: Util.parseBool(json['success']),
    msg: Util.parseStr(json['msg']),
    data: json['data'] == null
        ? null
        : CardData.fromJson(json['data'] as Map<String, dynamic>),
  );
}

CardData _$CardDataFromJson(Map<String, dynamic> json) {
  return CardData(
    json['info'] == null
        ? null
        : BasicCardInfo.fromJson(json['info'] as Map<String, dynamic>),
    Util.parseList(json['list'],
        (e) => CardDetailItem.fromJson(e as Map<String, dynamic>)),
  );
}

BasicCardInfo _$BasicCardInfoFromJson(Map<String, dynamic> json) {
  return BasicCardInfo(
    Util.parseInt(json['card_id']),
    Util.parseInt(json['version']),
    Util.parseInt(json['level']),
    Util.parseInt(json['renewal_card_num']),
    Util.parseInt(json['renewal_price']),
    json['upgrade_note'] == null
        ? null
        : UpgradeCard.fromJson(json['upgrade_note'] as Map<String, dynamic>),
    Util.parseInt(json['next_level']),
    Util.parseInt(json['next_card_id']),
    Util.parseStr(json['next_level_note']) ?? '',
    Util.parseInt(json['next_card_num']),
    Util.parseInt(json['unget_card_num']),
    Util.parseStr(json['regot_dates']) ?? '',
    Util.parseInt(json['regot_num']),
    Util.parseInt(json['regot_price']),
  );
}

UpgradeCard _$UpgradeCardFromJson(Map<String, dynamic> json) {
  return UpgradeCard(
    Util.parseList(json['get'],
        (e) => UpgradeCardItem.fromJson(e as Map<String, dynamic>)),
    Util.parseList(json['unopen'],
        (e) => UpgradeCardItem.fromJson(e as Map<String, dynamic>)),
  );
}

UpgradeCardItem _$UpgradeCardItemFromJson(Map<String, dynamic> json) {
  return UpgradeCardItem(
    Util.parseStr(json['card_name']) ?? '',
    Util.parseStr(json['card_num']) ?? '',
    Util.parseStr(json['card_img']) ?? '',
  );
}

CardDetailItem _$CardDetailItemFromJson(Map<String, dynamic> json) {
  return CardDetailItem(
    Util.parseInt(json['now_card_id']),
    Util.parseStr(json['now_card_name']) ?? '',
    Util.parseStr(json['now_card_bg']) ?? '',
    Util.parseStr(json['now_card_img']) ?? '',
    Util.parseStr(json['now_card_tag']) ?? '',
    Util.parseStr(json['text_colour']) ?? '',
    Util.parseStr(json['shadow_color']) ?? '',
    Util.parseInt(json['now_card_total_num']),
    Util.parseInt(json['now_card_unopen_num']),
    Util.parseInt(json['now_card_locked_num']),
    Util.parseInt(json['now_card_expired_num']),
    Util.parseInt(json['now_card_opentime_left']),
    Util.parseInt(json['now_card_version']),
    Util.parseInt(json['now_card_need_level']),
    Util.parseInt(json['before_card_id']),
    Util.parseInt(json['before_card_unopen_num']),
    Util.parseInt(json['next_card_id']),
    Util.parseInt(json['next_card_unopen_num']),
  );
}

LotteryBoxResp _$LotteryBoxRespFromJson(Map<String, dynamic> json) {
  return LotteryBoxResp(
    success: Util.parseBool(json['success']),
    msg: Util.parseStr(json['msg']),
    data: json['data'] == null
        ? null
        : LotteryBoxList.fromJson(json['data'] as Map<String, dynamic>),
  );
}

LotteryBoxList _$LotteryBoxListFromJson(Map<String, dynamic> json) {
  return LotteryBoxList(
    Util.parseList(json['list'],
        (e) => ShopMailCommodity.fromJson(e as Map<String, dynamic>)),
  );
}
