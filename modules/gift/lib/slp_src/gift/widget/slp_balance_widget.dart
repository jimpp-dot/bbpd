import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:gift/k.dart';
import 'package:gift/slp_src/gift/slp_intimate_pay_mixin.dart';
import 'package:gift/slp_src/widget/slp_intimate_pay_select_dialog.dart';
import 'package:get/get.dart';

/// 礼物面板余额显示
class SlpBalanceWidget extends StatefulWidget {
  final double ratio;
  final double numMaxWidth;
  final int selfMoney; // 当前登录用户余额
  final bool dark;
  final bool showIntimate; // 支持亲密付

  const SlpBalanceWidget(
      {super.key,
      this.ratio = 1,
      this.numMaxWidth = 168,
      required this.selfMoney,
      required this.showIntimate,
      this.dark = false});

  @override
  State<SlpBalanceWidget> createState() => _SlpBalanceWidgetState();
}

class _SlpBalanceWidgetState extends State<SlpBalanceWidget>
    with SlpIntimatePayMixin<SlpBalanceWidget> {
  @override
  bool get supportSlpIntimate => widget.showIntimate;

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: intimatePlayController,
      builder: (GetxController controller) {
        int realTotalMoney = widget.selfMoney;
        if (intimateCardInfo != null) {
          realTotalMoney = intimateCardInfo!.leftMoney;
        }
        return Container(
          // width: 200,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (supportSlpIntimate == true)
                SlpIntimatePaySelectButton(
                  ratio: widget.ratio,
                  selectedCard: intimateCardInfo,
                  intimateCardSelectCallback: onIntimateCardChange,
                ),
              Image.asset(MoneyConfig.moneyIcon,
                  width: 24 * widget.ratio, height: 24 * widget.ratio),
              SizedBox(width: 4 * widget.ratio),
              Container(
                constraints: BoxConstraints(maxWidth: widget.numMaxWidth),
                child: FittedBox(
                  fit: BoxFit.contain,
                  child: NumText(
                    MoneyConfig.moneyNum(realTotalMoney, fractionDigits: 2),
                    style: TextStyle(
                      color: widget.dark ? Colors.white : R.color.mainTextColor,
                      fontSize: 15 * widget.ratio,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              if (!useIntimateCardPay)
                GestureDetector(
                  onTap: () {
                    ISettingManager? manager = ComponentManager.instance
                        .getManager(ComponentManager.MANAGER_SETTINGS);
                    manager?.openRechargeScreen(context, refer: 'gift');
                  },
                  child: Padding(
                    padding: EdgeInsetsDirectional.only(
                        start: 4 * widget.ratio, end: 4 * widget.ratio),
                    child: Container(
                      width: 18 * widget.ratio,
                      height: 18 * widget.ratio,
                      decoration: BoxDecoration(
                        color: R.color.mainBrandColor,
                        borderRadius: BorderRadius.circular(9 * widget.ratio),
                      ),
                      child: Center(
                        child: Icon(
                          Icons.add,
                          color: Colors.black,
                          size: 16 * widget.ratio,
                        ),
                      ),
                    ),

                    // child: Row(
                    //   mainAxisSize: MainAxisSize.min,
                    //   children: <Widget>[
                    //     Text(
                    //       K.gift_recharge,
                    //       style: TextStyle(
                    //         color: R.color.mainBrandColor,
                    //         fontSize: 15 * widget.ratio,
                    //         fontWeight: FontWeight.w600,
                    //       ),
                    //     ),
                    //     Icon(
                    //       Icons.navigate_next,
                    //       color: R.color.mainBrandColor,
                    //       size: 18 * widget.ratio,
                    //     ),
                    //   ],
                    // ),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}
