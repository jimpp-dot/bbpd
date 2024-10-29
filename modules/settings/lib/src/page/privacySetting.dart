import 'package:settings/k.dart';
import 'package:shared/shared.dart';
import 'package:shared/src/network/entity/settingsInfoRsp.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:settings/src/model/pb/generated/general_setting.pb.dart';
import 'package:settings/src/model/setting_repository.dart';
import 'blackListScreen.dart';

// 隐私设置
class PrivacySetting extends StatefulWidget {
  bool enableOneKeyProtection; // 一键防护
  bool? enableStrangerMsg; // 消息防打扰
  int? push_wakeup_chat; // 匹配防打扰
  bool nearbyInvisible; // 附近隐身
  int? showDistance; //显示距离
  bool addressBookInvisible; //通讯录隐身
  bool enableRecommend; // 推荐
  bool closeRoomRecommend; // 房间推荐
  PrivacySetting({
    super.key,
    this.enableOneKeyProtection = false,
    this.enableStrangerMsg,
    this.push_wakeup_chat,
    this.nearbyInvisible = false,
    this.showDistance,
    this.addressBookInvisible = false,
    this.enableRecommend = false,
    this.closeRoomRecommend = false,
  });

  static void show(BuildContext context, bool? enableStrangerMsg, int? pushWakeupChat, bool? nearbyInvisible, int? showDistance) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => PrivacySetting(
        enableStrangerMsg: enableStrangerMsg,
        push_wakeup_chat: pushWakeupChat,
        nearbyInvisible: nearbyInvisible ?? false,
        showDistance: showDistance,
      ),
      settings: const RouteSettings(name: '/PrivacySetting'),
    ));
  }

  @override
  State<StatefulWidget> createState() {
    return _State();
  }
}

class _State extends State<PrivacySetting> {
  SettingsInfoRsp? _settingsInfoRsp;
  ResGetGeneralSetting? _generalSettingRes;
  bool _loading = false;
  String? _errorMsg;
  bool _showRoomRecommend = false;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Widget _renderBody(BuildContext context) {
    if (_loading) {
      return const Center(
        child: CupertinoActivityIndicator(),
      );
    }
    if (_errorMsg != null) {
      return Center(
        child: ErrorData(
          error: _errorMsg,
          onTap: () {
            _load();
          },
        ),
      );
    }

    Map<int, String> distanceTrailText = {
      1: K.setting_distance_all_cansee,
      2: K.setting_distance_friend_cansee,
      3: K.setting_distance_all_hide
    };

    return Column(
      children: <Widget>[
        // 一键防护
        SettingItemWithSwitchWidget(
          title: K.setting_one_key_protect_title,
          subTitle: K.setting_one_key_protect_desc,
          value: widget.enableOneKeyProtection,
          onChanged: _onOneKeyProtectionChanged,
          contentPadding: const EdgeInsetsDirectional.only(start: 20, end: 20),
        ),
        // 消息防打扰
        if (widget.enableStrangerMsg != null)
          SettingItemWithSwitchWidget(
            title: K.setting_fb_msg_intercpt,
            subTitle: K.setting_dont_receive_stranger_msg,
            value: widget.enableStrangerMsg!,
            onChanged: _onMsgSwitchValueChanged,
            contentPadding: const EdgeInsetsDirectional.only(start: 20, end: 20),
          ),
        // 匹配防打扰
        if (widget.push_wakeup_chat != null)
          SettingItemWithSwitchWidget(
            title: K.setting_fb_match_intercpt,
            subTitle: K.setting_dont_join_match_chat,
            value: widget.push_wakeup_chat == 2,
            onChanged: _onPushSwitchValueChanged,
            contentPadding: const EdgeInsetsDirectional.only(start: 20, end: 20),
          ),
        if (_showRoomRecommend)
          SettingItemWithSwitchWidget(
            title: K.setting_room_recommend_invisible,
            subTitle: K.setting_not_recommend_room,
            value: widget.closeRoomRecommend,
            onChanged: _roomRecommendChanged,
            contentPadding: const EdgeInsetsDirectional.only(start: 20, end: 20),
          ),
        SettingItemWithSwitchWidget(
          title: K.setting_phone_address_book_hide,
          subTitle: K.setting_not_find_you_by_phone,
          value: widget.addressBookInvisible,
          onChanged: _addressBookVisibleChanged,
          contentPadding: const EdgeInsetsDirectional.only(start: 20, end: 20),
        ),
        // SettingItemWithSwitchWidget(
        //   title: K.setting_nearby_invisible,
        //   subTitle: K.setting_nearby_invisible_explain,
        //   value: widget.nearbyInvisible,
        //   onChanged: _onNearbyVisibleChanged,
        //   contentPadding: const EdgeInsetsDirectional.only(start: 20, end: 20),
        // ),
        // if (!showNewRecommendSetting)
        //   SettingItemWithSwitchWidget(
        //     title: K.setting_close_recommend,
        //     subTitle: K.setting_close_recommend_desc,
        //     value: widget.enableRecommend,
        //     onChanged: _onRecommendEnableChanged,
        //     contentPadding: EdgeInsetsDirectional.only(start: 20, end: 20),
        //   ),
        //显示距离
        // SettingItemWidget(
        //   title: K.setting_distance_show,
        //   subTitle: K.setting_distance_other_cansee,
        //   trailingText: distanceTrailText[widget.showDistance],
        //   onClicked: () {
        //     _displaySetTitleMenu();
        //   },
        // ),
        if (widget.enableStrangerMsg != null || widget.push_wakeup_chat != null) const SettingDividerWidget(),
        // if (showNewRecommendSetting)
        //   SettingItemWidget(
        //       title: K.setting_recommend_manage,
        //       onClicked: () {
        //         RecommendManagePage.show(context);
        //       }),
        if (!Util.isAndroidVerify)
          SettingItemWidget(
            title: K.blacklist_screen_title,
            onClicked: () {
              BlackListScreen.show(context);
            },
          ),
      ],
    );
  }

  _displaySetTitleMenu() async {
    try {
      List<SheetItem> res = [];

      res.add(SheetItem(K.setting_distance_all_cansee, 'setting_distance_all_cansee'));
      res.add(SheetItem(K.setting_distance_friend_cansee, 'setting_distance_friend_cansee'));
      res.add(SheetItem(K.setting_distance_all_hide, 'setting_distance_all_hide'));

      SheetCallback? result = await displayModalBottomSheet(
          context: context,
          builder: (BuildContext context) {
            return RadioBottomSheet(
              title: K.setting_distance_choose_title,
              data: res,
            );
          });
      if (result == null || result.reason == SheetCloseReason.Active) {
        return;
      }

      _onMenu(result.value!);
    } catch (e) {
      Log.d(e);
    }
  }

  _onMenu(SheetItem value) async {
    Map<String, String> titleIndex = {
      'setting_distance_all_cansee': '1',
      'setting_distance_friend_cansee': '2',
      'setting_distance_all_hide': '3'
    };

    if (widget.showDistance != Util.parseInt(titleIndex[value.key])) {
      try {
        XhrResponse response =
            await Xhr.postJson("${System.domain}account/opdistanceprivacy", {'value': titleIndex[value.key] ?? ''}, throwOnError: true);

        Map res = response.value();
        if (res['success'] == true) {
          widget.showDistance = Util.parseInt(titleIndex[value.key]);
          if (mounted) {
            setState(() {});
          }

          Fluttertoast.showToast(msg: K.setting_set_success, gravity: ToastGravity.CENTER);
        } else {
          if (res['msg'] != null && res['msg'] is String) {
            Fluttertoast.showToast(msg: res['msg'], gravity: ToastGravity.CENTER);
          }
        }
      } catch (e) {
        Fluttertoast.toastException(exp: e, gravity: ToastGravity.CENTER);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(K.settings_privacy_setting),
      body: _renderBody(context),
    );
  }

  void _onOneKeyProtectionChanged(bool value) async {
    NormalNull res = await SettingRepository.setGeneralSetting(1, value ? 1 : 0);
    if (res.success) {
      widget.enableOneKeyProtection = value;
      if (mounted) {
        setState(() {});
      }
      Fluttertoast.showToast(msg: K.setting_set_success, gravity: ToastGravity.CENTER);
    } else {
      if (res.msg.isNotEmpty) {
        Fluttertoast.showToast(msg: res.msg, gravity: ToastGravity.CENTER);
      }
    }
  }

  void _onMsgSwitchValueChanged(bool value) async {
    try {
      XhrResponse response = await Xhr.postJson(
          "${System.domain}account/strangermsg",
          {
            'value': value ? "0" : "1",
          },
          throwOnError: true);
      Map res = response.value();
      if (res['success'] == true) {
        widget.enableStrangerMsg = value;
        if (mounted) {
          setState(() {});
        }
        Fluttertoast.showToast(msg: K.setting_set_success, gravity: ToastGravity.CENTER);
      } else {
        if (res['msg'] != null && res['msg'] is String) {
          Fluttertoast.showToast(msg: res['msg'], gravity: ToastGravity.CENTER);
        }
      }
    } catch (e) {
      Fluttertoast.toastException(exp: e, gravity: ToastGravity.CENTER);
    }
  }

  void _onPushSwitchValueChanged(bool value) async {
    try {
      XhrResponse response = await Xhr.postJson(
          "${System.domain}account/pushwakeupMsg",
          {
            'value': value ? "1" : "0",
          },
          throwOnError: true);
      Map res = response.value();
      if (res['success'] == true) {
        widget.push_wakeup_chat = value ? 2 : 1;
        if (mounted) {
          setState(() {});
        }
        Fluttertoast.showToast(msg: K.setting_set_success, gravity: ToastGravity.CENTER);
      } else {
        if (res['msg'] != null && res['msg'] is String) {
          Fluttertoast.showToast(msg: res['msg'], gravity: ToastGravity.CENTER);
        }
      }
    } catch (e) {
      Fluttertoast.toastException(exp: e, gravity: ToastGravity.CENTER);
    }
  }

  void _roomRecommendChanged(bool value) async {
    NormalNull res = await SettingRepository.setGeneralSetting(9, value ? 1 : 0);
    Tracker.instance.track(TrackEvent.open_room_push, properties: {
      'click_tab': value ? 1 : 0, // 1关闭推荐，0打开推荐
    });
    if (res.success) {
      widget.closeRoomRecommend = value;
      if (mounted) {
        setState(() {});
      }
      Fluttertoast.showToast(msg: K.setting_set_success, gravity: ToastGravity.CENTER);
    } else {
      if (res.msg.isNotEmpty) {
        Fluttertoast.showToast(msg: res.msg, gravity: ToastGravity.CENTER);
      }
    }
  }

  void _addressBookVisibleChanged(bool value) async {
    try {
      XhrResponse response = await Xhr.postJson(
          "${System.domain}account/addrBookVisible",
          {
            'addr_book_invisible': value ? "1" : "0",
          },
          throwOnError: true);
      Map res = response.value();
      if (res['success'] == true) {
        widget.addressBookInvisible = value;
        if (mounted) {
          setState(() {});
        }
        Fluttertoast.showToast(msg: K.setting_set_success, gravity: ToastGravity.CENTER);
      } else {
        if (res['msg'] != null && res['msg'] is String) {
          Fluttertoast.showToast(msg: res['msg'], gravity: ToastGravity.CENTER);
        }
      }
    } catch (e) {
      Fluttertoast.toastException(exp: e, gravity: ToastGravity.CENTER);
    }
  }

  void _onNearbyVisibleChanged(bool value) async {
    try {
      XhrResponse response = await Xhr.postJson(
          "${System.domain}account/nearbyvisible",
          {
            'nearby_invisible': value ? "1" : "0",
          },
          throwOnError: true);
      Map res = response.value();
      if (res['success'] == true) {
        widget.nearbyInvisible = value;
        eventCenter.emit('settings.changed.nearbyInvisible', value);
        if (mounted) {
          setState(() {});
        }
        Fluttertoast.showToast(msg: K.setting_set_success, gravity: ToastGravity.CENTER);
      } else {
        if (res['msg'] != null && res['msg'] is String) {
          Fluttertoast.showToast(msg: res['msg'], gravity: ToastGravity.CENTER);
        }
      }
    } catch (e) {
      Fluttertoast.toastException(exp: e, gravity: ToastGravity.CENTER);
    }
  }

  void _load() async {
    _loading = true;
    await Future.wait([
      Future(() async {
        _settingsInfoRsp = await BaseRequestManager.getSettingsInfo();
      }),
      Future(() async {
        _generalSettingRes = await SettingRepository.getGeneralSetting();
      }),
    ]);
    _loading = false;
    if (_settingsInfoRsp != null && _settingsInfoRsp!.success && _generalSettingRes != null && _generalSettingRes!.success) {
      _errorMsg = null;
      widget.enableStrangerMsg = _settingsInfoRsp!.data.showMsgSetting ? _settingsInfoRsp!.data.enableStrangerMsg : null;
      widget.push_wakeup_chat = _settingsInfoRsp!.data.pushWakeupChat;
      widget.nearbyInvisible = _settingsInfoRsp!.data.nearbyInvisible;
      widget.addressBookInvisible = _settingsInfoRsp!.data.addressBookInvisible;
      widget.enableRecommend = _settingsInfoRsp!.data.enableRecommend;
      _showRoomRecommend = _settingsInfoRsp!.data.enableRoomRecommend;

      widget.enableOneKeyProtection = _generalSettingRes!.data.oneKeyProtection == 1;
      widget.closeRoomRecommend = _generalSettingRes!.data.closeBootRoomRecommend == 1;
    } else {
      _errorMsg = R.string('click_to_retry');
    }
    _refresh();
  }

  void _refresh() {
    if (mounted) {
      setState(() {});
    }
  }
}
