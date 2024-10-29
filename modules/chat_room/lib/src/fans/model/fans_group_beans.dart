import 'package:shared/shared.dart';
import 'package:json_annotation/json_annotation.dart';

part 'fans_group_beans.g.dart';

@JsonSerializable(createToJson: false)
class StarChallengeResp extends BaseResponse {
  StarChallengeData? data;

  StarChallengeResp({super.success, super.msg, this.data});

  factory StarChallengeResp.fromJson(Map<String, dynamic> json) =>
      _$StarChallengeRespFromJson(json);
}

@JsonSerializable(createToJson: false)
class StarChallengeData {
  @JsonKey(name: "user_info")
  BasicInfo? basicInfo;

  @JsonKey(name: "task_data")
  List<TaskInfo> taskData;

  @JsonKey(name: 'task_name')
  String? name;

  StarChallengeData(this.basicInfo, this.taskData, this.name);

  factory StarChallengeData.fromJson(Map<String, dynamic> json) =>
      _$StarChallengeDataFromJson(json);
}

@JsonSerializable(createToJson: false)
class BasicInfo {
  String? uid;
  String? name;
  String? icon;
  int popularity;
  @JsonKey(name: 'stars_count')
  int starsCount;
  @JsonKey(name: 'fans_num')
  int fansNum;

  BasicInfo(this.uid, this.name, this.icon, this.popularity, this.starsCount,
      this.fansNum);

  factory BasicInfo.fromJson(Map<String, dynamic> json) =>
      _$BasicInfoFromJson(json);
}

@JsonSerializable(createToJson: false)
class TaskInfo {
  static const int STATUS_COMPLETE = 1;

  static const int STATUS_NON = 0;

  int status;

  int percent;

  @JsonKey(name: 'award_popularity')
  int popularity;

  @JsonKey(name: "task_list")
  List<TaskItem> itemList;

  TaskInfo(this.status, this.percent, this.popularity, this.itemList);

  factory TaskInfo.fromJson(Map<String, dynamic> json) =>
      _$TaskInfoFromJson(json);
}

@JsonSerializable(createToJson: false)
class TaskItem {
  String? icon;
  String? name;
  String? process;
  int percent;

  TaskItem(this.icon, this.name, this.process, this.percent);

  factory TaskItem.fromJson(Map<String, dynamic> json) =>
      _$TaskItemFromJson(json);
}

@JsonSerializable(createToJson: false)
class FansEntranceResp extends BaseResponse {
  FansEntrance? data;

  FansEntranceResp({super.success, super.msg, this.data});

  factory FansEntranceResp.fromJson(Map<String, dynamic> json) =>
      _$FansEntranceRespFromJson(json);
}

@JsonSerializable(createToJson: false)
class FansEntrance {
  bool follow;
  bool fans;
  int uid;

  FansEntrance(this.follow, this.fans, this.uid);

  factory FansEntrance.fromJson(Map<String, dynamic> json) =>
      _$FansEntranceFromJson(json);
}

@JsonSerializable(createToJson: false)
class JoinFansGroupResp extends BaseResponse {
  JoinFansGroup? data;

  JoinFansGroupResp({super.success, super.msg, this.data});

  factory JoinFansGroupResp.fromJson(Map<String, dynamic> json) =>
      _$JoinFansGroupRespFromJson(json);
}

@JsonSerializable(createToJson: false)
class JoinFansGroup {
  int uid;
  String? name;
  String? icon;
  int sex;
  @JsonKey(name: 'fans_num')
  int fansNum;
  int rank;
  JoinGift? gift;
  List<FansRight> rights;

  JoinFansGroup(this.uid, this.name, this.icon, this.sex, this.fansNum,
      this.rank, this.gift, this.rights);

  factory JoinFansGroup.fromJson(Map<String, dynamic> json) =>
      _$JoinFansGroupFromJson(json);
}

@JsonSerializable(createToJson: false)
class JoinGift {
  int id;
  String? name;
  double price;
  String? type;
  @JsonKey(name: 'gift_type')
  String? giftType;
  int cid;

  JoinGift(this.id, this.name, this.price, this.type, this.giftType, this.cid);

  factory JoinGift.fromJson(Map<String, dynamic> json) =>
      _$JoinGiftFromJson(json);
}

@JsonSerializable(createToJson: false)
class FansRight {
  String? name;
  String? desc;
  String? icon;

  FansRight(this.name, this.desc, this.icon);

  factory FansRight.fromJson(Map<String, dynamic> json) =>
      _$FansRightFromJson(json);
}

@JsonSerializable(createToJson: false)
class FansGroupRankItem {
  int rank;
  int uid;
  String? name;
  String? icon;
  int sex;
  String? credit;

  FansGroupRankItem(
      this.rank, this.uid, this.name, this.icon, this.sex, this.credit);

  factory FansGroupRankItem.fromJson(Map<String, dynamic> json) =>
      _$FansGroupRankItemFromJson(json);
}

@JsonSerializable(createToJson: false)
class FansGroupRankData {
  int page;
  int size;
  int next;

  List<FansGroupRankItem> list;

  FansGroupRankData(this.page, this.size, this.next, this.list);

  factory FansGroupRankData.fromJson(Map<String, dynamic> json) =>
      _$FansGroupRankDataFromJson(json);
}

@JsonSerializable(createToJson: false)
class FansGroupRankRsp extends BaseResponse {
  FansGroupRankData? data;

  FansGroupRankRsp({super.success, super.msg, this.data});

  factory FansGroupRankRsp.fromJson(Map<String, dynamic> json) =>
      _$FansGroupRankRspFromJson(json);
}

@JsonSerializable(createToJson: false)
class GroupInfoData {
  int rid;
  int uid;
  String? name;
  String? icon;

  @JsonKey(name: 'member_num')
  int memberNum;

  int credit;
  int rank;

  GroupInfoData(this.rid, this.uid, this.name, this.icon, this.memberNum,
      this.credit, this.rank);

  factory GroupInfoData.fromJson(Map<String, dynamic> json) =>
      _$GroupInfoDataFromJson(json);
}

@JsonSerializable(createToJson: false)
class FansUserInfo {
  int rank;
  int uid;
  String? name;
  String? icon;
  int credit;
  String? label;
  int level;

  @JsonKey(name: 'label_image')
  String? labelImage;

  @JsonKey(name: 'label_colors')
  List<String> labelColors;

  FansUserInfo(this.rank, this.uid, this.name, this.icon, this.credit,
      this.label, this.level, this.labelImage, this.labelColors);

  factory FansUserInfo.fromJson(Map<String, dynamic> json) =>
      _$FansUserInfoFromJson(json);
}

@JsonSerializable(createToJson: false)
class FansRankItem {
  String? name;
  int rank;
  int uid;
  String? icon;
  int credit;
  int level;
  String? label;
  int sex;

  @JsonKey(name: 'label_image')
  String? labelImage;

  @JsonKey(name: 'label_colors')
  List<String> labelColors;

  FansRankItem(this.name, this.rank, this.uid, this.icon, this.credit,
      this.level, this.label, this.sex, this.labelImage, this.labelColors);

  factory FansRankItem.fromJson(Map<String, dynamic> json) =>
      _$FansRankItemFromJson(json);
}

@JsonSerializable(createToJson: false)
class FansTaskItem {
  String? name;
  String? label;
  String? icon;

  @JsonKey(name: 'award_credit')
  int awardCredit;

  @JsonKey(name: 'award_note')
  String? awardNote;

  @JsonKey(name: 'complete_note')
  String? completeNote;

  @JsonKey(name: 'max_num')
  int maxNum;

  @JsonKey(name: 'complete_num')
  int completeNum;

  FansTaskItem(this.name, this.label, this.icon, this.awardCredit,
      this.awardNote, this.completeNote, this.maxNum, this.completeNum);

  factory FansTaskItem.fromJson(Map<String, dynamic> json) =>
      _$FansTaskItemFromJson(json);
}

@JsonSerializable(createToJson: false)
class FansGroupItem {
  @JsonKey(name: 'group_info')
  GroupInfoData? groupInfo;

  @JsonKey(name: 'user_info')
  FansUserInfo? userInfo;

  @JsonKey(name: 'task_list')
  List<FansTaskItem> taskList;

  @JsonKey(name: 'rank_list')
  List<FansRankItem> rankList;

  FansGroupItem(this.groupInfo, this.userInfo, this.taskList, this.rankList);

  factory FansGroupItem.fromJson(Map<String, dynamic> json) =>
      _$FansGroupItemFromJson(json);
}

@JsonSerializable(createToJson: false)
class FansGroupRsp extends BaseResponse {
  FansGroupItem? data;

  FansGroupRsp({super.success, super.msg, this.data});

  factory FansGroupRsp.fromJson(Map<String, dynamic> json) =>
      _$FansGroupRspFromJson(json);
}

@JsonSerializable(createToJson: false)
class FansPrivilegeBagData {
  @JsonKey(name: 'pkg_id')
  int pkgId;

  int price;

  @JsonKey(name: 'original_price')
  int originalPrice;

  List<ShopMailCommodity> list;

  FansPrivilegeBagData(this.pkgId, this.price, this.originalPrice, this.list);

  factory FansPrivilegeBagData.fromJson(Map<String, dynamic> json) =>
      _$FansPrivilegeBagDataFromJson(json);
}

@JsonSerializable(createToJson: false)
class FansPrivilegeRsp extends BaseResponse {
  FansPrivilegeBagData? data;

  FansPrivilegeRsp({super.success, super.msg, this.data});

  factory FansPrivilegeRsp.fromJson(Map<String, dynamic> json) =>
      _$FansPrivilegeRspFromJson(json);
}

@JsonSerializable(createToJson: false)
class FansLabelListResp extends BaseResponse {
  FansLabelList? data;

  FansLabelListResp({super.success, super.msg, this.data});

  factory FansLabelListResp.fromJson(Map<String, dynamic> json) =>
      _$FansLabelListRespFromJson(json);
}

@JsonSerializable(createToJson: false)
class FansLabelList {
  List<FansLabelItemData> list;

  FansLabelList(this.list);

  factory FansLabelList.fromJson(Map<String, dynamic> json) =>
      _$FansLabelListFromJson(json);
}

@JsonSerializable(createToJson: false)
class FansLabelItemData {
  int uid;
  String? name;
  String? icon;
  int sex;
  int age;
  @JsonKey(name: 'popularity_level')
  int popular;

  @JsonKey(name: 'credit_today')
  int creditToday;
  int level;

  @JsonKey(name: 'label')
  String? labelName;

  @JsonKey(name: 'credit_total')
  int creditTotal;

  @JsonKey(name: 'credit_level')
  int creditLevel;

  @JsonKey(name: 'is_join')
  bool isJoin;
  int rid;

  @JsonKey(name: 'is_live')
  bool isLive;

  @JsonKey(name: 'label_image')
  String? levelImg;

  @JsonKey(name: 'label_colors')
  List<String> colors;

  FansLabelItemData(
      this.uid,
      this.name,
      this.icon,
      this.sex,
      this.age,
      this.popular,
      this.creditToday,
      this.level,
      this.labelName,
      this.creditTotal,
      this.creditLevel,
      this.isJoin,
      this.rid,
      this.isLive,
      this.levelImg,
      this.colors);

  factory FansLabelItemData.fromJson(Map<String, dynamic> json) =>
      _$FansLabelItemDataFromJson(json);
}
