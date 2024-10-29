import 'package:settings/k.dart';
import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:settings/src/widget/slp_log_upload_dialog.dart';
import '../model/setting_repository.dart';

// 通用设置
class GeneralSetting extends StatefulWidget {
  bool notAutoCreateGroup = false;
  bool notAutoJoinGroup = false;
  int close_box_receive = 0;
  final bool showBoxSetting;
  bool closeEmoticon = false;

  GeneralSetting(
    this.notAutoCreateGroup,
    this.notAutoJoinGroup,
    this.close_box_receive,
    this.closeEmoticon, {
    Key? key,
    this.showBoxSetting = false,
  }) : super(key: key);

  static void show(BuildContext context, bool notAutoCreateGroup,
      bool notAutoJoinGroup, int closeBoxReceive, bool closeEmoticon,
      {bool showBoxSetting = true}) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => GeneralSetting(notAutoCreateGroup,
            notAutoJoinGroup, closeBoxReceive, closeEmoticon,
            showBoxSetting: showBoxSetting),
        settings: const RouteSettings(name: '/GeneralSetting'),
      ),
    );
  }

  @override
  State<StatefulWidget> createState() {
    return _State();
  }
}

class _State extends State<GeneralSetting> {
  /// 是否关闭特效场景
  bool closeSpecialEffectsScene = false;

  /// 停止接单
  int _closeReceiveGameOrder = 2;

  @override
  void initState() {
    super.initState();
    _loadGeneralSettingData();
  }

  Widget _renderBody() {
    ISettingManager settingManager =
        ComponentManager.instance.getManager(ComponentManager.MANAGER_SETTINGS);
    // String boxTitle = K.setting_dont_drop_pac([BoxUtil.boxActName]);
    // String boxSubTitle = K.setting_dont_drop_pac_desc([BoxUtil.commonBoxName]);
    return Column(
      children: <Widget>[
        /*// 是否参加xx活动
        if (widget.showBoxSetting)
        SettingItemWithSwitchWidget(
          title: boxTitle,
          subTitle: boxSubTitle,
          value: widget.close_box_receive > 0,
          onChanged: _onCloseBoxValueChanged,
        ),*/
        // // 是否创建临时群
        // if (settingManager.showTempGroup())
        //   SettingItemWithSwitchWidget(
        //     title: K.setting_dont_creat_tmp_group,
        //     subTitle: K.setting_dont_creat_tmp_group_desc,
        //     value: widget.notAutoCreateGroup,
        //     onChanged: _onAutoCreateGroupChanged,
        //   ),
        // // 是否加入临时群
        // if (settingManager.showTempGroup())
        //   SettingItemWithSwitchWidget(
        //     title: K.setting_dont_join_tmp_group,
        //     subTitle: K.setting_dont_join_tmp_group_desc,
        //     value: widget.notAutoJoinGroup,
        //     onChanged: _onAutoJoinGroupChanged,
        //   ),
        // 不推荐动态表情
        /*SettingItemWithSwitchWidget(
          title: K.setting_close_emoticon,
          subTitle: K.setting_close_emoticon_desc,
          value: widget.closeEmoticon,
          onChanged: _onCloseEmoticonChanged,
        ),*/
        // 不开启特效场景
        SettingItemWithSwitchWidget(
          title: K.setting_close_special_effects_scene,
          subTitle: K.setting_close_special_effects_scene_desc,
          value: closeSpecialEffectsScene,
          onChanged: _onCloseSpecialEffectsSceneChanged,
        ),
        // 停止接单
        if (_closeReceiveGameOrder == 0 || _closeReceiveGameOrder == 1)
          SettingItemWithSwitchWidget(
            title: K.setting_stop_receive_order,
            subTitle: K.setting_stop_receive_order_tip,
            value: _closeReceiveGameOrder == 1,
            onChanged: _onStopReceiveOrderChanged,
          ),
        if (AppConfig.useBBlog)
          SettingItemWidget(
            title: K.upload_log,
            showNextIcon: true,
            onClicked: _uploadBBLog,
          ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(K.settings_general_setting),
      body: _renderBody(),
    );
  }

  void _onCloseBoxValueChanged(bool value) async {
    try {
      XhrResponse response = await Xhr.postJson(
          "${System.domain}account/closeboxreceive",
          {
            'value': value ? "1" : "0",
          },
          throwOnError: true);
      Map res = response.value();
      if (res['success'] == true) {
        widget.close_box_receive = value ? 1 : 0;
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

  void _onAutoCreateGroupChanged(bool value) {
    _onValueChanged('auto_create_group', !widget.notAutoCreateGroup, (value) {
      widget.notAutoCreateGroup = value;
    });
  }

  void _onAutoJoinGroupChanged(bool value) {
    _onValueChanged('auto_join_group', !widget.notAutoJoinGroup, (value) {
      widget.notAutoJoinGroup = value;
    });
  }

  void _onCloseEmoticonChanged(bool value) {
    _onValueChanged('close_emoticon', !widget.closeEmoticon, (value) {
      widget.closeEmoticon = value;
    });
  }

  void _onCloseSpecialEffectsSceneChanged(bool value) {
    if (closeSpecialEffectsScene) {
      _onPbValueChanged(0, !closeSpecialEffectsScene, (value) {
        closeSpecialEffectsScene = value;
      });
    } else {
      _GeneralSettingDialog.show(context,
          content: K.setting_close_special_effects_scene_dialog_desc,
          closeButtonTapedCallback: () {
        Navigator.of(context).pop();
      }, submitButtonTapedCallback: () {
        Navigator.of(context).pop();
        _onPbValueChanged(0, !closeSpecialEffectsScene, (value) {
          closeSpecialEffectsScene = value;
        });
      });
    }
  }

  void _onStopReceiveOrderChanged(bool set) {
    _onPbValueChanged(12, set, (value) {
      _closeReceiveGameOrder = value ? 1 : 0;
    });
  }

  String _getUrl(String key) {
    switch (key) {
      case 'auto_create_group':
      case 'auto_join_group':
        return 'account/roomgroup';
      case 'close_emoticon':
        return '/account/closeEmoticon';
      default:
        return '';
    }
  }

  String _getParamName(String key) {
    switch (key) {
      case 'auto_create_group':
        return 'close_create_room_group';
      case 'auto_join_group':
        return 'close_join_room_group';
      case 'close_emoticon':
        return 'value';
      default:
        return '';
    }
  }

  void _onValueChanged(
      String key, dynamic value, ValueChanged onValueChanged) async {
    try {
      XhrResponse response = await Xhr.postJson(
          '${System.domain}${_getUrl(key)}',
          {
            _getParamName(key): value ? "1" : "0",
          },
          throwOnError: true);
      Map res = response.value();
      if (res['success'] == true) {
        onValueChanged(value);
        setState(() {});

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

  void _loadGeneralSettingData() {
    SettingRepository.getGeneralSetting().then((resp) {
      if (resp.success && resp.hasData() && mounted) {
        _closeReceiveGameOrder = resp.data.closeReceiveGameOrder;
        setState(() {
          closeSpecialEffectsScene = resp.data.closeSpecialEffectsScene == 1;
        });
      }
    });
  }

  void _onPbValueChanged(
      int settingType, bool value, ValueChanged onValueChanged) async {
    try {
      NormalNull resp =
          await SettingRepository.setGeneralSetting(settingType, value ? 1 : 0);
      if (resp.success) {
        onValueChanged(value);
        setState(() {});
        Fluttertoast.showToast(
            msg: K.setting_set_success, gravity: ToastGravity.CENTER);
        Session.sync({});
      } else {
        Fluttertoast.showToast(msg: resp.msg, gravity: ToastGravity.CENTER);
      }
    } catch (e) {
      Fluttertoast.toastException(exp: e, gravity: ToastGravity.CENTER);
    }
  }

  void _uploadBBLog() async {
    dynamic re = await showDialog(
      context: context,
      builder: (context) => ConfirmDialog(
        title: K.sure_upload_log,
        content: K.upload_log_desc,
      ),
    );

    if (re != null && re == true) {
      BBLogUploadDialog.show(context);
    }
  }
}

class _GeneralSettingDialog extends StatelessWidget {
  final String? content;
  final VoidCallback? closeButtonTapedCallback;
  final VoidCallback? submitButtonTapedCallback;

  const _GeneralSettingDialog(
      {Key? key,
      this.content,
      this.closeButtonTapedCallback,
      this.submitButtonTapedCallback})
      : super(key: key);

  static Future<void> show(BuildContext context,
      {String? content,
      VoidCallback? closeButtonTapedCallback,
      VoidCallback? submitButtonTapedCallback}) async {
    showDialog(
      context: context,
      barrierColor: const Color(0xFF08032B).withOpacity(0.85).withOpacity(0.4),
      builder: (context) {
        return AlertDialog(
          contentPadding: EdgeInsets.zero,
          backgroundColor: Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          insetPadding: EdgeInsets.zero,
          content: _GeneralSettingDialog(
            content: content,
            closeButtonTapedCallback: closeButtonTapedCallback,
            submitButtonTapedCallback: submitButtonTapedCallback,
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Util.width - 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              content ?? '',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: R.color.mainTextColor,
                  fontSize: 18,
                  fontWeight: FontWeight.w500),
            ),
          ),
          const SizedBox(height: 32),
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: closeButtonTapedCallback,
                child: Container(
                  width: 130,
                  height: 48,
                  alignment: AlignmentDirectional.center,
                  decoration: BoxDecoration(
                    color: const Color(0xFFF5F5F5),
                    borderRadius: BorderRadius.circular(28),
                  ),
                  child: Text(
                    K.cancel,
                    style: TextStyle(
                        color: R.color.unionRankText1.withOpacity(0.7),
                        fontSize: 15,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              GestureDetector(
                onTap: submitButtonTapedCallback,
                child: Container(
                  width: 130,
                  height: 48,
                  alignment: AlignmentDirectional.center,
                  decoration: BoxDecoration(
                    gradient:
                        LinearGradient(colors: R.color.mainBrandGradientColors),
                    borderRadius: BorderRadius.circular(28),
                  ),
                  child: Text(
                    K.sure,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}
