import 'package:shared/shared.dart';
import 'package:login/src/model/pb/generated/hisong_reg_config.pb.dart';
import 'package:login/src/model/pb/generated/share.pb.dart';

import 'package:login/src/profile/slp_complete_information.dart';

import '../model/pb/generated/near_gs_hi.pb.dart';

class Api {
  static Future<BaseResponse> postAccountProfile(
    String name,
    String sex,
    String birthday,
    String icon,
    String inviteCode, {
    bool needAutoInRoom = true,
  }) async {
    String url = '${System.domain}account/profile?version=6';
    Map<String, String> map = {
      'name': name ?? '',
      'sex': sex ?? '',
      'birthday': birthday ?? '',
      'icon': icon ?? '',
      'inviteCode': inviteCode ?? ''
    };
    try {
      XhrResponse response = await Xhr.postJson(url, map);
      BaseResponse baseResponse = BaseResponse.parse(response);
      if (baseResponse.success == true) {
        Map value = response.response as Map;
        await Session.setValues(value['data']);
        if (value['nameToast'] != null &&
            value['nameToast'] is String &&
            Util.validStr(value['nameToast'])) {
          Fluttertoast.showCenter(msg: value['nameToast']);
          await Future.delayed(const Duration(seconds: 2));
        }
        if (needAutoInRoom == true) {
          /// 注册流程之后，还有其他流程才进首页的，等其他流程走完再触发autoInRoom
          autoInRoom();
        }
      }
      return baseResponse;
    } catch (e) {
      return BaseResponse(msg: '$e', success: false);
    }
  }

  static Future<BaseResponse> autoInRoom() async {
    String url = '${System.domain}home/autoInRoom';
    try {
      XhrResponse response = await Xhr.getJson(url);
      BaseResponse baseResponse = BaseResponse.parse(response);
      if (baseResponse.success == true) {
        Map value = response.response as Map;
        int rid = value['data']['rid'] ?? 0;
        if (rid > 0) {
          Future.delayed(const Duration(seconds: 1), () {
            IRoomManager roomManager = ComponentManager.instance
                .getManager(ComponentManager.MANAGER_BASE_ROOM);
            roomManager.openChatRoomScreenShow(System.context, rid,
                refer: 'home_autoInRoom');
          });
        }
      }
      return baseResponse;
    } catch (e) {
      return BaseResponse(msg: '$e', success: false);
    }
  }

  static Future<BaseResponse> postFilterNameIcon(
      String name, String icon) async {
    String url = '${System.domain}account/filterNameIcon';
    Map<String, String> map = {
      'name': name ?? '',
      'icon': icon ?? '',
    };
    try {
      XhrResponse response = await Xhr.postJson(url, map);
      BaseResponse baseResponse = BaseResponse.parse(response);
      return baseResponse;
    } catch (e) {
      return BaseResponse(msg: '$e', success: false);
    }
  }

  static Future<ResHiSongRegConfig> getHiSongPlaceholderData() async {
    try {
      XhrResponse response = await Xhr.get('go/hisong/account/regConfig',
          throwOnError: true, pb: true);
      return ResHiSongRegConfig.fromBuffer(response.bodyBytes);
    } catch (e) {
      return ResHiSongRegConfig(msg: e.toString(), success: false);
    }
  }

  /// 选择未满18岁，封禁账号
  static void underEighteen() async {
    String url = '${System.domain}account/underEighteen';
    try {
      await Xhr.postJson(url, {});
    } catch (e) {}
  }

  /// 获取注册流程的方式
  static Future<RegType> getRegConfig() async {
    String url = '${System.domain}account/regConfig';
    try {
      XhrResponse response = await Xhr.postJson(url, null, throwOnError: true);
      Map data = response.value();
      if (data['success'] == true &&
          data['data'] != null &&
          data['data'] is Map) {
        return RegType.fromJson(data['data']);
      }
    } catch (e) {
      Log.d('$e');
    }

    return RegType(easyMode: false);
  }

  static Future<RespShare> killerShareInfo(String tp, int vid, int uid) async {
    try {
      String url = '${System.domain}go/games/share/index';
      Map<String, String> params = {
        'tp': tp,
        'vid': '$vid',
        'uid': '$uid',
      };
      XhrResponse response = await Xhr.post(url, params, pb: true);
      return RespShare.fromBuffer(response.bodyBytes);
    } catch (e) {
      return RespShare(msg: e.toString(), success: false);
    }
  }

  /// 一键关注/打招呼GS
  static Future<NormalNull> followNearGs(int uid) async {
    try {
      String url = '${System.domain}go/yy/gs/sayHi';
      Map<String, String> params = {
        'gs': '$uid',
      };
      XhrResponse response =
          await Xhr.post(url, params, pb: true, throwOnError: true);
      return NormalNull.fromBuffer(response.bodyBytes);
    } catch (e) {
      Fluttertoast.toastException(exp: e);
      return NormalNull(msg: '', success: false);
    }
  }

  /// 获取GS列表
  static Future<ResNearGsHi> getNearGs() async {
    try {
      String url = '${System.domain}go/yy/gs/nearGs';
      XhrResponse response = await Xhr.get(url, pb: true, throwOnError: true);
      return ResNearGsHi.fromBuffer(response.bodyBytes);
    } catch (e) {
      return ResNearGsHi(msg: e.toString(), success: false);
    }
  }

  /// 获取邀请码绑定的用户
  static Future<DataRsp<String>> getBindingUser(String code) async {
    try {
      String url = '${System.domain}go/yy/account/getUserBrief?uid=$code';
      XhrResponse response =
          await Xhr.getJson(url, formatJson: true, throwOnError: true);
      DataRsp<Map> resp =
          DataRsp<Map>.fromXhrResponse(response, (object) => object as Map);
      String name = Util.parseStr(resp.data?['name']) ?? '';
      return DataRsp<String>(success: true, data: name);
    } catch (e) {
      return DataRsp<String>(success: false, msg: e.toString());
    }
  }
}
