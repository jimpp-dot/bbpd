import 'package:settings/k.dart';
import 'package:shared/shared.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:settings/src/model/pb/generated/general_setting.pb.dart';
import 'package:settings/src/model/setting_repository.dart';

// 消息设置
class MessageSetting extends StatefulWidget {
  const MessageSetting({super.key});

  @override
  State<StatefulWidget> createState() {
    return _State();
  }

  static void show(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => const MessageSetting(),
      settings: const RouteSettings(name: '/MessageSetting'),
    ));
  }
}

class _State extends State<MessageSetting> {
  bool _loading = true;
  bool _privateMessageNoti = true;
  bool _autoCallNotify = true; // 主动招呼 默认开启
  bool _dynamicChatNotify = true; // 动态私聊 默认开启
  bool _birthdayRemindNotify = true; // 生日提醒 默认开启

  @override
  initState() {
    super.initState();
    _loadConfig();
  }

  @override
  void dispose() {
    super.dispose();
  }

  _loadConfig() async {
    Map? res;
    await Future.wait([
      Future(() async {
        res = await MsgNotify.loadConfig();
      }),
      Future(() async {
        ResGetGeneralSetting setting =
            await SettingRepository.getGeneralSetting();
        if (setting.success) {
          _privateMessageNoti = setting.data.privateMessageNoti == 0;
          _autoCallNotify = setting.data.closeAutoGreet == 0;
          _dynamicChatNotify = setting.data.closeTopicChatRcm == 0;
          _birthdayRemindNotify = setting.data.closeBirthdayRemind == 0;
        }
      }),
    ]);
    Log.d('_loadConfig, res: $res');

    if (!mounted) return;
    setState(() {
      _loading = false;
    });
  }

  Widget _renderBody(BuildContext context) {
    if (_loading) {
      return const Center(
        child: CupertinoActivityIndicator(),
      );
    }

    return Column(
      children: <Widget>[
        // 私信消息通知
        SettingItemWithSwitchWidget(
          title: K.setting_private_message_title,
          subTitle: K.setting_private_message_desc,
          value: !_privateMessageNoti,
          onChanged: _privateMessageChange,
        ),
        // 通知消息显示详情
//        SettingItemWithSwitchWidget(
//          title: K.settings_show_msg_detail,
//          subTitle: K.settings_show_msg_subtitle,
//          value: !Constant.showMsgdetail,
//          onChanged:,
//        ),
        // 好友踩房通知
        SettingItemWithSwitchWidget(
          title: K.settings_room_notify,
          subTitle: K.settings_room_subtitle_v2,
          value: !MsgNotify.showRoomNotify,
          onChanged: _onRoomSettingChange,
        ),
        // 粉丝关注提醒
        SettingItemWithSwitchWidget(
          title: K.settings_follow_notify,
          subTitle: K.settings_follow_subtitle_v2,
          value: !MsgNotify.showFollowNotify,
          onChanged: _onFollowSettingChange,
        ),

        // 自动打招呼
        SettingItemWithSwitchWidget(
          title: K.settings_auto_call_notify,
          subTitle: K.settings_auto_call_subtitle,
          value: !_autoCallNotify,
          onChanged: _onAutoCallSettingChange,
        ),
        // 动态私聊
        SettingItemWithSwitchWidget(
          title: K.settings_dynamic_chat_notify,
          subTitle: K.settings_dynamic_chat_subtitle,
          value: !_dynamicChatNotify,
          onChanged: _onDynamicRecommendSettingChange,
        ),
        // 生日提醒通知
        SettingItemWithSwitchWidget(
          title: K.settings_birthday_remind_nofity,
          subTitle: K.settings_birthday_remind_subtitle,
          value: !_birthdayRemindNotify,
          onChanged: _onBirthdayRemindSettingChange,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(K.settings_message_setting),
      body: _renderBody(context),
    );
  }

  void _privateMessageChange(bool value) async {
    NormalNull res =
        await SettingRepository.setGeneralSetting(2, value ? 1 : 0);
    if (res.success) {
      _privateMessageNoti = !value;
      if (mounted) {
        setState(() {});
      }
      Fluttertoast.showToast(
          msg: K.setting_set_success, gravity: ToastGravity.CENTER);
    } else {
      if (res.msg.isNotEmpty) {
        Fluttertoast.showToast(msg: res.msg, gravity: ToastGravity.CENTER);
      }
    }
  }

  void _onRoomSettingChange(bool value) async {
    try {
      XhrResponse response = await Xhr.postJson(
          "${System.domain}account/closeUserJoinRoom",
          {
            'value': value ? "1" : "0",
          },
          throwOnError: true);
      Map res = response.value();
      if (res['success'] == true) {
        MsgNotify.showRoomNotify = !value;
        if (mounted) {
          setState(() {});
        }
        Fluttertoast.showToast(
            msg: K.setting_set_success, gravity: ToastGravity.CENTER);
      } else {
        if (res['msg'] != null && res['msg'] is String) {
          Fluttertoast.showToast(msg: res['msg'], gravity: ToastGravity.CENTER);
        }
      }
    } catch (e) {
      Fluttertoast.toastException(exp: e, gravity: ToastGravity.CENTER);
    }
  }

  void _onFollowSettingChange(bool value) async {
    try {
      XhrResponse response = await Xhr.postJson(
          "${System.domain}account/closeFansAttention",
          {
            'value': value ? "1" : "0",
          },
          throwOnError: true);
      Map res = response.value();
      if (res['success'] == true) {
        MsgNotify.showFollowNotify = !value;
        if (mounted) {
          setState(() {});
        }
        Fluttertoast.showToast(
            msg: K.setting_set_success, gravity: ToastGravity.CENTER);
      } else {
        if (res['msg'] != null && res['msg'] is String) {
          Fluttertoast.showToast(msg: res['msg'], gravity: ToastGravity.CENTER);
        }
      }
    } catch (e) {
      Fluttertoast.toastException(exp: e, gravity: ToastGravity.CENTER);
    }
  }

  void _onAutoCallSettingChange(bool value) async {
    NormalNull res =
        await SettingRepository.setGeneralSetting(5, value ? 1 : 0);
    if (res.success) {
      _autoCallNotify = !value;
      if (mounted) {
        setState(() {});
      }
      Fluttertoast.showToast(
          msg: K.setting_set_success, gravity: ToastGravity.CENTER);
      Tracker.instance
          .track(TrackEvent.sayhi_open, properties: {'is_open': value ? 0 : 1});
    } else {
      if (res.msg.isNotEmpty) {
        Fluttertoast.showToast(msg: res.msg, gravity: ToastGravity.CENTER);
      }
    }
  }

  void _onDynamicRecommendSettingChange(bool value) async {
    NormalNull res =
        await SettingRepository.setGeneralSetting(6, value ? 1 : 0);
    if (res.success) {
      _dynamicChatNotify = !value;
      if (mounted) {
        setState(() {});
      }
      Fluttertoast.showToast(
          msg: K.setting_set_success, gravity: ToastGravity.CENTER);
    } else {
      if (res.msg.isNotEmpty) {
        Fluttertoast.showToast(msg: res.msg, gravity: ToastGravity.CENTER);
      }
    }
  }

  void _onBirthdayRemindSettingChange(bool value) async {
    NormalNull res =
        await SettingRepository.setGeneralSetting(4, value ? 1 : 0);
    if (res.success) {
      _birthdayRemindNotify = !value;
      if (mounted) {
        setState(() {});
      }
      Fluttertoast.showToast(
          msg: K.setting_set_success, gravity: ToastGravity.CENTER);
      Tracker.instance.track(TrackEvent.click,
          properties: {'click_page': 'click_reming', 'value': value ? 1 : 0});
    } else {
      if (res.msg.isNotEmpty) {
        Fluttertoast.showToast(msg: res.msg, gravity: ToastGravity.CENTER);
      }
    }
  }
}
