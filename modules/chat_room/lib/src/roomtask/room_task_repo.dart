import 'package:shared/shared.dart';
import 'package:chat_room/src/roomtask/model/room_business_task.dart';
import 'package:chat_room/src/roomtask/model/room_task.dart';

class RoomTaskInfoRepo {
  static Future<RoomTaskInfoRsp> getRoomTaskInfo(int rid) async {
    String url = '${System.domain}roomexp/info/v2?rid=$rid';
    try {
      XhrResponse response = await Xhr.getJson(url, throwOnError: false);
      if (response.error != null) {
        Log.d(response.error.toString());
        return RoomTaskInfoRsp(msg: response.error.toString(), success: false);
      }

      Map res = response.response as Map;
      Log.i(tag: "room_task", "getRoomTaskInfo result: $res");
      if (!(res['success'] ?? false)) {
        return RoomTaskInfoRsp(msg: Util.parseStr(res['msg']), success: false);
      }
      try {
        RoomTaskInfoRsp responseData =
            RoomTaskInfoRsp.fromJson(res as Map<String, dynamic>);

        return responseData;
      } catch (e) {
        return RoomTaskInfoRsp(
            msg: R.array('xhr_error_type_array')[6], success: false);
      }
    } catch (e) {
      return RoomTaskInfoRsp(msg: e.toString(), success: false);
    }
  }

  static Future getBusinessRoomTaskInfo(int rid, int uid) async {
    String url = '${System.domain}roompoint/benefitInfo';
    try {
      XhrResponse response = await Xhr.getJson(url,
          params: {'rid': rid, 'uid': uid, 'package': Constant.packageName},
          throwOnError: false);
      if (response.error != null) {
        return response.error.toString();
      }

      Map res = response.response as Map;
      if (!(res['success'] ?? false)) {
        return Util.parseStr(res['msg']);
      }
      try {
        RoomBusinessTaskInfo responseData =
            RoomBusinessTaskInfo.fromJson(res['data']);
        return responseData;
      } catch (e) {
        return R.array('xhr_error_type_array')[6];
      }
    } catch (e) {
      return e.toString();
    }
  }

  static Future<RoomTaskExpInfo?> getRoomTaskExpInfo(int rid, int uid) async {
    String url = '${System.domain}roomexp/taskinfo';
    try {
      XhrResponse response = await Xhr.getJson(url,
          params: {'rid': rid, 'uid': uid, 'package': Constant.packageName},
          throwOnError: false);

      Map res = response.response as Map;
      Map data = res['data'];
      RoomTaskExpInfo responseData =
          RoomTaskExpInfo.fromJson(data as Map<String, dynamic>);
      return responseData;
    } catch (e) {
      Log.d(e);
      return null;
    }
  }

  static Future<BaseResponse> roomTaskSignin(int rid) async {
    String url = '${System.domain}roomexp/sign?rid=$rid';
    try {
      XhrResponse response = await Xhr.getJson(url, throwOnError: false);
      if (response.error != null) {
        Log.d(response.error.toString());
        return BaseResponse(msg: response.error.toString(), success: false);
      }

      Map res = response.response as Map;
      if (!(res['success'] ?? false)) {
        return BaseResponse(msg: Util.parseStr(res['msg']), success: false);
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
