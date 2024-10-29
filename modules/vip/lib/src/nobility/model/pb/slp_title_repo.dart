import 'package:shared/shared.dart';
import 'package:flutter/cupertino.dart';
import 'package:vip/src/nobility/model/pb/generated/slp_nobility_activity.pb.dart';

import 'generated/slp_title.pb.dart';

class SlpTitleRepo {
  //  获取专属麦座设置
  //  GET  /go/yy/title/micSofaSetting
  static Future<ResTitleMicSofaSetting> micSofaSetting() async {
    try {
      XhrResponse response = await Xhr.get(
        'go/yy/title/micSofaSetting?version=1',
        pb: true,
      );
      return ResTitleMicSofaSetting.fromBuffer(response.bodyBytes);
    } catch (e) {
      return ResTitleMicSofaSetting(success: false, msg: e.toString());
    }
  }

  //  佩戴专属麦座
  //  POST  /go/yy/title/setMicSofa
  //  传参   sofa_level    佩戴的爵位等级
  static Future<NormalNull> setMicSofa(
      {int sofaLevel = 0, required int id}) async {
    try {
      XhrResponse response = await Xhr.post(
        'go/yy/title/setMicSofa',
        {'sofa_level': sofaLevel.toString(), 'id': '$id', 'version': '1'},
        pb: true,
      );
      return NormalNull.fromBuffer(response.bodyBytes);
    } catch (e) {
      return NormalNull(success: false, msg: e.toString());
    }
  }

  //  爵位购买活动数据
  static Future<RespGiftBagDetail> getNobleActivityData(int type) async {
    try {
      XhrResponse response = await Xhr.post(
        'go/yy/gift_bag/detail',
        {'type': type.toString()},
        pb: true,
      );
      debugPrint(RespGiftBagDetail.fromBuffer(response.bodyBytes).toString());
      return RespGiftBagDetail.fromBuffer(response.bodyBytes);
    } catch (e) {
      return RespGiftBagDetail(success: false, msg: e.toString());
    }
  }
}
