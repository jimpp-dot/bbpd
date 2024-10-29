/*
 *
 *  Created by yao.qi on 2022/6/9 下午8:37
 *  Copyright (c) 2019 - 2022 . All rights reserved.
 *  Last modified 2022/6/9 下午8:37
 *
 */

import 'dart:convert';

import 'package:shared/shared.dart';

import '../room_quick_reply_msg.dart';

class QuickReplyRepo {
  /// 查询快速回复消息列表
  static Future<RoomQuickReplyMsg> quickMsgList(int rid) async {
    RoomQuickReplyMsg res;
    try {
      XhrResponse response = await Xhr.getJson(
          '${System.domain}go/yy/screen/quickMsgList?rid=$rid',
          throwOnError: false,
          formatJson: true);
      Map? result = response.response as Map?;
      if (result != null && result['success'] == true) {
        res = RoomQuickReplyMsg.fromJson(result as Map<String, dynamic>);
        if (res.data != null) {
          Config.set('res_quick_reply_msg_$rid', jsonEncode(result));
        }
      } else {
        String resStr = Config.get('res_quick_reply_msg_$rid');
        Map<String, dynamic> data;
        try {
          data = Util.validStr(resStr)
              ? Map<String, dynamic>.from(jsonDecode(resStr))
              : {};
        } catch (e) {
          data = {};
        }
        Log.d('quickMsgList--cache-data1:$data');
        res = data.isNotEmpty
            ? RoomQuickReplyMsg.fromJson(data)
            : RoomQuickReplyMsg(false, 'error', null);
      }
    } catch (e) {
      String resStr = Config.get('res_quick_reply_msg_$rid');
      Map<String, dynamic> data;
      try {
        data = Util.validStr(resStr)
            ? Map<String, dynamic>.from(jsonDecode(resStr))
            : {};
      } catch (e) {
        data = {};
      }
      Log.d('quickMsgList--cache-data2:$data');
      res = data.isNotEmpty
          ? RoomQuickReplyMsg.fromJson(data)
          : RoomQuickReplyMsg(false, 'error', null);
    }
    Log.d('---------quickMsgList---------:${res.toJson()}');
    return res;
  }

  /// 保存快捷语
  /// content   必填   发言内容
  /// id        可选   修改时传入
  static Future<NormalNull> saveQuickMsg(String content, {int id = 0}) async {
    Map<String, String> body = {'content': content};
    if (id > 0) {
      body['id'] = id.toString();
    }
    try {
      XhrResponse response = await Xhr.post(
          '${System.domain}go/yy/screen/saveQuickMsg', body,
          pb: true);
      return NormalNull.fromBuffer(response.bodyBytes);
    } catch (e) {
      return NormalNull(msg: e.toString(), success: false);
    }
  }

  /// 快捷发言排序
  /// ids    string    排序后的id集合，英文逗号分隔      示例：5,6,2,3,1,4
  static Future<NormalNull> sortQuickMsg(String ids) async {
    try {
      XhrResponse response = await Xhr.post(
          '${System.domain}go/yy/screen/sortQuickMsg', {'ids': ids},
          pb: true);
      return NormalNull.fromBuffer(response.bodyBytes);
    } catch (e) {
      return NormalNull(msg: e.toString(), success: false);
    }
  }

  /// 删除快捷发言
  /// id   int    快捷发言id
  static Future<NormalNull> delQuickMsg(int id) async {
    try {
      XhrResponse response = await Xhr.post(
          '${System.domain}go/yy/screen/delQuickMsg', {'id': id.toString()},
          pb: true);
      return NormalNull.fromBuffer(response.bodyBytes);
    } catch (e) {
      return NormalNull(msg: e.toString(), success: false);
    }
  }

  /// 同步后台默认快捷发言
  static Future<NormalNull> syncQuickMsg(int rid) async {
    try {
      XhrResponse response = await Xhr.post(
          '${System.domain}go/yy/screen/syncQuickMsg', {'rid': rid.toString()},
          pb: true);
      return NormalNull.fromBuffer(response.bodyBytes);
    } catch (e) {
      return NormalNull(msg: e.toString(), success: false);
    }
  }
}
