import 'package:shared/shared.dart';
import 'package:json_annotation/json_annotation.dart';

part 'ranking_week_star_data.g.dart';

@JsonSerializable(createToJson: false)
class RankingWeekStarItem {
  int uid;

  @JsonKey(name: 'user_name')
  String name;

  @JsonKey(name: 'user_icon')
  String icon;

  int rank;
  int score;

  @JsonKey(name: 'top_sender_name')
  String topSenderName;

  RankingWeekStarItem(this.uid, this.name, this.icon, this.rank, this.score,
      this.topSenderName);

  factory RankingWeekStarItem.fromJson(Map<String, dynamic> json) =>
      _$RankingWeekStarItemFromJson(json);

  String get giftNumStr => _valueString(score);

  String _valueString(int value, {int fractionDigits = 1}) {
    if (value < 1000) {
      return value.toString();
    } else if (value < 1000 * 1000) {
      return '${(value / 1000).toStringAsFixed(fractionDigits)}K';
    } else if (value < 1000 * 1000 * 1000) {
      return '${(value / 1000000).toStringAsFixed(fractionDigits)}M';
    } else {
      return '${(value / 1000000000).toStringAsFixed(fractionDigits)}B';
    }
  }
}

@JsonSerializable(createToJson: false)
class RankingWeekStarGift {
  @JsonKey(name: 'gift_id')
  int giftId;

  @JsonKey(name: 'gift_name')
  String giftName;

  int fresh;

  RankingWeekStarGift(this.giftId, this.giftName, this.fresh);

  factory RankingWeekStarGift.fromJson(Map<String, dynamic> json) =>
      _$RankingWeekStarGiftFromJson(json);
}

@JsonSerializable(createToJson: false)
class RankingWeekStarLastWeekTop {
  int uid;
  String name;
  String icon;

  /// income: 周星之王  consume: 周星富豪
  String type;

  @JsonKey(name: 'gift_id')
  int giftId;

  RankingWeekStarLastWeekTop(
      this.uid, this.name, this.icon, this.type, this.giftId);

  factory RankingWeekStarLastWeekTop.fromJson(Map<String, dynamic> json) =>
      _$RankingWeekStarLastWeekTopFromJson(json);
}

@JsonSerializable(createToJson: false)
class RankingWeekStarData {
  @JsonKey(name: 'last_week_top')
  List<List<RankingWeekStarLastWeekTop>> lastWeekTop;

  List<RankingWeekStarItem> list;
  List<RankingWeekStarGift> gifts;
  int page;
  int more;

  RankingWeekStarData(
      this.lastWeekTop, this.list, this.gifts, this.page, this.more);

  factory RankingWeekStarData.fromJson(Map<String, dynamic> json) =>
      _$RankingWeekStarDataFromJson(json);
}

@JsonSerializable(createToJson: false)
class RankingWeekStarResponse extends BaseResponse {
  final RankingWeekStarData? data;

  RankingWeekStarResponse({super.success, super.msg, this.data});

  factory RankingWeekStarResponse.fromJson(Map<String, dynamic> json) =>
      _$RankingWeekStarResponseFromJson(json);
}
