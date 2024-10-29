import 'package:settings/k.dart';
import 'package:shared/shared.dart';
import 'package:shared/k.dart' as BaseK;
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../assets.dart';

// 背景设置
class BackgroundSetting extends StatefulWidget {
  const BackgroundSetting({super.key});

  @override
  State<StatefulWidget> createState() => _BackgroundSettingState();

  static void show(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => const BackgroundSetting(),
      settings: const RouteSettings(name: '/BackgroundSetting'),
    ));
  }
}

class _BackgroundSettingState extends State<BackgroundSetting> {
  bool _curMode = darkMode;

  @override
  initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _checkChange,
      child: Scaffold(
        appBar:
            BaseAppBar(K.settings_bg_setting, onBackPressedCallback: _onBack),
        body: SafeArea(child: _renderBody()),
      ),
    );
  }

  Widget _renderBody() {
    double imgWidth = (Util.width - 16 * 2 - 16) / 2;
    double imgHeight = imgWidth * 311 / 165;
    return Container(
      padding: const EdgeInsetsDirectional.only(
          start: 16, end: 16, top: 60, bottom: 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () {
                  if (!_curMode) {
                    _curMode = !_curMode;
                    refresh();
                  }
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    R.img(Assets.settings$ic_home_theme_bg_dark_webp,
                        width: imgWidth,
                        height: imgHeight,
                        package: ComponentManager.MANAGER_SETTINGS),
                    const SizedBox(height: 16),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        _curMode
                            ? CheckBoxChecked(color: R.dColor.brightTextColor)
                            : const CheckBoxUnchecked(),
                        const SizedBox(width: 4),
                        Text(
                          K.setting_theme_dark_title,
                          style: TextStyle(
                              color: R.color.mainTextColor,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () {
                  if (_curMode) {
                    _curMode = !_curMode;
                    refresh();
                  }
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    R.img(Assets.settings$ic_home_theme_bg_light_webp,
                        width: imgWidth,
                        height: imgHeight,
                        package: ComponentManager.MANAGER_SETTINGS),
                    const SizedBox(height: 16),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        !_curMode
                            ? CheckBoxChecked(color: R.dColor.brightTextColor)
                            : const CheckBoxUnchecked(),
                        const SizedBox(width: 4),
                        Text(
                          K.setting_theme_light_title,
                          style: TextStyle(
                              color: R.color.mainTextColor,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          const Spacer(),
          GestureDetector(
            onTap: _onSure,
            child: Container(
              width: double.infinity,
              height: 52,
              decoration: ShapeDecoration(
                shape: const StadiumBorder(),
                color: _curMode != darkMode
                    ? R.color.mainBrandColor
                    : R.color.mainBrandColor.withOpacity(0.5),
              ),
              alignment: AlignmentDirectional.center,
              child: Text(
                BaseK.K.sure,
                style: TextStyle(
                    color: R.dColor.mainTextColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future _onBack() async {
    bool result = await _checkChange();
    if (result) {
      Navigator.of(context).pop();
    }
  }

  Future<bool> _checkChange() async {
    if (_curMode != darkMode) {
      bool? result = await showDialog(
        context: context,
        builder: (BuildContext context) {
          return ConfirmDialog(
            title: BaseK.K.tips,
            content: K.setting_change_not_save_content,
            positiveButton: PositiveButton(text: BaseK.K.base_go_back),
          );
        },
      );
      return result != null && result == true;
    }
    return true;
  }

  Future _onSure() async {
    if (_curMode != darkMode) {
      bool? result = await showDialog(
        context: context,
        builder: (BuildContext context) {
          return ConfirmDialog(
            title: BaseK.K.tips,
            content: K.setting_theme_change_content,
            positiveButton: PositiveButton(text: BaseK.K.sure),
          );
        },
      );
      if (result == true) {
        darkMode = _curMode;
        Config.setBool(DARK_MODE, darkMode);
        Tracker.instance.track(
          TrackEvent.common_operate,
          properties: {
            'operate_name': 'background_setting',
            'operate_content': darkMode ? 'dark' : 'light'
          },
        );
        Get.forceAppUpdate();
        Navigator.popUntil(System.context, ModalRoute.withName('/'));
      }
    }
  }
}
