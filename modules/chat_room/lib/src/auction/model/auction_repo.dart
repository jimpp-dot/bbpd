import 'package:shared/shared.dart';
import 'package:chat_room/src/protobuf/generated/auction.pb.dart';

class AuctionRepo {
  /// 加载数据
  static Future<RespAuctionConfig> loadData(int rid) async {
    String url = '${System.domain}go/room/auction/config';
    try {
      XhrResponse response = await Xhr.post(url, {'rid': '$rid'}, pb: true);
      RespAuctionConfig rsp = RespAuctionConfig.fromBuffer(response.bodyBytes);
      Log.d(rsp.toProto3Json());
      return rsp;
    } catch (e) {
      return RespAuctionConfig(message: e.toString(), success: false);
    }
  }

  /// 获取设置
  static Future<RespAuctionSetting> getSettings(int rid) async {
    String url = '${System.domain}go/room/auction/settings';
    try {
      XhrResponse response =
          await Xhr.post(url, {'rid': '$rid', 'version': '2'}, pb: true);
      RespAuctionSetting rsp =
          RespAuctionSetting.fromBuffer(response.bodyBytes);
      Log.d(rsp.toProto3Json());
      return rsp;
    } catch (e) {
      return RespAuctionSetting(message: e.toString(), success: false);
    }
  }

  /// 保存设置
  static Future<RespAuctionSave> saveSettings(
      {required int rid,
      required int cid,
      required String cName,
      required int flag,
      required int expired,
      required int giftId,
      required int vvc}) async {
    String url = '${System.domain}go/room/auction/save';
    try {
      XhrResponse response = await Xhr.post(
          url,
          {
            'rid': '$rid',
            'cid': '$cid',
            'c_name': cName,
            'flag': '$flag',
            'expired': '$expired',
            'gift_id': '$giftId',
            'vvc': '$vvc',
            'version': '2',
          },
          pb: true);
      RespAuctionSave rsp = RespAuctionSave.fromBuffer(response.bodyBytes);
      Log.d(rsp.toProto3Json());
      return rsp;
    } catch (e) {
      return RespAuctionSave(message: e.toString(), success: false);
    }
  }

  /// 结束
  static Future<RespAuctionConfig> end(int rid, int vvc) async {
    String url = '${System.domain}go/room/auction/end';
    try {
      XhrResponse response =
          await Xhr.post(url, {'rid': '$rid', 'vvc': '$vvc'}, pb: true);
      RespAuctionConfig rsp = RespAuctionConfig.fromBuffer(response.bodyBytes);
      Log.d(rsp.toProto3Json());
      return rsp;
    } catch (e) {
      return RespAuctionConfig(message: e.toString(), success: false);
    }
  }

  /// 今日榜
  static Future<RespAuctionRank> todayRank(int rid, {int page = 1}) async {
    String url = '${System.domain}go/room/auction/dailyRank';
    try {
      XhrResponse response =
          await Xhr.post(url, {'rid': '$rid', 'page': '$page'}, pb: true);
      RespAuctionRank rsp = RespAuctionRank.fromBuffer(response.bodyBytes);
      Log.d(rsp.toProto3Json());
      return rsp;
    } catch (e) {
      return RespAuctionRank(message: e.toString(), success: false);
    }
  }

  /// 总榜
  static Future<RespAuctionRank> worldRank(int rid, {int page = 1}) async {
    String url = '${System.domain}go/room/auction/worldRank';
    try {
      XhrResponse response =
          await Xhr.post(url, {'rid': '$rid', 'page': '$page'}, pb: true);
      RespAuctionRank rsp = RespAuctionRank.fromBuffer(response.bodyBytes);
      Log.d(rsp.toProto3Json());
      return rsp;
    } catch (e) {
      return RespAuctionRank(message: e.toString(), success: false);
    }
  }

  /// 名人堂
  static Future<RespAuctionRank> fameHallRank(int rid, {int page = 1}) async {
    String url = '${System.domain}go/room/auction/fameHallRank';
    try {
      XhrResponse response =
          await Xhr.post(url, {'rid': '$rid', 'page': '$page'}, pb: true);
      RespAuctionRank rsp = RespAuctionRank.fromBuffer(response.bodyBytes);
      Log.d(rsp.toProto3Json());
      return rsp;
    } catch (e) {
      return RespAuctionRank(message: e.toString(), success: false);
    }
  }

  static Future<NormalNull> saveDefineContent(
      {required int rid, required String cName, required int vvc}) async {
    String url = '${System.domain}go/room/auction/check';
    try {
      XhrResponse response = await Xhr.postPb(url, {
        'rid': '$rid',
        'commodity': cName,
        'vvc': '$vvc',
      });
      NormalNull rsp = NormalNull.fromBuffer(response.bodyBytes);
      return rsp;
    } catch (e) {
      return NormalNull(msg: e.toString(), success: false);
    }
  }

  static Future<NormalNull> commitDiyRelation(
      {required int rid, required String diyName}) async {
    String url = '${System.domain}go/room/auction/diy';
    try {
      XhrResponse response = await Xhr.postPb(url, {
        'rid': '$rid',
        'diyName': diyName,
      });
      NormalNull rsp = NormalNull.fromBuffer(response.bodyBytes);
      return rsp;
    } catch (e) {
      return NormalNull(msg: e.toString(), success: false);
    }
  }

  static Future<NormalNull> replayDiyRelation(
      {required int rid,
      required int agree,
      required String diyName,
      required int version}) async {
    String url = '${System.domain}go/room/auction/diyReply';
    try {
      XhrResponse response = await Xhr.postPb(url, {
        'rid': '$rid',
        'agree': '$agree',
        'diyName': diyName,
        'version': '$version',
      });
      NormalNull rsp = NormalNull.fromBuffer(response.bodyBytes);
      return rsp;
    } catch (e) {
      return NormalNull(msg: e.toString(), success: false);
    }
  }
}
