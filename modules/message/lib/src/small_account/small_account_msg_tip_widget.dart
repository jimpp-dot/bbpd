import 'dart:async';
import 'dart:convert';

import 'package:message/k.dart';
import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:message/src/api/message_repo.dart';
import 'package:shared/src/pbModel/generated/banban_small.pb.dart';

class SmallAccountMsgTipWidget extends StatefulWidget {
  const SmallAccountMsgTipWidget({super.key});

  @override
  State<StatefulWidget> createState() => SmallAccountMsgTipState();
}

class SmallAccountMsgTipState extends State<SmallAccountMsgTipWidget> {
  DialogLoadingController? _controller;
  late ILoginManager _loginManager;

  bool _show = false;
  int _state = 0; // 1 提示；2 通知

  Map<String, dynamic> map = {};

  @override
  void initState() {
    super.initState();
    _loginManager =
        ComponentManager.instance.getManager(ComponentManager.MANAGER_LOGIN);

    loadData();
    eventCenter.addListener(
        Im.EventMessageReceivedBoxShowBySmallAccount, _onEventBySmallAccount);
  }

  @override
  void dispose() {
    eventCenter.removeListener(
        Im.EventMessageReceivedBoxShowBySmallAccount, _onEventBySmallAccount);
    _timer?.cancel();
    super.dispose();
  }

  void _onEventBySmallAccount(String type, Object? data) async {
    String value =
        Config.get('small_account_notify_switch_${Session.uid}', '1');
    Log.d("small_account_notify value: $value");
    if (value != '1') {
      /// 关闭了小号通知才处理
      Log.d("small_account_notify _onEventBySmallAccount2 $type, $data");
      Map? res = data as Map?;
      if (res == null || !Session.isLogined) return;

      int messageId = res['messageId'];
      int msgCount = res['msgCount'];
      Map<String, dynamic> userInfo = json.decode(res['userInfo']);
      String userId = userInfo['uid'];
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
        } catch (e) {
          Log.d(e);
        }
      }

      bool canShow =
          extraMap == null || Util.parseInt(extraMap['can_show_tips']) == 0;

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
            map.clear();
            map['uid'] = userId;
            map['name'] = userInfo['name'];
            map['icon'] = userInfo['icon'];
            map['left'] = msgCount;

            _show = true;
            _state = 2;
            refresh();
            _startTimer();

            Tracker.instance
                .track(TrackEvent.account_popup_window_show, properties: {
              'uid': Session.uid,
              'account_popup_window_type': 2,
            });
          }
        }
      }
    }
  }

  Timer? _timer;

  void _startTimer() {
    _timer?.cancel();
    _timer = Timer(const Duration(seconds: 5), () {
      _show = false;
      _state = 0;
      refresh();
    });
  }

  void loadData() async {
    ResSmallAccountEntry res = await MessageRepo.getSmallAccountTip();
    if (res.success) {
      int time = Util.parseInt(Config.get('small_account_tip_${Session.uid}'));
      if (res.entryInfo.showType == 1) {
        /// 每 ${res.entryInfo.showInterval} 时间显示一次
        _show = (DateTime.now().secondsSinceEpoch - time >=
            res.entryInfo.showInterval);
        _state = 1;
      } else if (res.entryInfo.showType == 2) {
        /// 只显示一次
        _show = (time == 0);
        _state = 1;
      } else {
        /// 不显示
        _show = false;
        _state = 0;
      }
      if (_show) {
        Tracker.instance
            .track(TrackEvent.account_popup_window_show, properties: {
          'uid': Session.uid,
          'account_popup_window_type': 1,
        });
      }
      if (mounted) {
        setState(() {});
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        if (_show) ...[
          PositionedDirectional(
            start: 16,
            end: 16,
            top: 56,
            child: _buildContent(),
          ),
          // PositionedDirectional(
          //   end: 118,
          //   top: 48,
          //   child: R.img(
          //     "ic_small_account_msg_arrow.png",
          //     width: 12,
          //     height: 10,
          //     color: R.colors.popMenuBgColor,
          //     package: ComponentManager.MANAGER_MESSAGE,
          //   ),
          // ),
        ],
      ],
    );
  }

  Widget _buildContent() {
    if (_state == 2) {
      return _buildMsgContent();
    } else if (_state == 1) {
      return _buildTipContent();
    }
    return const SizedBox();
  }

  /// 气泡提示
  Widget _buildTipContent() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsetsDirectional.all(12),
      decoration: BoxDecoration(
        color: R.colors.popMenuBgColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Text(
              K.small_account_add_tip,
              style: TextStyle(
                color: R.colors.mainTextColor,
                fontSize: 15,
              ),
            ),
          ),
          const SizedBox(width: 12),
          InkWell(
            onTap: () {
              onTapHide();
              // 添加账号
              ILoginManager loginManager = ComponentManager.instance
                  .getManager(ComponentManager.MANAGER_LOGIN);
              loginManager.openOneKeyLogin(context, type: "small_account");

              Tracker.instance
                  .track(TrackEvent.account_popup_window_click, properties: {
                'uid': Session.uid,
                'account_popup_window_type': 1,
              });
            },
            child: Container(
              height: 28,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              alignment: AlignmentDirectional.center,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: R.colors.mainBrandGradientColors,
                ),
                borderRadius: BorderRadius.circular(14),
              ),
              child: Text(
                R.string("setting_add_account"),
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          const SizedBox(width: 16),
          InkWell(
            onTap: onTapHide,
            child: R.img(
              "ic_small_account_close.webp",
              width: 16,
              height: 16,
              color: R.colors.thirdTextColor,
              package: ComponentManager.MANAGER_MESSAGE,
            ),
          ),
        ],
      ),
    );
  }

  /// 气泡消息通知
  Widget _buildMsgContent() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsetsDirectional.all(12),
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(
            color: Color(0x0F000000),
            offset: Offset(0, 1),
            blurRadius: 10,
            spreadRadius: 0,
          ),
        ],
        color: R.colors.bubbleBgColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildAvatar(map['icon'] ?? ''),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  map['name'] ?? '',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: R.colors.mainTextColor,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  K.small_account_receive_msg_num(['${map['left']}']),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: R.colors.secondTextColor,
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          InkWell(
            onTap: () {
              _onTapClose();
              // 切换账号
              _onSwitchAccount(Util.parseInt(map['uid']));

              Tracker.instance
                  .track(TrackEvent.account_popup_window_click, properties: {
                'uid': Session.uid,
                'account_popup_window_type': 2,
              });
            },
            child: Container(
              height: 28,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              alignment: AlignmentDirectional.center,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: R.colors.mainBrandGradientColors,
                ),
                borderRadius: BorderRadius.circular(14),
              ),
              child: Text(
                R.string("small_account_change"),
                style: TextStyle(
                  color: R.colors.brightTextColor,
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          const SizedBox(width: 16),
          InkWell(
            onTap: _onTapClose,
            child: R.img(
              "ic_small_account_close.webp",
              width: 16,
              height: 16,
              color: R.colors.thirdTextColor,
              package: ComponentManager.MANAGER_MESSAGE,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAvatar(String url) {
    return ClipOval(
      child: CommonAvatar(
        path: url,
        size: 48,
        fit: BoxFit.cover,
      ),
    );
  }

  void _onSwitchAccount(int uid, {String? icon, String? phone}) async {
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

    Log.d(post);

    try {
      XhrResponse response = await Xhr.postJson(url, post, throwOnError: true);
      Map res = response.value();
      bool success = res['success'];

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

  void _onTapClose() async {
    _show = false;
    setState(() {});
  }

  void onTapHide() async {
    _onTapClose();
    await Config.set('small_account_tip_${Session.uid}',
        DateTime.now().secondsSinceEpoch.toString());
  }
}
