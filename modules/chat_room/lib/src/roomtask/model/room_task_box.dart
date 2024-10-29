import 'package:shared/shared.dart';
import 'package:json_annotation/json_annotation.dart';

part 'room_task_box.g.dart';

@JsonSerializable(createToJson: false)
class BoxGiftList {
  /// 礼物名称
  @JsonKey(name: 'gift_name', fromJson: Util.notNullStr)
  final String giftName;

  /// 礼物icon
  @JsonKey(name: 'gift_icon', fromJson: Util.notNullStr)
  final String giftIcon;

  /// 礼物数量
  @JsonKey(name: 'gift_num', fromJson: Util.parseInt)
  final int giftNum;

  BoxGiftList(this.giftName, this.giftIcon, this.giftNum);

  static BoxGiftList fromJson(r) {
    return _$BoxGiftListFromJson(r);
  }

  String get imageURL {
    if (giftIcon.contains('http')) return giftIcon;

    return '${System.imageDomain}$giftIcon';
  }
}

@JsonSerializable(createToJson: false)
class OpenBoxResult {
  /// 打开宝箱是否成功的状态码。1：打开失败（任务还没有完成，不能打开宝箱），
  /// 2：打开失败（“您今日已开启5个房间任务宝箱啦，明天再来吧～”）3：打开失败（“该房间包厢已经打开过啦，明天再来吧～”）,
  /// 4、没有抽到，0、抽奖成功
  @JsonKey(name: 'open_success', fromJson: Util.parseInt)
  final int openSuccess;
  final String? msg;

  /// 成功打开宝箱后的抽奖结果
  final BoxGiftList? result;

  OpenBoxResult(this.openSuccess, this.msg, this.result);

  static OpenBoxResult fromJson(r) {
    return _$OpenBoxResultFromJson(r);
  }
}

class RoomTaskBoxRepo {
  static Future getPersonalBoxList(int rid, int uid) async {
    String url = '${System.domain}roomexp/boxgiftlist';
    try {
      XhrResponse response = await Xhr.getJson(url,
          params: {'rid': rid, 'uid': uid, 'package': Constant.packageName},
          throwOnError: false);
      if (response.error != null) {
        return response.error.toString();
      }

      Map res = response.response as Map;
      if (!(res['success'] ?? false)) {
        return res['msg'];
      }
      try {
        List responseList = res['data']['gift_list'];
        List<BoxGiftList> giftList =
            responseList.map((e) => BoxGiftList.fromJson(e)).toList();
        return giftList;
      } catch (e) {
        return R.array('xhr_error_type_array')[6];
      }
    } catch (e) {
      return e.toString();
    }
  }

  static Future personalBoxOpen(int rid, int uid) async {
    String url = '${System.domain}roomexp/openboxgift';
    try {
      XhrResponse response = await Xhr.postJson(
          url,
          {
            'rid': rid.toString(),
            'uid': uid.toString(),
            'package': Constant.packageName
          },
          throwOnError: false);
      if (response.error != null) {
        return response.error.toString();
      }

      Map res = response.response as Map;
      if (!(res['success'] ?? false)) {
        return res['msg'];
      }
      try {
        OpenBoxResult responseData = OpenBoxResult.fromJson(res['data']);
        return responseData;
      } catch (e) {
        return R.array('xhr_error_type_array')[6];
      }
    } catch (e) {
      return e.toString();
    }
  }

  static Future getBusinessBoxList(int rid, int uid, int level) async {
    String url = '${System.domain}roompoint/boxgiftlist';
    try {
      XhrResponse response = await Xhr.getJson(url,
          params: {
            'rid': rid,
            'uid': uid,
            'package': Constant.packageName,
            'box_level': level
          },
          throwOnError: false);
      if (response.error != null) {
        return response.error.toString();
      }

      Map res = response.response as Map;
      if (!(res['success'] ?? false)) {
        return res['msg'];
      }
      try {
        List responseList = res['data']['gift_list'];
        List<BoxGiftList> giftList =
            responseList.map((e) => BoxGiftList.fromJson(e)).toList();
        return giftList;
      } catch (e) {
        return R.array('xhr_error_type_array')[6];
      }
    } catch (e) {
      return e.toString();
    }
  }

  static Future businessBoxOpen(int rid, int uid, int level) async {
    String url = '${System.domain}roompoint/openboxgift';
    try {
      XhrResponse response = await Xhr.postJson(
          url,
          {
            'rid': rid.toString(),
            'uid': uid.toString(),
            'package': Constant.packageName,
            'box_level': level.toString(),
          },
          throwOnError: false);
      if (response.error != null) {
        return response.error.toString();
      }

      Map res = response.response as Map;
      if (!(res['success'] ?? false)) {
        return res['msg'];
      }
      try {
        OpenBoxResult responseData = OpenBoxResult.fromJson(res['data']);
        return responseData;
      } catch (e) {
        return R.array('xhr_error_type_array')[6];
      }
    } catch (e) {
      return e.toString();
    }
  }
}
