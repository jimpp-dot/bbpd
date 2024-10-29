import 'dart:convert';

import 'package:shared/shared.dart';
import 'package:chat_room/src/protobuf/generated/plugin_vote.pb.dart';

import 'create/vote_create_view_model.dart';

/// 投票插件相关请求
class VoteRepos {
  /// 创建投票获取配置
  static Future<ResVoteConfig?> getConfig(int rid) async {
    XhrResponse response =
        await Xhr.postPb('${System.domain}go/room/vote/config?rid=$rid', {});
    try {
      ResVoteConfig config = ResVoteConfig.fromBuffer(response.bodyBytes);

      return config;
    } catch (e) {
      Log.d(e);
    }
    return null;
  }

  /// 新建投票接口
  static Future<bool> create(
      int rid, VoteOptionType? type, VoteCreateInfo info) async {
    Map<String, String> params = {'rid': '$rid'};
    params['title'] = info.title;
    params['duration'] = '${info.time}';
    params['select_type'] = info.isMulti ? '1' : '0';
    params['result_show'] = info.showResult ? '1' : '0';
    if (type == VoteOptionType.text) {
      params['type'] = 'text';
      params['options'] = jsonEncode(info.texts);
    } else {
      params['type'] = 'user';
      params['options'] = jsonEncode(info.users.map((e) => e.uid).toList());
    }
    XhrResponse response =
        await Xhr.postPb('${System.domain}go/room/vote/save?rid=$rid', params);
    try {
      NormalNull config = NormalNull.fromBuffer(response.bodyBytes);
      if (config.msg.isNotEmpty == true) {
        Fluttertoast.showToast(msg: config.msg);
      }
      return config.success;
    } catch (e) {
      Log.d(e);
    }
    return false;
  }

  /// 获取房间启动的投票信息
  static Future<ResPluginVoteInfo?> getVoteInfo(int rid) async {
    XhrResponse response =
        await Xhr.postPb('${System.domain}go/room/vote/info?rid=$rid', {});
    try {
      ResPluginVoteInfo config =
          ResPluginVoteInfo.fromBuffer(response.bodyBytes);
      if (System.debug) {
        Log.d('vote getVoteInfo config:${config.toString()}');
      }
      return config;
    } catch (e) {
      Log.d(e);
    }
    return null;
  }

  /// 投票
  static Future<bool> vote(int rid, int vid, List<int> optionIds) async {
    Map<String, String> params = {'rid': '$rid'};
    params['vid'] = '$vid';
    params['voids'] = jsonEncode(optionIds);
    XhrResponse response =
        await Xhr.postPb('${System.domain}go/room/vote/post?rid=$rid', params);
    try {
      NormalNull config = NormalNull.fromBuffer(response.bodyBytes);
      if (config.msg.isNotEmpty == true) {
        Fluttertoast.showToast(msg: config.msg);
      }
      return config.success;
    } catch (e) {
      Log.d(e);
    }
    return false;
  }
}
