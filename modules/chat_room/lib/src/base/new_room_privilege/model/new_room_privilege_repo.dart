import 'package:shared/shared.dart';

import 'generated/privilege_rookie.pb.dart';

class NewRoomPrivilegeRepo {
  /// /go/room/privilege/config [get] req:rid ,resp :pb.ApiRookiePrivilegeResponse
  static Future<ApiRookiePrivilegeResponse> privilegeConfig(int rid) async {
    try {
      XhrResponse response = await Xhr.get(
        '${System.domain}go/room/privilege/config?rid=$rid',
        pb: true,
        throwOnError: true,
      );
      return ApiRookiePrivilegeResponse.fromBuffer(response.bodyBytes);
    } catch (e) {
      return ApiRookiePrivilegeResponse(success: false, message: e.toString());
    }
  }

  /// /go/room/privilege/use [post] req:rid,privilege_id,targets resp:pb.NormallNull
  static Future<NormalNull> privilegeUse(
      int rid, int privilegeId, String targets) async {
    try {
      XhrResponse response = await Xhr.post(
        '${System.domain}go/room/privilege/use',
        {
          'rid': rid.toString(),
          'pid': privilegeId.toString(),
          'targets': targets
        },
        pb: true,
      );
      return NormalNull.fromBuffer(response.bodyBytes);
    } catch (e) {
      return NormalNull(success: false, msg: e.toString());
    }
  }
}
