import 'package:shared/shared.dart';
import 'package:json_annotation/json_annotation.dart';

part 'card_bean.g.dart';

// 文档地址: http://47.111.103.155/project/14/interface/api/872

@JsonSerializable(createToJson: false)
class CardDataResp extends BaseResponse {
  CardData? data;

  CardDataResp({super.success, super.msg, this.data});

  factory CardDataResp.fromJson(Map<String, dynamic> json) =>
      _$CardDataRespFromJson(json);
}

@JsonSerializable(createToJson: false)
class CardData {
  BasicCardInfo? info;

  List<CardDetailItem> list;

  CardData(this.info, this.list);

  factory CardData.fromJson(Map<String, dynamic> json) =>
      _$CardDataFromJson(json);
}

@JsonSerializable(createToJson: false)
class BasicCardInfo {
  @JsonKey(name: 'card_id')
  int cardId;

  int version;

  int level;

  @JsonKey(name: 'renewal_card_num')
  int renewalCardNum;

  @JsonKey(name: 'renewal_price')
  int renewalPrice;

  @JsonKey(name: 'upgrade_note')
  UpgradeCard? upgradeCard;

  @JsonKey(name: 'next_level')
  int nextLevel;

  @JsonKey(name: 'next_card_id')
  int nextCardId;

  @JsonKey(name: 'next_level_note')
  String nextLevelNote;

  @JsonKey(name: 'next_card_num')
  int nextCardNum;

  @JsonKey(name: 'unget_card_num')
  int ungetCardNum;

  @JsonKey(name: 'regot_dates')
  String regotDates;

  @JsonKey(name: 'regot_num')
  int regotNum;

  @JsonKey(name: 'regot_price')
  int regotPrice;

  BasicCardInfo(
      this.cardId,
      this.version,
      this.level,
      this.renewalCardNum,
      this.renewalPrice,
      this.upgradeCard,
      this.nextLevel,
      this.nextCardId,
      this.nextLevelNote,
      this.nextCardNum,
      this.ungetCardNum,
      this.regotDates,
      this.regotNum,
      this.regotPrice);

  factory BasicCardInfo.fromJson(Map<String, dynamic> json) =>
      _$BasicCardInfoFromJson(json);
}

@JsonSerializable(createToJson: false)
class UpgradeCard {
  @JsonKey(name: 'get')
  List<UpgradeCardItem> receive;

  @JsonKey(name: 'unopen')
  List<UpgradeCardItem> unOpen;

  UpgradeCard(this.receive, this.unOpen);

  factory UpgradeCard.fromJson(Map<String, dynamic> json) =>
      _$UpgradeCardFromJson(json);
}

@JsonSerializable(createToJson: false)
class UpgradeCardItem {
  @JsonKey(name: 'card_name')
  String cardName;

  @JsonKey(name: 'card_num')
  String cardNum;

  @JsonKey(name: 'card_img')
  String cardImg;

  UpgradeCardItem(this.cardName, this.cardNum, this.cardImg);

  factory UpgradeCardItem.fromJson(Map<String, dynamic> json) =>
      _$UpgradeCardItemFromJson(json);
}

@JsonSerializable(createToJson: false)
class CardDetailItem {
  @JsonKey(name: 'now_card_id')
  int cardId;

  @JsonKey(name: 'now_card_name')
  String cardName;

  @JsonKey(name: 'now_card_bg')
  String cardBg;

  @JsonKey(name: 'now_card_img')
  String cardBoxImg;

  @JsonKey(name: 'now_card_tag')
  String cardTagImg;

  @JsonKey(name: 'text_colour')
  String cardTextColor;

  @JsonKey(name: 'shadow_color')
  String shadowColor;

  @JsonKey(name: 'now_card_total_num')
  int totalNum;

  @JsonKey(name: 'now_card_unopen_num')
  int unOpenNum;

  @JsonKey(name: 'now_card_locked_num')
  int lockedNum;

  @JsonKey(name: 'now_card_expired_num')
  int expiredNum;

  @JsonKey(name: 'now_card_opentime_left')
  int openTimeLeft;

  @JsonKey(name: 'now_card_version')
  int version;

  @JsonKey(name: 'now_card_need_level')
  int needLevel;

  @JsonKey(name: 'before_card_id')
  int beforeCardId;

  @JsonKey(name: 'before_card_unopen_num')
  int beforeUnOpenNum;

  @JsonKey(name: 'next_card_id')
  int nextCardId;

  @JsonKey(name: 'next_card_unopen_num')
  int nextUnOpenNum;

  CardDetailItem(
      this.cardId,
      this.cardName,
      this.cardBg,
      this.cardBoxImg,
      this.cardTagImg,
      this.cardTextColor,
      this.shadowColor,
      this.totalNum,
      this.unOpenNum,
      this.lockedNum,
      this.expiredNum,
      this.openTimeLeft,
      this.version,
      this.needLevel,
      this.beforeCardId,
      this.beforeUnOpenNum,
      this.nextCardId,
      this.nextUnOpenNum);

  factory CardDetailItem.fromJson(Map<String, dynamic> json) =>
      _$CardDetailItemFromJson(json);
}

@JsonSerializable(createToJson: false)
class LotteryBoxResp extends BaseResponse {
  LotteryBoxList? data;

  LotteryBoxResp({super.success, super.msg, this.data});

  factory LotteryBoxResp.fromJson(Map<String, dynamic> json) =>
      _$LotteryBoxRespFromJson(json);
}

@JsonSerializable(createToJson: false)
class LotteryBoxList {
  List<ShopMailCommodity> list;

  LotteryBoxList(this.list);

  factory LotteryBoxList.fromJson(Map<String, dynamic> json) =>
      _$LotteryBoxListFromJson(json);
}
