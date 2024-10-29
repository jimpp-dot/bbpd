import 'package:json_annotation/json_annotation.dart';
import 'package:shared/shared.dart';

part 'gift_wish_bean.g.dart';

@JsonSerializable(createToJson: false)
class RoomWishGiftsData {
  bool show;

  int percent;

  Champion? champion;

  List<RoomWishGift> gifts;

  RoomWishGiftsData(this.show, this.percent, this.champion, this.gifts);

  factory RoomWishGiftsData.fromJson(Map<String, dynamic> json) =>
      _$RoomWishGiftsDataFromJson(json);
}

@JsonSerializable(createToJson: false)
class RoomWishGift {
  @JsonKey(name: 'gift_id')
  int giftId;

  String name;

  RoomWishGift(this.giftId, this.name);

  factory RoomWishGift.fromJson(Map<String, dynamic> json) =>
      _$RoomWishGiftFromJson(json);
}

@JsonSerializable(createToJson: false)
class Champion {
  int uid;

  String icon;

  Champion(this.uid, this.icon);

  factory Champion.fromJson(Map<String, dynamic> json) =>
      _$ChampionFromJson(json);
}
