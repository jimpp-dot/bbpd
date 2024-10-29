// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wedding_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeddingDateModel _$WeddingDateModelFromJson(Map<String, dynamic> json) {
  return WeddingDateModel(
    Util.parseInt(json['start_time']),
    Util.parseInt(json['end_time']),
    Util.parseInt(json['status']),
    Util.parseBool(json['is_mine']),
  );
}

Map<String, dynamic> _$WeddingDateModelToJson(WeddingDateModel instance) =>
    <String, dynamic>{
      'start_time': instance.startTime,
      'end_time': instance.endTime,
      'status': instance.status,
      'is_mine': instance.isMine,
    };

WeddingSceneModel _$WeddingSceneModelFromJson(Map<String, dynamic> json) {
  return WeddingSceneModel(
    Util.parseInt(json['scene_id']),
    Util.parseStr(json['scene_name']) ?? '',
    Util.parseInt(json['price']),
    Util.parseStr(json['bg']) ?? '',
    Util.parseStr(json['price_name']) ?? '',
    Util.parseStr(json['price_tag']) ?? '',
  );
}

Map<String, dynamic> _$WeddingSceneModelToJson(WeddingSceneModel instance) =>
    <String, dynamic>{
      'scene_id': instance.sceneId,
      'scene_name': instance.sceneName,
      'price_name': instance.priceName,
      'price_tag': instance.priceTag,
      'price': instance.price,
      'bg': instance.bg,
    };

WeddingBannerModel _$WeddingBannerModelFromJson(Map<String, dynamic> json) {
  return WeddingBannerModel(
    Util.parseInt(json['group_id']),
    Util.parseStr(json['title']) ?? '',
    Util.parseStr(json['icon']) ?? '',
  );
}

Map<String, dynamic> _$WeddingBannerModelToJson(WeddingBannerModel instance) =>
    <String, dynamic>{
      'group_id': instance.groupId,
      'title': instance.title,
      'icon': instance.icon,
    };

WeddingCardModel _$WeddingCardModelFromJson(Map<String, dynamic> json) {
  return WeddingCardModel(
    Util.parseInt(json['card_type_id']),
    Util.parseStr(json['card_name']) ?? '',
    Util.parseInt(json['price']),
    Util.parseInt(json['sale_min_num']),
    Util.parseStr(json['bg']) ?? '',
    Util.parseStr(json['detail_bg']) ?? '',
    Util.parseStr(json['card_title']) ?? '',
    Util.parseStr(json['price_tag']) ?? '',
    Util.parseInt(json['price_total']),
  );
}

Map<String, dynamic> _$WeddingCardModelToJson(WeddingCardModel instance) =>
    <String, dynamic>{
      'card_type_id': instance.cardId,
      'card_name': instance.cardName,
      'card_title': instance.cardTitle,
      'price': instance.price,
      'price_tag': instance.priceTag,
      'sale_min_num': instance.minNum,
      'bg': instance.bg,
      'detail_bg': instance.detailBg,
      'price_total': instance.priceTotal,
    };

WeddingDateListModel _$WeddingDateListModelFromJson(Map<String, dynamic> json) {
  return WeddingDateListModel(
    Util.parseList(json['today_duration'],
            (e) => WeddingDateModel.fromJson(e as Map<String, dynamic>)) ??
        [],
    Util.parseList(json['tomorrow_duration'],
            (e) => WeddingDateModel.fromJson(e as Map<String, dynamic>)) ??
        [],
    Util.parseList(json['after_tomorrow_duration'],
            (e) => WeddingDateModel.fromJson(e as Map<String, dynamic>)) ??
        [],
  );
}

Map<String, dynamic> _$WeddingDateListModelToJson(
        WeddingDateListModel instance) =>
    <String, dynamic>{
      'today_duration': instance.todayList,
      'tomorrow_duration': instance.tomorrowLst,
      'after_tomorrow_duration': instance.afterList,
    };

WeddingPrepareResponse _$WeddingPrepareResponseFromJson(
    Map<String, dynamic> json) {
  return WeddingPrepareResponse(
    success: Util.parseBool(json['success']),
    msg: Util.parseStr(json['msg']) ?? '',
    dateListModel: json['date_list'] == null
        ? null
        : WeddingDateListModel.fromJson(
            json['date_list'] as Map<String, dynamic>),
    sceneList: Util.parseList(json['scene_list'],
            (e) => WeddingSceneModel.fromJson(e as Map<String, dynamic>)) ??
        [],
    cardList: Util.parseList(json['card_list'],
            (e) => WeddingCardModel.fromJson(e as Map<String, dynamic>)) ??
        [],
    banner: json['banner'] == null
        ? null
        : WeddingBannerModel.fromJson(json['banner'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$WeddingPrepareResponseToJson(
        WeddingPrepareResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'msg': instance.msg,
      'date_list': instance.dateListModel,
      'scene_list': instance.sceneList,
      'card_list': instance.cardList,
      'banner': instance.banner,
    };
