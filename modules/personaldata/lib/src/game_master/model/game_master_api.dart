import 'package:shared/shared.dart';

import 'pb/generated/slp_godcard.pb.dart';

class GameMasterAPI {
  /// 主播卡卡片列表接口
  static Future<ResGodCardList> getGameCardListRes(int vuid) async {
    String url = '${System.domain}go/yy/godcard/godCardList/';
    try {
      XhrResponse response = await Xhr.get(url,
          queryParameters: {'vuid': vuid}, pb: true, throwOnError: true);
      return ResGodCardList.fromBuffer(response.bodyBytes);
    } catch (e) {
      return ResGodCardList(msg: e.toString(), success: false);
    }
  }

  /// 主播卡任务接口
  static Future<ResGodLevelProgress> getMissionRes() async {
    String url = '${System.domain}go/yy/godcard/godLevelProgress';
    try {
      XhrResponse response = await Xhr.get(url, pb: true, throwOnError: true);
      return ResGodLevelProgress.fromBuffer(response.bodyBytes);
    } catch (e) {
      return ResGodLevelProgress(msg: e.toString(), success: false);
    }
  }

  /// 主播卡推荐主播接口
  static Future<ResRecommendGodList> getRecommendMastertRes(int page) async {
    String url = '${System.domain}go/yy/godcard/godCardRecommendList/';
    try {
      XhrResponse response = await Xhr.get(url,
          queryParameters: {'page': page, 'limit': 20},
          pb: true,
          throwOnError: true);
      return ResRecommendGodList.fromBuffer(response.bodyBytes);
    } catch (e) {
      return ResRecommendGodList(msg: e.toString(), success: false);
    }
  }

  /// 主播卡游戏分类接口
  static Future<ResGodCardCategory> getGameCategoryRes() async {
    String url = '${System.domain}go/yy/godcard/category/';
    try {
      XhrResponse response = await Xhr.get(url, pb: true, throwOnError: true);
      return ResGodCardCategory.fromBuffer(response.bodyBytes);
    } catch (e) {
      return ResGodCardCategory(msg: e.toString(), success: false);
    }
  }

  /// 主播卡单个游戏属性接口
  static Future<ResGodCardCategoryDetail> getGameProperties(int gameId) async {
    String url = '${System.domain}go/yy/godcard/categoryDetail/';
    try {
      XhrResponse response = await Xhr.get(url,
          queryParameters: {'cate_id': gameId}, pb: true, throwOnError: true);
      return ResGodCardCategoryDetail.fromBuffer(response.bodyBytes);
    } catch (e) {
      return ResGodCardCategoryDetail(msg: e.toString(), success: false);
    }
  }

  /// 主播卡保存游戏卡片
  static Future<ResGodCardCategoryDetail> submitGameProperties(
      int gameId, Map<int, String> properties) async {
    String url = '${System.domain}go/yy/godcard/categoryDetailSubmit/';
    String propertiesString = '';
    properties.forEach((key, value) {
      propertiesString += '$key:$value,';
    });
    if (propertiesString.isNotEmpty) {
      propertiesString =
          propertiesString.substring(0, propertiesString.length - 1);
    }
    try {
      XhrResponse response = await Xhr.post(
          url, {'cate_id': gameId.toString(), 'subcate': propertiesString},
          pb: true, throwOnError: true);
      return ResGodCardCategoryDetail.fromBuffer(response.bodyBytes);
    } catch (e) {
      return ResGodCardCategoryDetail(msg: e.toString(), success: false);
    }
  }

  /// 主播卡删除游戏卡片
  static Future<ResGodCardList> deleteGameMasterCardRes(int gameId) async {
    String url = '${System.domain}go/yy/godcard/godCardDel/';
    try {
      XhrResponse response = await Xhr.post(url, {'cate_id': gameId.toString()},
          pb: true, throwOnError: true);
      return ResGodCardList.fromBuffer(response.bodyBytes);
    } catch (e) {
      return ResGodCardList(msg: e.toString(), success: false);
    }
  }
}
