import 'package:shared/shared.dart';
import 'package:json_annotation/json_annotation.dart';

part 'wish_gift_beans.g.dart';

//http://192.168.11.46:4000/project/14/interface/api/cat_952
@JsonSerializable(createToJson: false)
class WishGiftsResp extends BaseResponse {
  WishGiftsData? data;

  WishGiftsResp({bool success = false, String? msg, this.data})
      : super(success: success, msg: msg);

  factory WishGiftsResp.fromJson(Map<String, dynamic> json) =>
      _$WishGiftsRespFromJson(json);
}

@JsonSerializable(createToJson: false)
class WishGiftsData {
  @JsonKey(name: 'gifts')
  List<WishGift> gifts;

  @JsonKey(name: 'top_senders')
  List<String> topSenders;

  @JsonKey(name: 'auto_open')
  bool autoOpen;

  @JsonKey(name: 'sender_num')
  int senderNum;

  @JsonKey(name: 'finish_num')
  int finishNum;

  @JsonKey(name: 'achieve_tips')
  String achieveTips;

  int countdown; // 倒计时时长，单位秒

  @JsonKey(name: 'reward_words')
  String rewardWords; // 答谢文案

  @JsonKey(name: 'reward_words_audit')
  int rewardWordsAudit; // 答谢文案审核状态：1-审核中

  WishGiftsData(
      this.gifts,
      this.topSenders,
      this.autoOpen,
      this.senderNum,
      this.finishNum,
      this.achieveTips,
      this.countdown,
      this.rewardWords,
      this.rewardWordsAudit);

  factory WishGiftsData.fromJson(Map<String, dynamic> json) =>
      _$WishGiftsDataFromJson(json);
}

@JsonSerializable(createToJson: false)
class WishGift {
  @JsonKey(name: 'gift_id')
  int giftId = 0;

  String? name;

  int price = 0;

  @JsonKey(name: 'wish_num')
  int wishNum = 0;

  @JsonKey(name: 'income_num')
  int incomeNum = 0;

  WishGift.giftId(this.giftId);

  WishGift(this.giftId, this.name, this.price, this.wishNum, this.incomeNum);

  factory WishGift.fromJson(Map<String, dynamic> json) =>
      _$WishGiftFromJson(json);
}
