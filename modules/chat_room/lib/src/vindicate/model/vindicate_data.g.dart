// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vindicate_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VindicateGiftData _$VindicateGiftDataFromJson(Map<String, dynamic> json) {
  return VindicateGiftData(
    giftId: Util.parseInt(json['gift_id']),
    name: Util.notNullStr(json['name']),
    desc: Util.notNullStr(json['desc']),
    price: Util.parseInt(json['price']),
    unlocked: Util.parseBool(json['unlocked']),
    probabilityTxt: Util.notNullStr(json['probability_txt']),
    lockTxt: Util.notNullStr(json['lock_txt']),
    giftCid: Util.parseInt(json['gift_cid']),
    title: Util.notNullStr(json['title']),
  );
}

Map<String, dynamic> _$VindicateGiftDataToJson(VindicateGiftData instance) =>
    <String, dynamic>{
      'gift_id': instance.giftId,
      'gift_cid': instance.giftCid,
      'name': instance.name,
      'desc': instance.desc,
      'price': instance.price,
      'unlocked': instance.unlocked,
      'probability_txt': instance.probabilityTxt,
      'lock_txt': instance.lockTxt,
      'title': instance.title,
    };

VindicateRecordData _$VindicateRecordDataFromJson(Map<String, dynamic> json) {
  return VindicateRecordData(
    fromIcon: Util.notNullStr(json['from_icon']),
    fromName: Util.notNullStr(json['from_name']),
    toIcon: Util.notNullStr(json['to_icon']),
    toName: Util.notNullStr(json['to_name']),
    timestamp: Util.parseInt(json['timestamp']),
    text: Util.notNullStr(json['text']),
    giftId: Util.parseInt(json['gift_id']),
    fromUid: Util.parseInt(json['from_uid']),
    toUid: Util.parseInt(json['to_uid']),
  );
}

Map<String, dynamic> _$VindicateRecordDataToJson(
        VindicateRecordData instance) =>
    <String, dynamic>{
      'from_icon': instance.fromIcon,
      'from_name': instance.fromName,
      'from_uid': instance.fromUid,
      'to_icon': instance.toIcon,
      'to_name': instance.toName,
      'to_uid': instance.toUid,
      'timestamp': instance.timestamp,
      'text': instance.text,
      'gift_id': instance.giftId,
    };

VindicateEventTouchData _$VindicateEventTouchDataFromJson(
    Map<String, dynamic> json) {
  return VindicateEventTouchData(
    next: Util.parseBool(json['next']),
    text: Util.notNullStr(json['text']),
    giftId: Util.parseInt(json['gift_id']),
    toUid: Util.parseInt(json['to_uid']),
  );
}

Map<String, dynamic> _$VindicateEventTouchDataToJson(
        VindicateEventTouchData instance) =>
    <String, dynamic>{
      'next': instance.next,
      'text': instance.text,
      'gift_id': instance.giftId,
      'to_uid': instance.toUid,
    };
