import 'package:shared/shared.dart';
import 'package:json_annotation/json_annotation.dart';

part 'invite_fans_rsp.g.dart';

@JsonSerializable(createToJson: false)
class InviteFansResp extends BaseResponse {
  final Map? data;

  int get leftInviteNum => Util.parseInt(data?['left_invite_num']);

  InviteFansResp({super.success, super.msg, this.data});

  factory InviteFansResp.fromJson(Map<String, dynamic> json) =>
      _$InviteFansRespFromJson(json);
}
