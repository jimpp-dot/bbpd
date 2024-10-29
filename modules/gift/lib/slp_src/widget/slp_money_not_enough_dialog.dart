import 'package:shared/assets.dart';
import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:gift/k.dart';

/// 余额不足，引导充值弹窗
class SlpMoneyNotEnoughDialog {
  static Future<bool> show(BuildContext context, int maxCost) async {
    bool? agree = await showDialog(
        context: System.context,
        builder: (context) {
          return CustomAlertDialog(
            title: K.gift_money_not_enough,
            content: K.gift_money_not_enough_content(['$maxCost']),
            negativeButton: null,
            positiveButton: PositiveButton(
              text: K.gift_go_recharge,
              width: 200,
              height: 48,
            ),
            closeWidget: GestureDetector(
              onTap: () => Navigator.of(context).pop(),
              behavior: HitTestBehavior.opaque,
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: R.img(
                  BaseAssets.ic_close_svg,
                  package: ComponentManager.MANAGER_BASE_CORE,
                  width: 16,
                  height: 16,
                  color: R.color.mainTextColor,
                ),
              ),
            ),
          );
        });

    if (agree == true) {
      // 前往充值
      ISettingManager? manager = ComponentManager.instance
          .getManager(ComponentManager.MANAGER_SETTINGS);
      await manager?.openRechargeScreen(context, refer: 'gift');
      return true;
    }

    return false;
  }
}
