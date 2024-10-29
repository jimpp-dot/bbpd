import 'package:shared/shared.dart';
import 'package:vip/src/bag/model/pb/generated/killer_exchange.pb.dart';

import 'model/bag_bean.dart';
import 'model/union_box_detail_bean.dart';

/// 背包相关API
class BagApi {
  /// 用户背包tab list
  static Future<DataRsp<List<BagTab>>> getBagTab() async {
    try {
      XhrResponse response = await Xhr.getJson('${System.domain}commodity/tab?version=2');
      return DataRsp<List<BagTab>>.fromXhrResponse(
        response,
        (object) => Util.parseList(object, (e) => BagTab.fromJson(e)),
      );
    } catch (e) {
      return DataRsp<List<BagTab>>(msg: R.array('xhr_error_type_array')[6], success: false);
    }
  }

  /// 用户背包页面 商品列表
  ///
  static Future<DataRsp<List<BagGoods>>> getBagCommodityList(String type) async {
    try {
      XhrResponse response = await Xhr.getJson('${System.domain}commodity/userList?version=3&type=$type');
      return DataRsp<List<BagGoods>>.fromXhrResponse(
        response,
        (object) => Util.parseList(object, (e) => BagGoods.fromJson(e)),
      );
    } catch (e) {
      return DataRsp<List<BagGoods>>(msg: R.array('xhr_error_type_array')[6], success: false);
    }
  }

  /// 背包物品详情
  /// [id] 背包物品id
  /// [type] 物品类型
  static Future<DataRsp<BagGoods>> getBagGoodsDetail(int id, String type) async {
    String url = '${System.domain}commodity/panel?id=$id';
    try {
      XhrResponse response = await Xhr.getJson(url);
      return DataRsp<BagGoods>.fromXhrResponse(
        response,
        (object) => BagGoods.fromJson(object as Map<String, dynamic>),
      );
    } catch (e) {
      return DataRsp<BagGoods>(msg: R.array('xhr_error_type_array')[6], success: false);
    }
  }

  /// 背包靓号卡详情
  /// [id] 背包物品id
  /// [type] 物品类型
  static Future<DataRsp<BagGoods>> getPrettyCardInfo(int id, int cid, {String? type}) async {
    String url = '${System.domain}go/mate/commodity/cpPrettyInfo?id=$id&cid=$cid';
    if (!Util.isNullOrEmpty(type)) {
      url += '&type=$type';
    }
    try {
      XhrResponse response = await Xhr.getJson(url, formatJson: true);
      return DataRsp<BagGoods>.fromXhrResponse(
        response,
        (object) => BagGoods.fromJson(object as Map<String, dynamic>),
      );
    } catch (e) {
      return DataRsp<BagGoods>(msg: R.array('xhr_error_type_array')[6], success: false);
    }
  }

  /// 使用靓号卡
  static Future<DataRsp> usePrettyCard(int id, int prettyId) async {
    String url = '${System.domain}go/mate/commodity/useCpPretty';

    try {
      XhrResponse response = await Xhr.postJson(
        url,
        {
          'id': '$id',
          'pretty_id': '$prettyId',
        },
        formatJson: true,
      );
      return DataRsp.fromXhrResponse(response, null);
    } catch (e) {
      return DataRsp(msg: R.array('xhr_error_type_array')[6], success: false);
    }
  }

  static Future<DataRsp> sendPrettyCard(int id, int prettyId, int targetUid) async {
    String url = '${System.domain}go/mate/commodity/sendCpPretty';

    try {
      XhrResponse response = await Xhr.postJson(
        url,
        {
          'id': '$id',
          'pretty_id': '$prettyId',
          'target_uid': '$targetUid',
        },
        formatJson: true,
      );
      return DataRsp.fromXhrResponse(response, null);
    } catch (e) {
      return DataRsp(msg: R.array('xhr_error_type_array')[6], success: false);
    }
  }

  /// 联盟宝箱详情 [cid] 背包物品cid
  static Future<UnionBoxDetailBean> getBoxDetail(int cid) async {
    String url = '${System.domain}_union/shop/boxdetail';
    try {
      XhrResponse response = await Xhr.postJson(url, {'cid': '$cid'}, throwOnError: true);
      if (response.error != null) {
        return UnionBoxDetailBean(success: false, msg: response.error.toString());
      }
      return UnionBoxDetailBean.fromJson(response.value() as Map<String, dynamic>);
    } catch (e) {
      return UnionBoxDetailBean(success: false, msg: e.toString());
    }
  }

  static Future<KillerExchangeResp> exchangePieceToPearl(int cid) async {
    String url = '${System.domain}go/games/exchange/pieceToPearl';
    try {
      Log.d("exchangePieceToPearl cid=$cid");
      XhrResponse response = await Xhr.post(url, {'cid': '$cid'}, pb: true);
      return KillerExchangeResp.fromBuffer(response.bodyBytes);
    } catch (e) {
      return KillerExchangeResp(msg: e.toString(), success: false);
    }
  }

  static Future<KillerCommodityValue> commodityUnitPrice(int cid) async {
    String url = '${System.domain}go/games/exchange/commodityValue';
    try {
      Log.d("commodityValue cid=$cid");
      XhrResponse response = await Xhr.post(url, {'cid': '$cid', 'num': '100'}, pb: true);
      return KillerCommodityValue.fromBuffer(response.bodyBytes);
    } catch (e) {
      return KillerCommodityValue(msg: e.toString(), success: false);
    }
  }

  static Future<KillerExchangeResp> sellCommodity(int cid, int num) async {
    String url = '${System.domain}go/games/exchange/commoditySale';
    try {
      Log.d("sellCommodity cid=$cid");
      XhrResponse response = await Xhr.post(url, {'cid': '$cid', 'num': '$num'}, pb: true);
      return KillerExchangeResp.fromBuffer(response.bodyBytes);
    } catch (e) {
      return KillerExchangeResp(msg: e.toString(), success: false);
    }
  }

  /// 分解
  static Future<RepCommodityResolve> breakGoods(int cid, String type, int num) async {
    String url = '${System.domain}go/yy/commodity/giftResolve';
    try {
      XhrResponse response = await Xhr.post(url, {"cid": "$cid", "type": type, "cnum": "$num"}, pb: true);
      return RepCommodityResolve.fromBuffer(response.bodyBytes);
    } catch (e) {
      return RepCommodityResolve(msg: e.toString(), success: false);
    }
  }
}
