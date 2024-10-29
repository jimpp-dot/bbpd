import 'package:shared/shared.dart';
import 'package:shared/src/pbModel/generated/banban_small.pb.dart';
import 'package:message/src/auto_reply/model/auto_reply_item.dart';
import 'package:message/src/auto_reply/model/gift_item.dart';
import 'package:message/src/model/accost_and_hi_group.dart';
import 'package:message/src/model/accost_config.dart';
import 'package:message/src/model/accost_strategy_config.dart';
import 'package:message/src/model/message_beans.dart';
import 'package:message/src/model/pb/generated/slp_gs.pb.dart';
import 'package:message/src/model/pb/generated/slp_cloud_smart.pb.dart';
import 'package:message/src/model/pb/generated/slp_reward_stranger.pb.dart';
import 'package:message/src/quick_msg/model/quick_msg_item.dart';

import '../model/pb/generated/slp_cloudbanner.pb.dart';
import '../model/pb/generated/mate_friend_playing.pb.dart';

class MessageRepo {
  MessageRepo._();

  static Future<NearbyUserListResp> getNearbyUserList() async {
    try {
      double longitude = Util.parseDouble(Config.get('location.longitude'));
      double latitude = Util.parseDouble(Config.get('location.latitude'));
      String url = '${System.domain}go/yy/geo/nearbyRoom?uid=${Session.uid}';
      // if (Util.isSLPAll()) {
      //   /// 今日缘分
      //   url = '$url&match_new=1';
      // }
      XhrResponse response = await Xhr.postJson(
          url,
          {
            'longitude': longitude.toString(),
            'latitude': latitude.toString(),
          },
          formatJson: true,
          throwOnError: false);
      if (response.error != null) {
        Log.d(response.error.toString());
        return NearbyUserListResp(
            msg: response.error.toString(), success: false);
      }

      Map res = response.value();
      if (!(res['success'] ?? false)) {
        return NearbyUserListResp(msg: res['msg'], success: false);
      }
      try {
        NearbyUserListResp responseData =
            NearbyUserListResp.fromJson(res as Map<String, dynamic>);
        return responseData;
      } catch (e) {
        Log.d("getNearbyUserList and e msg = ${e.toString()}");

        return NearbyUserListResp(
            msg: R.array('xhr_error_type_array')[6], success: false);
      }
    } catch (e) {
      return NearbyUserListResp(msg: e.toString(), success: false);
    }
  }

  static Future<BaseResponse> uploadAddressBook(Map<String, String> map) async {
    try {
      String url = '${System.domain}friend/uploadAddrBook';
      Log.d('uploadAddrBook:$map');
      XhrResponse response = await Xhr.postJson(url, map);
      if (response.error != null) {
        Log.d(response.error.toString());
        return BaseResponse(msg: response.error.toString(), success: false);
      }
      Map res = response.value();
      if (!(res['success'] ?? false)) {
        return BaseResponse(msg: res['msg'], success: false);
      }
      return BaseResponse(success: true);
    } catch (e) {
      return BaseResponse(msg: e.toString(), success: false);
    }
  }

  static Future<AddressBookFriendsResp> getAddressBookFriends(
      int page, int pageSize) async {
    try {
      String url = '${System.domain}friend/getAddrBookFriends';
      Map<String, dynamic> map = {'page': '$page', 'pageSize': '$pageSize'};
      XhrResponse response = await Xhr.getJson(url, params: map);
      if (response.error != null) {
        Log.d(response.error.toString());
        return AddressBookFriendsResp(
            msg: response.error.toString(), success: false);
      }
      Map res = response.value();
      if (!(res['success'] ?? false)) {
        return AddressBookFriendsResp(msg: res['msg'], success: false);
      }
      try {
        AddressBookFriendsResp responseData =
            AddressBookFriendsResp.fromJson(res as Map<String, dynamic>);
        return responseData;
      } catch (e) {
        return AddressBookFriendsResp(msg: e.toString(), success: false);
      }
    } catch (e) {
      return AddressBookFriendsResp(msg: e.toString(), success: false);
    }
  }

  /// 打招呼消息需要展开显示的gs列表/gs给别人发的自动搭讪未回复列表
  static Future<DataRsp<AccostAndHiGroup>> accostAndHiList() async {
    try {
      XhrResponse response = await Xhr.getJson(
          '${System.domain}go/mate/friend/msgGroup',
          formatJson: true);
      DataRsp<AccostAndHiGroup> rsp = DataRsp<AccostAndHiGroup>.fromXhrResponse(
          response,
          (json) => AccostAndHiGroup.fromJson(json as Map<String, dynamic>));
      if (rsp.success == true && rsp.data != null) {
        // Log.d('gs list: ${rsp.data!.gsList}');
        // Log.d('gs bossList: ${rsp.data!.bossList}');
        Config.set(
            '${Session.uid}.message.gsIDs', Util.jsonEncode(rsp.data!.gsList));
        Config.set('${Session.uid}.message.bossIDs',
            Util.jsonEncode(rsp.data!.bossList));
      }
      return rsp;
    } catch (e) {
      return DataRsp(success: false, msg: e.toString());
    }
  }

  /// 打招呼消息需要展开显示的gs列表/gs给别人发的自动搭讪未回复列表(快乐星球)
  static Future<ResFriendMsgGroup> bbAccostAndHiList() async {
    try {
      XhrResponse response =
          await Xhr.get('${System.domain}go/yy/friend/msgGroup', pb: true);
      ResFriendMsgGroup rsp = ResFriendMsgGroup.fromBuffer(response.bodyBytes);
      if (rsp.success) {
        Config.set(
            '${Session.uid}.message.gsIDs', Util.jsonEncode(rsp.data.gsList));
        Config.set('${Session.uid}.message.bossIDs',
            Util.jsonEncode(rsp.data.bossList));
      }
      return rsp;
    } catch (e) {
      return ResFriendMsgGroup(success: false);
    }
  }

  /// 快乐星球获取自动搭讪配置Tab
  static Future<ResAutoChatCategory> bbAccostConfigTab() async {
    try {
      XhrResponse response =
          await Xhr.get('${System.domain}go/yy/gs/strategyCategory', pb: true);
      return ResAutoChatCategory.fromBuffer(response.bodyBytes);
    } catch (e) {
      return ResAutoChatCategory(success: false, msg: e.toString());
    }
  }

  /// 快乐星球：获取自动搭讪配置信息（单Tab）
  static Future<ResGsAutoChat> bbAccostConfigList(int id) async {
    try {
      XhrResponse response = await Xhr.get(
          '${System.domain}go/yy/gs/autoChat?category_id=$id',
          pb: true);
      return ResGsAutoChat.fromBuffer(response.bodyBytes);
    } catch (e) {
      return ResGsAutoChat(success: false, msg: e.toString());
    }
  }

  /// 获取自动搭讪配置信息
  static Future<DataRsp<AccostConfig>> accostConfigList() async {
    try {
      XhrResponse response = await Xhr.getJson(
          '${System.domain}go/mate/gs/autoChat',
          formatJson: true);
      return DataRsp<AccostConfig>.fromXhrResponse(response,
          (json) => AccostConfig.fromJson(json as Map<String, dynamic>));
    } catch (e) {
      return DataRsp(success: false, msg: e.toString());
    }
  }

  /// 快乐星球:获取参考话术
  /// strategyId：搭讪策略ID
  /// categoryId：搭讪类型（TAB）ID
  static Future<ResAccostSampleList> bbAccostStrategyExample(
      int strategyId, int categoryId) async {
    try {
      XhrResponse response = await Xhr.get(
          '${System.domain}go/yy/gs/sample?strategy_id=$strategyId&category_id=$categoryId',
          pb: true);
      return ResAccostSampleList.fromBuffer(response.bodyBytes);
    } catch (e) {
      return ResAccostSampleList(success: false, msg: e.toString());
    }
  }

  /// 快乐星球:获取搭讪策略信息
  /// strategyId：搭讪策略ID
  /// categoryId：搭讪类型（TAB）ID
  static Future<ResGsChatMsgList> bbAccostStrategyInfo(
      int strategyId, int categoryId) async {
    try {
      XhrResponse response = await Xhr.get(
          '${System.domain}go/yy/gs/chatMsgList?strategy_id=$strategyId&category_id=$categoryId',
          pb: true);
      return ResGsChatMsgList.fromBuffer(response.bodyBytes);
    } catch (e) {
      return ResGsChatMsgList(success: false, msg: e.toString());
    }
  }

  /// 获取搭讪策略信息
  static Future<DataRsp<AccostStrategyConfig>> accostStrategyInfo(
      int strategyId) async {
    try {
      XhrResponse response = await Xhr.getJson(
          '${System.domain}go/mate/gs/chatMsgList?strategy_id=$strategyId',
          formatJson: true);
      return DataRsp<AccostStrategyConfig>.fromXhrResponse(
          response,
          (json) =>
              AccostStrategyConfig.fromJson(json as Map<String, dynamic>));
    } catch (e) {
      return DataRsp(success: false, msg: e.toString());
    }
  }

  /// 提交搭讪策略信息
  static Future<ResGsNull> commitBbAccostStrategyInfo(
      int categoryId, int strategyId, String? strategyName,
      {int nearest = 0, String? msgListStr, String? deleteListStr}) async {
    try {
      Map<String, String> body = {
        'category_id': '$categoryId',
        'strategy_name': strategyName ?? '',
        'nearest': '$nearest',
      };
      if (strategyId > 0) {
        body['strategy_id'] = '$strategyId';
      }
      if (msgListStr != null && msgListStr.isNotEmpty) {
        body['msg_list'] = msgListStr;
      }
      if (deleteListStr != null && deleteListStr.isNotEmpty) {
        body['delete_list'] = deleteListStr;
      }

      XhrResponse response = await Xhr.post(
          '${System.domain}go/yy/gs/updateChatMsg', body,
          pb: true);
      return ResGsNull.fromBuffer(response.bodyBytes);
    } catch (e) {
      return ResGsNull(msg: e.toString(), success: false);
    }
  }

  /// 提交搭讪策略信息
  static Future<NormalNull> commitAccostStrategyInfo(
      int strategyId, String strategyName,
      {String? msgListStr, String? deleteListStr}) async {
    try {
      Map<String, String> body = {
        'strategy_name': strategyName,
      };
      if (strategyId > 0) {
        body['strategy_id'] = '$strategyId';
      }
      if (msgListStr != null && msgListStr.isNotEmpty) {
        body['msg_list'] = msgListStr;
      }
      if (deleteListStr != null && deleteListStr.isNotEmpty) {
        body['delete_list'] = deleteListStr;
      }

      XhrResponse response = await Xhr.post(
          '${System.domain}go/mate/gs/updateChatMsg', body,
          pb: true);
      return NormalNull.fromBuffer(response.bodyBytes);
    } catch (e) {
      return NormalNull(msg: e.toString(), success: false);
    }
  }

  /// 快乐星球：选择某条搭讪策略
  /// strategyId：搭讪策略ID
  /// categoryId：搭讪类型（TAB）ID
  static Future<ResGsNull> selectBbAccostStrategy(
      int strategyId, int categoryId) async {
    try {
      XhrResponse response = await Xhr.post(
          '${System.domain}go/yy/gs/switchChatStrategy',
          {
            'strategy_id': '$strategyId',
            'category_id': '$categoryId',
          },
          pb: true);
      return ResGsNull.fromBuffer(response.bodyBytes);
    } catch (e) {
      return ResGsNull(msg: e.toString(), success: false);
    }
  }

  /// 选择某条搭讪策略
  static Future<NormalNull> selectAccostStrategy(int strategyId) async {
    try {
      XhrResponse response = await Xhr.post(
          '${System.domain}go/mate/gs/switchChatStrategy',
          {
            'strategy_id': '$strategyId',
          },
          pb: true,
          throwOnError: true);
      return NormalNull.fromBuffer(response.bodyBytes);
    } catch (e) {
      return NormalNull(msg: e.toString(), success: false);
    }
  }

  /// 快乐星球：删除某条搭讪策略
  /// strategyId：搭讪策略ID
  /// categoryId：搭讪类型（TAB）ID
  static Future<ResGsNull> deleteBbAccostStrategy(
      int strategyId, int categoryId) async {
    try {
      XhrResponse response = await Xhr.post(
          '${System.domain}go/yy/gs/delChatStrategy',
          {
            'strategy_id': '$strategyId',
            'category_id': '$categoryId',
          },
          pb: true);
      return ResGsNull.fromBuffer(response.bodyBytes);
    } catch (e) {
      return ResGsNull(msg: e.toString(), success: false);
    }
  }

  /// 删除某条搭讪策略
  static Future<NormalNull> deleteAccostStrategy(int strategyId) async {
    try {
      XhrResponse response = await Xhr.post(
          '${System.domain}go/mate/gs/delChatStrategy',
          {
            'strategy_id': '$strategyId',
          },
          pb: true);
      return NormalNull.fromBuffer(response.bodyBytes);
    } catch (e) {
      return NormalNull(msg: e.toString(), success: false);
    }
  }

  /// 快捷消息列表
  static Future<DataRsp<List<QuickMsgItem>>> quickMsgList(bool edit) async {
    try {
      XhrResponse response = await Xhr.getJson(
          '${System.domain}go/mate/user/quick_message/list?edit=$edit',
          formatJson: true);
      return DataRsp<List<QuickMsgItem>>.fromXhrResponse(
        response,
        (object) => Util.parseList(
            object, (e) => QuickMsgItem.fromJson(e as Map<String, dynamic>)),
      );
    } catch (e) {
      return DataRsp(success: false, msg: e.toString());
    }
  }

  /// 提交快捷消息列表
  static Future<BaseResponse> commitQuickMsgList(
      {String? msgListStr, String? deleteListStr}) async {
    try {
      Map<String, String> body = {};
      if (msgListStr != null && msgListStr.isNotEmpty) {
        body['msg_list'] = msgListStr;
      }
      if (deleteListStr != null && deleteListStr.isNotEmpty) {
        body['delete_list'] = deleteListStr;
      }

      XhrResponse response = await Xhr.post(
          '${System.domain}go/mate/user/quick_message/update', body,
          formatJson: true);
      return BaseResponse.fromJson(response.value() as Map<String, dynamic>);
    } catch (e) {
      Log.e(e);
      return BaseResponse(success: false, msg: e.toString());
    }
  }

  /// 消息页顶部横幅
  static Future<ResCloudBanner> getMessagePageTopBanner() async {
    try {
      XhrResponse response = await Xhr.get('${System.domain}go/yy/cloud/banner',
          pb: true, throwOnError: true);
      return ResCloudBanner.fromBuffer(response.bodyBytes);
    } catch (e) {
      return ResCloudBanner(success: false, msg: e.toString());
    }
  }

  /// 小号消息助手
  static Future<ResSmallAccountList> getSmallAccountList(
      {int needDetail = 0}) async {
    String url = "${System.domain}go/yy/small/list";
    try {
      String dtoken = Session.getString('dtoken', '');
      XhrResponse response = await Xhr.postPb(
          url, {'need_detail': '$needDetail', 'dtoken': dtoken});
      return ResSmallAccountList.fromBuffer(response.bodyBytes);
    } catch (e) {
      return ResSmallAccountList(success: false, msg: e.toString());
    }
  }

  /// 小号消息助手设置 - 修改
  static Future<NormalNull> updateSmallAccountSetting(String allow) async {
    String url = "${System.domain}go/yy/small/tipsSwitch";
    try {
      XhrResponse response = await Xhr.postPb(url, {'allow_tips': allow});
      return NormalNull.fromBuffer(response.bodyBytes);
    } catch (e) {
      return NormalNull(success: false, msg: e.toString());
    }
  }

  static Future<void> getSmallAccountSetting() async {
    String url = "${System.domain}go/yy/small/tipsSwitchState";
    try {
      XhrResponse response = await Xhr.postPb(url, {});
      ResTipsSwitchState res =
          ResTipsSwitchState.fromBuffer(response.bodyBytes);
      if (res.success) {
        Config.set('small_account_notify_switch_${Session.uid}',
            res.allowTips.toString());
      } else {
        Config.set('small_account_notify_switch_${Session.uid}', '1'); // 默认为 打开
      }
    } catch (e) {
      Config.set('small_account_notify_switch_${Session.uid}', '1'); // 默认为 打开
    }
  }

  static Future<NormalNull> deleteSmallAccount(int uid) async {
    String url = "${System.domain}go/yy/small/del";
    try {
      XhrResponse response = await Xhr.postPb(url, {'uid': '$uid'});
      return NormalNull.fromBuffer(response.bodyBytes);
    } catch (e) {
      return NormalNull(success: false, msg: e.toString());
    }
  }

  /// 获取自动回复设置
  static Future<DataRsp<List<AutoReply>>> autoReplyList() async {
    try {
      XhrResponse response = await Xhr.getJson(
          '${System.domain}go/mate/user/auto_reply/listV2',
          formatJson: true);
      return DataRsp<List<AutoReply>>.fromXhrResponse(
        response,
        (object) => Util.parseList(
            object, (e) => AutoReply.fromJson(e as Map<String, dynamic>)),
      );
    } catch (e) {
      return DataRsp(success: false, msg: e.toString());
    }
  }

  /// 提交自动回复设置
  static Future<NormalNull> commitAutoReplyList(
      {String? msgListStr, String? deleteListStr}) async {
    try {
      Map<String, String> body = {};
      if (msgListStr != null && msgListStr.isNotEmpty) {
        body['msg_list'] = msgListStr;
      }
      if (deleteListStr != null && deleteListStr.isNotEmpty) {
        body['delete_list'] = deleteListStr;
      }

      XhrResponse response = await Xhr.post(
          '${System.domain}go/mate/user/auto_reply/update', body,
          pb: true);
      return NormalNull.fromBuffer(response.bodyBytes);
    } catch (e) {
      return NormalNull(msg: e.toString(), success: false);
    }
  }

  /// 自动回复礼物选择
  static Future<DataRsp<List<GiftItem>>> autoReplyGiftList() async {
    try {
      XhrResponse response = await Xhr.getJson(
          '${System.domain}go/mate/gift/allGifts',
          formatJson: true);
      return DataRsp<List<GiftItem>>.fromXhrResponse(
        response,
        (object) => Util.parseList(
            object, (e) => GiftItem.fromJson(e as Map<String, dynamic>)),
      );
    } catch (e) {
      return DataRsp(success: false, msg: e.toString());
    }
  }

  /// 皮队友搭讪策略参考话术
  static Future<DataRsp<List<String>>> mateAccostStrategyExample() async {
    try {
      XhrResponse response = await Xhr.getJson(
          '${System.domain}go/mate/gs/chatMsgSample',
          formatJson: true);
      return DataRsp<List<String>>.fromXhrResponse(
        response,
        (object) => Util.parseList(object, (e) => e),
      );
    } catch (e) {
      return DataRsp(success: false, msg: e.toString());
    }
  }

  static Future<ResSmallAccountEntry> getSmallAccountTip() async {
    String url = "${System.domain}go/yy/small/entry";
    try {
      XhrResponse response = await Xhr.postPb(url, {});
      return ResSmallAccountEntry.fromBuffer(response.bodyBytes);
    } catch (e) {
      return ResSmallAccountEntry(success: false, msg: e.toString());
    }
  }

  static Future<ResAccostGsPermissions> getBbAccostObjectList() async {
    String url = "${System.domain}go/yy/gs/permission";
    try {
      XhrResponse response = await Xhr.postPb(url, {});
      return ResAccostGsPermissions.fromBuffer(response.bodyBytes);
    } catch (e) {
      return ResAccostGsPermissions(success: false, msg: e.toString());
    }
  }

  static Future<ResAccostGsRank> getBbAccostRankList(
      {required int type, required int nextId, String? rankName}) async {
    String url = "${System.domain}go/yy/gs/rank";
    try {
      XhrResponse response = await Xhr.postPb(url,
          {'type': '$type', 'next_id': '$nextId', 'rank_name': rankName ?? ''});
      return ResAccostGsRank.fromBuffer(response.bodyBytes);
    } catch (e) {
      return ResAccostGsRank(success: false, msg: e.toString());
    }
  }

  /// 好友在玩列表
  static Future<MatePlayingListResp> getFriendPlayingList(
      {required int page}) async {
    String url = '${System.domain}go/mate/friend/playingList?page=$page';
    try {
      XhrResponse response = await Xhr.get(url, pb: true);
      if (response.error == null) {
        MatePlayingListResp rsp =
            MatePlayingListResp.fromBuffer(response.bodyBytes);
        return rsp;
      } else {
        return MatePlayingListResp(
            success: false, msg: response.error.toString());
      }
    } catch (e) {
      return MatePlayingListResp(success: false, msg: e.toString());
    }
  }

  /// 智能招呼 提醒开启
  static Future<ResImCloudTips> getCloudSmartTips() async {
    String url = "${System.domain}go/yy/cloud/tips";
    try {
      XhrResponse response = await Xhr.get(url, pb: true, throwOnError: false);
      return ResImCloudTips.fromBuffer(response.bodyBytes);
    } catch (e) {
      return ResImCloudTips(success: false, msg: e.toString());
    }
  }

  /// 打赏消息（陌生人）
  static Future<ApiRankRewardStrangerResponse> getRewardStrangerList(
      int page, int sort) async {
    String url = "${System.domain}go/room/ranking/rewardStranger";
    try {
      XhrResponse response = await Xhr.get(url,
          queryParameters: {'page': page, 'sort': sort}, pb: true);
      return ApiRankRewardStrangerResponse.fromBuffer(response.bodyBytes);
    } catch (e) {
      return ApiRankRewardStrangerResponse(
          success: false, message: e.toString());
    }
  }

  /// 打赏消息（陌生人）- 清空未读数
  static Future<NormalNull> resetRewardStrangerItem(int uid) async {
    String url = "${System.domain}go/room/ranking/resetRewardStranger";
    try {
      XhrResponse response =
          await Xhr.get(url, queryParameters: {'uid': uid}, pb: true);
      return NormalNull.fromBuffer(response.bodyBytes);
    } catch (e) {
      return NormalNull(success: false, msg: e.toString());
    }
  }
}
