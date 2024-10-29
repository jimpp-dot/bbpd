import 'package:chat_room/chat_room.dart';
import 'package:chat_room/src/base/model/option_beans.dart';
import 'package:chat_room/src/base/page/roomModifyScreen.dart';
import 'package:shared/shared.dart';

class RoomOptionsRepo {
  /// 13：房设置增加间歌友会会长房主邀请成员入会入口
  /// 14：房间设置里面新增房间门票
  /// 15：大哥房（my_house_room）
  static const int OPTION_INDEX_VERSION = 15;

  static Future<OptionsResp> getRoomOptions(int rid, int partyStyle) async {
    try {
      XhrResponse response = await Xhr.getJson(
        "${System.domain}option/index?rid=$rid&version=${RoomModifyScreen.INFO_VERSION}&option_index_version=$OPTION_INDEX_VERSION&use_party_style=$partyStyle",
      );
      if (response.error != null) {
        Log.d(response.error.toString());
        return OptionsResp(msg: response.error.toString(), success: false);
      }

      Map res = response.value();
      if (!(res['success'] ?? false)) {
        return OptionsResp(msg: res['msg'], success: false);
      }
      try {
        OptionsResp responseData = OptionsResp.fromJson(res as Map<String, dynamic>);
        return responseData;
      } catch (e) {
        Log.d("getFansGroupTaskInfo and e msg = ${e.toString()}");

        return OptionsResp(msg: R.array('xhr_error_type_array')[6], success: false);
      }
    } catch (e) {
      return OptionsResp(msg: e.toString(), success: false);
    }
  }

  ///设置项保存
  static Future<BaseResponse> optionsSave(int rid, Map<String, String> params) async {
    try {
      String url =
          '${System.domain}option/save?rid=$rid&version=${RoomConstant.optionSaveVersion}&room_version=${RoomConstant.roomVersion}';
      XhrResponse response = await Xhr.postJson(url, params, throwOnError: false);
      Map data = response.value();
      BaseResponse baseResponse = BaseResponse.fromJson(data as Map<String, dynamic>);
      return baseResponse;
    } catch (e) {
      return BaseResponse(msg: e.toString(), success: false);
    }
  }

  ///保存房间封面
  static void saveRoomCover(int rid, String cover) async {
    String url = '${System.domain}go/mate/room/editCover';
    try {
      XhrResponse response = await Xhr.post(url, {'rid': '$rid', 'room_cover': cover}, formatJson: true, throwOnError: true);
      BaseResponse rsp = BaseResponse.fromJson(response.value() as Map<String, dynamic>);
      if (!(rsp.success == true)) {
        Fluttertoast.showToast(msg: rsp.msg);
      }
    } catch (e) {
      Fluttertoast.showToast(msg: '$e');
    }
  }
}
