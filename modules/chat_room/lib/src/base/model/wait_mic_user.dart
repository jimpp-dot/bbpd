import 'package:shared/shared.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:chat_room/src/base/model/roomConstant.dart';
import 'package:chat_room/src/base/widget/pickup_mic_page.dart';

part 'wait_mic_user.g.dart';

@JsonSerializable(createToJson: false)
class WaitMicUserInfo {
  @JsonKey(name: 'uid', fromJson: Util.parseInt)
  int uid;

  String name;
  String icon;
  int sex;
  int title;

  @JsonKey(name: 'title_new')
  int titleNew;

  int vip;
  int year;

  @JsonKey(name: 'dateline_diff')
  String datelineDiff;

  bool priority; // 网赚厅优先标记

  @JsonKey(name: 'song_name')
  String song; // 网赚厅已点歌曲名

  @JsonKey(name: 'song_id')
  String songId; // 网赚厅已点歌曲id

  WaitMicUserInfo(
      this.uid,
      this.name,
      this.icon,
      this.sex,
      this.title,
      this.titleNew,
      this.vip,
      this.year,
      this.datelineDiff,
      this.priority,
      this.song,
      this.songId);

  factory WaitMicUserInfo.fromJson(Map json) =>
      _$WaitMicUserInfoFromJson(json as Map<String, dynamic>);
}

@JsonSerializable(createToJson: false)
class WaitMicUserListRsp extends BaseResponse {
  @JsonKey(name: 'data')
  List<WaitMicUserInfo>? waitMicUsers;

  @JsonKey(name: 'position_table')
  List<PositionIndex>? positionTable;

  @JsonKey(name: 'gift_info') // 网赚厅排麦插队送礼礼物
  Gift? gift;

  @JsonKey(name: 'sing_power') // 网赚厅注册7天内才能上台演唱
  bool singPower;

  @JsonKey(name: 'has_order_song') // 用户是否已完成过点歌现金任务
  bool hasOrderSong;

  WaitMicUserListRsp(
      {required super.success,
      this.positionTable,
      required super.msg,
      this.waitMicUsers,
      this.gift,
      this.singPower = false,
      this.hasOrderSong = false});

  factory WaitMicUserListRsp.fromJson(Map json) =>
      _$WaitMicUserListRspFromJson(json as Map<String, dynamic>);
}

class WaitMicRepository {
  static Future<WaitMicUserListRsp> getWaitList(
      int rid, bool isBoss, bool isAuction) async {
    String url = '${System.domain}room/queue?version=2';
    try {
      XhrResponse response = await Xhr.postJson(
          url,
          {
            'rid': '$rid',
            'position': RoomConstant.Queue_Display.toString(), //-2 申请任一空位
            'boss': isBoss ? '1' : '0',
            'auction': isAuction ? '1' : '0',
          },
          throwOnError: false);
      if (response.error != null) {
        Log.d(response.error.toString());
        return WaitMicUserListRsp(
            msg: response.error.toString(), success: false);
      }

      Map res = response.value();
      if (!(res['success'] ?? false)) {
        return WaitMicUserListRsp(msg: res['msg'], success: false);
      }
      try {
        WaitMicUserListRsp responseData = WaitMicUserListRsp.fromJson(res);
        return responseData;
      } catch (e) {
        return WaitMicUserListRsp(
            msg: R.array('xhr_error_type_array')[6], success: false);
      }
    } catch (e) {
      return WaitMicUserListRsp(msg: e.toString(), success: false);
    }
  }

  /// 取消排麦
  static Future<BaseResponse> quitWaitMic(int rid) async {
    if (rid == 0)
      return BaseResponse(
          msg: R.array('xhr_error_type_array')[6], success: false);

    String url = '${System.domain}room/queue?version=2';
    Map<String, String> post = {
      'rid': rid.toString(),
      'position': RoomConstant.Queue_Quite.toString(),
    };

    try {
      XhrResponse response = await Xhr.postJson(url, post, throwOnError: false);
      if (response.error != null) {
        return BaseResponse(msg: response.error.toString(), success: false);
      }

      Map res = response.value();
      if (!(res['success'] ?? false)) {
        return BaseResponse(msg: res['msg'], success: false);
      }
      try {
        BaseResponse responseData =
            BaseResponse.fromJson(res as Map<String, dynamic>);
        return responseData;
      } catch (e) {
        return BaseResponse(
            msg: R.array('xhr_error_type_array')[6], success: false);
      }
    } catch (e) {
      return BaseResponse(msg: e.toString(), success: false);
    }
  }

  /// 清空排麦列表
  static Future<BaseResponse> clearWaitMicList(int? rid) async {
    if (rid == null || rid == 0)
      return BaseResponse(
          msg: R.array('xhr_error_type_array')[6], success: false);

    String url = '${System.domain}room/clearQueue';
    Map<String, String> post = {
      'rid': rid.toString(),
    };

    try {
      XhrResponse response = await Xhr.postJson(url, post, throwOnError: false);
      if (response.error != null) {
        return BaseResponse(msg: response.error.toString(), success: false);
      }

      Map res = response.value();
      if (!(res['success'] ?? false)) {
        return BaseResponse(msg: res['msg'], success: false);
      }
      try {
        BaseResponse responseData =
            BaseResponse.fromJson(res as Map<String, dynamic>);
        return responseData;
      } catch (e) {
        return BaseResponse(
            msg: R.array('xhr_error_type_array')[6], success: false);
      }
    } catch (e) {
      return BaseResponse(msg: e.toString(), success: false);
    }
  }
}
