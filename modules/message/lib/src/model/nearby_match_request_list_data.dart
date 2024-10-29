import 'package:shared/shared.dart';
import 'package:json_annotation/json_annotation.dart';

part 'nearby_match_request_list_data.g.dart';

@JsonSerializable(createToJson: false)
class NearbyMatchRequestListDataResp extends BaseResponse {
  @JsonKey(name: 'data')
  final List<NearbyMatchRequestListData>? data;

  NearbyMatchRequestListDataResp({super.success, super.msg, this.data});

  factory NearbyMatchRequestListDataResp.fromJson(Map<String, dynamic> json) =>
      _$NearbyMatchRequestListDataRespFromJson(json);
}

@JsonSerializable(createToJson: false)
class NearbyMatchRequestListData {
  @JsonKey(name: 'id')
  final int indexId;

  @JsonKey(name: 'name')
  final String? name;

  @JsonKey(name: 'touid')
  int touid = 0;

  @JsonKey(name: 'uid')
  final int uid;

  @JsonKey(name: 'sign')
  final String? sign;

  @JsonKey(name: 'status')
  int status; //0 未接受匹配 1 已匹配

  @JsonKey(name: 'icon')
  final String? icon;

  @JsonKey(name: 'age')
  final int age;

  @JsonKey(name: 'sex')
  final int sex;

  NearbyMatchRequestListData(this.indexId, this.name, this.uid, this.sign,
      this.status, this.icon, this.age, this.sex);

  factory NearbyMatchRequestListData.fromJson(Map<String, dynamic> json) =>
      _$NearbyMatchRequestListDataFromJson(json);
}

@JsonSerializable(createToJson: false)
class SayhiMatchRsp extends BaseResponse {
  @JsonKey(name: 'data')
  final List<SayhiMatchModel>? data;

  @JsonKey(name: 'remaining_num')
  final int remainTime;

  SayhiMatchRsp({super.success, super.msg, this.data, this.remainTime = 0});

  factory SayhiMatchRsp.fromJson(Map<String, dynamic> json) =>
      _$SayhiMatchRspFromJson(json);
}

@JsonSerializable(createToJson: false)
class SayhiMatchModel {
  @JsonKey(name: 'icon')
  final String? head;

  @JsonKey(name: 'distance')
  final String? distance;

  @JsonKey(name: 'uid')
  final int uid;

  @JsonKey(name: 'in_room')
  final int rid;

  @JsonKey(name: 'name')
  final String? name;

  SayhiMatchModel(this.head, this.distance, this.uid, this.rid, this.name);

  factory SayhiMatchModel.fromJson(Map<String, dynamic> json) =>
      _$SayhiMatchModelFromJson(json);
}

// @JsonSerializable(createToJson: false)
// class SayhiMatchNumModelResq extends BaseResponse {
//
//   @JsonKey(name: 'data')
//   MatchNumModel model;
//
//   SayhiMatchNumModelResq({bool success, String msg, this.model}) : super(success: success, msg: msg);
//
//   factory SayhiMatchNumModelResq.fromJson(Map<String, dynamic> json) => _$SayhiMatchNumModelResqFromJson(json);
// }
//
// @JsonSerializable(createToJson: false)
// class MatchNumModel {
//
//   @JsonKey(name: 'num')
//   int num;
//
//   @JsonKey(name: 'dateline')
//   int dateLine;
//
//   MatchNumModel(this.num, this.dateLine);
//
//   factory MatchNumModel.fromJson(Map<String, dynamic> json) => _$MatchNumModelFromJson(json);
// }

@JsonSerializable(createToJson: false)
class SayHiNearbyPeopleRsq extends BaseResponse {
  @JsonKey(name: 'data')
  final List<SayHiNearbyPeople>? data;

  SayHiNearbyPeopleRsq({super.success, super.msg, this.data});

  factory SayHiNearbyPeopleRsq.fromJson(Map<String, dynamic> json) =>
      _$SayHiNearbyPeopleRsqFromJson(json);
}

@JsonSerializable(createToJson: false)
class SayHiNearbyPeople {
  @JsonKey(name: 'uid')
  final int uid;

  @JsonKey(name: 'icon')
  final String? icon;

  @JsonKey(name: 'name')
  final String? name;

  SayHiNearbyPeople(this.uid, this.icon, this.name);

  factory SayHiNearbyPeople.fromJson(Map<String, dynamic> json) =>
      _$SayHiNearbyPeopleFromJson(json);
}

@JsonSerializable(createToJson: false)
class SayhiMatchRemainNumRsp extends BaseResponse {
  @JsonKey(name: 'data')
  Map? data;

  int remainNum = 0; //data['remaining_num']

  SayhiMatchRemainNumRsp({super.success, super.msg, this.data});

  factory SayhiMatchRemainNumRsp.fromJson(Map<String, dynamic> json) =>
      _$SayhiMatchRemainNumRspFromJson(json);
}
