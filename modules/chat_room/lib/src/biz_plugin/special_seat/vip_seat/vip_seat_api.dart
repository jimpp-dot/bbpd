import 'package:shared/shared.dart';

class VipSeatRepo {
  static Future<ApiVipMicConfigResponse> getVipSeatDetail(int rid) async {
    String url = '${System.domain}go/room/vipmic/config';
    try {
      XhrResponse response = await Xhr.postPb(url, {'rid': '$rid'});
      return ApiVipMicConfigResponse.fromBuffer(response.bodyBytes);
    } catch (e) {
      return ApiVipMicConfigResponse(message: e.toString(), success: false);
    }
  }

  static Future<ApiVipMicSimpleResponse> getVipSeat(int rid) async {
    String url = '${System.domain}go/room/vipmic/simple';
    try {
      XhrResponse response = await Xhr.postPb(url, {'rid': '$rid'});
      return ApiVipMicSimpleResponse.fromBuffer(response.bodyBytes);
    } catch (e) {
      return ApiVipMicSimpleResponse(message: e.toString(), success: false);
    }
  }

  static Future<ApiVipMicCPInfoResponse> getCpSeat(int rid) async {
    String url = '${System.domain}go/room/vipmic/cpInfo';
    try {
      XhrResponse response =
          await Xhr.postPb(url, {'rid': '$rid'}, throwOnError: true);
      return ApiVipMicCPInfoResponse.fromBuffer(response.bodyBytes);
    } catch (e) {
      return ApiVipMicCPInfoResponse(message: e.toString(), success: false);
    }
  }
}
