import 'package:shared/shared.dart';
import 'package:json_annotation/json_annotation.dart';

part 'wedding_model.g.dart';

@JsonSerializable()
class WeddingDateModel {
  @JsonKey(name: 'start_time')
  int startTime;

  @JsonKey(name: 'end_time')
  int endTime;
  int status; //0：可以预约 1：已被预约

  @JsonKey(name: 'is_mine')
  bool isMine;

  String getTimeDurationStr() {
    return '${Utility.formatDateToHourAndMin(startTime)} ~ ${Utility.formatDateToHourAndMin(endTime)}';
  }

  WeddingDateModel(this.startTime, this.endTime, this.status, this.isMine);
  factory WeddingDateModel.fromJson(Map<String, dynamic> json) =>
      _$WeddingDateModelFromJson(json);
}

@JsonSerializable()
class WeddingSceneModel {
  @JsonKey(name: 'scene_id')
  int sceneId;

  @JsonKey(name: 'scene_name')
  String sceneName;
  @JsonKey(name: 'price_name')
  String priceName;
  @JsonKey(name: 'price_tag')
  String priceTag;
  int price;
  String bg;

  WeddingSceneModel(this.sceneId, this.sceneName, this.price, this.bg,
      this.priceName, this.priceTag);
  factory WeddingSceneModel.fromJson(Map<String, dynamic> json) =>
      _$WeddingSceneModelFromJson(json);
}

@JsonSerializable()
class WeddingBannerModel {
  @JsonKey(name: 'group_id')
  int groupId;
  String title;
  String icon;

  WeddingBannerModel(this.groupId, this.title, this.icon);
  factory WeddingBannerModel.fromJson(Map<String, dynamic> json) =>
      _$WeddingBannerModelFromJson(json);
}

@JsonSerializable()
class WeddingCardModel {
  @JsonKey(name: 'card_type_id')
  int cardId;

  @JsonKey(name: 'card_name')
  String cardName;
  @JsonKey(name: 'card_title')
  String cardTitle;
  int price;
  @JsonKey(name: 'price_tag')
  String priceTag;

  @JsonKey(name: 'sale_min_num')
  int minNum;
  String bg;
  @JsonKey(name: 'detail_bg')
  String detailBg;

  @JsonKey(name: 'price_total')
  int priceTotal;

  WeddingCardModel(this.cardId, this.cardName, this.price, this.minNum, this.bg,
      this.detailBg, this.cardTitle, this.priceTag, this.priceTotal);
  factory WeddingCardModel.fromJson(Map<String, dynamic> json) =>
      _$WeddingCardModelFromJson(json);
}

@JsonSerializable()
class WeddingDateListModel {
  @JsonKey(name: 'today_duration')
  List<WeddingDateModel> todayList;

  @JsonKey(name: 'tomorrow_duration')
  List<WeddingDateModel> tomorrowLst;

  @JsonKey(name: 'after_tomorrow_duration')
  List<WeddingDateModel> afterList;

  WeddingDateListModel(this.todayList, this.tomorrowLst, this.afterList);
  factory WeddingDateListModel.fromJson(Map<String, dynamic> json) =>
      _$WeddingDateListModelFromJson(json);
}

@JsonSerializable()
class WeddingPrepareResponse extends BaseResponse {
  @JsonKey(name: 'date_list')
  WeddingDateListModel? dateListModel;

  @JsonKey(name: 'scene_list')
  List<WeddingSceneModel>? sceneList;

  @JsonKey(name: 'card_list')
  List<WeddingCardModel>? cardList;

  WeddingBannerModel? banner;

  WeddingPrepareResponse(
      {bool success = false,
      String msg = '',
      this.dateListModel,
      this.sceneList,
      this.cardList,
      this.banner})
      : super(msg: msg, success: success);

  factory WeddingPrepareResponse.fromJson(Map<String, dynamic> json) =>
      _$WeddingPrepareResponseFromJson(json);
}
