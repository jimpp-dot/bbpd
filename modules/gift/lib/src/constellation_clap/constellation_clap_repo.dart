import 'package:shared/shared.dart';
import 'package:gift/src/constellation_clap/pb/generated/zodiac.pb.dart';

class ConstellationClapRepo {
  static Future<ApiZodiacPopupResponse> mainDialog() async {
    try {
      String url = '${System.domain}go/yy/zodiac-pai/popInfo';
      final response = await Xhr.get(url, pb: true, throwOnError: true);
      ApiZodiacPopupResponse res =
          ApiZodiacPopupResponse.fromBuffer(response.bodyBytes);
      return res;
    } catch (e) {
      return ApiZodiacPopupResponse(success: false, message: e.toString());
    }
  }

  static Future<ApiZodiacPaiResultResponse> resultDialog(
      {int mission = 1}) async {
    try {
      String url =
          '${System.domain}go/yy/zodiac-pai/popResult?show_mission=$mission';
      final response = await Xhr.get(url, pb: true, throwOnError: true);
      ApiZodiacPaiResultResponse res =
          ApiZodiacPaiResultResponse.fromBuffer(response.bodyBytes);
      return res;
    } catch (e) {
      return ApiZodiacPaiResultResponse(success: false, message: e.toString());
    }
  }

  static Future<NormalNull> getAward(int id) async {
    String url = '${System.domain}go/yy/zodiac-pai/getAward';
    try {
      final response = await Xhr.post(url, {'mission_id': '$id'},
          pb: true, throwOnError: true);
      return NormalNull.fromBuffer(response.bodyBytes);
    } catch (e) {
      return NormalNull(success: false, msg: e.toString());
    }
  }

  static Future<NormalNull> setClickJump() async {
    String url = '${System.domain}go/yy/zodiac-pai/jump';
    try {
      final response = await Xhr.get(url, pb: true, throwOnError: true);
      return NormalNull.fromBuffer(response.bodyBytes);
    } catch (e) {
      return NormalNull(success: false, msg: e.toString());
    }
  }
}
