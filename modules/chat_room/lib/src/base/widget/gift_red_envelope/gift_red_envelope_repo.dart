import 'package:shared/shared.dart';

import '../../../protobuf/generated/gift_red_packet.pb.dart';

class GiftRedEnvelopeRepo {
  /// 礼物红包面板
  static Future<RedPacketHomeData> getGiftRedEnvelopePanel() async {
    String url = '${System.domain}go/yy/redPacket/home';
    ResRedPacketHome resp;
    try {
      XhrResponse response = await Xhr.get(url, pb: true, throwOnError: true);
      resp = ResRedPacketHome.fromBuffer(response.bodyBytes);
    } catch (e) {
      resp = ResRedPacketHome(success: false, msg: e.toString());
    }
    if (!resp.success) {
      Fluttertoast.showCenter(msg: resp.msg);
    }
    return resp.data;
  }

  /// 抢红包列表面板
  static Future<ResRobRedList> getGrabGiftRedEnvelopeList(int rid) async {
    String url = '${System.domain}go/yy/redPacket/roomRedList';
    try {
      XhrResponse response = await Xhr.get(url,
          queryParameters: {'rid': rid}, pb: true, throwOnError: true);
      return ResRobRedList.fromBuffer(response.bodyBytes);
    } catch (e) {
      return ResRobRedList(success: false, msg: e.toString());
    }
  }

  /// 抢红包
  static Future<NormalNull> grabGiftRedEnvelope(
      int rid, int redPacketId) async {
    String url = '${System.domain}go/yy/redPacket/robRedPacket';
    try {
      XhrResponse response = await Xhr.get(
        url,
        queryParameters: {'rid': rid, 'user_red_id': redPacketId},
        pb: true,
        throwOnError: true,
      );
      return NormalNull.fromBuffer(response.bodyBytes);
    } catch (e) {
      return NormalNull(success: false, msg: e.toString());
    }
  }

  /// 礼物红包领取详情
  static Future<ResRedPacketDetail> redPacketDetail(int page, int id) async {
    String url = '${System.domain}go/yy/redPacket/redPacketDetail';
    ResRedPacketDetail resp;
    try {
      XhrResponse response = await Xhr.get(
        url,
        queryParameters: {'page': '$page', 'userRedId': id},
        pb: true,
        throwOnError: true,
      );
      resp = ResRedPacketDetail.fromBuffer(response.bodyBytes);
    } catch (e) {
      resp = ResRedPacketDetail(success: false, msg: e.toString());
    }
    if (!resp.success) {
      Fluttertoast.showCenter(msg: resp.msg);
    }
    return resp;
  }
}
