import 'package:shared/shared.dart';
import 'package:json_annotation/json_annotation.dart';

part 'nl_friend_recommend_model.g.dart';

/// 成就榜
@JsonSerializable(createToJson: false)
class NLAchieveRankItem {
  String rank;
  int uid;
  String name;
  String icon;
  int sex;
  String score;

  NLAchieveRankItem(
      this.rank, this.uid, this.name, this.icon, this.sex, this.score);

  factory NLAchieveRankItem.fromJson(Map<String, dynamic> json) =>
      _$NLAchieveRankItemFromJson(json);

  @override
  String toString() {
    return 'NLAchieveRankItem{rank: $rank, uid: $uid, name: $name, icon: $icon, sex: $sex, score: $score}';
  }
}

@JsonSerializable(createToJson: false)
class NLAchieveRankData {
  List<NLAchieveRankItem> list;

  @JsonKey(name: 'user_info')
  NLAchieveRankItem? my;

  bool more;

  NLAchieveRankData(this.list, this.my, this.more);

  factory NLAchieveRankData.fromJson(Map<String, dynamic> json) =>
      _$NLAchieveRankDataFromJson(json);
}

@JsonSerializable(createToJson: false)
class NLAchieveRankRsp extends BaseResponse {
  NLAchieveRankData? data;

  NLAchieveRankRsp({super.success, super.msg, this.data});

  factory NLAchieveRankRsp.fromJson(Map<String, dynamic> json) =>
      _$NLAchieveRankRspFromJson(json);
}

/// 好友推荐
@JsonSerializable(createToJson: false)
class NLRecommendFriendItem {
  String name;
  String icon;
  int uid;
  int sex;
  int age;
  int rid;
  int follow;

  @JsonKey(name: 'tag_info')
  NLRecommendFriendTagInfo? tagInfo;

  @JsonKey(name: 'popularity_level')
  int popularityLevel;

  @JsonKey(name: 'vip_level')
  int vipLevel;

  String distance;
  String score;
  bool online;

  NLRecommendFriendItem(
      this.name,
      this.icon,
      this.uid,
      this.sex,
      this.age,
      this.rid,
      this.follow,
      this.tagInfo,
      this.popularityLevel,
      this.vipLevel,
      this.distance,
      this.score,
      this.online);

  factory NLRecommendFriendItem.fromJson(Map<String, dynamic> json) =>
      _$NLRecommendFriendItemFromJson(json);
}

@JsonSerializable(createToJson: false)
class NLRecommendFriendTagInfo {
  String show;

  @JsonKey(name: 'bg')
  List<String> bgColors;

  @JsonKey(name: 'acute_icon')
  String acuteIcon;

  NLRecommendFriendTagInfo(this.show, this.bgColors, this.acuteIcon);

  factory NLRecommendFriendTagInfo.fromJson(Map<String, dynamic> json) =>
      _$NLRecommendFriendTagInfoFromJson(json);
}

@JsonSerializable(createToJson: false)
class NLRecommendFriendData {
  List<NLRecommendFriendItem> list;

  NLRecommendFriendData(this.list);

  factory NLRecommendFriendData.fromJson(Map<String, dynamic> json) =>
      _$NLRecommendFriendDataFromJson(json);
}

@JsonSerializable(createToJson: false)
class NLRecommendFriendRsp extends BaseResponse {
  NLRecommendFriendData? data;

  NLRecommendFriendRsp({super.success, super.msg, this.data});

  factory NLRecommendFriendRsp.fromJson(Map<String, dynamic> json) =>
      _$NLRecommendFriendRspFromJson(json);
}
