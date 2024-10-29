import 'package:shared/shared.dart';
import 'package:json_annotation/json_annotation.dart';

import '../pk/live_pk_setting_v3.dart';

part 'live_pk_set_config_model_v3.g.dart';

@JsonSerializable()
class LivePKSetConfigModelV3 extends BaseResponse {
  @JsonKey(name: 'data')
  LivePKInfo? data;

  @JsonKey(name: 'system_punish')
  Map? systemPunishList;

  LivePKSetConfigModelV3(
      {super.success, super.msg, this.data, this.systemPunishList});

  factory LivePKSetConfigModelV3.fromJson(Map<String, dynamic> srcJson) =>
      _$LivePKSetConfigModelV3FromJson(srcJson);

  @override
  Map<String, dynamic> toJson() => _$LivePKSetConfigModelV3ToJson(this);
}

/// 是否接受PK邀请  1 允许  2 拒绝
AcceptPKInvitation getAcceptPKInvitation(var status) {
  int curStatus = Util.parseInt(status);
  if (curStatus == 1) {
    return AcceptPKInvitation.Accept;
  } else if (curStatus == 2) {
    return AcceptPKInvitation.NoAccept;
  }
  return AcceptPKInvitation.Accept;
}

/// 是否接受好友PK邀请  1 允许  2 拒绝
AcceptFriendsPKInvitation getAcceptFriendsPKInvitation(var status) {
  int curStatus = Util.parseInt(status);
  if (curStatus == 1) {
    return AcceptFriendsPKInvitation.Accept;
  } else if (curStatus == 2) {
    return AcceptFriendsPKInvitation.NoAccept;
  } else if (curStatus == 3) {
    return AcceptFriendsPKInvitation.Disable;
  }
  return AcceptFriendsPKInvitation.Accept;
}

/// 是否接受PK邀请  1 允许  2 拒绝
EnableCoinGift getEnableCoinGift(var status) {
  int curStatus = Util.parseInt(status);
  if (curStatus == 1) {
    return EnableCoinGift.Enable;
  } else if (curStatus == 2) {
    return EnableCoinGift.NoEnable;
  }
  return EnableCoinGift.Enable;
}

@JsonSerializable()
class LivePKInfo {
  @JsonKey(name: 'id')
  int configId;

  @JsonKey(name: 'rid')
  int rid;

  @JsonKey(name: 'pk_status', fromJson: getAcceptPKInvitation)
  AcceptPKInvitation acceptPKInvitation; //是否接受PK邀请

  @JsonKey(name: 'host_invite', fromJson: getAcceptFriendsPKInvitation)
  AcceptFriendsPKInvitation acceptPKHostInvitation; //是否接受互相关注主播 PK邀请

  @JsonKey(name: 'coin_enable', fromJson: getEnableCoinGift)
  EnableCoinGift enableCoinGift;

  @JsonKey(name: 'pk_type')
  String punishType; //惩罚类型

  @JsonKey(name: 'punish_id')
  int punishId; //惩罚id

  @JsonKey(name: 'punish_content')
  String punishContent; //惩罚类型

  @JsonKey(name: 'create_time')
  String createTime;

  @JsonKey(name: 'pk_time')
  String pkTime;

  LivePKInfo(
    this.configId,
    this.rid,
    this.acceptPKInvitation,
    this.acceptPKHostInvitation,
    this.enableCoinGift,
    this.punishContent,
    this.createTime,
    this.punishId,
    this.punishType,
    this.pkTime,
  );

  factory LivePKInfo.fromJson(Map<String, dynamic> srcJson) =>
      _$LivePKInfoFromJson(srcJson);

  Map<String, dynamic> toJson() => _$LivePKInfoToJson(this);
}

@JsonSerializable()
class SystemPunish {
  @JsonKey(name: 'id')
  int punishId;

  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'icon')
  int icon;

  @JsonKey(name: 'content')
  List<String> punishContent; //惩罚类型

  @JsonKey(name: 'create_time')
  String createTime;

  @JsonKey(name: 'time')
  String time;

  @JsonKey(name: 'type')
  String type;

  SystemPunish(this.name, this.icon, this.type, this.time, this.punishContent,
      this.createTime, this.punishId);

  factory SystemPunish.fromJson(Map<String, dynamic> srcJson) =>
      _$SystemPunishFromJson(srcJson);

  Map<String, dynamic> toJson() => _$SystemPunishToJson(this);
}
