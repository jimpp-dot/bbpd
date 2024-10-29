import 'dart:io';

import 'package:shared/shared.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pay/k.dart';

import 'p_t_sheet.dart';

class PayBottomSheet extends StatefulWidget {
  final String? title;
  final String? tips;
  final int? accountType;
  final int? price;
  final AsyncValueGetter<bool>? onInterceptClose;
  final BalanceInfo? balanceInfo;

  const PayBottomSheet(
      {super.key,
      this.title,
      this.tips,
      this.accountType,
      this.onInterceptClose,
      this.price = 0,
      this.balanceInfo});

  @override
  _PayBottomDialogState createState() => _PayBottomDialogState();

  static bool isShowing = false;

  ///充值弹窗
  /// [onlyRecharge]是否仅充值，true：仅充值，false：先判断余额是否足够支付，足够支付返回余额支付方式，余额不足展示充值弹窗
  static Future<SheetCallback?> show(
    BuildContext context, {
    String? title,
    String? tips,
    int? accountType,
    int price = 0,
    AsyncValueGetter<bool>? onInterceptClose,
    bool onlyRecharge = false,
    bool showDiamondRecharge = false,
  }) async {
    if (isShowing) {
      Log.d('is showing, ignore');
      return null;
    }
    isShowing = true;
    BalanceInfo? data = await BalanceInfo.loadBalanceInfo();
    isShowing = false;
    if (data == null) {
      return null;
    }
    if (onlyRecharge != true && price >= 0) {
      int money = 0;
      if (accountType == 1) {
        money = data.availableOrder;
      } else {
        money = data.available;
      }
      if (money >= price) {
        // 余额足够，且是支付场景。返回余额支付方式
        return SheetCallback(SheetCloseReason.Result, -1,
            const SheetItem('', IPayManager.pTAvailable));
      }
    }

    // if (data.showTimeLimitProduct == 1) {
    //   ISettingManager settingManager = ComponentManager.instance
    //       .getManager(ComponentManager.MANAGER_SETTINGS);
    //   settingManager.showRechargeActivitySendDialog(context);
    //   return null;
    // }

    if (Platform.isAndroid &&
        onlyRecharge != true &&
        price >= 600 &&
        showDiamondRecharge == false) {
      // Android消费金额>=6元，弹直充BottomSheet
      return displayModalBottomSheet(
          context: context,
          isBarrierDismissible: onInterceptClose == null ? true : false,
          builder: (BuildContext context) {
            return PTSheetWidget(
              price: price,
              accountType: accountType,
              showBalance: true,
              onInterceptClose: onInterceptClose,
            );
          });
    }

    return displayModalBottomSheet(
        context: context,
        isBarrierDismissible: onInterceptClose == null ? true : false,
        maxHeightRatio: 1,
        builder: (BuildContext context) {
          return PayBottomSheet(
            title: title,
            tips: tips,
            accountType: accountType,
            price: price,
            onInterceptClose: onInterceptClose,
            balanceInfo: data,
          );
        });
  }
}

class _PayBottomDialogState extends State<PayBottomSheet> {
  BalanceInfo? _balanceInfo;

  @override
  void initState() {
    super.initState();
    _balanceInfo = widget.balanceInfo;
  }

  int get _availableMoney {
    int money = 0;
    if (_balanceInfo != null) {
      if (widget.accountType == 1) {
        money = _balanceInfo!.availableOrder;
      } else {
        money = _balanceInfo!.available;
      }
    }
    return money;
  }

  bool get _isMoneyEnough {
    return _availableMoney >= (widget.price ?? 0);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                color: R.colors.mainBgColor,
                borderRadius: const BorderRadiusDirectional.only(
                    topStart: Radius.circular(16),
                    topEnd: Radius.circular(16))),
            padding: EdgeInsetsDirectional.only(
                start: 20, end: 20, top: 22, bottom: Util.iphoneXBottom),
            height: Util.height * 0.54,
            child: Column(
              children: [
                Text(
                  widget.title ?? K.pay_diamond_not_enough,
                  style: TextStyle(
                      color: R.colors.mainTextColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 18),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  width: Util.width,
                  height: 0.5,
                  color: R.colors.dividerColor,
                ),
                const SizedBox(
                  height: 6,
                ),
                if (!Util.isStringEmpty(_getTips()))
                  Padding(
                    padding: const EdgeInsetsDirectional.only(bottom: 12),
                    child: Row(
                      children: [
                        Text(
                          _getTips(),
                          style: TextStyle(
                              color: R.colors.secondTextColor, fontSize: 13),
                        ),
                      ],
                    ),
                  ),
                Expanded(child: _getPayWidget())
              ],
            ),
          ),
          if (widget.onInterceptClose != null)
            PositionedDirectional(
                top: 0,
                start: 0,
                child: IconButton(
                    icon: Icon(
                      Icons.close,
                      color: R.colors.thirdTextColor,
                    ),
                    onPressed: () async {
                      bool shouldClose = widget.onInterceptClose != null
                          ? await widget.onInterceptClose!()
                          : true;
                      if (shouldClose)
                        Navigator.of(context)
                            .pop(SheetCallback(SheetCloseReason.Active));
                    })),
        ],
      ),
    );
  }

  String _getTips() {
    if (!Util.isStringEmpty(widget.tips)) {
      return widget.tips!;
    }

    if (widget.price == null || widget.price == 0) {
      return '';
    }

    if (_balanceInfo != null && _isMoneyEnough == false) {
      return K.pay_slp_left_diamond(
          ['$_availableMoney', '${widget.price! - _availableMoney}']);
    }

    return '';
  }

  Widget _getPayWidget() {
    ISettingManager settingManager =
        ComponentManager.instance.getManager(ComponentManager.MANAGER_SETTINGS);
    return settingManager.getRechargeWidget(
        refer: 'pay_bottom_sheet',
        isPaySheet: true,
        totalPrice: widget.price ?? 0);
  }
}
