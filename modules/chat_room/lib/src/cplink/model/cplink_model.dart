import 'package:shared/shared.dart';
import 'package:json_annotation/json_annotation.dart';

part 'cplink_model.g.dart';

@JsonSerializable(createToJson: false)
class CpLinkConfigData {
  @JsonKey(name: 'cplink_stage', fromJson: CpLinkConfigData.parseState)
  CpLinkState state;

  @JsonKey(name: 'cplink_top_list')
  List<int> heartValue;

  @JsonKey(name: "scene_config_new")
  List<Scene> scenes;

  @JsonKey(name: "fetch_relations")
  bool fetchRelation;

  @JsonKey(name: "show_defend_pat")
  bool showPat;

  int version;

  CpLinkConfigData(
    this.state,
    this.heartValue,
    this.scenes,
    this.fetchRelation,
    this.showPat,
    this.version,
  );

  factory CpLinkConfigData.fromJson(Map<String, dynamic> json) =>
      _$CpLinkConfigDataFromJson(json);

  static CpLinkState parseState(dynamic state) {
    int stateValue = Util.parseInt(state);
    if (stateValue == 0) {
      return CpLinkState.wait;
    } else if (stateValue == 1) {
      return CpLinkState.heart;
    } else if (stateValue == 2) {
      return CpLinkState.hand;
    }
    return CpLinkState.wait;
  }
}

@JsonSerializable(createToJson: false)
class RelationshipData {
  @JsonKey(name: "defend_days")
  int defendDays;

  @JsonKey(name: "auction_config")
  List<Relationship> relationships;

  @JsonKey(name: "level_info")
  List<RelationshipLevelInfo> levels;

  RelationshipData(
      {required this.defendDays,
      required this.relationships,
      required this.levels});

  factory RelationshipData.fromJson(Map<String, dynamic> json) =>
      _$RelationshipDataFromJson(json);
}

@JsonSerializable(createToJson: false)
class RelationshipDataV2 {
  @JsonKey(name: "auction_config")
  List<Relationship> relationships;

  RelationshipDataV2({required this.relationships});

  factory RelationshipDataV2.fromJson(Map<String, dynamic> json) =>
      _$RelationshipDataV2FromJson(json);
}

@JsonSerializable(createToJson: false)
class DefendDaysData {
  @JsonKey(name: "current")
  int curDefendDays;

  @JsonKey(name: "next")
  int nextDefendDays;

  @JsonKey(name: "score")
  int nextScore;

  DefendDaysData(
      {required this.curDefendDays,
      required this.nextDefendDays,
      required this.nextScore});

  factory DefendDaysData.fromJson(Map<String, dynamic> json) =>
      _$DefendDaysDataFromJson(json);
}

@JsonSerializable(createToJson: false)
class RelationshipLevelInfo {
  final int score; // 当前等级需要的守护值即defend_value
  final int level; //等级
  final String? title; // 等级头衔【黄金，钻石，荣耀】

  RelationshipLevelInfo({required this.score, required this.level, this.title});

  factory RelationshipLevelInfo.fromJson(Map<String, dynamic> json) =>
      _$RelationshipLevelInfoFromJson(json);
}

class NoticeInfo {
  String? content;

  NoticeInfo({
    this.content,
  });

  factory NoticeInfo.fromJson(Map<String, dynamic> json) {
    return NoticeInfo(
      content: Util.parseStr(json["content"]),
    );
  }
}

@JsonSerializable(createToJson: false)
class Relationship {
  int id;
  String? name;
  @JsonKey(name: "light_status")
  bool lightStatus;
  @JsonKey(name: "light_money")
  int lightMoney;
  @JsonKey(name: "defend_value")
  int defendValue;
  @JsonKey(name: "expire_time")
  int expireTime;

  @JsonKey(name: "defend_days_config")
  DefendDaysData? defendDays;

  Relationship({
    required this.id,
    this.name,
    required this.lightStatus,
    required this.lightMoney,
    required this.defendValue,
    required this.expireTime,
    required this.defendDays,
  });

  factory Relationship.fromJson(Map<String, dynamic> json) =>
      _$RelationshipFromJson(json);
}

@JsonSerializable(createToJson: false)
class Scene {
  int scene;
  int money;
  String? name;
  String? icon;

  Scene(this.scene, this.money, this.name, this.icon);

  factory Scene.fromJson(Map<String, dynamic> json) => _$SceneFromJson(json);
}

@JsonSerializable(createToJson: false)
class CpLinkResult {
  static const SUCCESS = "succ";

  static const FAIL = "fail";

  String? status;
  String? url;
  int size;
  List<UserInfo> users;
  int rid;
  List<String> uids;

  @JsonKey(name: 'auction_duration')
  String? relationDuration;
  @JsonKey(name: 'auction_name')
  String? relationName;

  bool isSuccess() {
    return status == SUCCESS;
  }

  bool isFail() {
    return status == FAIL;
  }

  CpLinkResult(this.status, this.url, this.size, this.users, this.rid,
      this.uids, this.relationDuration, this.relationName);

  factory CpLinkResult.fromJson(Map<String, dynamic> json) =>
      _$CpLinkResultFromJson(json);

  @override
  String toString() {
    return 'CpLinkResult{status: $status, url: $url, size: $size, users: $users, rid: $rid, uids: $uids, relationDuration: $relationDuration, relationName: $relationName}';
  }
}

@JsonSerializable(createToJson: false)
class UserInfo {
  String? uid;
  String? name;
  String? icon;

  UserInfo(this.uid, this.name, this.icon);

  factory UserInfo.fromJson(Map<String, dynamic> json) =>
      _$UserInfoFromJson(json);
}

enum CpLinkState {
  wait, //等待良缘
  heart, //心动连线
  hand, //牵手成功
}

@JsonSerializable(createToJson: false)
class DelayData {
  @JsonKey(name: 'delay_left_times')
  int delayLeftTimes;

  DelayData({
    required this.delayLeftTimes,
  });

  factory DelayData.fromJson(Map<String, dynamic> json) =>
      _$DelayDataFromJson(json);
}
