/*
 *
 *  Created by yao.qi on 2022/9/7 上午11:22
 *  Copyright (c) 2019 - 2022 . All rights reserved.
 *  Last modified 2022/8/19 上午9:56
 *
 */

import 'package:shared/shared.dart';
import 'pb/generated/slp_travel.pb.dart';

class GiftWallApi {
  /// 1.礼物墙 /go/yy/gift/wallList
  static Future<GiftWallListRes> getBBGiftWallListResp(int uid,
      {int tabId = 0}) async {
    String url = '${System.domain}go/yy/gift/wallList';
    try {
      XhrResponse response = await Xhr.get(url,
          queryParameters: {'uid': uid, 'tab_id': tabId},
          pb: true,
          throwOnError: true);
      return GiftWallListRes.fromBuffer(response.bodyBytes);
    } catch (e) {
      return GiftWallListRes(msg: e.toString(), success: false);
    }
  }

  /// 2.礼物墙统计 /go/yy/gift/wallListStatistics
  static Future<GiftWallStaticsRes> getBBGiftWallListStatisticsResp(
      int uid, int version) async {
    String url = '${System.domain}go/yy/gift/wallListStatistics';
    try {
      XhrResponse response = await Xhr.get(url,
          queryParameters: {'uid': uid, 'version': version},
          pb: true,
          throwOnError: true);
      return GiftWallStaticsRes.fromBuffer(response.bodyBytes);
    } catch (e) {
      return GiftWallStaticsRes(msg: e.toString(), success: false);
    }
  }

  /// 3.礼物墙图鉴 /go/yy/gift/wallListGraphic
  static Future<GiftWallGraphicRes> getBBGiftWallListGraphicResp(
      int uid) async {
    String url = '${System.domain}go/yy/gift/wallListGraphic';
    try {
      XhrResponse response = await Xhr.get(url,
          queryParameters: {'uid': uid}, pb: true, throwOnError: true);
      return GiftWallGraphicRes.fromBuffer(response.bodyBytes);
    } catch (e) {
      return GiftWallGraphicRes(msg: e.toString(), success: false);
    }
  }

  /// 4.爱的旅行地图
  static Future<ResTravelWall> getBBGiftWallListTravelResp(int uid) async {
    String url = '${System.domain}go/yy/travel/wall';
    try {
      XhrResponse response = await Xhr.get(url,
          queryParameters: {'uid': uid}, pb: true, throwOnError: true);
      return ResTravelWall.fromBuffer(response.bodyBytes);
    } catch (e) {
      return ResTravelWall(msg: e.toString(), success: false);
    }
  }

  /// 1.限时收集
  static Future<ResGiftWallLimit> getBBGiftWallLimitListResp(
      int uid, int activity) async {
    String url = '${System.domain}go/yy/gift/giftWallLimit';
    try {
      XhrResponse response = await Xhr.get(url,
          queryParameters: {'uid': uid, 'activity': activity},
          pb: true,
          throwOnError: true);
      return ResGiftWallLimit.fromBuffer(response.bodyBytes);
    } catch (e) {
      return ResGiftWallLimit(msg: e.toString(), success: false);
    }
  }
}
