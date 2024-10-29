import 'package:personaldata/k.dart';
import 'package:shared/shared.dart';
import 'package:shared/model/defend_bean.dart';
import 'package:flutter/material.dart';

class DeleteDefendRelationForceDialog extends StatelessWidget {
  final DefendRelationModel? item;

  DeleteDefendRelationForceDialog({super.key, this.item});

  static Future<void> show(
      {BuildContext? buildContext, DefendRelationModel? item}) {
    BuildContext context = buildContext ?? System.context;
    return showGeneralDialog(
      context: context,
      pageBuilder: (BuildContext buildContext, Animation<double> animation,
          Animation<double> secondaryAnimation) {
        return Center(
          child: DeleteDefendRelationForceDialog(
            item: item,
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
      // height: 236,
      padding: const EdgeInsetsDirectional.only(
          start: 20, end: 20, top: 25, bottom: 23),
      decoration: BoxDecoration(
        borderRadius: BorderRadiusDirectional.circular(16),
        color: R.color.mainBgColor,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            K.personal_delete_defend_force,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: R.color.mainTextColor,
            ),
          ),
          const SizedBox(
            height: 21,
          ),
          Text(
            K.personal_delete_defend_force_subtitle([item?.title ?? '']),
            style: TextStyle(
              fontSize: 14,
              color: R.color.mainTextColor,
            ),
            maxLines: 1,
          ),
          const SizedBox(
            height: 23,
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              R.img(
                MoneyConfig.moneyIcon,
                width: 20,
                height: 20,
              ),
              Text(
                '${item?.breakMoney}',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: R.color.mainTextColor,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 26,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () {
                  /// 取消解除
                  Navigator.of(context).pop();
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
                    K.cancel,
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
                  /// 申请解除
                  forceDeleteDefend();
                },
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
                    K.personal_sure,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
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

  /// 强制解除
  void forceDeleteDefend() async {
    if (_isPaying) {
      return;
    }

    _displayPay();
  }

  _displayPay() async {
    SheetCallback? result = await _payManager.showRechargeSheet(
        System.context, item?.breakMoney ?? 0);
    if (result == null ||
        result.reason == SheetCloseReason.Active ||
        result.value?.key == IPayManager.pTRecharge) {
      return;
    }

    _pay(result.value?.key);
  }

  void _pay(String? type) {
    _isPaying = true;
    Map<String, dynamic> params = {
      'id': item?.id ?? '',
    };
    _payManager.pay(System.context,
        key: 'defend_break',
        type: type ?? '',
        args: {
          'money': item?.breakMoney ?? 0,
          'type': 'defend-break',
          'params': params,
        },
        showLoading: true,
        onPayed: _onPayed,
        onError: _onPayError);
  }

  void _onPayed() {
    _isPaying = false;
    Navigator.of(System.context).pop();
  }

  void _onPayError(bool isErrorCatch) {
    _isPaying = false;
  }
}
