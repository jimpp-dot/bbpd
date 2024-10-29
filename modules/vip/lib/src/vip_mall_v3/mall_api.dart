import 'package:shared/shared.dart';

import '../pb/generated/slp_shop_resp.pb.dart';
import '../pb/generated/store.pb.dart';

class MallApi {
  /// 商城首页分类
  static Future<ShopCateListResp> getMallTabs() async {
    String url = '${System.domain}go/yy/shop/cateList';
    Map<String, String> params = {};
    try {
      XhrResponse response = await Xhr.post(url, params, pb: true);
      return ShopCateListResp.fromBuffer(response.bodyBytes);
    } catch (e) {
      return ShopCateListResp(msg: e.toString(), success: false);
    }
  }

  /// 首页热门
  static Future<ShopIndexResp> getHot() async {
    String url = '${System.domain}go/yy/shop/index';
    Map<String, String> params = {};
    try {
      XhrResponse response = await Xhr.post(url, params, pb: true);
      return ShopIndexResp.fromBuffer(response.bodyBytes);
    } catch (e) {
      return ShopIndexResp(msg: e.toString(), success: false);
    }
  }

  /// 礼包详情
  static Future<ShopBagDetailResp> getBags(int bagId) async {
    String url = '${System.domain}go/yy/shop/bagDetail';
    Map<String, String> params = {"bag_id": "$bagId"};
    try {
      XhrResponse response = await Xhr.post(url, params, pb: true);
      return ShopBagDetailResp.fromBuffer(response.bodyBytes);
    } catch (e) {
      return ShopBagDetailResp(msg: e.toString(), success: false);
    }
  }

  /// 福袋列表
  static Future<ShopBagListResp> getBagList(int bagType) async {
    String url = '${System.domain}go/yy/shop/bagList';
    Map<String, String> params = {"bag_type": "$bagType"};
    try {
      XhrResponse response = await Xhr.post(url, params, pb: true);
      return ShopBagListResp.fromBuffer(response.bodyBytes);
    } catch (e) {
      return ShopBagListResp(msg: e.toString(), success: false);
    }
  }

  /// 首页其它tab
  static Future<ApiStorePageResponse> getStorePageData(String page,
      {Map<String, String>? extra}) async {
    String url = '${System.domain}go/yy/store/page';
    if (extra == null) {
      extra = {'page': page};
    } else {
      extra['page'] = page;
    }
    try {
      XhrResponse response = await Xhr.postPb(url, extra);
      return ApiStorePageResponse.fromBuffer(response.bodyBytes);
    } catch (e) {
      return ApiStorePageResponse(success: false, message: e.toString());
    }
  }

  /// 藏品拥有者
  static Future<GetPayUserListResp> getCollectionOwnerData(int bagId) async {
    String url = '${System.domain}go/yy/shop/getPayUserList';
    try {
      XhrResponse response =
          await Xhr.postPb(url, {'bag_id': bagId.toString()});
      GetPayUserListResp resp =
          GetPayUserListResp.fromBuffer(response.bodyBytes);
      return resp;
    } catch (e) {
      return GetPayUserListResp(success: false, msg: e.toString());
    }
  }

  /// 藏品弹窗中通过cid获取物品详情
  static Future<DataRsp<Map<String, dynamic>>> getCollectionCommodityInfo(
      String cidString) async {
    String url =
        '${System.domain}commodity/batchBuying?version=4&cids=$cidString';
    try {
      XhrResponse response = await Xhr.getJson(url);
      if (response.error == null) {
        Map res = response.value() as Map<String, dynamic>;
        if (res['success'] == true) {
          DataRsp<Map<String, dynamic>> resp = DataRsp<Map<String, dynamic>>(
              msg: '', success: true, data: res['data']);
          return resp;
        }
        return DataRsp<Map<String, dynamic>>(msg: res['msg'], success: false);
      }
      return DataRsp<Map<String, dynamic>>(
          msg: response.error.toString(), success: false);
    } catch (e) {
      return DataRsp<Map<String, dynamic>>(msg: e.toString(), success: false);
    }
  }

  /// 积分兑换页面
  static Future<GetCreditGoodsIndexResp> getCreditList() async {
    String url = '${System.domain}go/yy/shop/getLightGoodsIndex';
    try {
      XhrResponse response = await Xhr.postPb(url, {});
      GetCreditGoodsIndexResp resp =
          GetCreditGoodsIndexResp.fromBuffer(response.bodyBytes);
      return resp;
    } catch (e) {
      return GetCreditGoodsIndexResp(success: false, msg: e.toString());
    }
  }

  /// 积分兑换记录
  static Future<GetExchangeListResp> getCreditHistory() async {
    String url = '${System.domain}go/yy/shop/getExchangeList';
    try {
      XhrResponse response = await Xhr.postPb(url, {});
      GetExchangeListResp resp =
          GetExchangeListResp.fromBuffer(response.bodyBytes);
      return resp;
    } catch (e) {
      return GetExchangeListResp(success: false, msg: e.toString());
    }
  }

  /// 提交装扮定制
  static Future<SubmitCustomApplyResp> submitCustomApply(int cid, int money,
      int score, String name, String desc, String img) async {
    String url = '${System.domain}go/yy/shop/submitCustomApply';
    try {
      XhrResponse response = await Xhr.postPb(url, {
        "id": "$cid",
        "money": "$money",
        "pay_score": "$score",
        "name": name,
        "g_desc": desc,
        "img": img
      });
      SubmitCustomApplyResp resp =
          SubmitCustomApplyResp.fromBuffer(response.bodyBytes);
      return resp;
    } catch (e) {
      return SubmitCustomApplyResp(success: false, msg: e.toString());
    }
  }
}
