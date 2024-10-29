import 'package:shared/shared.dart';

/// 收藏室Api
class CollectionRoomApi {
  static const int pageSize = 24;

  /// 获取收藏室Tab列表
  static Future<ResExhibitTab> requestCollectionRoomTabs() async {
    try {
      final url = System.domain + ('go/yy/commodity/exhibitionTab');
      final response = await Xhr.get(url, headers: Xhr.globalHeaders, pb: true);
      return ResExhibitTab.fromBuffer(response.bodyBytes);
    } catch (e) {
      return ResExhibitTab(success: false, msg: e.toString());
    }
  }

  /// 获取物品等级列表
  /// [type] 物品类型，mounts - 座驾 , header - 头像框
  static Future<ResExhibitIndex> requestCollectionLevelList(
      {String type = 'mounts'}) async {
    try {
      final url = System.domain + ('go/yy/commodity/exhibitionIndex');
      Map<String, dynamic> params = {
        'type': type,
        'grade': '',
        'page': '1',
        "page_size": pageSize.toString()
      };
      final response = await Xhr.get(url,
          queryParameters: params, headers: Xhr.globalHeaders, pb: true);
      return ResExhibitIndex.fromBuffer(response.bodyBytes);
    } catch (e) {
      return ResExhibitIndex(success: false, msg: e.toString());
    }
  }

  /// 展开更多数据
  static Future<ResExhibitMore> requestMoreCollections(
      {required String type,
      required String level,
      int page = 2,
      int pageSize = pageSize}) async {
    try {
      final url = System.domain + ('go/yy/commodity/exhibitionMore');
      final response = await Xhr.get(url,
          queryParameters: {
            "type": type,
            "grade": level,
            "page": "$page",
            "page_size": "$pageSize",
          },
          headers: Xhr.globalHeaders,
          pb: true);
      return ResExhibitMore.fromBuffer(response.bodyBytes);
    } catch (e) {
      return ResExhibitMore(success: false, msg: e.toString());
    }
  }

  /// 对外展示/取消展示
  static Future<NormalNull> requestShowOutOrNot(
      {required int cid, required String level}) async {
    try {
      final url = System.domain + ('go/yy/commodity/exhibitionDisplay');
      final response = await Xhr.postPb(
          url,
          {
            'cid': "$cid",
            'grade': level,
          },
          headers: Xhr.globalHeaders);
      return NormalNull.fromBuffer(response.bodyBytes);
    } catch (e) {
      return NormalNull(success: false, msg: e.toString());
    }
  }

  /// 获取对外展示的收藏品数据
  static Future<ResExhibitRecommend> requestGetDisplayCollections() async {
    try {
      final url = System.domain + ('go/yy/commodity/exhibitionList');
      final response = await Xhr.get(url, headers: Xhr.globalHeaders, pb: true);
      return ResExhibitRecommend.fromBuffer(response.bodyBytes);
    } catch (e) {
      return ResExhibitRecommend(success: false, msg: e.toString());
    }
  }
}
