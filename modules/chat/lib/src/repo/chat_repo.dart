import 'package:chat/src/model/pbModel/generated/chat_egg.pb.dart';
import 'package:chat/src/model/pbModel/generated/chat_hi.pb.dart';
import 'package:shared/shared.dart';

import '../model/pbModel/generated/chat_account_info.pb.dart';

class ChatRepo {
  static const _weddingUrl = 'games/wedding/proposeRetry';

  static Future<ResCloudProfile> getGroupConfig(int groupId) async {
    try {
      ResCloudProfile data = await BaseRequestManager.cloudProfile(groupId.toString(), type: 'group');
      return data;
    } catch (e) {
      return ResCloudProfile(msg: '$e', success: false);
    }
  }

  static Future<ResAccountUserInfo> getUserInfo(int uid) async {
    String url = '${System.domain}go/yy/account/getUserInfo';
    try {
      XhrResponse response = await Xhr.post(
          url,
          {
            'uid': '$uid',
            'ver': Constant.appVersion,
          },
          pb: true,
          throwOnError: true);
      return ResAccountUserInfo.fromBuffer(response.bodyBytes);
    } catch (e) {
      return ResAccountUserInfo(msg: '$e', success: false);
    }
  }

  static Future<SetBgImgResNormal> setChatBgImg(int otherUid, int id, int op) async {
    String url = '${System.domain}go/yy/account/setChatBgImage';
    try {
      XhrResponse response = await Xhr.post(
          url,
          {
            'to_uid': '$otherUid',
            'id': '$id',
            'opt': '$op',
          },
          pb: true,
          throwOnError: true);
      return SetBgImgResNormal.fromBuffer(response.bodyBytes);
    } catch (e) {
      return SetBgImgResNormal(msg: '$e', success: false);
    }
  }

  // 私聊彩蛋任务状态
  static Future<ResChatEggTips> getChatEggTips(int chatEggId) async {
    String url = '${System.domain}go/yy/chategg/tips?api_version=2';
    try {
      XhrResponse response = await Xhr.get(url, queryParameters: {'chat_egg_id': chatEggId.toString()}, pb: true);
      return ResChatEggTips.fromBuffer(response.bodyBytes);
    } catch (e) {
      return ResChatEggTips(msg: e.toString(), success: false);
    }
  }

  // 聊天彩蛋详情
  static Future<ResChatEggDetail> getChatEggDetail(int chatEggId) async {
    String url = '${System.domain}go/yy/chategg/detail?api_version=1';
    try {
      XhrResponse response = await Xhr.get(url, queryParameters: {'chat_egg_id': chatEggId.toString()}, pb: true);
      return ResChatEggDetail.fromBuffer(response.bodyBytes);
    } catch (e) {
      return ResChatEggDetail(msg: e.toString(), success: false);
    }
  }

  static Future<ResMsgList> getSayHiMsgList() async {
    String url = '${System.domain}go/hisong/chat/msgList';
    try {
      XhrResponse response = await Xhr.postPb(url, {});
      return ResMsgList.fromBuffer(response.bodyBytes);
    } catch (e) {
      return ResMsgList(success: false, msg: e.toString());
    }
  }

  ///上报在线匹配通知的用户点击行为
  static Future<BaseResponse> reportMatchNotificationAction(int action) async {
    String url = '${System.domain}go/hisong/chat/setChatMatchClick';
    try {
      XhrResponse response = await Xhr.postPb(url, {
        'caller': '1', // 匹配来源 0：用户主动发起 1：系统辅助发起
        'click_button': '$action', // 操作类型 0: 点击关闭 1: 接受匹配
      });
      return BaseResponse.parse(response);
    } catch (e) {
      return BaseResponse(success: false, msg: e.toString());
    }
  }

  /// 重发结婚消息
  static Future<BaseResponse> weddingProposeRetry({required int to, required int rid, required int giftId, required String content}) async {
    try {
      XhrResponse response = await Xhr.postJson(
        _weddingUrl,
        {
          'to': to.toString(),
          'rid': rid.toString(),
          'giftId': giftId.toString(),
          'content': content,
        },
      );
      return BaseResponse.parse(response);
    } catch (e) {
      return BaseResponse(msg: '$e', success: false);
    }
  }

  /// 命中敏感词上报
  static Future<ResForbidDirtMsg> reportHitSensitive(int targetId, String imCode, String? imMsg) async {
    try {
      XhrResponse response = await Xhr.postPb(
        '${System.domain}go/yy/im/forbidDirtMsg',
        {
          'tart_uid': targetId.toString(),
          'im_code': imCode,
          'im_msg': imMsg ?? '',
          'channel': DeviceInfo.channel,
        },
      );
      return ResForbidDirtMsg.fromBuffer(response.bodyBytes);
    } catch (e) {
      return ResForbidDirtMsg(success: false, msg: e.toString());
    }
  }

  /// 开启消息防打扰
  static Future<BaseResponse> closeMsgReceiver() async {
    try {
      XhrResponse response = await Xhr.postJson("${System.domain}account/strangermsg", {'value': '0'});
      return BaseResponse.parse(response);
    } catch (e) {
      return BaseResponse(msg: '$e', success: false);
    }
  }
}
