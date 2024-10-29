import 'package:shared/shared.dart';
import 'package:vip/src/vip_mall/model/vip_mall_second_bean.dart';
import 'package:vip/src/vip_mall/pb/generated/buy_room_hot.pb.dart';

import 'model/commodity_bean.dart';
import 'model/vip_mall_bean.dart';
import 'pb/generated/commodity_rare_config.pb.dart';
import 'pb/generated/vip_commodity.pb.dart';

class Api {
  /// 商城首页
  static Future<DataRsp<VipMallBean>> getCommodity() async {
    String url = '${System.domain}commodity/data?version=5';
    try {
      XhrResponse response = await Xhr.getJson(url);
      return DataRsp<VipMallBean>.fromXhrResponse(response, (object) => VipMallBean.fromJson(object as Map<String, dynamic>));
    } catch (e) {
      return DataRsp<VipMallBean>(msg: R.array('xhr_error_type_array')[6], success: false);
    }
  }

  /// 商城二级页面
  static Future<DataRsp<List<VipMallSecondBean>>> getCommodityList(String type) async {
    String url = '${System.domain}commodity/list?version=6&type=$type';
    try {
      XhrResponse response = await Xhr.getJson(url);
      return DataRsp<List<VipMallSecondBean>>.fromXhrResponse(
        response,
        (object) => Util.parseList(object, (e) => VipMallSecondBean.fromJson(e as Map<String, dynamic>)),
      );
    } catch (e) {
      return DataRsp<List<VipMallSecondBean>>(msg: R.array('xhr_error_type_array')[6], success: false);
    }
  }

  static Future<DataRsp<CouponTip>> getCouponTip(String type) async {
    String url = '${System.domain}commodity/myCoupon?type=$type';
    try {
      XhrResponse response = await Xhr.get(url, throwOnError: true, pb: true);
      return DataRsp<CouponTip>.fromXhrResponse(
        response,
        (object) {
          Map data = object as Map;
          Map couponTipData = data['coupon'];
          return CouponTip.fromJson(couponTipData as Map<String, dynamic>);
        },
      );
    } catch (e) {
      return DataRsp<CouponTip>(msg: e.toString(), success: false);
    }
  }

  /// 购买弹窗
  ///
  /// [cid] 物品cid
  static Future<DataRsp<CommodityBuyInfo>> getCommodityBuyInfo(int cid) async {
    String url = '${System.domain}commodity/buying?version=4&cid=$cid';

    try {
      XhrResponse response = await Xhr.getJson(url);
      return DataRsp<CommodityBuyInfo>.fromXhrResponse(
        response,
        (object) => CommodityBuyInfo.fromJson(object as Map<String, dynamic>),
      );
    } catch (e) {
      return DataRsp<CommodityBuyInfo>(msg: e.toString(), success: false);
    }
  }

  static Future<ResRoomBuyHot> getBuyRoomHotPanel(int rid) async {
    String url = '${System.domain}go/mate/commodity/buyHotConfig?rid=$rid';
    try {
      XhrResponse response = await Xhr.get(url, throwOnError: true, pb: true);
      return ResRoomBuyHot.fromBuffer(response.bodyBytes);
    } catch (e) {
      return ResRoomBuyHot(msg: e.toString(), success: false);
    }
  }

  static Future<List<String>> getFilterInfo(String type) async {
    String url = '${System.domain}go/mate/commodity/getRareConfig?type=$type';
    try {
      XhrResponse response = await Xhr.get(url, throwOnError: true, pb: true);
      ResCommodityRareConfig config = ResCommodityRareConfig.fromBuffer(response.bodyBytes);
      // Log.d('filter: $config');
      return config.data;
    } catch (e) {
      Log.d(e.toString());
      return [];
    }
  }

  static int getMapNum(Map? map) {
    int num = 0;
    map?.forEach((key, value) {
      if (value is int) {
        num = num + value;
      }
    });
    return num;
  }

  /// 公会商城tab
  static Future<ResBrokerShopIndex> getGuildMallTabInfo() async {
    try {
      XhrResponse response = await Xhr.get(
        '${System.domain}go/mate/commodity/brokerShopIndex',
        pb: true,
      );
      ResBrokerShopIndex rsp = response.formatProtobuf(ResBrokerShopIndex.create());
      // Log.d('getGuildMallTabInfo: $rsp');
      return rsp;
    } catch (e) {
      return ResBrokerShopIndex(msg: e.toString(), success: false);
    }
  }

  /// 积分明细
  ///
  static Future<ResScoreHistory> getGuildScoreHistory() async {
    try {
      XhrResponse response = await Xhr.get('${System.domain}go/mate/commodity/scoreHistory', pb: true);
      ResScoreHistory rsp = response.formatProtobuf(ResScoreHistory.create());
      // Log.d('getGuildScoreHistory: $rsp');
      return rsp;
    } catch (e) {
      return ResScoreHistory(msg: e.toString(), success: false);
    }
  }

  /// 积分购买
  ///
  static Future<NormalNull> scoreBuy(int cid, {int num = 1}) async {
    try {
      XhrResponse response = await Xhr.postPb(
        '${System.domain}go/mate/commodity/scoreBuy',
        {
          'cid': '$cid',
          'num': '$num',
        },
      );
      return response.formatProtobuf(NormalNull.create());
    } catch (e) {
      return NormalNull(msg: e.toString(), success: false);
    }
  }
}
