import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'friends_playing.g.dart';

@JsonSerializable(createToJson: false)
class FriendsPlayingItem {
  @JsonKey(fromJson: Util.parseInt)
  int? uid;

  @JsonKey(name: 'in_room', fromJson: Util.parseInt)
  int? rid;
  String? icon;
  String? name;

  @JsonKey(name: 'room_tag_new')
  String? roomTag;

  @JsonKey(name: 'rec_mark')
  String? mark; //推荐标签

  @JsonKey(name: 'online_status')
  int? onlineStatus;

  String? show;

  @JsonKey(name: 'acute_icon')
  String? acuteIcon;

  @JsonKey(name: 'bg', fromJson: Util.parseColors)
  final List<Color>? bgColors;

  FriendsPlayingItem(
      {this.uid,
      this.rid,
      this.icon,
      this.name,
      this.acuteIcon,
      this.bgColors,
      this.show,
      this.onlineStatus});

  factory FriendsPlayingItem.fromJson(Map<String, dynamic> json) =>
      _$FriendsPlayingItemFromJson(json);
}

@JsonSerializable(createToJson: false)
class FriendsPlayingRsp extends BaseResponse
    with PageListResponse<FriendsPlayingItem> {
  List<FriendsPlayingItem>? data;

  @JsonKey(fromJson: Util.parseInt)
  int total;

  FriendsPlayingRsp(
      {bool success = false, String? msg, this.data, this.total = 0})
      : super(success: success, msg: msg);

  factory FriendsPlayingRsp.fromJson(Map<String, dynamic> json) =>
      _$FriendsPlayingRspFromJson(json);

  @override
  List<FriendsPlayingItem>? get items => data;
}

class FriendsPlayingRepo {
  static Future<FriendsPlayingRsp> getFriendsPlayingList(int page) async {
    String url =
        '${System.domain}home/friendsPlayinglist?page=$page&v=3&need_offline=0';
    try {
      XhrResponse response = await Xhr.getJson(url, throwOnError: false);
      if (response.error != null) {
        Log.d(response.error.toString());
        return FriendsPlayingRsp(
            msg: response.error.toString(), success: false);
      }

      Map<String, dynamic> res = response.response as Map<String, dynamic>;
      if (!(res['success'] ?? false)) {
        return FriendsPlayingRsp(msg: res['msg'], success: false);
      }
      try {
        FriendsPlayingRsp responseData = FriendsPlayingRsp.fromJson(res);
        return responseData;
      } catch (e) {
        return FriendsPlayingRsp(
            msg: R.array('xhr_error_type_array')[6], success: false);
      }
    } catch (e) {
      return FriendsPlayingRsp(msg: e.toString(), success: false);
    }
  }
}
