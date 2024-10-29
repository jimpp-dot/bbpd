import 'package:shared/assets.dart';
import 'package:flutter/material.dart';
import 'package:shared/shared.dart';
import 'package:settings/k.dart';

import '../../assets.dart';

//安全手机绑定成功弹框界面
class BindSafeMobileSuccessDialog extends StatelessWidget {
  const BindSafeMobileSuccessDialog({super.key});

  static void showBindSafeDialog() async {
    WidgetsBinding.instance.addPostFrameCallback((Duration timeStamp) {
      showDialog(
          context: Constant.context,
          builder: (context) => const BindSafeMobileSuccessDialog());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 91.0,
            child: Stack(
              children: <Widget>[
                PositionedDirectional(
                    start: 71.0,
                    top: 25.0,
                    child: InkWell(
                      onTap: () {},
                      child: R.img(
                        Assets.settings$btn_bind_success_png,
                        width: 133.0,
                        height: 66.0,
                        package: ComponentManager.MANAGER_SETTINGS,
                      ),
                    )),
                PositionedDirectional(
                    end: 16.0,
                    top: 16.0,
                    child: InkWell(
                      onTap: () {
                        _onDisagree(context);
                      },
                      child: R.img(
                        BaseAssets.shared$btn_close_black_png,
                        width: 10.0,
                        height: 10.0,
                        package: ComponentManager.MANAGER_BASE_CORE,
                      ),
                    )),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 12.0, left: 102.0),
            child: Text(
              K.setting_bind_success,
              textAlign: TextAlign.start,
              style: TextStyle(fontSize: 16.0, color: R.color.mainTextColor),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                left: 27.0, right: 27.0, top: 18.0, bottom: 23.0),
            child: Text(
              K.setting_change_safephone_path,
              textAlign: TextAlign.start,
              style: TextStyle(fontSize: 14.0, color: R.color.thirdTextColor),
            ),
          ),
        ],
      ),
    );
  }

  _onDisagree(context) {
    Navigator.pop(context);
  }
}
