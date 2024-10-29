import 'package:shared/shared.dart';

class HomeRepository {
  static Future<Map> matchRoom(String key, {int quick = 0}) async {
    IRoomManager roomManager = ComponentManager.instance
        .getManager(ComponentManager.MANAGER_BASE_ROOM);
    String url =
        "${System.domain}match/match?version=8&room_version=${roomManager.getRoomVersionParaValue()}";
    Map<String, String> params = {
      'key': key,
      'quick': quick == 1 ? '1' : '0',
    };
    Map<String, dynamic> result = {};
    try {
      XhrResponse response =
          await Xhr.postJson(url, params, throwOnError: true);
      Map data = response.value();
      if (data['success'] == true) {
        result = data['data'] ?? {};
      } else {
        Fluttertoast.showToast(msg: data['msg'], gravity: ToastGravity.CENTER);
      }
    } catch (e) {
      Log.d('Request $url with error: ${e.toString()}');
      Fluttertoast.toastException(exp: e);
    }
    return result;
  }
}
