import 'dart:math';

import 'package:shared/shared.dart';
import 'package:flutter/material.dart';

import '../../../assets.dart';
import '../../../k.dart';

class KillerCreateRoomCheckDialog extends StatelessWidget {
  const KillerCreateRoomCheckDialog({super.key});

  /// 创房前置实名认证
  /// true 可以跳转创房页， false 不可以
  static Future<bool> show() async {
    if (!Session.idAuthenticated) {
      bool? check = await showDialog(
          context: System.context,
          barrierDismissible: false,
          builder: (context) {
            return const KillerCreateRoomCheckDialog();
          });
      if (check != null && check) {
        ISettingManager settingManager = ComponentManager.instance
            .getManager(ComponentManager.MANAGER_SETTINGS);
        settingManager.openIdAuth(System.context);
      }
    } else {
      if (Session.isAdult == 1) {
        return true;
      } else {
        Fluttertoast.showCenter(msg: K.setting_juvenlie_cannot_create_room);
      }
    }

    return false;
  }

  @override
  Widget build(BuildContext context) {
    double dialogWidth = min(Util.width - 48, 328);
    double detailPadding = dialogWidth == 328 ? 36 : 26;
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: dialogWidth,
            decoration: BoxDecoration(
              color: R.color.secondBgColor,
              borderRadius: const BorderRadius.all(Radius.circular(16)),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 32, bottom: 24),
                  child: R.img(Assets.settings$juveniles_guide_icon_webp,
                      package: ComponentManager.MANAGER_SETTINGS,
                      width: 160,
                      height: 120),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.only(
                      start: detailPadding, end: detailPadding, bottom: 20),
                  child: Text(
                    K.setting_juvenlie_create_room_tips,
                    style:
                        TextStyle(color: R.color.secondTextColor, fontSize: 14),
                  ),
                ),
                Container(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                    ISettingManager settingManager = ComponentManager.instance
                        .getManager(ComponentManager.MANAGER_SETTINGS);
                    settingManager.openIdAuth(context);
                  },
                  child: Container(
                    height: 48,
                    margin:
                        const EdgeInsetsDirectional.only(start: 40, end: 40),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      gradient: LinearGradient(
                          colors: R.color.mainBrandGradientColors),
                    ),
                    child: Text(
                      K.setting_goto_certification,
                      style: const TextStyle(
                          color: Color(0xFFFFFFFF), fontSize: 15),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 37,
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsetsDirectional.only(top: 27),
            width: 34,
            height: 34,
            child: GestureDetector(
                child: R.img(
                  'dialog_close.webp',
                ),
                onTap: () {
                  Navigator.of(context).pop(false);
                }),
          )
        ],
      ),
    );
  }
}
