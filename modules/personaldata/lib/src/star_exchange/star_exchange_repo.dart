import 'package:shared/shared.dart';
import 'package:personaldata/src/star_exchange/pb/generated/relation_conver.pb.dart';

class StarExchangeRepo {
  /// 兑换主页
  static Future<RelConvertHomeRsp> exchangeHomePage() async {
    try {
      String url = '${System.domain}go/yy/relation/convertHome';
      final response = await Xhr.get(url, pb: true, throwOnError: true);
      return RelConvertHomeRsp.fromBuffer(response.bodyBytes);
    } catch (e) {
      return RelConvertHomeRsp(success: false, msg: e.toString());
    }
  }

  /// 兑换区列表
  static Future<RelConvertHomeRsp> exchangeList(int scoresort, int page) async {
    try {
      String url =
          '${System.domain}go/yy/relation/convertList?scoresort=$scoresort&page=$page';
      final response = await Xhr.get(url, pb: true, throwOnError: true);
      return RelConvertHomeRsp.fromBuffer(response.bodyBytes);
    } catch (e) {
      return RelConvertHomeRsp(success: false, msg: e.toString());
    }
  }

  /// 兑换记录
  static Future<RelConvertGoodsLogRsp> exchangeRecord(int page) async {
    try {
      String url = '${System.domain}go/yy/relation/convertGoodsLog?page=$page';
      final response = await Xhr.get(url, pb: true, throwOnError: true);
      return RelConvertGoodsLogRsp.fromBuffer(response.bodyBytes);
    } catch (e) {
      return RelConvertGoodsLogRsp(success: false, msg: e.toString());
    }
  }

  /// 兑换
  static Future<RelConvertGoodsRsp> exchange(
      int goodstype, int goodsid, int id) async {
    try {
      XhrResponse response = await Xhr.postPb(
        '${System.domain}go/yy/relation/convertGoods',
        {
          'goodstype': goodstype.toString(),
          'goodsid': goodsid.toString(),
          'id': id.toString()
        },
        throwOnError: true,
      );
      return RelConvertGoodsRsp.fromBuffer(response.bodyBytes);
    } catch (e) {
      return RelConvertGoodsRsp(success: false, msg: e.toString());
    }
  }

  /// 定制
  static Future<NormalNull> custom(int defendUid) async {
    try {
      XhrResponse response = await Xhr.postPb(
        '${System.domain}go/yy/relation/customPretend',
        {'defend_uid': defendUid.toString()},
        throwOnError: true,
      );
      return NormalNull.fromBuffer(response.bodyBytes);
    } catch (e) {
      return NormalNull(success: false, msg: e.toString());
    }
  }
}
