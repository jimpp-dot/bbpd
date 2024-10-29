import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import '../../k.dart';
import 'package:shared/model/fans_group_model.dart';

/// 入团Presenter
class JoinGroupPresenter {
  final BuildContext context;
  final int groupId;
  final int uid;
  final FansGroupGift? gift;
  final String refer;

  JoinGroupPresenter(
      this.context, this.groupId, this.uid, this.gift, this.refer);

  Function? _onPayedCallback;

  /// 设置支付完成回调
  void setOnPayedCallback(Function callback) {
    _onPayedCallback = callback;
  }

  bool _joining = false;

  /// 加入粉丝团
  void join() {
    if (_joining) return;
    _joining = true;
    _payManager ??=
        ComponentManager.instance.getManager(ComponentManager.MANAGER_PAY);
    _showPTSheet();
  }

  IPayManager? _payManager;
  void _pay(String? type) {
    int payPrice = gift?.payPrice ?? 0;
    if (payPrice <= 0) return;
    _payManager!.pay(context,
        key: 'gift',
        type: type ?? '',
        args: {
          'money': payPrice,
          'type': 'chat-gift',
          'params': {
            'to': uid,
            'uids': '$uid',
            'giftId': gift?.id ?? 0,
            'giftNum': 1,
            'price': payPrice,
            'cid': 0,
            'ctype': '',
            'duction_money': 0,
            'version': 2,
            'num': 1,
            'gift_type': gift?.type ?? '',
            'kfg_id': groupId,
            'refer': '$refer:join_group'
          }
        },
        onPayed: _onPayed,
        onError: _onPayError);
  }

  void _onPayed() {
    _joining = false;
    Fluttertoast.showToast(
        msg: K.group_join_group_success, gravity: ToastGravity.BOTTOM);
    if (_onPayedCallback != null) _onPayedCallback!();
  }

  void _onPayError(bool isErrorCatch) {
    _joining = false;
    Fluttertoast.showToast(
        msg: K.group_join_group_pay_failure, gravity: ToastGravity.BOTTOM);
  }

  _showPTSheet() async {
    SheetCallback? result =
        await _payManager!.showRechargeSheet(context, gift?.payPrice ?? 0);
    if (result == null ||
        result.reason == SheetCloseReason.Active ||
        result.value?.key == IPayManager.pTRecharge) {
      _joining = false;
      return;
    }
    _pay(result.value?.key);
  }
}
