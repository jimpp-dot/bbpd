import 'package:json_annotation/json_annotation.dart';
import 'package:shared/shared.dart';
part 'tour_group_info.g.dart';

enum TourGroupSort {
  normal,

  /// 按禁言状态排序
  ban,

  /// 在线时间降序
  onlineDesc,

  /// 在线时间升序
  onlineAscending,

  /// 加入时间降序
  joinDesc,

  /// 加入时间升序
  joinAscending,
}

@JsonSerializable()
class TourGroupInfo extends Object {
  @JsonKey(name: 'group')
  Group? group;

  @JsonKey(name: 'captain')
  Captain? captain;

  @JsonKey(name: 'members')
  List<TourMembers>? members;

  @JsonKey(ignore: true)
  Set<int> adminUids = {}; //管理员

  TourGroupInfo(
    this.group,
    this.captain,
    this.members,
  );

  /// 是否是观光团成员
  bool isMember(int uid) {
    if (members == null) return false;

    for (TourMembers member in members!) {
      if (member.uid == uid) return true;
    }
    return false;
  }

  /// 自己是否是观光团管理员
  bool isCaptain(int uid) {
    if (captain?.uid == uid) {
      return true;
    }
    return false;
  }

  /// 自己是否是观光团管理员
  bool isTourAdmin(int uid) {
    if (isCaptain(uid) || (adminUids.contains(uid))) {
      return true;
    }
    return false;
  }

  factory TourGroupInfo.fromJson(Map<String, dynamic> srcJson) {
    TourGroupInfo groupInfo = _$TourGroupInfoFromJson(srcJson);
    groupInfo.members?.forEach((element) {
      if (element.isManager == true) groupInfo.adminUids.add(element.uid);
    });
    return groupInfo;
  }

  Map<String, dynamic> toJson() => _$TourGroupInfoToJson(this);

  @override
  String toString() {
    return 'TourGroupInfo{group: $group, captain: $captain, members: $members}';
  }
}

@JsonSerializable()
class Group extends Object {
  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'countMembers')
  int countMembers;

  @JsonKey(name: 'countOnline')
  int countOnline;

  /// 公告
  String notice;

  /// 标识
  String symbol;

  /// 是否使用标示，0不使用 1使用
  @JsonKey(name: 'show_symbol')
  bool showSymbol;

  Group(this.id, this.name, this.countMembers, this.countOnline, this.notice,
      this.symbol, this.showSymbol);

  factory Group.fromJson(Map<String, dynamic> srcJson) =>
      _$GroupFromJson(srcJson);

  Map<String, dynamic> toJson() => _$GroupToJson(this);

  @override
  String toString() {
    return 'Group{id: $id, name: $name, countMembers: $countMembers, countOnline: $countOnline}';
  }
}

@JsonSerializable()
class Captain extends Object {
  @JsonKey(name: 'uid')
  int uid;

  @JsonKey(name: 'rid')
  int rid;

  Captain(this.uid, this.rid);

  factory Captain.fromJson(Map<String, dynamic> srcJson) =>
      _$CaptainFromJson(srcJson);

  Map<String, dynamic> toJson() => _$CaptainToJson(this);

  @override
  String toString() {
    return 'Captain{uid: $uid}';
  }
}

@JsonSerializable()
class TourMembers extends Object {
  @JsonKey(name: 'uid')
  int uid;

  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'icon')
  String icon;

  @JsonKey(name: 'dateline')
  int dateline;

  @JsonKey(name: 'sex')
  int sex;

  @JsonKey(name: 'online_status')
  int onlineStatus;

  @JsonKey(name: 'same_rid')
  int sameRid;

  @JsonKey(name: 'vip')
  int vip;

  /// 是否管理员
  @JsonKey(name: 'is_manager')
  bool isManager;

  /// 是否被禁言
  @JsonKey(name: 'ban')
  bool ban;

  int get banValue => ban == true ? 0 : 1;

  TourMembers(this.uid, this.name, this.icon, this.dateline, this.sex,
      this.onlineStatus, this.sameRid, this.vip, this.isManager, this.ban);

  factory TourMembers.fromJson(Map<String, dynamic> srcJson) =>
      _$TourMembersFromJson(srcJson);

  Map<String, dynamic> toJson() => _$TourMembersToJson(this);

  @override
  String toString() {
    return 'TourMembers{uid: $uid, name: $name, icon: $icon, dateline: $dateline, sex: $sex, onlineStatus: $onlineStatus, sameRid: $sameRid}';
  }
}
