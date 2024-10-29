// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'box_bean.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BoxBean _$BoxBeanFromJson(Map<String, dynamic> json) {
  return BoxBean(
    Util.parseBool(json['success']),
    Util.parseInt(json['star']),
    Util.parseInt(json['curmoney']),
    Util.parseInt(json['gold_coin']),
    Util.parseInt(json['maxNum']),
    Util.parseInt(json['boxNum']),
    Util.parseInt(json['keyNum']),
    Util.parseStr(json['company']) ?? '',
    Util.parseInt(json['showBuyHeader']),
    Util.parseInt(json['openBoxUseMoney']),
    Util.parseInt(json['next_refresh_seconds']),
    json['data'] == null
        ? null
        : BoxContent.fromJson(json['data'] as Map<String, dynamic>),
    json['screen'] == null
        ? null
        : BoxScreen.fromJson(json['screen'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$BoxBeanToJson(BoxBean instance) => <String, dynamic>{
      'success': instance.success,
      'star': instance.star,
      'curmoney': instance.money,
      'gold_coin': instance.goldCoin,
      'maxNum': instance.maxNum,
      'boxNum': instance.boxNum,
      'keyNum': instance.keyNum,
      'company': instance.company,
      'showBuyHeader': instance.showBuyHeader,
      'openBoxUseMoney': instance.openBoxUseMoney,
      'next_refresh_seconds': instance.nextRefreshSeconds,
      'data': instance.content,
      'screen': instance.screen,
    };

BoxContent _$BoxContentFromJson(Map<String, dynamic> json) {
  return BoxContent(
    Util.parseInt(json['cid']),
    Util.parseStr(json['name']) ?? '',
    Util.parseStr(json['name_group']) ?? '',
    Util.parseStr(json['name_series']) ?? '',
    Util.parseStr(json['name_zh_tw']) ?? '',
    Util.parseStr(json['name_en']) ?? '',
    Util.parseStr(json['description']) ?? '',
    Util.parseStr(json['image']) ?? '',
    Util.parseStr(json['image_bg']) ?? '',
  );
}

Map<String, dynamic> _$BoxContentToJson(BoxContent instance) =>
    <String, dynamic>{
      'cid': instance.cid,
      'name': instance.name,
      'name_group': instance.nameGroup,
      'name_series': instance.nameSeries,
      'name_zh_tw': instance.nameZhTw,
      'name_en': instance.nameEn,
      'description': instance.description,
      'image': instance.image,
      'image_bg': instance.imageBg,
    };

BoxScreen _$BoxScreenFromJson(Map<String, dynamic> json) {
  return BoxScreen(
    Util.parseStr(json['id']) ?? '',
    Util.parseInt(json['uid']),
    Util.parseInt(json['app_id']),
    Util.parseStr(json['type']) ?? '',
    Util.parseInt(json['open_num']),
    Util.parseInt(json['cid']),
    Util.parseInt(json['cnum']),
    Util.parseStr(json['cimage']) ?? '',
    Util.parseStr(json['dateline']) ?? '',
    Util.parseInt(json['rid']),
    Util.parseStr(json['name']) ?? '',
    Util.parseStr(json['icon']) ?? '',
    Util.parseStr(json['time']) ?? '',
  );
}

Map<String, dynamic> _$BoxScreenToJson(BoxScreen instance) => <String, dynamic>{
      'id': instance.id,
      'uid': instance.uid,
      'app_id': instance.appId,
      'type': instance.type,
      'open_num': instance.openNum,
      'cid': instance.cid,
      'cnum': instance.cnum,
      'cimage': instance.cimage,
      'dateline': instance.dateline,
      'rid': instance.rid,
      'name': instance.name,
      'icon': instance.icon,
      'time': instance.time,
    };
