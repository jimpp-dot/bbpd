// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gift_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GiftItem _$GiftItemFromJson(Map<String, dynamic> json) {
  return GiftItem(
    Util.parseInt(json['id']),
    Util.parseStr(json['name']),
    Util.parseInt(json['price']),
  );
}

Map<String, dynamic> _$GiftItemToJson(GiftItem instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'price': instance.price,
    };
