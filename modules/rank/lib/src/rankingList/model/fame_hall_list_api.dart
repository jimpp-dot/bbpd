/*
 *
 *  Created by yao.qi on 2022/4/28 下午2:33
 *  Copyright (c) 2019 - 2022 . All rights reserved.
 *  Last modified 2022/4/28 下午2:33
 *
 */

import 'package:shared/shared.dart';
import 'pb/generated/slp_weekstar.pb.dart';

class FameHallListApi {
  /// 获取直播周星榜-名人堂数据
  static Future<ResWeekStarFameHall> sendFameHallListRequest(
      {int page = 1}) async {
    String url = '${System.domain}go/yy/weekstar/fameHall';
    try {
      Map<String, dynamic> params = {'page': page};
      XhrResponse response =
          await Xhr.get(url, pb: true, queryParameters: params);
      return ResWeekStarFameHall.fromBuffer(response.bodyBytes);
    } catch (e) {
      return ResWeekStarFameHall(msg: e.toString(), success: false);
    }
  }
}
