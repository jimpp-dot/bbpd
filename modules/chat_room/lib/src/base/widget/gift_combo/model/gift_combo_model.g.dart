// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gift_combo_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GiftCombo _$GiftComboFromJson(Map json) {
  return GiftCombo(
    uuid: Util.notNullStr(json['uuid']),
    uid: Util.parseInt(json['uid']),
    comboId: Util.parseInt(json['combo_id']),
    comboNum: Util.parseInt(json['combo_num']),
    uids: Util.parseList(json['uids'], (e) => Util.parseInt(e)),
    type: Util.notNullStr(json['type']),
    from: Util.notNullStr(json['from']),
    icon: Util.notNullStr(json['icon']),
    toNames: Util.notNullStr(json['to_names']),
    subType: Util.notNullStr(json['sub_type']),
    params: (json['params'] as Map?)?.map(
      (k, e) => MapEntry(Util.notNullStr(k), Util.notNullStr(e)),
    ),
    gift: json['gift'] == null ? null : Gift.fromJson(json['gift']),
  );
}

Map<String, dynamic> _$GiftComboToJson(GiftCombo instance) => <String, dynamic>{
      'uuid': instance.uuid,
      'type': instance.type,
      'sub_type': instance.subType,
      'from': instance.from,
      'uid': instance.uid,
      'icon': instance.icon,
      'to_names': instance.toNames,
      'combo_num': instance.comboNum,
      'combo_id': instance.comboId,
      'uids': instance.uids,
      'params': instance.params,
      'gift': instance.gift,
    };
