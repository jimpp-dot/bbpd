import 'package:shared/shared.dart';
import 'package:json_annotation/json_annotation.dart';

part 'live_pk_one_more_info.g.dart';

@JsonSerializable()
class LivePKOneMoreInfo extends BaseResponse {
  @JsonKey(name: 'from_uid')
  int fromUid; //主播uid

  @JsonKey(name: 'from_rid')
  int fromRid;

  @JsonKey(name: 'to_uid')
  int toUid; //主播uid

  @JsonKey(name: 'to_rid')
  int toRid;

  @JsonKey(name: 'pk_time')
  String pkTime;

  @JsonKey(name: 'expire_time')
  int expireTime;

  LivePKOneMoreInfo(this.toRid, this.fromUid, this.pkTime, this.fromRid,
      this.expireTime, this.toUid);

  factory LivePKOneMoreInfo.fromJson(Map<String, dynamic> srcJson) =>
      _$LivePKOneMoreInfoFromJson(srcJson);

  @override
  Map<String, dynamic> toJson() => _$LivePKOneMoreInfoToJson(this);
}
