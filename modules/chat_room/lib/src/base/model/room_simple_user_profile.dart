import 'package:shared/shared.dart';
import 'package:json_annotation/json_annotation.dart';
part 'room_simple_user_profile.g.dart';

@JsonSerializable()
class RoomSimpleUserProfile extends BaseResponse {
  final SimpleUserProfileItem? data;

  RoomSimpleUserProfile({this.data});

  factory RoomSimpleUserProfile.fromJson(Map<String, dynamic> json) =>
      _$RoomSimpleUserProfileFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$RoomSimpleUserProfileToJson(this);
}

@JsonSerializable()
class SimpleUserProfileItem {
  final int uid;
  final String name;
  final String icon;
  final int sex; //1男2女

  SimpleUserProfileItem(
      {required this.uid,
      required this.name,
      required this.icon,
      required this.sex});

  factory SimpleUserProfileItem.fromJson(Map<String, dynamic> json) =>
      _$SimpleUserProfileItemFromJson(json);

  Map<String, dynamic> toJson() => _$SimpleUserProfileItemToJson(this);
}
