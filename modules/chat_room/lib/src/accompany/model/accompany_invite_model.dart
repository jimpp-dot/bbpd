import 'package:shared/shared.dart';
import 'package:json_annotation/json_annotation.dart';

part 'accompany_invite_model.g.dart';

/// 邀请朋友或者在线用户
class AccompanyInviteResponse extends BaseResponse {
  final List<AccompanyInviteModel>? list;
  final int more;

  AccompanyInviteResponse({super.success, super.msg, this.list, this.more = 0});

  factory AccompanyInviteResponse.fromJson(Map<String, dynamic> json) {
    bool success = false;
    String msg = '';
    List<AccompanyInviteModel> resultList = [];
    int more = 0;
    try {
      success = Util.parseBool(json['success']);
      msg = json['msg'];
      if (success) {
        // Map data = json['data'];
        more = Util.parseInt(json['more']);
        for (var element in (json['data'] as List)) {
          AccompanyInviteModel ranking = AccompanyInviteModel.fromJson(element);
          resultList.add(ranking);
        }
      }
    } catch (e) {
      Log.d(e);
    }
    AccompanyInviteResponse rsp = AccompanyInviteResponse(
        success: success, msg: msg, list: resultList, more: more);
    return rsp;
  }
}

/// 邀请朋友或在线用户
@JsonSerializable(createToJson: false, fieldRename: FieldRename.snake)
class AccompanyInviteModel {
  final int uid;
  final String? name;
  @JsonKey(fromJson: Util.getRemoteImgUrl)
  final String? icon;
  final int online;
  final String? onlineDatelineDiff;
  final double distance;

  @JsonKey(ignore: true)
  bool isSelected = false;

  AccompanyInviteModel(this.uid, this.name, this.icon, this.online,
      this.distance, this.onlineDatelineDiff);

  factory AccompanyInviteModel.fromJson(Map<String, dynamic> json) =>
      _$AccompanyInviteModelFromJson(json);
}

/// 邀请朋友或在线用户
class AccompanyInviteSocketData {
  final int rid;
  final UserBean? from;
  final UserBean? to;

  AccompanyInviteSocketData(this.rid, this.from, this.to);

  factory AccompanyInviteSocketData.fromJson(Map<String, dynamic> json) {
    return AccompanyInviteSocketData(
      Util.parseInt(json['rid']),
      json['from'] == null
          ? null
          : UserBean.fromJson(Map<String, dynamic>.from(json['from'])),
      json['to'] == null
          ? null
          : UserBean.fromJson(Map<String, dynamic>.from(json['to'])),
    );
  }
}
