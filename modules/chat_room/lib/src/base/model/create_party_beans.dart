import 'package:shared/shared.dart';
import 'package:json_annotation/json_annotation.dart';

part 'create_party_beans.g.dart';

@JsonSerializable(createToJson: false)
class CreatePartyInfo {
  @JsonKey(name: 'playing_num')
  int playingNum;

  @JsonKey(name: 'party_name')
  String partyName;

  @JsonKey(name: 'party_icon', fromJson: Util.getRemoteImgUrl)
  final String partyIcon;

  @JsonKey(name: 'friend_next')
  bool friendNext;

  @JsonKey(name: 'friend_list')
  List<FriendItem> friends;

  @JsonKey(name: 'room_info')
  RoomInfo? roomInfo;

  @JsonKey(name: 'need_verify_new')
  int needVerify;

  @JsonKey(name: 'party_rooms')
  List<RoomType> roomList;

  @JsonKey(name: 'private_levels')
  List<PrivateLevel> privateLevels;

  final String toast; // 建房限制提示文案

  @JsonKey(name: 'match_style')
  int matchStyle; // 0-旧样式，1-v2样式

  final String agreement; // 协议

  @JsonKey(name: 'close_notify')
  int closeNotify;

  @JsonKey(name: 'ticket_setting')
  bool ticketSetting;

  CreatePartyInfo(
    this.playingNum,
    this.partyName,
    this.partyIcon,
    this.friendNext,
    this.friends,
    this.roomInfo,
    this.needVerify,
    this.roomList,
    this.privateLevels,
    this.toast,
    this.matchStyle,
    this.agreement,
    this.closeNotify,
    this.ticketSetting,
  );

  factory CreatePartyInfo.fromJson(Map<String, dynamic> json) =>
      _$CreatePartyInfoFromJson(json);
}

@JsonSerializable(createToJson: false)
class FriendItem {
  int uid = 0;

  String icon = '';

  String name = '';

  bool online = false;

  @JsonKey(name: 'online_dateline')
  int onlineDateTime = 0;

  /// 本地标识
  @JsonKey(defaultValue: TYPE_USER)
  String type;

  /// 普通用户
  static const String TYPE_USER = 'user';

  /// 更多
  static const String TYPE_MORE = 'more';

  FriendItem.type(this.type);

  FriendItem(this.uid, this.icon, this.name, this.online, this.onlineDateTime,
      this.type);

  factory FriendItem.fromJson(Map<String, dynamic> json) =>
      _$FriendItemFromJson(json);
}

@JsonSerializable(createToJson: false)
class RoomInfo {
  int rid;

  String icon;

  String type;

  String prefix;

  String name;

  String description;

  String password;

  int reception;

  int paier;

  RoomInfo(this.rid, this.icon, this.type, this.prefix, this.name,
      this.description, this.password, this.reception, this.paier);

  factory RoomInfo.fromJson(Map<String, dynamic> json) =>
      _$RoomInfoFromJson(json);
}

@JsonSerializable(createToJson: false)
class PrivateLevel {
  @JsonKey(name: 'private_level')
  int level;

  @JsonKey(name: 'level_name')
  String display;

  PrivateLevel(this.level, this.display);

  factory PrivateLevel.fromJson(Map<String, dynamic> json) =>
      _$PrivateLevelFromJson(json);
}

@JsonSerializable(createToJson: false)
class PartyListResp extends BaseResponse {
  List<PartyList>? data;

  PartyListResp({super.success, super.msg, this.data});

  factory PartyListResp.fromJson(Map<String, dynamic> json) =>
      _$PartyListRespFromJson(json);
}

@JsonSerializable(createToJson: false)
class PartyList {
  List<Party> list;
  String type;
  String name;

  PartyList(this.list, this.type, this.name);

  factory PartyList.fromJson(Map<String, dynamic> json) =>
      _$PartyListFromJson(json);
}

@JsonSerializable(createToJson: false)
class Party {
  final String display;

  @JsonKey(name: 'party_type')
  final String partyType;

  @JsonKey(name: 'home_icon')
  final String icon;

  @JsonKey(name: 'player_tag')
  String tag;

  @JsonKey(name: 'option_icon')
  String optionIcon;

  @JsonKey(name: 'abstract_icon')
  String abstractIcon = '';

  @JsonKey(name: 'rt_corner')
  String cornerIcon = '';

  Party(
      {required this.display,
      required this.partyType,
      required this.icon,
      required this.tag,
      required this.optionIcon});

  factory Party.fromJson(Map<String, dynamic> json) => _$PartyFromJson(json);
}

@JsonSerializable(createToJson: false)
class RoomType {
  @JsonKey(name: 'room_type')
  String roomType;

  @JsonKey(name: 'room_show')
  String show;

  @JsonKey(name: 'room_lock')
  bool lock;

  RoomType(this.roomType, this.show, this.lock);

  factory RoomType.fromJson(Map<String, dynamic> json) =>
      _$RoomTypeFromJson(json);

  int get testMode {
    switch (roomType) {
      case IWereWolfManager.WOLF9:
      case IWereWolfManager.NEWWOLF9:
        return 1;
      case IWereWolfManager.WOLF12:
        return 3;
    }
    return 1;
  }
}
