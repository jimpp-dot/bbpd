import 'package:shared/shared.dart';

class QualifyingApi {
  /// PK战绩
  static Future<ApiRoomCrossPkExploitsListResponse> getPKRecordList(int uid,
      {int page = 1, int type = 0}) async {
    String url = "${System.domain}go/room/games/crosspk/exploits";
    try {
      XhrResponse response = await Xhr.get(url,
          queryParameters: {'page': page, 'uid': uid, 'type': type}, pb: true);
      return ApiRoomCrossPkExploitsListResponse.fromBuffer(response.bodyBytes);
    } catch (e) {
      return ApiRoomCrossPkExploitsListResponse(
          success: false, message: e.toString());
    }
  }
}
