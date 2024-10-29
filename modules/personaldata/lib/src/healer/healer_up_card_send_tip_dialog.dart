import 'package:personaldata/k.dart';
import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:personaldata/src/model/pb/generated/healer.pb.dart';

/// 聊愈师UP卡赠送不足提示
class HealerUpCardSentTipDialog extends StatelessWidget {
  final HealerCardData cardData;
  final int count;

  const HealerUpCardSentTipDialog(
      {super.key, required this.cardData, required this.count});

  static Future<bool?> show(
      BuildContext context, HealerCardData cardData, int count) async {
    return showDialog<bool>(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return HealerUpCardSentTipDialog(cardData: cardData, count: count);
      },
    );
  }

  int get _totalMoney => cardData.price * count;

  void _pay(BuildContext context) async {
    IPayManager payManager =
        ComponentManager.instance.getManager(ComponentManager.MANAGER_PAY);
    SheetCallback? result =
        await payManager.showRechargeSheet(context, _totalMoney);
    if (result == null || result.reason == SheetCloseReason.Active) {
      return;
    }
    if (result.value?.key == IPayManager.pTRecharge) {
      Navigator.maybePop(context, false);
      return;
    }
    payManager.pay(
      context,
      key: 'shop-buy',
      type: 'available',
      refer: 'shop',
      args: {
        'money': _totalMoney,
        'type': 'shop-buy',
        'params': {
          'num': count,
          'cid': cardData.cid,
          'price': cardData.price,
          'version': 2,
        }
      },
      onPayed: () {
        _onPayed(context);
      },
      onError: _onPayError,
    );
  }

  void _onPayed(BuildContext context) {
    Navigator.of(context).maybePop(true);
  }

  void _onPayError(bool isErrorCatch) {}

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 280.dp,
        height: 237.dp,
        padding: EdgeInsetsDirectional.only(start: 24.dp, end: 24.dp),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(21.dp),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(K.healer_up_is_not_enough,
                style: TextStyle(
                    color: R.color.mainTextColor,
                    fontSize: 16.dp,
                    fontWeight: FontWeight.w600)),
            SizedBox(height: 24.dp),
            Text(K.healer_up_is_not_enough_tip(['${cardData.price}']),
                textAlign: TextAlign.center,
                style:
                    TextStyle(color: R.color.mainTextColor, fontSize: 14.dp)),
            Text(K.healer_cost_money_tip(['$_totalMoney']),
                style: TextStyle(
                    color: R.color.mainTextColor,
                    fontSize: 14.dp,
                    fontWeight: FontWeight.w600)),
            SizedBox(height: 24.dp),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Container(
                    width: 110.dp,
                    height: 48.dp,
                    alignment: AlignmentDirectional.center,
                    decoration: BoxDecoration(
                      color: const Color(0xFFF7F8FA),
                      borderRadius: BorderRadius.circular(24.dp),
                    ),
                    child: Text(K.cancel,
                        style: TextStyle(
                            color: R.color.tipsTextColor, fontSize: 16.dp)),
                  ),
                ),
                GestureDetector(
                  onTap: () => _pay(context),
                  child: Container(
                    width: 110.dp,
                    height: 48.dp,
                    alignment: AlignmentDirectional.center,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: R.color.mainBrandGradientColors),
                      borderRadius: BorderRadius.circular(24.dp),
                    ),
                    child: Text(K.sure,
                        style: TextStyle(color: Colors.white, fontSize: 16.dp)),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
