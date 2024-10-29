import 'package:shared/shared.dart';
import 'package:json_annotation/json_annotation.dart';

part 'intimate_interact_gift_data.g.dart';

@JsonSerializable()
class IntimateInteractGiftData {
  final String name;

  @JsonKey(name: 'gift_id')
  final int giftId;

  @JsonKey(fromJson: Util.parseIcon)
  final String icon;

  final int price;

  IntimateInteractGiftData(this.name, this.giftId, this.icon, this.price);

  factory IntimateInteractGiftData.fromJson(Map<String, dynamic> json) =>
      _$IntimateInteractGiftDataFromJson(json);

  @override
  String toString() {
    return _$IntimateInteractGiftDataToJson(this).toString();
  }
}
