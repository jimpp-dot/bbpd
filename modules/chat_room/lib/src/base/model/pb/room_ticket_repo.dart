import 'package:shared/shared.dart';

import 'generated/common_roomticket.pb.dart';

class RoomTicketRepo {
  //  获取房间门票接口
  // GET  go/yy/roomticket/getTicket
  // 传参   rid
  static Future<ResRoomTicketConfig> getTicket(int rid) async {
    try {
      XhrResponse response = await Xhr.get(
        'go/yy/roomticket/getTicket?rid=$rid',
        pb: true,
        throwOnError: true,
      );
      return ResRoomTicketConfig.fromBuffer(response.bodyBytes);
    } catch (e) {
      return ResRoomTicketConfig(success: false, msg: e.toString());
    }
  }

  //  设置房间门票接口
  //  POST  /go/yy/roomticket/setTicket
  //  传参    rid          房间id
  //  gift_id    礼物id
  static Future<NormalNull> setTicket(int rid, int giftId) async {
    try {
      XhrResponse response = await Xhr.post(
        'go/yy/roomticket/setTicket',
        {
          'rid': rid.toString(),
          'gift_id': giftId.toString(),
        },
        pb: true,
      );
      return NormalNull.fromBuffer(response.bodyBytes);
    } catch (e) {
      return NormalNull(success: false, msg: e.toString());
    }
  }
}
