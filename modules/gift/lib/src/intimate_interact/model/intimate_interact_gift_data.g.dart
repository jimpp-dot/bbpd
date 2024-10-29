// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'intimate_interact_gift_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IntimateInteractGiftData _$IntimateInteractGiftDataFromJson(
    Map<String, dynamic> json) {
  return IntimateInteractGiftData(
    Util.parseStr(json['name']) ?? '',
    Util.parseInt(json['gift_id']),
    Util.parseIcon(json['icon']),
    Util.parseInt(json['price']),
  );
}

Map<String, dynamic> _$IntimateInteractGiftDataToJson(
        IntimateInteractGiftData instance) =>
    <String, dynamic>{
      'name': instance.name,
      'gift_id': instance.giftId,
      'icon': instance.icon,
      'price': instance.price,
    };
