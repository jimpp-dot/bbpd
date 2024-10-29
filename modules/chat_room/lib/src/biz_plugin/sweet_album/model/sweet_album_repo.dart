import 'package:shared/shared.dart';
import 'package:chat_room/src/biz_plugin/sweet_album/pb/generated/sweet_album.pb.dart';

class SweetAlbumRepo {
  static Future<ApiSweetAlbumHomeResponse> panelData(int uid, int rid) async {
    try {
      String url = '${System.domain}go/yy/sweet-album/home?uid=$uid&rid=$rid';
      final response = await Xhr.get(url, pb: true, throwOnError: true);
      ApiSweetAlbumHomeResponse res =
          ApiSweetAlbumHomeResponse.fromBuffer(response.bodyBytes);
      return res;
    } catch (e) {
      return ApiSweetAlbumHomeResponse(success: false, message: e.toString());
    }
  }

  static Future<ApiSweetAlbumPageResponse> pageData(int uid, int rid) async {
    try {
      String url = '${System.domain}go/yy/sweet-album/page?uid=$uid&rid=$rid';
      final response = await Xhr.get(url, pb: true, throwOnError: true);
      ApiSweetAlbumPageResponse res =
          ApiSweetAlbumPageResponse.fromBuffer(response.bodyBytes);
      return res;
    } catch (e) {
      return ApiSweetAlbumPageResponse(success: false, message: e.toString());
    }
  }

  static Future<ApiSweetAlbumCompanionListResponse> companionList(
      int page, int rid) async {
    String url =
        '${System.domain}go/yy/sweet-album/companionList?page=$page&rid=$rid';
    try {
      final response = await Xhr.get(url, pb: true, throwOnError: true);
      ApiSweetAlbumCompanionListResponse history =
          ApiSweetAlbumCompanionListResponse.fromBuffer(response.bodyBytes);
      return history;
    } catch (e) {
      return ApiSweetAlbumCompanionListResponse(
          success: false, message: e.toString());
    }
  }
}
