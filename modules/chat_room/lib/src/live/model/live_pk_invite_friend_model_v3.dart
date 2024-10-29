import 'package:shared/shared.dart';
import 'package:json_annotation/json_annotation.dart';

import '../pk/live_pk_sub_page_v3.dart';

part 'live_pk_invite_friend_model_v3.g.dart';

@JsonSerializable()
class LivePkInviteFriendModelV3 extends BaseResponse {
  @JsonKey(name: 'data')
  Data? data;

  LivePkInviteFriendModelV3({super.success, super.msg, this.data});

  factory LivePkInviteFriendModelV3.fromJson(Map<String, dynamic> srcJson) =>
      _$LivePkInviteFriendModelV3FromJson(srcJson);

  @override
  Map<String, dynamic> toJson() => _$LivePkInviteFriendModelV3ToJson(this);
}

@JsonSerializable()
class Data {
  @JsonKey(name: 'data')
  List<LivePKInviteFriendItem> data;

  Data(this.data);

  factory Data.fromJson(Map<String, dynamic> srcJson) =>
      _$DataFromJson(srcJson);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}

LivePKStatus getLivePKStatus(var status) {
  int curStatus = Util.parseInt(status);
  if (curStatus == 1) {
    return LivePKStatus.NoBroadcast;
  } else if (curStatus == 2) {
    return LivePKStatus.CanPK;
  } else if (curStatus == 3) {
    return LivePKStatus.PKing;
  } else if (curStatus == 4) {
    return LivePKStatus.NoPK;
  }
  return LivePKStatus.NoPK;
}

@JsonSerializable()
class LivePKInviteFriendItem {
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

  @JsonKey(name: 'online_num')
  int onlineNum; //在线人数

  @JsonKey(name: 'real')
  int charm; //魅力值

  @JsonKey(name: 'status', fromJson: getLivePKStatus)
  LivePKStatus pkStatus;

  LivePKInviteFriendItem(this.uid, this.name, this.icon, this.sex,
      this.onlineNum, this.charm, this.pkStatus, this.rid);

  factory LivePKInviteFriendItem.fromJson(Map<String, dynamic> srcJson) =>
      _$LivePKInviteFriendItemFromJson(srcJson);

  Map<String, dynamic> toJson() => _$LivePKInviteFriendItemToJson(this);
}
