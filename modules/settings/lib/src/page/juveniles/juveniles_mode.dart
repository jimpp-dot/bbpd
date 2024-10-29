import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:settings/a.dart';
import 'package:settings/k.dart';

import 'juveniles_plan.dart';

/// 青少年模式
class JuvenilesMode extends StatefulWidget {
  const JuvenilesMode({super.key});

  /// 是否开启保护模式
  static bool isActive() => Session.getInt('young_mode', 0) == 1;

  @override
  _JuvenilesModeState createState() {
    return _JuvenilesModeState();
  }

  static void show(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => const JuvenilesMode(),
      settings: const RouteSettings(name: '/juveniles'),
    ));
  }
}

class _JuvenilesModeState extends State<JuvenilesMode> {
  bool _switch = false;

  @override
  void initState() {
    super.initState();
    _switch = JuvenilesMode.isActive();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _switch = JuvenilesMode.isActive();
  }

  List<String> get tips => _switch ? A.setting_juveniles_tips : A.setting_juveniles_disable_tips;

  Widget _buildBody(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: BaseAppBar(
        K.juveniles_protect_title,
        showBack: !_switch,
      ),
      body: Padding(
        padding: const EdgeInsetsDirectional.only(start: 20, end: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const SizedBox(height: 48),
            R.img(
              'juveniles_guide_icon.webp',
              width: 160,
              height: 120,
              package: ComponentManager.MANAGER_SETTINGS,
            ),
            const SizedBox(height: 28),
            Text(
              _switch ? K.settings_juveniles_enabled : K.settings_juveniles_disabled,
              style: TextStyle(fontSize: 16, color: R.color.mainTextColor, fontWeight: FontWeight.w600),
            ),
            ...tips
                .expand((_) => [
                      const SizedBox(
                        height: 12,
                      ),
                      _getRow(_),
                    ])
                .toList(),
            const SizedBox(
              height: 36,
            ),
            InkResponse(
              onTap: () => _toggleSwitch(!_switch),
              customBorder: const StadiumBorder(),
              child: Container(
                height: 48,
                alignment: AlignmentDirectional.center,
                decoration: ShapeDecoration(
                  shape: const StadiumBorder(),
                  gradient: LinearGradient(colors: R.color.mainBrandGradientColors),
                ),
                child: Text(
                  _switch ? K.settings_disable_juveniles : K.settings_enable_juveniles,
                  style: const TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_switch) {
      return WillPopScope(
        onWillPop: () => Future.value(false),
        child: _buildBody(context),
      );
    } else {
      return _buildBody(context);
    }
  }

  Widget _getRow(String text) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          width: 6,
          height: 6,
          decoration: BoxDecoration(
            color: R.color.mainBrandColor,
            shape: BoxShape.circle,
          ),
          margin: const EdgeInsetsDirectional.only(top: 9, end: 9),
        ),
        Expanded(
          child: Text(
            text,
            style: TextStyle(
              color: R.color.mainTextColor,
              fontSize: 14,
            ),
          ),
        ),
      ],
    );
  }

  /// 跳转到未成年人保护计划
  _showProtectionPlan() {
    Log.d('_JuvenilesModeState._showProtectionPlan');
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const JuvenilesPlan(),
      ),
    );
  }

  /// 切换开关
  _toggleSwitch(bool value) {
    if (value) {
      // 需要设置密码
      _openSwitch();
    } else {
      // on => off
      _closeSwitch();
    }
  }

  /// 关闭开关
  _closeSwitch() async {
    String? pwd = await showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return PwdDialog(title: K.setting_input_pwd, showReset: true);
      },
    );
    if (pwd != null && pwd.length == 4) {
      XhrResponse response = await Xhr.postJson('${System.domain}youngmode/set', {
        'mode': '0',
        'password': pwd,
        'device': DeviceInfo.mac,
      });
      if (response.error == null) {
        Map res = response.value();
        if (res['success'] == true) {
          Toast.showCenter(context, K.setting_operate_success);
          await Session.setValue('young_mode', '0');
          setState(() {
            _switch = false;
          });
          return;
        }
      }
      Toast.showCenter(context, K.setting_pwd_error);
    }
    setState(() {
      _switch = JuvenilesMode.isActive();
    });
  }

  /// 打开开关
  _openSwitch() async {
    String? firstPwd = await showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return PwdDialog(title: K.setting_setup_pwd);
      },
    );
    if (firstPwd == null) {
      return;
    }

    String? secondPwd = await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return PwdDialog(title: K.setting_input_pwd_again);
      },
    );
    if (secondPwd == null) {
      Toast.showCenter(context, K.setting_already_cancel);
      return;
    }
    if (firstPwd != secondPwd) {
      Toast.showCenter(context, K.setting_twice_pwd_not_same);
      return;
    }
    XhrResponse response = await Xhr.postJson('${System.domain}youngmode/set', {
      'mode': '1',
      'password': firstPwd,
      'device': DeviceInfo.mac,
    });
    if (response.error == null) {
      Map res = response.value();
      if (res['success'] == true) {
        Toast.showCenter(context, K.setting_setup_pwd_success);
        await Session.setValue('young_mode', '1');
        setState(() {
          _switch = true;
        });

        IRoomManager roomManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_BASE_ROOM);
        roomManager.topLiveToolDestroy();
        return;
      }
    }
    Toast.show(context, K.setting_submit_failed);
  }
}

/// 密码输入框
class PwdDialog extends StatefulWidget {
  final String? title;
  final bool showReset;

  PwdDialog({super.key, String? title, this.showReset = false}) : title = title ?? K.setting_please_input_pwd;

  @override
  _PwdDialogState createState() {
    return _PwdDialogState();
  }
}

class _PwdDialogState extends State<PwdDialog> {
  final ISettingManager _settingManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_SETTINGS);

  String _pwd = '';
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  _close() {
    Navigator.of(context).pop(_pwd.length == 4 ? _pwd : null);
  }

  _onChanged(String value) {
    Log.d('_PwdDialogState._onChanged: $value');
    setState(() {
      _pwd = value;
    });
    if (value.length == 4) {
      _focusNode.unfocus();
      _close();
    }
  }

  Widget _buildTextItem(int index) {
    return Container(
      width: 40,
      height: 36,
      alignment: Alignment.topCenter,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: R.color.thirdTextColor,
          ),
        ),
      ),
      child: Text(
        _pwd.length > index ? '*' : '',
        style: TextStyle(
          color: R.color.mainTextColor,
          fontSize: 24,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      backgroundColor: R.color.dialogBgColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      title: Center(
        child: Text(
          widget.title ?? '',
          style: TextStyle(color: R.color.mainTextColor, fontSize: 16),
        ),
      ),
      contentPadding: const EdgeInsetsDirectional.only(
        start: 30,
        end: 30,
        bottom: 32,
        top: 36,
      ),
      children: <Widget>[
        SizedBox(
          height: 36,
          child: Stack(
            children: [
              TextField(
                autofocus: true,
                autocorrect: false,
                maxLines: 1,
                maxLength: 4,
                maxLengthEnforcement: MaxLengthEnforcement.enforced,
                decoration: null,
                style: const TextStyle(
                  color: Colors.transparent,
                  fontSize: 1,
                  fontWeight: FontWeight.w500,
                ),
                obscureText: true,
                cursorWidth: 0,
                keyboardType: TextInputType.number,
                enableInteractiveSelection: false,
                focusNode: _focusNode,
                onChanged: _onChanged,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              ),
              IgnorePointer(
                child: Container(
                  color: R.color.secondBgColor,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      _buildTextItem(0),
                      _buildTextItem(1),
                      _buildTextItem(2),
                      _buildTextItem(3),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        if (widget.showReset)
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 36),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsetsDirectional.only(end: 4),
                    child: Text(
                      K.settings_youngmode_forget,
                      style: TextStyle(
                        color: R.color.thirdTextColor,
                        fontSize: 13,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () async {
                      _focusNode.unfocus();
                      if (Util.isIdAuthenticated()) {
                        final result = await _settingManager.openIdAuth(context, certifyType: CertifyType.youngmode);
                        if (result == true) {
                          await Session.sync({'young_mode': true});
                          _close();
                        }
                      } else {
                        _settingManager.openIdAuth(context);
                      }
                    },
                    child: Text(
                      K.settings_youngmode_appeal_reset,
                      style: TextStyle(
                        color: R.color.mainBrandColor,
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
      ],
    );
  }
}
