import 'package:shared/shared.dart';
import 'package:flutter/material.dart';

import '../../k.dart';

class DefendGardenBuyDialog extends StatelessWidget {
  final String subTitle;
  final int money;
  DefendGardenBuyDialog({super.key, this.money = 0, this.subTitle = ''});

  static Future<bool?> show(
      {BuildContext? buildContext, String subTitle = '', int money = 0}) {
    BuildContext context = buildContext ?? System.context;
    return showGeneralDialog(
      context: context,
      pageBuilder: (BuildContext buildContext, Animation<double> animation,
          Animation<double> secondaryAnimation) {
        return Center(
          child: DefendGardenBuyDialog(
            money: money,
            subTitle: subTitle,
          ),
        );
      },
      barrierDismissible: true,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      barrierColor: Colors.black54,
      transitionDuration: const Duration(milliseconds: 300),
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        return ScaleTransition(
          scale: CurvedAnimation(
            parent: animation,
            curve: Curves.easeOut,
          ),
          child: child,
        );
      },
      useRootNavigator: true,
      routeSettings: null,
    );
  }

  @override
  Widget build(BuildContext context) {
    double width = 312;
    if (Util.width - 2 * 30 < width) {
      width = Util.width - 2 * 30;
    }
    return Container(
      width: width,
      padding: const EdgeInsetsDirectional.only(
          start: 20, end: 20, top: 24, bottom: 23),
      decoration: BoxDecoration(
        borderRadius: BorderRadiusDirectional.circular(16),
        color: R.color.mainBgColor,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            K.personal_defend_garden_buy_dialog_title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: R.color.mainTextColor,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            subTitle,
            style: TextStyle(
              fontSize: 16,
              color: R.color.secondTextColor,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 24,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () {
                  /// 再等等
                  Navigator.of(context).pop(false);
                },
                child: Container(
                  width: (width - 40 - 12) / 2,
                  height: 48,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadiusDirectional.circular(24),
                    color: const Color(0xFFF5F5F5),
                  ),
                  alignment: AlignmentDirectional.center,
                  child: Text(
                    K.personal_defend_wait,
                    style: TextStyle(
                      fontSize: 15,
                      color: R.color.mainTextColor.withOpacity(0.7),
                    ),
                  ),
                ),
              ),
              const Spacer(),
              GestureDetector(
                onTap: () {
                  /// 提前解锁
                  unlock();
                },
                child: SizedBox(
                  width: (width - 40 - 12) / 2,
                  height: 58,
                  child: Stack(
                    children: [
                      PositionedDirectional(
                        top: 10,
                        child: Container(
                          width: (width - 40 - 12) / 2,
                          height: 48,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadiusDirectional.circular(24),
                            gradient: LinearGradient(
                              begin: AlignmentDirectional.centerStart,
                              end: AlignmentDirectional.centerEnd,
                              colors: R.color.mainBrandGradientColors,
                            ),
                          ),
                          alignment: AlignmentDirectional.center,
                          child: Text(
                            K.personal_defend_garden_buy_btn,
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      PositionedDirectional(
                        end: 0,
                        child: Container(
                          height: 20,
                          padding: const EdgeInsetsDirectional.only(
                              start: 8, end: 8),
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadiusDirectional.only(
                              topEnd: Radius.circular(66),
                              bottomEnd: Radius.circular(10),
                              topStart: Radius.circular(57),
                              bottomStart: Radius.circular(57),
                            ),
                            gradient: LinearGradient(
                              begin: AlignmentDirectional.centerEnd,
                              end: AlignmentDirectional.centerStart,
                              colors: [Color(0xFFFF638C), Color(0xFFFA7845)],
                            ),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              R.img(
                                MoneyConfig.moneyIcon,
                                width: 13,
                                height: 13,
                              ),
                              const SizedBox(
                                width: 2,
                              ),
                              Text(
                                '$money',
                                style: const TextStyle(
                                  fontSize: 9,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  bool _isPaying = false;
  final IPayManager _payManager =
      ComponentManager.instance.getManager(ComponentManager.MANAGER_PAY);
  void unlock() async {
    if (_isPaying) {
      return;
    }

    _displayPay();
  }

  _displayPay() async {
    SheetCallback? result =
        await _payManager.showRechargeSheet(System.context, money);
    if (result == null ||
        result.reason == SheetCloseReason.Active ||
        result.value?.key == IPayManager.pTRecharge) {
      return;
    }

    _pay(result.value?.key);
  }

  void _pay(String? type) {
    _isPaying = true;
    Map<String, dynamic> params = {};
    _payManager.pay(System.context,
        key: 'defend_garden_unlock',
        type: type ?? '',
        args: {
          'money': money,
          'type': 'defend-garden-unlock',
          'params': params,
        },
        showLoading: true,
        onPayed: _onPayed,
        onError: _onPayError);
  }

  void _onPayed() {
    _isPaying = false;
    Navigator.of(System.context).pop(true);
  }

  void _onPayError(bool isErrorCatch) {
    _isPaying = false;
  }
}
