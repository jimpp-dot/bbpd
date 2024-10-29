import 'package:shared/shared.dart';
import 'package:json_annotation/json_annotation.dart';

part 'message_beans.g.dart';

@JsonSerializable(createToJson: false)
class NearbyUserListResp extends BaseResponse {
  final NearbyUserList? data;

  NearbyUserListResp({super.success, super.msg, this.data});

  factory NearbyUserListResp.fromJson(Map<String, dynamic> json) =>
      _$NearbyUserListRespFromJson(json);
}

@JsonSerializable(createToJson: false)
class NearbyUserList {
  @JsonKey(name: 'match_num')
  int leftCount;

  @JsonKey(name: "data")
  final List<NearbyUserItem> list;

  NearbyUserList(this.leftCount, this.list);

  factory NearbyUserList.fromJson(Map<String, dynamic> json) =>
      _$NearbyUserListFromJson(json);
}

@JsonSerializable(createToJson: false)
class NearbyUserItem {
  final int uid;
  final String? name;
  final String? icon;
  final int state;
  final int sex;
  final int distance;

  @JsonKey(name: "in_room")
  final int rid;

  @JsonKey(name: "room_property")
  final String? roomProperty;

  @JsonKey(name: "room_type")
  final String? roomType;

  @JsonKey(name: "room_tag_new")
  final String? roomTag;

  @JsonKey(name: "show")
  final String? roomTypeName;

  @JsonKey(name: "bg")
  final List<String> bgColors;

  @JsonKey(name: "acute_icon")
  final String? acuteIcon;

  NearbyUserItem(
      this.uid,
      this.name,
      this.icon,
      this.state,
      this.sex,
      this.distance,
      this.rid,
      this.roomProperty,
      this.roomType,
      this.roomTag,
      this.roomTypeName,
      this.bgColors,
      this.acuteIcon);

  factory NearbyUserItem.fromJson(Map<String, dynamic> json) =>
      _$NearbyUserItemFromJson(json);

  String get distanceStr {
    if (distance <= 0) {
      return '';
    } else if (distance < 100) {
      return '0.10km';
    } else if (distance > 50000) {
      return '${(distance / 1000).toStringAsFixed(2)}km';
    } else {
      return '${(distance / 1000).toStringAsFixed(2)}km';
    }
  }
}

@JsonSerializable(createToJson: false)
class AddressBookUserItem {
  @JsonKey(name: "its_uid")
  final int uid;
  @JsonKey(name: "app_name")
  final String? name;
  final String? icon;
  @JsonKey(name: "contact_name")
  final String? contactName; //手机通讯录名称
  @JsonKey(name: "redpoint")
  final int redPoint; //新好友
  int follow;
  final int online;
  @JsonKey(name: "room_tag")
  final UserConfig? roomTag;
  AddressBookUserItem(this.uid, this.name, this.icon, this.contactName,
      this.redPoint, this.follow, this.online, this.roomTag);
  factory AddressBookUserItem.fromJson(Map<String, dynamic> json) =>
      _$AddressBookUserItemFromJson(json);
}

@JsonSerializable(createToJson: false)
class AddressBookFriendsResp extends BaseResponse {
  AddressBookFriendsModel? data;
  AddressBookFriendsResp({super.success, super.msg, this.data});
  factory AddressBookFriendsResp.fromJson(Map<String, dynamic> json) =>
      _$AddressBookFriendsRespFromJson(json);
}

@JsonSerializable(createToJson: false)
class AddressBookFriendsModel {
  int total;
  List<AddressBookUserItem> list;
  bool more;
  AddressBookFriendsModel(this.total, this.list, this.more);

  factory AddressBookFriendsModel.fromJson(Map<String, dynamic> json) =>
      _$AddressBookFriendsModelFromJson(json);
}
