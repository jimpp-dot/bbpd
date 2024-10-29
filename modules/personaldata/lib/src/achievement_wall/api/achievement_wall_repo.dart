/*
 *
 *  Created by yao.qi on 2022/7/18 下午12:09
 *  Copyright (c) 2019 - 2022 . All rights reserved.
 *  Last modified 2022/7/18 下午12:09
 *
 */

import 'package:shared/shared.dart';

import '../model/pb/generated/slp_achieve.pb.dart';

class AchievementWallRepo {
  ///  成就墙接口
  ///
  ///  GET  /go/yy/achieve/wall
  ///
  ///  传参   uid   		被查看用户id
  ///  cate_id      勋章类别id，初始不传默认为1 1：荣耀；2：社区
  static Future<ResAchieveWall> getAchieveWall(
      {required int uid, int cateId = 0}) async {
    try {
      XhrResponse response = await Xhr.get(
        '${System.domain}go/yy/achieve/wall?uid=$uid&cate_id=$cateId',
        pb: true,
        throwOnError: true,
      );
      return ResAchieveWall.fromBuffer(response.bodyBytes);
    } catch (e) {
      return ResAchieveWall(success: false, msg: e.toString());
    }
  }

  ///  成就墙勋章排序
  ///
  ///  POST  /go/yy/achieve/sortBadge
  ///
  ///  传参   badge_ids    排好序的勋章id集合，英文逗号分隔
  static Future<NormalNull> achieveSortBadge(String ids) async {
    try {
      XhrResponse response = await Xhr.post(
        '${System.domain}go/yy/achieve/sortBadge',
        {'badge_ids': ids},
        pb: true,
      );
      NormalNull rsp = NormalNull.fromBuffer(response.bodyBytes);
      return rsp;
    } catch (e) {
      return NormalNull(success: false, msg: e.toString());
    }
  }

  ///  成就墙勋章榜单
  ///  GET  /go/yy/achieve/badgeRank
  ///  传参  tab    取值：1-好友，2-全站
  ///  page   页数
  static Future<ResAchieveBadgeRank> getAchieveWallBadgeRank(
      {required int tab, int page = 1}) async {
    try {
      XhrResponse response = await Xhr.get(
        '${System.domain}go/yy/achieve/badgeRank?tab=$tab&page=$page',
        pb: true,
        throwOnError: true,
      );
      return ResAchieveBadgeRank.fromBuffer(response.bodyBytes);
    } catch (e) {
      return ResAchieveBadgeRank(success: false, msg: e.toString());
    }
  }

  /// 成就皮肤设置
  static Future<ResAchieveChangeSkin> saveSkin(int skinId) async {
    try {
      XhrResponse response = await Xhr.post(
        '${System.domain}go/yy/achieve/setSkinId',
        {'skinid': "$skinId"},
        pb: true,
      );
      ResAchieveChangeSkin rsp =
          ResAchieveChangeSkin.fromBuffer(response.bodyBytes);
      return rsp;
    } catch (e) {
      return ResAchieveChangeSkin(success: false, msg: e.toString());
    }
  }

  /// 佩戴成就勋章
  static Future<NormalNull> wearBadge(int badgeId) async {
    try {
      XhrResponse response = await Xhr.post(
        '${System.domain}go/yy/achieve/wearBadge',
        {'badgeid': "$badgeId"},
        pb: true,
      );
      NormalNull rsp = NormalNull.fromBuffer(response.bodyBytes);
      return rsp;
    } catch (e) {
      return NormalNull(success: false, msg: e.toString());
    }
  }

  /// 取消佩戴成就勋章
  static Future<NormalNull> takeOffBadge(int badgeId) async {
    try {
      XhrResponse response = await Xhr.post(
        '${System.domain}go/yy/achieve/takeOffBadge',
        {'badgeid': "$badgeId"},
        pb: true,
      );
      NormalNull rsp = NormalNull.fromBuffer(response.bodyBytes);
      return rsp;
    } catch (e) {
      return NormalNull(success: false, msg: e.toString());
    }
  }

  /// 获取跳转地址
  static Future<ResGetRedirect> getRedirectPath(int badgeId) async {
    try {
      XhrResponse response = await Xhr.post(
        '${System.domain}go/yy/achieve/getRedirect',
        {'badgeid': "$badgeId"},
        pb: true,
        throwOnError: true,
      );
      ResGetRedirect rsp = ResGetRedirect.fromBuffer(response.bodyBytes);
      return rsp;
    } catch (e) {
      return ResGetRedirect(success: false, msg: e.toString());
    }
  }
}
