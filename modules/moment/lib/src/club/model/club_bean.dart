import 'package:shared/shared.dart';
import 'package:json_annotation/json_annotation.dart';

part 'club_bean.g.dart';

@JsonSerializable(createToJson: false)
class ClubListPage {
  final int total;
  final List<ClubBean> list;

  ClubListPage(this.total, this.list);

  factory ClubListPage.fromJson(Map<String, dynamic> json) =>
      _$ClubListPageFromJson(json);
}

@JsonSerializable(createToJson: false, fieldRename: FieldRename.snake)
class ClubBean {
  final int clubId;
  final String? icon;
  final String? name;
  bool joined;

  ClubBean(this.clubId, this.icon, this.name, this.joined);

  factory ClubBean.fromJson(Map<String, dynamic> json) =>
      _$ClubBeanFromJson(json);
}

@JsonSerializable(createToJson: false, fieldRename: FieldRename.snake)
class ClubDetailBean {
  final String? name;

  @JsonKey(fromJson: Util.parseIcon)
  final String? icon;

  /// 主播数量
  final int broadcastNum;

  /// 成员数量
  int memberNum;
  @JsonKey(fromJson: Util.parseIcon)
  final String bgImg;

  bool joined;
  final int clubId;

  final List<PartyRoomGridItem> relatedRooms;

  final List<AnchorInfo> relatedBroadcast;

  List<PartyGodBean> gods;

  final int pcid; // 俱乐部对应的技能id

  ClubDetailBean(
    this.name,
    this.icon,
    this.broadcastNum,
    this.memberNum,
    this.bgImg,
    this.joined,
    this.clubId,
    this.relatedRooms,
    this.relatedBroadcast,
    this.gods,
    this.pcid,
  );

  factory ClubDetailBean.fromJson(Map<String, dynamic> json) =>
      _$ClubDetailBeanFromJson(json);
}

@JsonSerializable(createToJson: false, fieldRename: FieldRename.snake)
class AnchorInfo {
  final int uid;
  final String? name;
  @JsonKey(fromJson: Util.parseIcon)
  final String? icon;
  @JsonKey(fromJson: Util.parseIcon)
  final String? sicon; // 主播角标

  final int rid;
  final String? roomTag;

  @JsonKey(name: 'online_status', fromJson: Util.parseBool)
  final bool online;

  @JsonKey(name: 'is_game', fromJson: Util.parseInt)
  final int isGame;

  AnchorInfo(this.uid, this.name, this.icon, this.rid, this.roomTag,
      this.online, this.isGame, this.sicon);

  factory AnchorInfo.fromJson(Map<String, dynamic> json) =>
      _$AnchorInfoFromJson(json);

  /// 是否在房
  bool get isPlaying {
    return (roomTag?.isNotEmpty ?? false) && rid > 0;
  }

  bool get isOnline {
    return online;
  }
}
