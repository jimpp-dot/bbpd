import 'package:shared/shared.dart';
import 'package:json_annotation/json_annotation.dart';

part 'accompany_pay_model.g.dart';

/// 付费陪伴房

@JsonSerializable(fieldRename: FieldRename.snake)
class AccompanyPayData {
  int value; //当前总亲密度
  int duration; //当前陪伴时长
  @JsonKey(fromJson: Util.parseIcon)
  String? decorate; //背景
  @JsonKey(fromJson: Util.parseIcon)
  String? effect; //陪伴时长达标后的动态背景

  @JsonKey(name: 'accompany_end_time')
  int accompanyEndTime; //付费陪伴房结束时间

  @JsonKey(name: 'total_time')
  int totalTime; //付费陪伴房总时间

  bool truthEnable; //是否显示真心话入口

  AccompanyPayData(this.value, this.duration, this.decorate, this.effect,
      this.accompanyEndTime, this.totalTime, this.truthEnable);

  factory AccompanyPayData.fromJson(Map<String, dynamic> json) =>
      _$AccompanyPayDataFromJson(json);
}

@JsonSerializable(createToJson: false)
class AccompanyGiftData {
  @JsonKey(name: 'left_time')
  int leftTime;
  @JsonKey(name: 'gift_newer')
  List<Gift> giftNewer;
  @JsonKey(name: 'gift_pay')
  List<Gift> giftPay;
  @JsonKey(name: 'money')
  int totalMoney;

  AccompanyGiftData(
      this.leftTime, this.giftNewer, this.giftPay, this.totalMoney);

  factory AccompanyGiftData.fromJson(Map<String, dynamic> json) =>
      _$AccompanyGiftDataFromJson(json);
}
