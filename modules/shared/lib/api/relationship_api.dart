import 'package:shared/shared.dart';

import '../src/pbModel/generated/api_relation.pb.dart';

class RelationshipApi {
  static Future<ResFriendFamiliar> getFamiliarDataPb() async {
    String url = '${System.domain}go/yy/friend/familiar';
    XhrResponse response = await Xhr.get(url, pb: true, throwOnError: false);
    try {
      ResFriendFamiliar data = ResFriendFamiliar.fromBuffer(response.bodyBytes);
      Log.d(
          'getFamiliarDataPb data success = ${data.success} and msg = ${data.msg}');
      Log.d('getFamiliarDataPb data success = ${data.data.familiar}');
      Log.d('getFamiliarDataPb data success = ${data.data.tmpgroup}');
      if (data.success) {
        Config.set("${Session.uid}.message.familiar",
            Util.jsonEncode(data.data.familiar));
        Config.set("${Session.uid}.message.tempgroup",
            Util.jsonEncode(data.data.tmpgroup));
      }
      return data;
    } catch (e) {
      Log.d('getFamiliarDataPb error = $e');
      return ResFriendFamiliar(msg: e.toString(), success: false);
    }
  }

  static Future<ResFamiliar> syncFamiliar(
      {int maxId = 0, bool group = false}) async {
    try {
      String url =
          '${System.domain}go/yy/relation/${group ? 'imGroupFamiliar' : 'imUserFamiliar'}';
      XhrResponse response =
          await Xhr.get('$url?id=$maxId', pb: true, throwOnError: true);
      return ResFamiliar.fromBuffer(response.bodyBytes);
    } catch (e) {
      Log.d('syncFamiliar error = $e');
      return ResFamiliar(msg: e.toString(), success: false);
    }
  }

  static Future<ResImFamiliarGs> getGsIds() async {
    try {
      String url = '${System.domain}go/yy/relation/imWhiteFamiliar';
      XhrResponse response = await Xhr.get(url, pb: true, throwOnError: true);
      return ResImFamiliarGs.fromBuffer(response.bodyBytes);
    } catch (e) {
      Log.d('getGsIds error = $e');
      return ResImFamiliarGs(msg: e.toString(), success: false);
    }
  }

  static Future<ResFriendsNum> getFriendsNum() async {
    XhrResponse response = await Xhr.get(
        "${System.domain}go/yy/friend/nums?version=1",
        pb: true,
        throwOnError: false);
    try {
      ResFriendsNum data = ResFriendsNum.fromBuffer(response.bodyBytes);
      Log.d(
          'getFriendsNum data success = ${data.success} and msg = ${data.msg}');
      return data;
    } catch (e) {
      Log.d('getFriendsNum error = $e');
      return ResFriendsNum(msg: e.toString(), success: false);
    }
  }

  static Future<ResFriendKASteward> getFriendsSteward() async {
    String url = '${System.domain}go/yy/friend/steward';
    try {
      XhrResponse response = await Xhr.get(url, pb: true, throwOnError: true);
      ResFriendKASteward data =
          ResFriendKASteward.fromBuffer(response.bodyBytes);
      return data;
    } catch (e) {
      return ResFriendKASteward(success: false, message: e.toString());
    }
  }
}
