import 'dart:convert';
import 'dart:io';

import 'package:crypto/crypto.dart';
import 'package:dio/dio.dart';
import 'package:path/path.dart';
import 'package:shared/model/invite_fans_rsp.dart';
import 'package:shared/model/liveListRsp.dart';
import 'package:shared/model/models.dart';
import 'package:shared/model/oss_upload_data.dart';
import 'package:shared/shared.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'entity/settingsInfoRsp.dart';

class BaseRequestManager {
  // 12升13 客服系统多轮对话
  //16：嗨歌私聊专属彩蛋
  //17：客服自动应答
  static const int GoCloudProfileVersion = 17;

  static const String ChatEggTitlePrefix = 'CHAT_EGG';
  static const String ChatEggTitleTextPrefix = 'CHAT_EGG_TEXT';
  static const String ChatEggTitleTextColorPrefix = 'CHAT_EGG_TEXT_COLOR';
  static const String ChatEggTitleBorderColorPrefix = 'CHAT_EGG_BORDER_COLOR';

  static const String ChatEggTitleChangedEvent = 'chat_egg_title_changed_event';

  static Future<CryptSaltRsp?> getCryptSalt() async {
    try {
      String url = "${System.domain}crypt/salt";
      Map<String, String> params = {};
      XhrResponse response = await Xhr.postJson(url, params, throwOnError: false, tryNum: 3);
      Map res = response.value();
      CryptSaltRsp rsp = CryptSaltRsp.fromJson(Util.parseStrKeyMap(res));
      return rsp;
    } catch (e, s) {
      Log.e(e, stackTrace: s);
      return null;
    }
  }

  static Future<Map<dynamic, dynamic>?> checkin(String type, String date, {String missionId = ''}) async {
    try {
      String url = "${System.domain}mission/signin";

      String emulatorInfoStr = Util.emulatorInfo;
      String isRootedStr = Util.isRooted ? '1' : '0';
      Map<String, String> params = {
        'type': type,
        'date': date,
        'mission_id': missionId,
        'version': "3",
        'emulatorInfo': emulatorInfoStr,
        'isRooted': isRootedStr
      };

      XhrResponse response = await Xhr.postJson(url, params, throwOnError: false, tryNum: 3);
      Map res = response.value();
      return res;
    } catch (e) {
      Log.d(e);
      return null;
    }
  }

  static Future<Map<dynamic, dynamic>?> getAward(String missionType, String missionId) async {
    try {
      String url = "${System.domain}mission/getaward";

      String emulatorInfoStr = Util.emulatorInfo;
      String isRootedStr = Util.isRooted ? '1' : '0';
      Map<String, String> params = {
        'mission_type': missionType,
        'mission_id': missionId,
        'emulatorInfo': emulatorInfoStr,
        'isRooted': isRootedStr
      };

      XhrResponse response = await Xhr.postJson(url, params, throwOnError: false, tryNum: 3);
      Map res = response.value();
      return res;
    } catch (e) {
      Log.d(e);
      return null;
    }
  }

  /// 查询关注状态
  /// return null.异常了，1为关注，2为好友
  static Future<int> queryFollowStatus(int uid, {bool toastError = true}) async {
    Map<int, int> followList = await batchQueryFollowStatus([uid], toastError: toastError);
    int follow = 0;
    if (followList.containsKey(uid)) {
      follow = followList[uid]!;
    }
    return follow;
  }

  /// 查询关注状态
  /// 返回关注列表数据，Tuple2 第一个值为uid
  /// 第二个值为 1为关注，2为好友
  static Future<Map<int, int>> batchQueryFollowStatus(List<int> uids, {bool toastError = true}) async {
    XhrResponse response =
        await Xhr.postJson("${System.domain}go/yy/friend/isFollow", {'uids': uids.join(',')}, throwOnError: false, formatJson: true);
    if (response.error == null) {
      Map res = response.value();
      if (res['success'] == true) {
        List<Map> results = Util.parseList(res['data'], ((e) => Util.parseMap(e)));
        Map<int, int> followData = <int, int>{};
        for (var e in results) {
          int follow = Util.parseInt(e['follow']);
          int friend = Util.parseInt(e['friend']);
          followData[Util.parseInt(e['uid'])] = friend > 0 ? 2 : (follow > 0 ? 1 : 0);
        }
        return followData;
      } else {
        if (toastError == true && res['msg'] != null) {
          Fluttertoast.showToast(msg: res['msg'], gravity: ToastGravity.CENTER);
        }
      }
    } else if (toastError == true) {
      Fluttertoast.showToast(msg: response.error.toString(), gravity: ToastGravity.CENTER);
    }
    return {};
  }

  /// 关注
  /// [uid] 用户id
  static Future<NormalNull> onFollow(
    String uid, {
    int rid = 0,
    int topicId = 0,
    String refer = '',
    String roomType = '',
    String gameType = '',
    String searchContent = '',
    String settlementChannel = '',
    String roomFactoryType = '',
    String typeLabel = '',
  }) async {
    try {
      String url = '${System.domain}go/yy/friend/follow';
      Map<String, String> body = {
        'uid': uid,
        'channel': FollowChannel.getChannel(refer),
        if (searchContent.isNotEmpty) 'search_content': searchContent,
        if (topicId > 0) 'topic_id': '$topicId',
      };

      XhrResponse response = await Xhr.post(url, body, pb: true);
      NormalNull data = NormalNull.fromBuffer(response.bodyBytes);

      if (data.success) {
        /// 统计关注事件
        IMainManager mainManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_MAIN);
        mainManager.trackEvent(AppsFlyerEvent.FOLLOW, eventValue: {AppsFlyerParameter.TARGET_ID: uid});

        Tracker.instance.track(TrackEvent.follow, properties: {
          'target_uid': uid,
          'rid': rid,
          'refer': refer,
          'room_type': roomType,
          'game_type': gameType,
          if (searchContent.isNotEmpty) 'search_content': searchContent,
          if (settlementChannel.isNotEmpty) 'settlement_channel': settlementChannel,
          if (roomFactoryType.isNotEmpty) 'room_factory_type': roomFactoryType,
          if (typeLabel.isNotEmpty) 'type_label': typeLabel,
        });
        eventCenter.emit(EventConstant.UserFollow, {'follow': true, 'uid': uid});
      }
      Log.d('NormalNull:${data.success}  ${data.msg}');
      return data;
    } catch (e) {
      Log.d('NormalNull:$e');
      return NormalNull(msg: e.toString(), success: false);
    }
  }

  /// 取消关注
  /// [uid] 用户id
  static Future<NormalNull> unFollow(String uid) async {
    try {
      String url = '${System.domain}go/yy/friend/unfollow';
      XhrResponse response = await Xhr.post(url, {'uid': uid}, pb: true);
      NormalNull data = NormalNull.fromBuffer(response.bodyBytes);
      if (data.success) {
        eventCenter.emit(EventConstant.UserFollow, {'follow': false, 'uid': uid});
      }
      return data;
    } catch (e) {
      return NormalNull(msg: e.toString(), success: false);
    }
  }

  ///关注多个
  /// [uids] 用户id
  static Future<NormalNull> followAll(List<String> uids) async {
    try {
      String url = '${System.domain}go/yy/friend/follows';
      List<int> intList = uids.map((e) => Util.parseInt(e)).toList();
      XhrResponse response = await Xhr.post(url, {'uids': jsonEncode(intList)}, pb: true);
      NormalNull data = NormalNull.fromBuffer(response.bodyBytes);
      return data;
    } catch (e) {
      return NormalNull(msg: e.toString(), success: false);
    }
  }

  /// 拉黑
  /// [uid] 用户id
  static Future<BaseResponse> blockAction(String uid, bool block) async {
    try {
      XhrResponse response = await Xhr.postJson(
        "${System.domain}block/action/?version=1&uid=$uid",
        {
          'type': block ? 'block' : 'unblock',
        },
        throwOnError: false,
      );
      if (response.error == null) {
        BaseResponse baseResponse = BaseResponse.fromJson(response.value() as Map<String, dynamic>);
        return baseResponse;
      } else {
        return BaseResponse(msg: response.error.toString(), success: false);
      }
    } catch (e) {
      return BaseResponse(msg: e.toString(), success: false);
    }
  }

  /// 拉黑
  /// [uid] 用户id
  static Future<ProfileDefendResponse> getDefendProfile(int uid) async {
    try {
      XhrResponse response = await Xhr.getJson(
        "${System.domain}profile/defend/?version=1&uid=$uid",
        throwOnError: true,
      );

      if (response.error == null) {
        ProfileDefendResponse baseResponse = ProfileDefendResponse.fromJson(response.value() as Map<String, dynamic>);
        return baseResponse;
      } else {
        return ProfileDefendResponse(msg: response.error.toString(), success: false);
      }
    } catch (e) {
      return ProfileDefendResponse(msg: e.toString(), success: false);
    }
  }

  /// 佩戴守护
  /// [defend] 被守护者
  /// [position] 佩戴守护类型
  static Future<BaseResponse> onChangeDefend(int defend, int position) async {
    try {
      XhrResponse response = await Xhr.postJson(
        "${System.domain}defend/change",
        {
          'defend': '$defend',
          'position': '$position',
        },
        throwOnError: false,
      );
      if (response.error == null) {
        BaseResponse baseResponse = BaseResponse.fromJson(response.value() as Map<String, dynamic>);
        return baseResponse;
      } else {
        return BaseResponse(msg: response.error.toString(), success: false);
      }
    } catch (e) {
      return BaseResponse(msg: e.toString(), success: false);
    }
  }

  static Future<SettingsInfoRsp?> getSettingsInfo() async {
    try {
      String url = "${System.domain}account/setinfo?v=8";
      Map<String, String> params = {};
      XhrResponse response = await Xhr.postJson(url, params, throwOnError: false, tryNum: 3);
      SettingsInfoRsp rsp = SettingsInfoRsp.fromJson(response.value() as Map<String, dynamic>);
      return rsp;
    } catch (e) {
      Log.d(e);
      return null;
    }
  }

  /// 账号信息
  /// 返回是否动态运营账号
  static Future<bool> isOperatorAccount() async {
    if (!Session.isLogined) return false;
    String url = '${System.domain}rush/account/isOperator?uid=${Session.uid}';
    try {
      XhrResponse response = await Xhr.getJson(url, throwOnError: true);
      Map res = response.value();
      if (res['success'] == true && res['data'] != null) {
        Map data = res['data'];
        return data['operator'] ?? false;
      } else {
        return false;
      }
    } catch (e) {
      Log.d(e);
      return false;
    }
  }

  /// 获取最新一条朋友圈的用户信息（红点）
  static Future<bool> hasRecentTopic() async {
    if (!Session.isLogined) return false;
    return hasRecentTopicV2();
  }

  /// 获取最新一条朋友圈的用户信息（红点）
  static Future<bool> hasRecentTopicV2() async {
    String url = '${System.domain}go/yy/circle/topicnew/';
    try {
      XhrResponse response = await Xhr.get(url, pb: true, throwOnError: false);

      ResTopicNew topic = ResTopicNew.fromBuffer(response.bodyBytes);
      if (topic.success && topic.hasData()) {
        return topic.data.num > 0;
      }

      return false;
    } catch (e) {
      Log.d(e);
      return false;
    }
  }

  /// 交友卡点击上报
  /// [tpid] 动态id
  static void reportFriendCardClick(int fcardId) {
    String url = '${System.domain}report/fcardClick';
    try {
      Xhr.postJsonWithoutParse(
        url,
        {
          'fcardId': '$fcardId',
        },
      );
    } catch (e) {
      Log.d(e);
    }
  }

  /// 匹配聊天点击上报
  /// [tpid] 动态id
  static Future<BaseResponse> reportMatchClick(int uid) async {
    String url = '${System.domain}report/matchChat';
    try {
      XhrResponse response = await Xhr.postJson(
        url,
        {
          'uid': '$uid',
        },
        throwOnError: true,
      );
      if (response.error != null) {
        Log.d(response.error.toString());
        return BaseResponse(msg: response.error.toString(), success: false);
      }
      try {
        return BaseResponse.fromJson(response.value() as Map<String, dynamic>);
      } catch (e) {
        Log.d(e);
        return BaseResponse(msg: R.array('xhr_error_type_array')[6], success: false);
      }
    } catch (e) {
      Log.d(e);
      return BaseResponse(msg: e.toString(), success: false);
    }
  }

  /// 用户背包红点
  static Future<bool> hasBagRedPoint() async {
    String url = "${System.domain}go/yy/commodity/userNew";
    try {
      XhrResponse response = await Xhr.get(url, pb: true, throwOnError: false);
      RepCommodityUserNew data = RepCommodityUserNew.fromBuffer(response.bodyBytes);
      return data.data;
    } catch (e) {
      return false;
    }
  }

  /// 获取应用首次进入动态默认TAB，优先级高于动态红点（hasRecentTopic）
  /// -1: 后台不做强制干预
  /// 0: 强制定位到【推荐】TAB
  /// 1：强制定位到【关注】TAB
  static Future<int> getDynamicDefaultTabByServer() async {
    if (!Session.isLogined) return -1;
    String url = "${System.domain}go/yy/circle/defaultTab";

    try {
      XhrResponse response = await Xhr.get(url, pb: true, throwOnError: false);
      RepCircleDefaultTab data = RepCircleDefaultTab.fromBuffer(response.bodyBytes);
      if (data.success) {
        return data.data;
      }

      return -1;
    } catch (e) {
      return -1;
    }
  }

  static Future<LiveListRsp?> getLiveList(int page, String type, {String? source}) async {
    try {
      String url = '${System.domain}list/live/?version=3&type=$type&page=$page';
      if (Util.validStr(source)) {
        url = '$url&source=$source';
      }
      final Map<String, String> params = {};
      XhrResponse response = await Xhr.postJson(url, params, throwOnError: true);
      Map res = response.value();
      LiveListRsp rsp = LiveListRsp.fromJson(res);
      return rsp;
    } catch (e) {
      Log.d(e);
      return null;
    }
  }

  // 首页主播粉丝团TAB，房间
  static Future<LiveListRsp?> getGroupFansList(int page, int groupId) async {
    try {
      String url = '${System.domain}kolfans/playing?kfg_id=$groupId&page=$page';
      final Map<String, String> params = {};
      XhrResponse response = await Xhr.postJson(url, params, throwOnError: true);
      Map res = response.value();
      LiveListRsp rsp = LiveListRsp.fromJson(res);
      return rsp;
    } catch (e) {
      Log.d(e);
      return null;
    }
  }

  ///邀请粉丝进房
  static Future<InviteFansResp> inviteFansJoinRoom(String rid) async {
    String url = '${System.domain}invite/inviteFansJoinRoom';
    try {
      Map<String, String> map = {
        'rid': rid,
      };
      XhrResponse response = await Xhr.postJson(url, map);
      if (response.error != null) {
        Log.d(response.error.toString());
        return InviteFansResp(msg: response.error.toString(), success: false);
      }
      final responseData = response.value();
      if (responseData is! Map<String, dynamic>) {
        return InviteFansResp(msg: '${response.value()}', success: false);
      }
      return InviteFansResp.fromJson(responseData);
    } catch (e) {
      return InviteFansResp(msg: e.toString(), success: false);
    }
  }

  static Future<OssUploadDataResp> getFileUploadUrl(String type) async {
    try {
      // 在46环境测试上传音频文件的时候 domain换dev 处理返回参数不正确导致上传400错误
      XhrResponse response = await Xhr.postJson("${System.domain}upload/getUploadPromise", {'upload_type': type}, throwOnError: false);
      if (response.error != null) {
        Log.d(response.error.toString());
        return OssUploadDataResp(msg: response.error.toString(), success: false);
      }

      Map res = response.value();
      if (!(res['success'] ?? false)) {
        return OssUploadDataResp(msg: res['msg'], success: false);
      }
      try {
        OssUploadDataResp responseData = OssUploadDataResp.fromJson(res as Map<String, dynamic>);
        return responseData;
      } catch (e) {
        Log.d("getFileUploadUrl error and e msg = ${e.toString()}");

        return OssUploadDataResp(msg: R.array('xhr_error_type_array')[6], success: false);
      }
    } catch (e) {
      return OssUploadDataResp(msg: e.toString(), success: false);
    }
  }

  static String getOssFilePath(String dir, File file) {
    String fileMd5 = md5.convert(file.readAsBytesSync()).toString();

    String filename = basename(file.path);
    String key = '$dir/$fileMd5.${filename.split(".")[1]}';
    return key;
  }

  static Future<bool> uploadFile(
    OssUploadData params,
    File file, {
    ProgressCallback? onSendProgress,
    CancelToken? cancelToken,
  }) async {
    String key = getOssFilePath(params.dir, file);
    Map<String, dynamic> map = {};
    map["key"] = key;
    map["policy"] = params.policy;
    map["OSSAccessKeyId"] = params.accessid;
    map["success_action_status"] = ["200"];
    map["callback"] = params.callback;
    map["signature"] = params.signature;
    map["file"] = await MultipartFile.fromFile(file.path);
    FormData formData = FormData.fromMap(map);
    Dio dio = Dio();
    Log.d('上传音频文件 post ');
    Response response = await dio.post(params.host, data: formData, onSendProgress: onSendProgress, cancelToken: cancelToken);

    dynamic data = response.data;

    Log.d('上传音频文件 respose = $response');

    if (data != null && data is Map) {
      return data['success'] == true;
    }
    return false;
  }

  static Future<BaseResponse> editAccountInfo(String name, String value) async {
    String url = "${System.domain}account/edit";
    try {
      XhrResponse response = await Xhr.postJson(url, {'key': name, 'value': value});
      return BaseResponse.parse(response);
    } catch (e) {
      Fluttertoast.toastException(exp: e, gravity: ToastGravity.CENTER);
      return BaseResponse(success: false, msg: '');
    }
  }

  /// 关注
  /// [uid] 用户id
  static Future<BaseResponse> onFollowForKiller(
    String uid, {
    int rid = 0,
    int juben_id = 0,
    String refer = '',
    String roomType = '',
    String gameType = '',
    String searchContent = '',
    String settlementChannel = '',
    String roomFactoryType = '',
    String typeLabel = '',
  }) async {
    try {
      XhrResponse response = await Xhr.postJson(
        "${System.domain}friend/follow?version=1",
        {'uid': uid, 'channel': FollowChannel.getChannel(refer)},
      );
      if (response.error == null) {
        BaseResponse baseResponse = BaseResponse.fromJson(response.value() as Map<String, dynamic>);
        if (baseResponse.success) {
          /// 统计关注事件
          IMainManager mainManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_MAIN);
          mainManager.trackEvent(AppsFlyerEvent.FOLLOW, eventValue: {AppsFlyerParameter.TARGET_ID: uid});

          Tracker.instance.track(TrackEvent.follow, properties: {
            'target_uid': uid,
            'rid': rid,
            'juben_id': juben_id,
            'refer': refer,
            'room_type': roomType,
            'game_type': gameType,
            if (searchContent.isNotEmpty) 'search_content': searchContent,
            if (settlementChannel.isNotEmpty) 'settlement_channel': settlementChannel,
            if (roomFactoryType.isNotEmpty) 'room_factory_type': roomFactoryType,
            if (typeLabel.isNotEmpty) 'type_label': typeLabel,
          });

          eventCenter.emit(EventConstant.UserFollow, {'follow': true, 'uid': uid});
        }
        return baseResponse;
      } else {
        return BaseResponse(msg: response.error.toString(), success: false);
      }
    } catch (e) {
      return BaseResponse(msg: e.toString(), success: false);
    }
  }

  /// 取消关注
  /// [uid] 用户id
  static Future<BaseResponse> unFollowForKiller(String uid) async {
    try {
      XhrResponse response = await Xhr.postJson(
        "${System.domain}friend/unfollow?version=1",
        {
          'uid': uid,
        },
      );
      if (response.error == null) {
        eventCenter.emit(EventConstant.UserFollow, {'follow': false, 'uid': uid});
        BaseResponse baseResponse = BaseResponse.fromJson(response.value() as Map<String, dynamic>);
        return baseResponse;
      } else {
        return BaseResponse(msg: response.error.toString(), success: false);
      }
    } catch (e) {
      return BaseResponse(msg: e.toString(), success: false);
    }
  }

  static Future<BaseResponse> uploadASAToken(String token, String idfa) async {
    try {
      XhrResponse response = await Xhr.postJson(
        "${System.domain}/welcome/ascribe",
        {'token': token, 'idfa': idfa},
      );
      if (response.error == null) {
        BaseResponse baseResponse = BaseResponse.fromJson(response.value() as Map<String, dynamic>);
        return baseResponse;
      } else {
        return BaseResponse(msg: response.error.toString(), success: false);
      }
    } catch (e) {
      return BaseResponse(msg: e.toString(), success: false);
    }
  }

  ///
  /// uids 用户uid
  /// groudIds 群id
  /// from 打招呼消息列表使用
  /// roomConfig 用户所属的房间信息
  /// groupConfig 群信息
  /// cacheUserInfo 存储用户信息
  ///
  static Future<ResCloudAll> cloudAll(
    List<String> uids, {
    List<String>? groudIds,
    String? from,
    Map<int, UserConfig>? roomConfig,
    Map<int, UserConfig>? groupConfig,
    bool cacheUserInfo = false,
  }) async {
    String url = '${System.domain}go/yy/cloud/all';

    Map<String, String> params = {
      'uids': uids.join(','),
      'ver': '2',
      if (groudIds != null && groudIds.isNotEmpty) 'group_ids': groudIds.join(','),
      if (from != null && from.isNotEmpty) 'from': from,
    };

    XhrResponse response = await Xhr.post(url, params, pb: true, throwOnError: false);
    try {
      ResCloudAll data = ResCloudAll.fromBuffer(response.bodyBytes);
      if (data.success == true) {
        if (roomConfig != null) {
          for (var e in uids) {
            roomConfig.remove(Util.parseInt(e));
          }

          if (data.config.isNotEmpty) {
            for (var e in data.config) {
              int uid = e.hasUid() ? e.uid : 0;
              roomConfig[uid] = UserConfig.fromCloudRoomConfig(e);
            }
          }
        }

        if (data.groupConfig.isNotEmpty && groupConfig != null) {
          for (var e in data.groupConfig) {
            int groudId = e.hasGroupId() ? e.groupId : 0;
            groupConfig[groudId] = UserConfig.fromCloudGroupConfig(e);
          }
        }

        if (data.users.isNotEmpty && cacheUserInfo == true) {
          for (int i = 0; i < data.users.length; i++) {
            CloudChatUser user = data.users[i];

            // 私聊彩蛋称号
            SharedPreferences pref = await SharedPreferences.getInstance();
            int oldChatEggTitile = pref.getInt('${ChatEggTitlePrefix}_${user.uid}_${Session.uid}') ?? 0;

            pref.setInt('${ChatEggTitlePrefix}_${user.uid}_${Session.uid}', user.chatEggTitle);

            // 嗨歌新增逻辑 做通用处理
            if (!Util.isStringEmpty(user.chatEggTitleName)) {
              pref.setString('${ChatEggTitleTextPrefix}_${user.uid}_${Session.uid}', user.chatEggTitleName);
            }
            if (!Util.isStringEmpty(user.chatEggTitleColor)) {
              pref.setString('${ChatEggTitleTextColorPrefix}_${user.uid}_${Session.uid}', user.chatEggTitleColor);
            }
            if (!Util.isCollectionEmpty(user.chatEggTitleBolder)) {
              pref.setStringList('${ChatEggTitleBorderColorPrefix}_${user.uid}_${Session.uid}', user.chatEggTitleBolder);
            }

            if (oldChatEggTitile != user.chatEggTitle) {
              eventCenter.emit(ChatEggTitleChangedEvent);
            }

            await CachedNames.instance().set(UserInfo.fromJson(user.writeToJsonMap()), false);
          }
        }
      }

      return data;
    } catch (e) {
      return ResCloudAll(msg: e.toString(), success: false);
    }
  }

  static Future<ResCloudProfile> cloudProfile(
    String uid, {
    String? type,
    String? relationShip,
    String? relationScore,
    String? skill,
    String? skillCid,
    String? profileIntegrity,
    String? intimacy,
  }) async {
    String url = '${System.domain}go/yy/cloud/profile';

    Map<String, String> queryParameters = {
      if (!Util.isStringEmpty(uid)) 'uid': uid,
      if (!Util.isStringEmpty(type)) 'type': type!,
      'version': GoCloudProfileVersion.toString(),
      if (!Util.isStringEmpty(relationShip)) 'relationship': relationShip!,
      if (!Util.isStringEmpty(relationScore)) 'relation_score': relationScore!,
      if (!Util.isStringEmpty(skill)) 'skill': skill!,
      if (!Util.isStringEmpty(skillCid)) 'skill_cid': skillCid!,
      if (!Util.isStringEmpty(profileIntegrity)) 'profile_integrity': profileIntegrity!,
      if (!Util.isStringEmpty(intimacy)) 'intimacy': intimacy!,
    };

    try {
      XhrResponse response = await Xhr.get(url, queryParameters: queryParameters, pb: true, throwOnError: true);
      ResCloudProfile data = ResCloudProfile.fromBuffer(response.bodyBytes);
      return data;
    } catch (e) {
      return ResCloudProfile(msg: e.toString(), success: false);
    }
  }

  ///打招呼时，以下情况不能给指定用户发消息:
  ///1.不能给系统用户发（排除客服/vip客服）巡管不受这个限制；
  /// 2.客服系统优化：有个展示/隐藏输入的开关（具体逻辑问下yaoqi）；
  /// 3.被封禁；
  /// 4.对方开启私聊保护，对方未关注我，对方未给我发过消息；
  static Future<bool> checkCanSendMsgWhenSayHi(int targetUid, String conversationType) async {
    ResCloudProfile profile = await BaseRequestManager.cloudProfile(targetUid.toString());
    if (profile.success && profile.hasData()) {
      CloudProfileData data = profile.data;
      int strangerMsg = data.strangerMsg;
      int fans = data.fans;
      int familiarR = data.familiarR; // 对方是否给我发送过消息，1：发送过
      bool isSuper = data.isSuper; //是否是巡管
      bool disabled = !ChatUtil.isSystemUser(targetUid) && strangerMsg == 0 && fans == 0 && familiarR == 0;
      bool hiddenInput = conversationType == ConversationType.Private &&
          ChatUtil.isSystemUser(targetUid) &&
          ChatUtil.isCustomerService(targetUid) == false &&
          ChatUtil.isVipCustomerService(targetUid) == false;
      hiddenInput |= conversationType == ConversationType.Private && isSuper;
      bool forbidden = Session.getInt('deleted', 0) > 1;
      return !forbidden && !disabled && !hiddenInput;
    } else {
      return false;
    }
  }

  /// 查询用户所在房间id
  /// [uid] 用户id
  static Future<int> getRoomId(int uid) async {
    try {
      XhrResponse response = await Xhr.getJson('${System.domain}rush/profile/room?uid=$uid', throwOnError: false);
      Map res = response.value();
      if (res['success'] == true && res['data'] != null) {
        return Util.parseInt((res['data'] as Map)['rid']);
      }
    } catch (e) {
      Log.d(e.toString());
    }
    return 0;
  }

  /// 检验房间是否可以跳转
  /// 如果房间开播 可以跳转
  static Future<ResTopRoomJump> checkRoomCanActivity(int rid) async {
    try {
      String url = "${System.domain}go/yy/roomlist/topRoomJump";
      XhrResponse response = await Xhr.post(url, {'rid': rid.toString()}, throwOnError: true, pb: true);
      ResTopRoomJump res = ResTopRoomJump.fromBuffer(response.bodyBytes);
      return res;
    } catch (e) {
      return ResTopRoomJump(success: false, msg: e.toString());
    }
  }
}
