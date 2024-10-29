import 'package:shared/shared.dart';
import 'package:chat_room/src/live/model/live_pk_invite_friend_model_v3.dart';
import 'package:json_annotation/json_annotation.dart';

import '../pk/live_pk_sub_page_v3.dart';

part 'live_pk_recent_match_model_v3.g.dart';

@JsonSerializable()
class LivePKRecentMatchModelV3 extends BaseResponse {
  @JsonKey(name: 'data')
  Data? data;

  LivePKRecentMatchModelV3({super.success, super.msg, this.data});

  factory LivePKRecentMatchModelV3.fromJson(Map<String, dynamic> srcJson) =>
      _$LivePKRecentMatchModelV3FromJson(srcJson);

  @override
  Map<String, dynamic> toJson() => _$LivePKRecentMatchModelV3ToJson(this);
}

@JsonSerializable()
class Data {
  @JsonKey(name: 'data')
  List<LivePKRecentItem> data;

  Data(this.data);

  factory Data.fromJson(Map<String, dynamic> srcJson) =>
      _$DataFromJson(srcJson);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}

@JsonSerializable()
class LivePKRecentItem {
  @JsonKey(name: 'uid')
  int uid; //主播uid

  @JsonKey(name: 'rid')
  int rid;

  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'icon')
  String icon;

  @JsonKey(name: 'sex', fromJson: Util.parseInt)
  int sex;

  @JsonKey(name: 'my_score')
  int mainScore; //当前房主pk得分

  @JsonKey(name: 'his_score')
  int competeScore; //对方主播pk得分

  @JsonKey(name: 'create_time')
  int lastMatchTime; // 上次匹配时间

  @JsonKey(name: 'status', fromJson: getLivePKStatus)
  LivePKStatus pkStatus;

  LivePKRecentItem({
    required this.uid,
    required this.name,
    required this.icon,
    required this.sex,
    required this.mainScore,
    required this.competeScore,
    required this.lastMatchTime,
    required this.rid,
    required this.pkStatus,
  });

  factory LivePKRecentItem.fromJson(Map<String, dynamic> srcJson) =>
      _$LivePKRecentItemFromJson(srcJson);

  Map<String, dynamic> toJson() => _$LivePKRecentItemToJson(this);
}
