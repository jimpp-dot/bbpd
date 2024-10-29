import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_switch/flutter_advanced_switch.dart';
import 'package:chat_room/k.dart';

/// 生日提醒设置

class BirthdayReminderSettingsPage extends StatefulWidget {
  const BirthdayReminderSettingsPage({Key? key}) : super(key: key);

  @override
  State<BirthdayReminderSettingsPage> createState() =>
      _BirthdayReminderSettingsPageState();

  static Future show(BuildContext context) {
    return Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const BirthdayReminderSettingsPage(),
        settings: const RouteSettings(name: '/BirthdayReminderSettingsPage'),
      ),
    );
  }
}

class _BirthdayReminderSettingsPageState
    extends State<BirthdayReminderSettingsPage> {
  final ISettingManager _settingManager =
      ComponentManager.instance.getManager(ComponentManager.MANAGER_SETTINGS);
  final ValueNotifier<bool> _controller = ValueNotifier<bool>(false);

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  void _loadData() async {
    bool closeBirthdayRemind =
        await _settingManager.getCloseBirthdayReminderFromGeneralSetting();
    _controller.value = closeBirthdayRemind;
    _controller.addListener(() async {
      bool value = _controller.value;

      Tracker.instance.track(TrackEvent.click,
          properties: {'click_page': 'click_reming', 'value': value ? 1 : 0});

      /// 生日提醒设置
      /// value true：关闭生日提醒，false：打开生日提醒
      /// 传参   setting_type   4
      /// on    1-关闭生日提醒，0-打开生日提醒
      NormalNull resp =
          await _settingManager.setGeneralSetting(4, value ? 1 : 0);
      if (resp.success) {
        Fluttertoast.showCenter(msg: K.room_set_success);
      } else {
        Fluttertoast.showCenter(msg: resp.msg);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar.custom(
        title: Text(
          K.room_birthday_reminder_settings,
          style: TextStyle(
              color: R.color.mainTextColor,
              fontSize: 18,
              fontWeight: FontWeight.w500),
        ),
      ),
      body: Column(
        children: [
          Container(
            height: 72,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      K.room_birthday_reminder,
                      style: TextStyle(
                          color: R.color.unionRankText1, fontSize: 16),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      K.room_birthday_reminder_desc,
                      style: TextStyle(
                          color: R.color.unionRankText1.withOpacity(0.4),
                          fontSize: 13),
                    ),
                  ],
                ),
                const Spacer(),
                AdvancedSwitch(
                  activeColor: R.color.mainBrandColor,
                  inactiveColor: Colors.grey.withOpacity(0.2),
                  thumb: Container(
                    width: 26,
                    height: 26,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(13),
                      color: Colors.white,
                    ),
                  ),
                  width: 46,
                  height: 28,
                  controller: _controller,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
