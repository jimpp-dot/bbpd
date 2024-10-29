// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nearby_match_request_list_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NearbyMatchRequestListDataResp _$NearbyMatchRequestListDataRespFromJson(
    Map<String, dynamic> json) {
  return NearbyMatchRequestListDataResp(
    success: Util.parseBool(json['success']),
    msg: Util.parseStr(json['msg']),
    data: Util.parseList(json['data'],
        (e) => NearbyMatchRequestListData.fromJson(e as Map<String, dynamic>)),
  );
}

NearbyMatchRequestListData _$NearbyMatchRequestListDataFromJson(
    Map<String, dynamic> json) {
  return NearbyMatchRequestListData(
    Util.parseInt(json['id']),
    Util.parseStr(json['name']),
    Util.parseInt(json['uid']),
    Util.parseStr(json['sign']),
    Util.parseInt(json['status']),
    Util.parseStr(json['icon']),
    Util.parseInt(json['age']),
    Util.parseInt(json['sex']),
  )..touid = Util.parseInt(json['touid']);
}

SayhiMatchRsp _$SayhiMatchRspFromJson(Map<String, dynamic> json) {
  return SayhiMatchRsp(
    success: Util.parseBool(json['success']),
    msg: Util.parseStr(json['msg']),
    data: Util.parseList(json['data'],
        (e) => SayhiMatchModel.fromJson(e as Map<String, dynamic>)),
    remainTime: Util.parseInt(json['remaining_num']),
  );
}

SayhiMatchModel _$SayhiMatchModelFromJson(Map<String, dynamic> json) {
  return SayhiMatchModel(
    Util.parseStr(json['icon']),
    Util.parseStr(json['distance']),
    Util.parseInt(json['uid']),
    Util.parseInt(json['in_room']),
    Util.parseStr(json['name']),
  );
}

SayHiNearbyPeopleRsq _$SayHiNearbyPeopleRsqFromJson(Map<String, dynamic> json) {
  return SayHiNearbyPeopleRsq(
    success: Util.parseBool(json['success']),
    msg: Util.parseStr(json['msg']),
    data: Util.parseList(json['data'],
        (e) => SayHiNearbyPeople.fromJson(e as Map<String, dynamic>)),
  );
}

SayHiNearbyPeople _$SayHiNearbyPeopleFromJson(Map<String, dynamic> json) {
  return SayHiNearbyPeople(
    Util.parseInt(json['uid']),
    Util.parseStr(json['icon']),
    Util.parseStr(json['name']),
  );
}

SayhiMatchRemainNumRsp _$SayhiMatchRemainNumRspFromJson(
    Map<String, dynamic> json) {
  return SayhiMatchRemainNumRsp(
    success: Util.parseBool(json['success']),
    msg: Util.parseStr(json['msg']),
    data: json['data'] as Map<String, dynamic>,
  )..remainNum = Util.parseInt(json['remainNum']);
}
