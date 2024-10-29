import 'package:json_annotation/json_annotation.dart';
import 'package:shared/shared.dart';

part 'gift_panel_banner.g.dart';

@JsonSerializable(createToJson: false)
class GiftPanelBanner {
  final ExclusiveGift special;

  @JsonKey(name: 'honor_prompts')
  final List<AllMicSendCondition> allMicPrompts;

  GiftPanelBanner(this.special, this.allMicPrompts);

  factory GiftPanelBanner.fromJson(Map<String, dynamic> json) =>
      _$GiftPanelBannerFromJson(json);
}

@JsonSerializable(createToJson: false)
class ExclusiveGift {
  final int uid;
  @JsonKey(fromJson: Util.getRemoteImgUrl)
  final String icon;
  final int deadline;

  ExclusiveGift(this.uid, this.icon, this.deadline);

  factory ExclusiveGift.fromJson(Map<String, dynamic> json) =>
      _$ExclusiveGiftFromJson(json);
}

@JsonSerializable(createToJson: false)
class AllMicSendCondition {
  @JsonKey(fromJson: Util.getRemoteImgUrl)
  final String icon;

  @JsonKey(name: 'mic_user_num')
  final int micNum;

  final int percent;

  final int price;

  AllMicSendCondition(this.icon, this.micNum, this.percent, this.price);

  factory AllMicSendCondition.fromJson(Map<String, dynamic> json) =>
      _$AllMicSendConditionFromJson(json);
}
