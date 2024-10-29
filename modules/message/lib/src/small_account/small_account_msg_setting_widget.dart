import 'package:shared/shared.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:message/k.dart';
import 'package:message/src/api/message_repo.dart';

class SmallAccountMsgSettingWidget extends StatefulWidget {
  const SmallAccountMsgSettingWidget({super.key});

  @override
  State<StatefulWidget> createState() => _SmallAccountMsgSettingState();

  static void show(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => const SmallAccountMsgSettingWidget(),
      settings: const RouteSettings(name: '/smallAccountSetting'),
    ));
  }
}

class _SmallAccountMsgSettingState extends State<SmallAccountMsgSettingWidget> {
  bool _switch = true;

  @override
  void initState() {
    super.initState();
    init();
    _loadData();
  }

  void init() {
    String value =
        Config.get('small_account_notify_switch_${Session.uid}', '1');
    _switch = (value == '1');
  }

  void _loadData() async {
    await MessageRepo.getSmallAccountSetting();
    init();
    refresh();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: R.colors.homeBgColor,
      appBar: BaseAppBar.custom(
        statusBrightness: darkMode ? Brightness.dark : Brightness.light,
        backColor: R.colors.mainTextColor,
        backgroundColor: R.colors.homeBgColor,
        title: Text(
          K.small_account_msg_setting_title,
          style: R.textStyle.title.copyWith(
            color: R.colors.mainTextColor,
          ),
        ),
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                K.small_account_msg_dialog_switch,
                style: TextStyle(
                  color: R.colors.mainTextColor,
                  fontSize: 16,
                ),
              ),
              CupertinoSwitch(
                value: _switch,
                activeColor: R.colors.mainBrandColor,
                onChanged: (bool value) async {
                  _switch = value;
                  refresh();
                  _onSave();
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  void _onSave() async {
    String allow = _switch ? '1' : '2';
    NormalNull res = await MessageRepo.updateSmallAccountSetting(allow);
    if (res.success) {
      Config.set('small_account_notify_switch_${Session.uid}', allow);
    } else {
      _switch = !_switch;
      refresh();
      Fluttertoast.showToast(msg: res.msg);
    }
  }
}
