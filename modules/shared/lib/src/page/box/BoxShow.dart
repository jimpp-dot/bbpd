import 'dart:async';
import 'dart:convert';

import 'package:shared/shared.dart';
import 'package:shared/k.dart';
import 'package:shared/model/online_notify_model.dart';
import 'package:shared/src/page/box/global_app_anim_widget.dart';
import 'package:shared/src/page/box/recommend_room_screen.dart';
import 'package:shared/widget/invite_room.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

import 'displayGift.dart';

class BoxShowTool {
  static OverlayEntry? _overlayEntry;

  static init() {
    WidgetsBinding.instance.addPostFrameCallback((Duration timeStamp) async {
      dispose();
      var overlayState = Overlay.of(System.context);
      OverlayEntry overlayEntry;
      overlayEntry = OverlayEntry(builder: (context) {
        return const BoxShow();
      });
      _overlayEntry = overlayEntry;
      overlayState.insert(overlayEntry);
    });
  }

  static dispose() {
    if (_overlayEntry != null) {
      _overlayEntry?.remove();
      _overlayEntry = null;
    }
  }
}

class BoxShow extends StatefulWidget {
  const BoxShow({Key? key}) : super(key: key);

  @override
  _BoxShowState createState() => _BoxShowState();
}

class _BoxShowState extends State<BoxShow> {
  final IRoomManager _roomManager =
      ComponentManager.instance.getManager(ComponentManager.MANAGER_BASE_ROOM);
  final IChatManager _chatManager =
      ComponentManager.instance.getManager(ComponentManager.MANAGER_CHAT);
  final ILoginManager _loginManager =
      ComponentManager.instance.getManager(ComponentManager.MANAGER_LOGIN);
  DialogLoadingController? _controller;

  Timer? _showTimer;
  bool _canDisplayMessage = true;

  bool playing = false;
  bool boxAccessDisplaying = false;
  final List<GiftConfig> _gifts = [];
  final List<GiftConfig> _queue = [];

  final GlobalKey _gameRestoreKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    eventCenter.addListener('Navigator.Page.Pop', _onPageChanged);
    eventCenter.addListener('Navigator.Page.Push', _onPageChanged);
    eventCenter.addListener(EventConstant.EventLogout, _onLogout);
    eventCenter.addListener(
        EventConstant.WebsocketEventMessage, _onSocketMessage);
    eventCenter.addListener(
        EventConstant.ShowNewUserPackage, _onShowNewUserPackage);
    eventCenter.addListener(Im.EventMessageReceivedBoxShow, _onEvent);
    eventCenter.addListener(
        Im.EventMessageReceivedBoxShowBySmallAccount, _onEventBySmallAccount);
    eventCenter.addListener(Im.EventCmd, _onCmd);
    eventCenter.addListener(
        EventConstant.EventLocationUpdated, _showSayhiBottomSheet);
    eventCenter.addListener(
        EventConstant.EventRecommendRoom, _showRecommendRoomDialog);
  }

  @override
  void dispose() {
    eventCenter.removeListener(EventConstant.EventLogout, _onLogout);
    eventCenter.removeListener('Navigator.Page.Pop', _onPageChanged);
    eventCenter.removeListener('Navigator.Page.Push', _onPageChanged);
    eventCenter.removeListener(
        EventConstant.WebsocketEventMessage, _onSocketMessage);
    eventCenter.removeListener(
        EventConstant.ShowNewUserPackage, _onShowNewUserPackage);
    eventCenter.removeListener(Im.EventMessageReceivedBoxShow, _onEvent);
    eventCenter.removeListener(
        Im.EventMessageReceivedBoxShowBySmallAccount, _onEventBySmallAccount);
    eventCenter.removeListener(Im.EventCmd, _onCmd);
    eventCenter.removeListener(
        EventConstant.EventLocationUpdated, _showSayhiBottomSheet);
    eventCenter.removeListener(
        EventConstant.EventRecommendRoom, _showRecommendRoomDialog);
    super.dispose();
  }

  /// cmd 消息
  void _onCmd(String type, dynamic value) async {
    if (value is! Map) return;
    Map res = value;
    String? name = Util.parseStr(res['name']);
    Map data = res['data'] is Map && res['data'].isNotEmpty ? res['data'] : {};

    if (name == 'leavel') {
      // 处理A呼叫B B在后台 A取消呼叫 B进入前台 B弹出被呼叫界面 但是A的leavel cmd通知在B弹出被呼叫界面前已发送导致B不知道呼叫已被取消
      // 显示被呼叫界面直到30秒超时的情况
      Log.d('boxShow------_onCmd');

      if (data['channelName'] != null && data['channelName'] is String) {
        Config.setBool(data['channelName'], true);
      }
    }
  }

  /// im 消息通知
  void _onEvent(String type, dynamic data) async {
    if (data is! Map || !Session.isLogined) return;

    Map res = data;

    MessageContent? message =
        await Im.getMessage(Util.parseInt(res['messageId']));
    if (message == null) return;

    bool isLiveMessage = false;
    bool isPhoneMessage = false;
    Map? extraMap;
    if (message.extra != null && message.extra!.isNotEmpty) {
      try {
        extraMap = jsonDecode(message.extra!);
        if (message.type == 'text' && extraMap != null) {
          isLiveMessage =
              extraMap['type'] == 'phone' || extraMap['type'] == 'live';
          isPhoneMessage = extraMap['type'] == 'phone';
        }
      } catch (e) {
        Log.d(e);
      }
    }

    // 新加过滤逻辑，敏感词命中消息
    bool canShow = extraMap == null ||
        !(extraMap['wechat.forbid'] ?? false) ||
        Util.parseInt(extraMap['can_show_tips']) == 0;

    if (!isLiveMessage &&
        _canDisplayMessage &&
        message.conversationType != 'chatroom' &&
        message.isSupport() &&
        canShow) {
      if (message.conversationType == 'group') {
        bool notifyStatus = await Im.getConversationNotificationStatus(
            'group', message.targetId);
        if (!notifyStatus) {
          return;
        }
        try {
          if (extraMap != null) {
            String? joinTempGroupUids =
                Util.parseStr(extraMap['join_tempgroup_ids']);
            if (joinTempGroupUids != null && joinTempGroupUids.isNotEmpty) {
              if (!joinTempGroupUids.contains('${Session.uid}')) {
                return; // 拉入临时群消息只提醒被拉入的人
              }
            }
          }
        } catch (e, s) {
          Log.e(e, stackTrace: s);
        }
      }

      String alertContent = K.you_have_a_new_msg;
      bool isOrderNotify = false;
      bool isGreet = false;
      bool isPopularityUpdate = false;

      /// 消息发送者是自己
      if (message.senderId == Session.uid.toString()) {
        return;
      }
      try {
        if (extraMap != null) {
          switch (extraMap['type']) {
            case 'follow': // 新粉丝提醒
              if (!MsgNotify.showFollowNotify) {
                Log.d('_onEvent, dont show follow notify');
                return;
              }
              alertContent = message.content;
              break;

            case 'greet':
              isGreet = true;
              break;
            case 'on.popularity_level.update':
              // 人气等级升级Im不展示小蓝条，已经有socket通知
              isPopularityUpdate = true;
              break;
          }
        }
      } catch (e, s) {
        Log.e(e, stackTrace: s);
      }
      if (isOrderNotify == true) {
        // 这里的逻辑迁移到ws消息里，不走im通道
      } else if (!isGreet && !isPopularityUpdate) {
        // 聊天匹配会发送打招呼，不展示打招呼蓝条

        if (message.conversationType == ConversationType.Private) {
          Map extraMap = message.getExtraMap();
          Map? onlineDataMap;
          if (extraMap['type'] == 'be_friend') {
            onlineDataMap = extraMap;
          } else {
            int tid = Util.parseInt(message.targetId);
            String text = K.base_im_reply;
            if (ChatUtil.isNotChatUid(tid) || ChatUtil.isSystemUser(tid)) {
              text = K.base_go_view;
            }
            OnlineNotificationData onlineData = OnlineNotificationData(
                'im',
                message.user?.portraitUri,
                tid,
                0,
                message.user?.name,
                message.content,
                text);
            onlineDataMap = onlineData.toJson();

            if (Util.isStringEmpty(onlineData.userName)) {
              return;
            }
          }
          DropDownAlert.show(
              content: '',
              replace: true,
              type: DropDownAlertType.online_notification,
              mapContent: onlineDataMap);
        }
      }
    }

    if (!isLiveMessage && message.conversationType != 'chatroom') {
      if (Util.appState != AppLifecycleState.resumed) {
        if (message.conversationType == 'group') {
          bool notifyStatus = await Im.getConversationNotificationStatus(
              'group', message.targetId);
          if (notifyStatus) {
            PushUtils.presentLocationNotification(
                id: 0,
                title: Util.appName,
                body: K.you_have_a_new_msg,
                payload: json.encode({'__page': 'chage'}));
          }
        } else {
          PushUtils.presentLocationNotification(
              id: 0,
              title: Util.appName,
              body: K.you_have_a_new_msg,
              payload: json.encode({'__page': 'chage'}));
        }
      }
    }

    if (isPhoneMessage && Util.appState != AppLifecycleState.resumed) {
      Map msg = res['message'];

      String friendName = K.audio_call_friend;
      if (msg['content'] != null &&
          msg['content']['user'] != null &&
          msg['content']['user']['name'] != null) {
        friendName = msg['content']['user']['name'] ?? K.audio_call_friend;
      }

      if (msg['conversationType'] == 'group') {
        bool notifyStatus = await Im.getConversationNotificationStatus(
            'group', msg['targetId']);
        if (notifyStatus) {
          PushUtils.presentLocationNotification(
            id: 0,
            title: Util.appName,
            body: K.you_have_a_audio_call([friendName]),
            payload: json.encode({'__page': 'chage'}),
          );
        }
      } else {
        PushUtils.presentLocationNotification(
            id: 0,
            title: Util.appName,
            body: K.you_have_a_audio_call([friendName]),
            payload: json
                .encode({'__page': 'phonecall', 'touid': message.targetId}));
      }
    }

    //处理语音通话 被呼叫的消息 不直接进入电话界面 先弹框
    if (extraMap != null &&
        isLiveMessage &&
        message.user != null &&
        message.messageId > 0) {
      if (message.sentTime > 0 &&
          DateTime.now().millisecondsSinceEpoch - message.sentTime >
              5 * 6 * 1000) {
        //语音通话 30秒超时
        return;
      }

      try {
        //语音通话新版本客户端接收方新增上报version 服务端通过cmd给通话发起方下发appVersion
        //新客户端A给老客户端B打电话 A根据是否有收到appVersion控制通话界面是否显示切换房间按钮
        await Xhr.postJson("${System.domain}agora/verify",
            {'channelName': extraMap['channelName'], 'version': '1'},
            throwOnError: true);
      } catch (e) {
        return;
      }

      if (Session.isLogined == false) return;

      Map newExtraMap = extraMap;
      newExtraMap['userName'] = message.user?.name ?? '';
      newExtraMap['icon'] = message.user?.portraitUri ?? '';
      newExtraMap['content'] = K.base_room_phone_invite;
      newExtraMap['messageId'] = message.messageId.toString();

      // Log.d('boxShow DropDownAlert' + extraMap.toString());

      //语音通话 30秒未接超时 呼叫方会自动退出
      DropDownAlert.show(
          content: '',
          ignoreAppstate: true,
          duration: const Duration(seconds: 30),
          type: DropDownAlertType.online_notification,
          mapContent: newExtraMap);
    }
  }

  void _onEventBySmallAccount(String type, dynamic data) async {
    String value =
        Config.get('small_account_notify_switch_${Session.uid}', '1');
    Log.d("small_account_notify value: $value");
    if (value == '1') {
      Log.d("small_account_notify _onEventBySmallAccount1 $type, $data");
      if (data is! Map || !Session.isLogined) return;
      Map res = data;
      int messageId = Util.parseInt(res['messageId']);
      int msgCount = Util.parseInt(res['msgCount']);
      Map<String, dynamic> userInfo = json.decode(res['userInfo']);
      String? userId = Util.parseStr(userInfo['uid']);
      MessageContent? message = await Im.getMessage(messageId, userId: userId);
      if (message == null) return;

      bool isLiveMessage = false;
      Map? extraMap;
      if (message.extra != null && message.extra!.isNotEmpty) {
        try {
          extraMap = jsonDecode(message.extra!);
          if (message.type == 'text' && extraMap != null) {
            isLiveMessage =
                extraMap['type'] == 'phone' || extraMap['type'] == 'live';
          }
        } catch (e, s) {
          Log.e(e, stackTrace: s);
        }
      }

      bool canShow =
          extraMap == null || Util.parseInt(extraMap['can_show_tips']) == 0;
      Log.d(
          "small_account_notify isLiveMessage:$isLiveMessage,support:${message.isSupport()},canShow:$canShow");

      if (!isLiveMessage &&
          message.conversationType != 'chatroom' &&
          message.isSupport() &&
          canShow) {
        if (message.conversationType == 'group') {
          return;
        }

        bool isGreet = false;

        /// 消息发送者是自己
        if (message.senderId == userId) {
          return;
        }
        try {
          if (extraMap != null) {
            switch (extraMap['type']) {
              case 'greet':
                isGreet = true;
                break;
            }
          }
        } catch (e) {
          Log.d(e);
        }
        if (!isGreet) {
          // 聊天匹配会发送打招呼，不展示打招呼蓝条
          if (message.conversationType == ConversationType.Private) {
            Map onlineDataMap = {};
            onlineDataMap['uid'] = userId;
            onlineDataMap['name'] = userInfo['name'];
            onlineDataMap['icon'] = userInfo['icon'];
            onlineDataMap['left'] = msgCount;
            DropDownAlert.show(
                content: '',
                onClick: (context) {
                  if (_roomManager.chatRoomDataExists()) {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return ConfirmDialog(
                            width: 312,
                            title: K.exit_room_by_change_account,
                            titleTextColor: const Color(0xFF202020),
                            negativeButton: const NegativeButton(
                              width: 130,
                              height: 48,
                              textColor: Color(0xB3202020),
                            ),
                            positiveButton: PositiveButton(
                              width: 130,
                              height: 48,
                              useGradientBg: true,
                              gradientBg: R.color.mainBrandGradientColors,
                              text: K.confirm_exit_room_title,
                              onPressed: () {
                                _onSwitchAccount(Util.parseInt(userId));
                                Navigator.of(context).pop(true);
                              },
                            ),
                          );
                        });
                  } else {
                    _onSwitchAccount(Util.parseInt(userId));
                  }
                },
                replace: true,
                type: DropDownAlertType.small_account_notification,
                mapContent: onlineDataMap);

            Tracker.instance
                .track(TrackEvent.account_popup_window_show, properties: {
              'uid': Session.uid,
              'account_popup_window_type': 3,
            });
          }
        }
      }
    }
  }

  void _onSwitchAccount(int uid, {String? icon, String? phone}) async {
    Tracker.instance.track(TrackEvent.account_popup_window_click, properties: {
      'uid': Session.uid,
      'account_popup_window_type': 3,
    });

    /// 是否开启保护模式
    if (Session.getInt('young_mode', 0) == 1) {
      Toast.show(context, R.string('setting_close_juveniles_to_logout'));
      return;
    }
    String dtoken = Session.getString('dtoken', '');

    showLoading(R.string('setting_requesting'));
    //发送验证码
    String method = "account/smallaccountlogin";
    String url = System.domain + method;
    Map<String, String> post = {
      'dtoken': dtoken,
      'target': uid.toString(),
    };

    try {
      XhrResponse response = await Xhr.postJson(url, post, throwOnError: true);
      Map res = response.value();
      bool success = res['success'] == true;

      hideLoading();
      if (success && res['data'] != null && res['data'] != false) {
        //记录用户信息
        int origin = Session.uid;
        await Session.setValues(res['data']);
        eventCenter.emit(EventConstant.EventLogin,
            {'origin': origin, 'now': Session.uid, 'login_type': 'switch'});
        Tracker.instance.track(TrackEvent.change_small_account, properties: {
          'uid': origin,
          'status': 1,
        });

        if (Session.role == UserRole.REG) {
          _loginManager.openLoginProfile(context);
        }

        Fluttertoast.showToast(
            msg: R.string('setting_change_account_success'),
            gravity: ToastGravity.CENTER);
      } else {
        if (res['msg'] != null && res['msg'] is String) {
          Fluttertoast.showToast(msg: res['msg'], gravity: ToastGravity.CENTER);
        }

        _goToLogin(uid, icon: icon, phone: phone);
      }
    } catch (e) {
      hideLoading();

      Fluttertoast.toastException(exp: e, gravity: ToastGravity.CENTER);

      _goToLogin(uid, icon: icon, phone: phone);
    }
  }

  void _goToLogin(int uid, {String? icon, String? phone}) {
    Tracker.instance.track(TrackEvent.change_small_account, properties: {
      'uid': Session.uid,
      'status': 0,
    });

    //success为false(账号未在设备登录过,需要进入安全手机号验证流程)
    if (BaseConfig.instance.smallAccount) {
      // 小号切换 输入验证码 新
      if (phone?.isNotEmpty == true) {
        ISettingManager settingManager = ComponentManager.instance
            .getManager(ComponentManager.MANAGER_SETTINGS);
        settingManager.openSafeMobileCheckScreen(context,
            type: 'check', uid: uid.toString(), phone: phone, icon: icon);
      } else {
        // 跳转添加
        _loginManager.openPhoneLogin(context, type: 'small_account');
      }
    }
  }

  void showLoading(String message) {
    if (_controller != null) {
      _controller!.setLabel(message);
      return;
    }

    _controller = DialogLoadingController();
    _controller!.show(context: context, message: message);
  }

  void hideLoading() {
    _controller?.close();
    _controller = null;
  }

  /// 语音通话 接收方接收进房间和上麦消息
  void _handleRoomPhone(int? rid, int? micpos) async {
    //首页语音通话
    if (Session.isLogined == false) return;

    if (rid != null && rid > 0 && micpos != null && micpos > 0) {
      IRoomManager manager = ComponentManager.instance
          .getManager(ComponentManager.MANAGER_BASE_ROOM);

      manager.openChatRoomScreenShow(System.context, rid, refer: '/boxShow');
      await Future.delayed(const Duration(seconds: 1));

      try {
        Map res = await _xhrAutoError(
          'room/joinMic?version=8',
          {
            'rid': rid.toString(),
            'position': micpos.toString(),
            'uid': Session.uid.toString(),
            'vrid': '0',
            'inviter_uid': '0',
          },
          toastError: false,
          toastSuccess: false,
        );
        if (res['success'] == true) {
          eventCenter.emit('JoinMic.Success');
        }
      } catch (e) {
        Log.d(e);
      }
    }
  }

  static Future<Map> _xhrAutoError(String url, Map<String, String> post,
      {bool toastError = true, bool toastSuccess = true}) async {
    XhrResponse response = await Xhr.postJson("${System.domain}$url", post);
    if (response.error != null) {
      if (toastError == true)
        Fluttertoast.toastException(
            exp: response.error, gravity: ToastGravity.CENTER);
      throw AssertionError(response.error.toString());
    }
    Map res = response.value();
    if (res['success'] == false) {
      if (toastError == true) {
        Fluttertoast.showToast(
            msg: res['msg'].toString(), gravity: ToastGravity.CENTER);
      }
    }
    return res;
  }

  /// 新用户礼包
  void _onShowNewUserPackage(String type, dynamic value) async {
    Config.set('onekey.follow.showed', '0'); //新注册用户才显示一键关注

    PermissionStatus permission = await Permission.location.status;

    if (permission == PermissionStatus.granted) {
      //新用户注册完立即弹打招呼页面
      Config.setBool("${BBConfigKey.needShowSayHiBottom}_${Session.uid}", true);
      if (Util.hasLocation) {
        _showSayhiBottomSheet(null, null);
      }
    }
  }

  /// 新厅流量推荐
  void _showRecommendRoomDialog(String type, dynamic value) async {
    RecommendRoomScreen.show(System.context, value);
  }

  void _showSayhiBottomSheet(String? type, dynamic data) async {
    if (Config.getBool(
        "${BBConfigKey.needShowSayHiBottom}_${Session.uid}", false)) {
      Config.setBool(
          "${BBConfigKey.needShowSayHiBottom}_${Session.uid}", false);

      /// 主app及马甲包用今日缘分替代打招呼功能
      // IMessageManager manager = ComponentManager.instance.getManager(ComponentManager.MANAGER_MESSAGE);
      // manager.openFateDialog(context);
      return;

      try {
        String url = '${System.domain}party/match/remaineNum';
        XhrResponse response = await Xhr.getJson(url, throwOnError: true);
        Map res = response.value();

        if (res['success'] == true &&
            res['data'] != null &&
            res['data']['remaining_num'] != null) {
          int remainNum = Util.parseInt(res['data']['remaining_num'], 0);

          if (remainNum > 0) {
            Tracker.instance.track(TrackEvent.match_nearby_show, properties: {
              'refer': 'new_register',
            });

            IMessageManager manager = ComponentManager.instance
                .getManager(ComponentManager.MANAGER_MESSAGE);
            manager.openSayhiBottomSheet(context, remainNum);
          }
        }
      } catch (e) {}
    }
  }

  dynamic _onSocketMessage(String name, dynamic data) async {
    // Log.d('Receive socket message in BoxShow, name: $name, data: $data');
    if (!Session.isLogined || data is! Map) return false;

    Map<String, dynamic> tmp = data as Map<String, dynamic>;
    switch (tmp['name']) {
      case 'kick.out':

        /// 这里接收的是阅后即焚cmd消息，再次登录不会再拉取到该cmd消息。适合一次性kickout操作
        Session.logout();
        break;
      case 'match.call':
        if (tmp['data'] == null) return false;
        if (!MsgNotify.showRoomNotify) {
          // 设置不展示踩房通知
          break;
        }
        Map map = tmp['data'];
        DropDownAlert.show(
          content: _getPushMsg(
              'match.call', map['name'], Util.parseInt(map['sex']),
              roomType: map['game']),
          onClick: (context) {
            int rid = Util.parseInt(map['rid']);
            if (rid > 0) {
              _roomManager.openChatRoomScreenShow(context, rid,
                  from: const RoomFrom('call', RoomFrom.notification));
            }
          },
        );
        break;
      case 'follow.onMic':
        if (tmp['data'] == null) return false;
        if (!MsgNotify.showRoomNotify) {
          // 设置不展示踩房通知
          break;
        }
        Map map = tmp['data'];

        /// 为了兼容旧版，所以协议看起来比较怪异
        if (map['extend'] != null && map['extend'] is Map) {
          DropDownAlert.show(
            content: '',
            replace: true,
            mapContent: Map<String, dynamic>.from(map['extend']),
            type: DropDownAlertType.online_notification,
          );
        } else {
          DropDownAlert.show(
            content: _getPushMsg(
                map['type'], map['name'], Util.parseInt(map['sex'])),
            onClick: (context) {
              int rid = Util.parseInt(map['rid']);
              if (rid > 0) {
                _roomManager.openChatRoomScreenShow(context, rid,
                    from: RoomFrom.follow_list);
              }
            },
          );
        }
        break;
      case 'game.restore': // 游戏房掉线恢复
        if (_gameRestoreKey.currentWidget == null) {
          Map data = tmp['data'];
          int rid = Util.parseInt(data['rid']);
          String text = data['text'] ?? K.base_game_restore_tips;
          if (rid > 0) {
            bool? result = await showDialog<bool>(
                context: context,
                builder: (context) =>
                    ConfirmDialog(key: _gameRestoreKey, content: text));
            if (result == true) {
              _roomManager.openChatRoomScreenShow(context, rid,
                  from: const RoomFrom('restore', RoomFrom.notification));
            }
          }
        }
        break;

      case 'room.recommend.notify': //推荐房间消息
        Map mapContent = tmp['data'];
        int rid = Util.parseInt(mapContent['rid']);
        DropDownAlert.show(
            content: '',
            type: DropDownAlertType.room_notify,
            replace: true,
            mapContent: mapContent,
            onClick: (context) {
              _roomManager.openChatRoomScreenShow(
                context,
                rid,
              );
              //确认点击上报
              Tracker.instance
                  .track(TrackEvent.new_room_push_action, properties: {
                'rid': rid,
                'type': '${mapContent['type']}',
                'room_type': '${mapContent['room_type']}',
                'room_propery': '${mapContent['room_propery']}',
                'action': 'accept'
              });
            },
            onRefuseClick: (context) {
              //拒绝点击上报
              Tracker.instance
                  .track(TrackEvent.new_room_push_action, properties: {
                'rid': rid,
                'type': '${mapContent['type']}',
                'room_type': '${mapContent['room_type']}',
                'room_propery': '${mapContent['room_propery']}',
                'action': 'refuse'
              });
            },
            onAutoMiss: (context) {
              //拒绝点击上报
              Tracker.instance
                  .track(TrackEvent.new_room_push_action, properties: {
                'rid': rid,
                'type': '${mapContent['type']}',
                'room_type': '${mapContent['room_type']}',
                'room_propery': '${mapContent['room_propery']}',
                'action': 'automiss'
              });
            });
        //展示上报
        Tracker.instance.track(TrackEvent.new_room_push, properties: {
          'rid': rid,
          'type': '${mapContent['type']}',
          'room_type': '${mapContent['room_type']}',
          'room_propery': '${mapContent['room_propery']}'
        });
        break;

      case 'on.popularity_level.update': // 人气等级升级提示
        Map mapContent = tmp['data'];
        DropDownAlert.show(
            content: '',
            replace: true,
            mapContent: mapContent,
            type: DropDownAlertType.popularity_upgrade,
            onClick: (context) {
              IVipManager vipManager = ComponentManager.instance
                  .getManager(ComponentManager.MANAGER_VIP);
              vipManager.showMyLevelScreen(context,
                  initialTab: MyLevelTab.Popularity);
            });
        break;
      case 'on.benefit.regot': // 福利补领
        Map mapContent = tmp['data'];
        eventCenter.emit(EventConstant.EventWelfareReplace, mapContent);
        break;
      case 'on.user.level.upgrade':
      case 'on.user.level.upgrade.new':
        IRoomManager manager = ComponentManager.instance
            .getManager(ComponentManager.MANAGER_BASE_ROOM);
        dynamic data = tmp['data'];
        if (data != null && data is Map) {
          manager.openUserLevelUpDialog(
            System.context,
            type: Util.parseStr(data['type']),
            title: Util.parseStr(data['label']),
            imageURL: Util.parseIcon(data['icon']),
            percent: Util.parseDouble(data['ex_bar']),
            subTitle: Util.parseStr(data['des']),
            btnTitle: K.base_check_level_up_privacy,
            level: Util.parseInt(data['level']),
          );

          /// 夜店，发公屏消息的时间间隔，vip或者人气等级升级后，间隔时间会缩短
          int time = Util.parseInt(data['time_interval']);
          if (time > 0) {
            eventCenter.emit(EventConstant.EventPubTimeIntervalChanged, time);
          }

          /// VIP 升到二级以上，或得一次抢红包特权
          int currVipLevel = Util.parseInt(data["level"]);
          eventCenter.emit(EventConstant.EventVipLevelUp, currVipLevel);
        }
        break;
      case 'deco.present':
        Future.delayed(const Duration(milliseconds: 500), () {
          // 商业厅自己给自己打赏装扮，socket快于pay/create返回，导致支付loading消不掉,延时500ms
          _chatManager.showReceivedGiftDialog(context, tmp['data']);
        });
        break;

      case 'on.gift.skin.unlock':
        dynamic data = tmp['data'];
        if (data != null && data is Map) {
          IGiftManager manager = ComponentManager.instance
              .getManager(ComponentManager.MANAGER_GIFT);
          manager.showGiftSkinUnlockDialog(context, data['icon'], data['name']);
        }
        break;
      case 'online.notification':
        dynamic data = tmp['data'];
        if (data != null && data is Map) {
          DropDownAlert.show(
            content: '',
            replace: true,
            mapContent: Map<String, dynamic>.from(data),
            type: DropDownAlertType.online_notification,
          );
        }
        break;
      case 'transfer.to.room':
        //语音通话 接收切换房间并上麦消息
        dynamic data = tmp['data'];

        if (data != null && data is Map) {
          if (data['rid'] != null && data['micpos'] != null) {
            _handleRoomPhone(
                Util.parseInt(data['rid']), Util.parseInt(data['micpos']));
          }
        }
        break;
      case 'room.dropdown':
        dynamic data = tmp['data'];
        Log.d('dropdown:$data');

        if (data != null && data is Map) {
          _roomManager.openMatchCard(data);
        }
        break;
      case 'room.invite.accompany':
        dynamic data = tmp['data'];
        if (data != null && data is Map) {
          Map<String, dynamic> map = json.decode(json.encode(data));
          InviteRoomDialog.showFromAccompany(
              context, InviteRoomData.fromJson(map));
        }
        break;
      case 'room.play.queue.notice':
        dynamic joinData = tmp['data'];
        if (joinData != null && joinData is Map) {
          int rid = Util.parseInt(joinData['rid']);
          String? msg = joinData['msg'];

          if (msg != null && msg.isNotEmpty) {
            DropDownAlert.show(
                content: msg,
                onClick: (context) {
                  if (rid > 0) {
                    _roomManager.openChatRoomScreenShow(
                      context,
                      rid,
                      from: const RoomFrom('playteam', RoomFrom.notification),
                    );
                  }
                });
          }
        }
        break;
      case 'on.normal.click.text.notify':
        dynamic data = tmp['data'];
        if (data != null && data is Map) {
          String? content = data['data'];
          int duration = Util.parseInt(data['duration']);
          if (content != null && content.isNotEmpty) {
            DropDownAlert.show(
                type: DropDownAlertType.normal_click_text_notify,
                content: content,
                duration: duration > 0 ? Duration(seconds: duration) : null,
                replace: true,
                onClick: (context) {
                  String? url = data['url'];
                  if (url?.isEmpty ?? true) return;
                  String schemeUrl = SchemeUrlHelper.instance().concatSchemeUrl(
                      url, SchemeUrlHelper.scheme_path_online_socket);
                  SchemeUrlHelper.instance()
                      .checkSchemeUrlAndGo(context, schemeUrl);
                });
          }
        }
        break;
      case 'on.normal.scheme':

        /// socket推通用跳转
        dynamic data = tmp['data'];
        if (data != null && data is Map) {
          String? url = data['url'];
          if (url?.isEmpty ?? true) return;
          String schemeUrl = SchemeUrlHelper.instance()
              .concatSchemeUrl(url, SchemeUrlHelper.scheme_path_online_socket);
          SchemeUrlHelper.instance().checkSchemeUrlAndGo(context, schemeUrl);
        }
        break;
      case 'on.games.mission.complete':
        eventCenter.emit("Websocket.Event.Task.RedDot");
        break;
      case 'recharge.package':
        dynamic data = tmp['data'];
        if (data != null && data is Map) {
          IGiftManager manager = ComponentManager.instance
              .getManager(ComponentManager.MANAGER_GIFT);
          Map<String, dynamic>? map = json.decode(json.encode(data));
          if (map != null) {
            manager.showSuperGiftReceiveDialog(context, map);
          }
        }
        break;
      case 'on.auto.join.room':

        /// socket推送直接进房
        Map? map = tmp['data'];
        if (map != null) {
          int rid = Util.parseInt(map['rid']);
          if (rid > 0) {
            _roomManager.openChatRoomScreenShow(context, rid,
                refer: 'socket_auto_join');
          }
        }
        break;
      case 'app.anim': //app级别的动画
        List? data = tmp['data'];
        if (data != null && data.isNotEmpty) {
          eventCenter.emit(
            EventConstant.EventAppAnim,
            data,
          );
        }
        break;
      case 'onlineearn.complete.daily.duty': //网赚 每日任务完成时 给完成者展示提醒横幅
        Map<String, dynamic>? data = tmp['data'];
        if (data != null) {
          data['type'] = 1;
          eventCenter.emit(EventConstant.OnlineEarnCompleteDailyDuty, data);
        }
        break;
      case 'knight.group.expire': // 直播守护到期提醒
        Map<String, dynamic>? data = tmp['data'];
        if (data != null) {
          Future.delayed(const Duration(milliseconds: 500), () {
            // 延迟500ms发送事件，messageList还未初始化
            eventCenter.emit(EventConstant.EventKnightGroupExpire, data);
          });
        }
        break;
      case 'hisong.sys.chatMatch': // 嗨歌在线匹配通知
        Map<String, dynamic>? data = tmp['data'];
        if (data != null) {
          _chatManager.showHiMatchNotification(context, data);
        }
        break;
      case 'stock.user.add.ka.steward':
        {
          // 对存量未建联KA用户推送建联弹窗，由后台提供数据。
          Map<String, dynamic>? data = tmp['data'];
          if (data != null) {
            if (data['data'] is String && Util.validStr(data['data'])) {
              /// 判断type == 1 或者 2 不需要把标志位置成true
              Map extra = {};
              try {
                extra = json.decode(data['data']);
              } catch (e, s) {
                Log.e(e, stackTrace: s);
              }
              if (extra.isNotEmpty) {
                if (!(Util.parseInt(extra['type']) == 1 ||
                    Util.parseInt(extra['type']) == 2)) {
                  Config.setBool(
                      '${Session.uid}_stock_user_show_svip_steward_dialog',
                      true);
                }
              } else {
                Config.setBool(
                    '${Session.uid}_stock_user_show_svip_steward_dialog', true);
              }
              Config.set('${Session.uid}_stock_user_add_ka_steward_data',
                  data['data']);
              eventCenter.emit('HomePage.showKa');
            }
          }
          break;
        }
      case 'on.normal.toast':
        dynamic data = tmp['data'];
        if (data != null && data is Map) {
          if (Util.validStr(Util.parseStr(data['msg']))) {
            Fluttertoast.showToast(
                msg: data['msg'], duration: const Duration(seconds: 5));
          }
        }
        break;
      case 'room.hangup.check': // Gs排挡挂机检查
        Map<String, dynamic>? data = tmp['data'];
        if (data != null) {
          IRoomManager manager = ComponentManager.instance
              .getManager(ComponentManager.MANAGER_BASE_ROOM);
          manager.openCheckGsOnHookDialog(context, data);
        }
        break;
      case 'tag.match.gs.msg':
        {
          List? listJson;
          try {
            String jsonStr = tmp['data']['data'];
            Map jsonData = json.decode(jsonStr);
            Map map = jsonData['tag_match_gs_msg'];
            listJson = map['CateGsList'];
          } catch (e) {
            listJson = null;
          }
          if (listJson != null) {
            IProfileManager manager = ComponentManager.instance
                .getManager(ComponentManager.MANAGER_PROFILE);
            manager.showRecommendTagsGsPage(context, listJson);
          }
        }
        break;
      case 'room.user.mute': // 收到禁言消息
        Map<String, dynamic>? data = tmp['data'];
        if (data != null) {
          eventCenter.emit('room.user.mute', Util.parseInt(data['countdown']));
        }
        break;
      case 'mount_gift_debris': // 座驾礼物收到碎片
        var data = tmp['data'];
        if (data is List) {
          IVipManager vipManager = ComponentManager.instance
              .getManager(ComponentManager.MANAGER_VIP);
          vipManager.openReceiveMountPieceDialog(context, data);
        }
        break;
      case 'sync.to.web.message': // 透传H5消息
        var data = tmp['data'];
        if (data != null) {
          eventCenter.emit(EventConstant.EventSyncToWebMessage, data);
        }
        break;
    }
  }

  String _getPushMsg(String type, String? name, int sex, {String? roomType}) {
    name = name ?? '';
    var sexStr = sex == 1 ? K.common_he : K.common_she;
    switch (type) {
      case 'owner':
        return '【$name】${K.common_open_room}$sexStr  >';
      case 'radio':
        return '【$name】${K.common_entertain}$sexStr    >';
      case 'match.call':
        return '【$name】${K.playing}${roomType ?? ''}${K.common_click_to_join}';
      default:
        return '【$name】${K.common_has_reception}$sexStr  >';
    }
  }

  _onPlayGiftComplete(GiftConfig config) {
    Log.d('_onPlayGiftComplete~~~~~~~~~~~~~~~~~~~~~~~');
    playing = false;
    setState(() {});
    if (_gifts.contains(config) || _queue.isNotEmpty) {
      setState(() {
        _gifts.remove(config);
        if (_queue.isNotEmpty) {
          _gifts.add(_queue.removeAt(0));
          playing = true;
        }
      });
    }
  }

  _onPlayGiftStart(GiftConfig config) {
    Log.d('_onPlayGiftStart~~~~~~~~~~~~~~~~~~~');
    setState(() {
      playing = true;
    });
  }

  void clearTimerOut() {
    if (_showTimer != null) {
      _showTimer!.cancel();
      _showTimer = null;
    }
  }

  _onLogout(String type, dynamic value) {
    clearTimerOut();
    playing = false;
    if (mounted) setState(() {});
  }

  _onPageChanged(String type, dynamic value) {
    String curName = appNavigatorObserver.getLast();
    if (curName.startsWith('/room')) {
      if (mounted) {
        setState(() {
          _canDisplayMessage = true;
        });
      }
    } else if (curName.startsWith('/userChat')) {
      if (mounted) {
        setState(() {
          _canDisplayMessage = false;
        });
      }
    } else {
      if (mounted) {
        setState(() {
          _canDisplayMessage = true;
        });
      }
    }
  }

  //启动，默认进入 TopLiveStatus.Background
  Future setup(int rid) async {
    Log.d("=open live ----------------- setup");
    clearTimerOut();
  }

  void show() {
    Log.d("=open live ----------------- show");
    clearTimerOut();
  }

  //销毁
  void destroy() {
    Log.d("=open live ----------------- destroy");
    clearTimerOut();
  }

  //渲染礼物动画播放
  List<Widget> _buildGiftDisplay() {
    List<Widget> widgets = [];

    if (_gifts.isNotEmpty) {
      for (var config in _gifts) {
        widgets.add(DisplayGift(
          key: config.key,
          config: config,
          onComplete: _onPlayGiftComplete,
          onStart: _onPlayGiftStart,
        ));
      }
    }

    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    Widget childWidget;
    if (!playing) {
      childWidget = const SizedBox.shrink();
    } else {
      childWidget = Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: _buildGiftDisplay(),
        ),
      );
    }

    return Stack(
      children: [
        childWidget,
        const GlobalAppAnimWidget(),
      ],
    );
  }
}
