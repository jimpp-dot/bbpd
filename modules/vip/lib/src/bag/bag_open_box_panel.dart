import 'dart:async';

import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:vip/k.dart';

import 'model/box_bean.dart';
import 'widget/bag_box_open_widget.dart';

/// 开箱子底部弹框
class BagBoxOpenPanel extends StatefulWidget {
  final int cid;
  final String boxName; // 盒子名称：xxx

  const BagBoxOpenPanel(this.cid, this.boxName, {super.key});

  static bool _isOpened = false;

  static Future<bool> show(
    BuildContext context, {
    required int cid,
    required String boxName,
  }) async {
    bool success = false;
    if (_isOpened) return success;

    _isOpened = true;
    success = (await displayModalBottomSheet<bool?>(
          context: context,
          maxHeightRatio: 1,
          builder: (BuildContext context) {
            return BagBoxOpenPanel(cid, boxName);
          },
        )) ??
        false;
    _isOpened = false;
    return success;
  }

  @override
  BagBoxOpenPanelState createState() => BagBoxOpenPanelState();
}

class BagBoxOpenPanelState extends State<BagBoxOpenPanel> {
  final IPayManager _payManager =
      ComponentManager.instance.getManager(ComponentManager.MANAGER_PAY);
  bool _loading = true;
  String? _error;
  BoxBean? _boxBean;

  final Map _coupons = {};

  @override
  void initState() {
    super.initState();

    _load();

    Session.sync({'lucky': true});
  }

  @override
  void dispose() {
    _payManager.dispose('shop-buy');
    super.dispose();
  }

  String _fetchBoxTypeByCid(int cid) {
    switch (cid) {
      case 2:
      case 5:
        return 'copper';
      case 3:
      case 6:
        return 'silver';
      case 4:
      case 7:
        return 'gold';
    }
    return 'gold';
  }

  void _load() async {
    String url =
        "${System.domain}account/boxdetail?cid=${widget.cid}&act_version=2";
    try {
      XhrResponse response = await Xhr.getJson(url);
      if (response.error == null) {
        Map res = response.response as Map;
        if (res['success'] == true) {
          if (res['data'].runtimeType.toString() == 'bool') {
            return;
          }
          _boxBean = BoxBean.fromJson(res as Map<String, dynamic>);
          if (res['coupons'] != null && res['coupons'] is Map) {
            res['coupons'].forEach((dynamic cid, dynamic tmp) {
              _coupons[Util.parseInt(cid)] = tmp;
            });
          }
        }
      } else {
        _error = response.error.toString();
      }
    } catch (e) {
      _error = e.toString();
    }
    if (mounted) {
      setState(() {
        _loading = false;
      });
    }
  }

  void _reload() async {
    if (!mounted) return;
    setState(() {
      _loading = true;
      _error = null;
    });
    _load();
  }

  String? _fetchBoxKeyTypeByCid(int cid) {
    if (cid == 2 || cid == 3 || cid == 4) {
      return 'box';
    } else if (cid == 5 || cid == 6 || cid == 7) {
      return 'key';
    } else {
      return null;
    }
  }

  String _getKeyName(String type) {
    if (type == 'gold') {
      return BoxUtil.goldKeyName;
    } else if (type == 'silver') {
      return BoxUtil.silverKeyName;
    } else {
      return BoxUtil.copperKeyName;
    }
  }

  int _fetchKeyCidByBoxCid(int cid) {
    if (cid == 2) {
      return 5;
    } else if (cid == 3) {
      return 6;
    } else if (cid == 4) {
      return 7;
    }
    return 0;
  }

  int _getKeyPrice(String type) {
    if (type == 'gold') {
      return 66;
    } else if (type == 'silver') {
      return 21;
    } else {
      return 6;
    }
  }

  String? __boxType;
  int? __boxNum;
  int? __boxKeyCid;
  int? __boxNeedNum;

  int? __boxKeyPrice;
  int? __boxMoney;
  int __discountMoney = 0;
  int __couponId = 0;

  void openBox(int num) async {
    if (num <= 0 || _boxBean!.maxNum <= 0) {
      String tips = K.vip_no_enough_pac([BoxUtil.commonBoxName]);
      Fluttertoast.showToast(msg: tips, gravity: ToastGravity.CENTER);
      return;
    }

    if (_boxBean!.boxNum >= num && _boxBean!.keyNum >= num) {
      // 数量足够
      try {
        String type = _fetchBoxTypeByCid(widget.cid);
        XhrResponse response = await Xhr.postJson(
            "${System.domain}account/openbox",
            {
              'type': type,
              'num': num.toString(),
              'star': '${_boxBean!.star}',
              'show_pac_man_guide':
                  Config.getBool('has_show_pac_man_guide', false) ? '0' : '1',
            },
            throwOnError: true);

        Map res = response.value();
        if (res['success'] == true) {
          Navigator.of(context).pop(true);
          BoxUtil.showGame(
              context: context,
              giftId: 0,
              starId: _boxBean!.star,
              giftNum: num);
        } else {
          if (res['msg'] != null && res['msg'] is String) {
            Fluttertoast.showToast(
                msg: res['msg'], gravity: ToastGravity.CENTER);
          }
        }
      } catch (e) {
        Fluttertoast.toastException(exp: e, gravity: ToastGravity.CENTER);
      }
    } else {
      bool isBox = _fetchBoxKeyTypeByCid(widget.cid) == 'box';
      if (isBox && num > _boxBean!.keyNum) {
        int needNum = num - _boxBean!.keyNum;

        String type = _fetchBoxTypeByCid(widget.cid);
        String keyName = _getKeyName(type);

        if (_boxBean!.showBuyHeader == 1) {
          // 服务端允许弹窗。 水晶够时，自动购买；水晶不够时，弹窗
          if (BuyHeaderDialog.needShowDialog(widget.cid)) {
            // 本地flag需要弹窗
            bool? r = await showDialog<bool?>(
                context: context,
                builder: (BuildContext context) {
                  return BuyHeaderDialog(
                    cid: widget.cid,
                    num: needNum,
                    totalMoney: (Session.money / 100).toStringAsFixed(2),
                  );
                });
            if (r == null || r == false) {
              return;
            }
          }
        } else if (_boxBean!.openBoxUseMoney == 1) {
          // 允许直接开箱子
        } else {
          // 提示钥匙不足
          Toast.show(context, K.key_not_enough([keyName]));
          return;
        }

        int keyCid = _fetchKeyCidByBoxCid(widget.cid);
        int keyPrice = _getKeyPrice(type);
        //查看用户是否有优惠券
        if (_coupons.containsKey(keyCid)) {
          if (Util.parseInt(_coupons[keyCid]['only_newpay']) > 0 &&
              Util.parseInt(_coupons[keyCid]['state']) == 0) {
//              Fluttertoast.showToast(
//                  msg: '您有一张' +
//                      _coupons[keyCid]['name'].toString() +
//                      '还未激活，本次购买将不会使用，请激活后使用',
//                  gravity: ToastGravity.CENTER);
          } else {
            __couponId = Util.parseInt(_coupons[keyCid]['id']);
            __discountMoney = Util.parseInt(_coupons[keyCid]['duction_money']);
          }
        }

        __boxType = type;
        __boxNum = num;
        __boxKeyCid = keyCid;
        __boxNeedNum = needNum;
        __boxKeyPrice = keyPrice * 100;
        __boxMoney = __boxKeyPrice! * __boxNeedNum!;
        _openBoxWithBuyAction();
      }
    }
  }

  _openBoxWithBuyAction() async {
    // Log.d("OpenBox _openBoxWithBuyAction ${widget.money} => ${__boxMoney}");
    int totalMoney = _boxBean!.money;
    if (totalMoney >= (__boxMoney! - __discountMoney)) {
      _purchaseOpenBox('available');
    } else {
      _openBoxWithSwitchType();
    }
  }

  _purchaseOpenBox(String? type) {
    _payManager.pay(context,
        key: 'shop-buy',
        type: type ?? '',
        refer: 'shop',
        args: {
          'money': __boxMoney,
          'type': 'shop-buy',
          'params': {
            'num': __boxNeedNum,
            'cid': __boxKeyCid,
            'price': __boxKeyPrice,
            'type': __boxType,
            'opennum': __boxNum,
            'coupon_id': __couponId,
            'duction_money': __discountMoney,
            'version': 2,
            'star': '${_boxBean!.star}',
            'show_pac_man_guide':
                Config.getBool('has_show_pac_man_guide', false) ? 0 : 1,
          }
        },
        onPayed: _onOpenBoxPayed,
        onError: _onOpenBoxPayError);
  }

  _openBoxWithSwitchType() async {
    SheetCallback? result = await _payManager.showRechargeSheet(
        context, __boxMoney! - __discountMoney);
    if (result == null ||
        result.reason == SheetCloseReason.Active ||
        result.value?.key == IPayManager.pTRecharge) {
      return;
    }
    _purchaseOpenBox(result.value?.key);
  }

  _onOpenBoxPayed() {
    __boxKeyCid = 0;

    Navigator.of(context).pop(true);

    BoxUtil.showGame(
        context: context,
        giftId: 0,
        starId: _boxBean!.star,
        giftNum: __boxNum ?? 0);
  }

  _onOpenBoxPayError(bool isErrorCatch) {}

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
          color: R.colors.bottomBarColor,
          borderRadius: const BorderRadiusDirectional.only(
              topStart: Radius.circular(20), topEnd: Radius.circular(20)),
        ),
        constraints: const BoxConstraints(minHeight: 300),
        child: SafeArea(
          child: _renderBody(),
        ),
      ),
    );
  }

  Widget _renderBody() {
    if (_loading) {
      return Container(
          height: 300,
          alignment: AlignmentDirectional.center,
          child: const Loading());
    }
    if (_error != null || _boxBean?.content == null) {
      return Container(
        height: 300,
        alignment: AlignmentDirectional.center,
        child: ErrorData(
          error: _error,
          fontColor: R.colors.mainTextColor,
          onTap: _load,
          top: 0,
          bottom: 0,
        ),
      );
    }
    return BagBoxOpenWidget(
      boxName: widget.boxName,
      maxNum: _boxBean!.maxNum,
      boxScreen: _boxBean!.screen,
      content: _boxBean!.content!,
      nextRefreshSeconds: _boxBean!.nextRefreshSeconds > 0
          ? _boxBean!.nextRefreshSeconds
          : 3600 * 3,
      reload: _reload,
      openBoxAction: (int num) {
        openBox(num);
      },
    );
  }
}
