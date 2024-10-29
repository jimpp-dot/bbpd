// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'intimate_msg_open.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IntimateMsgOpen _$IntimateMsgOpenFromJson(Map<String, dynamic> json) {
  return IntimateMsgOpen(
    Util.parseBool(json['can_open_photo']),
    Util.parseBool(json['is_commodity_sent']),
    Util.parseList(json['prompt'],
        (e) => IntimateColorText.fromJson(e as Map<String, dynamic>)),
    Util.parseList(json['commodity_list'],
        (e) => ShopMailCommodity.fromJson(e as Map<String, dynamic>)),
  );
}

IntimateColorText _$IntimateColorTextFromJson(Map<String, dynamic> json) {
  return IntimateColorText(
    Util.parseStr(json['text']),
    Util.parseColor(json['color']),
  );
}
