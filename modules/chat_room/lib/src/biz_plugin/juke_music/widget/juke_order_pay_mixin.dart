import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:chat_room/k.dart';

mixin JukeOrderPayMixin<T extends StatefulWidget> on State<T> {
  final IPayManager _payManager =
      ComponentManager.instance.getManager(ComponentManager.MANAGER_PAY);

  bool _tryUseAvailable = false; // 尝试使用余额支付

  void pay(String type) {
    _tryUseAvailable = true;
    _payManager.pay(context,
        key: 'gift',
        type: type,
        args: getPayParam(),
        onPayed: _onPayed,
        onError: _onPayError);
  }

  void _onPayed() {
    _tryUseAvailable = false;
    Fluttertoast.showToast(
        msg: K.room_juke_order_success, gravity: ToastGravity.BOTTOM);

    eventCenter.emit("Gift.SendSuccess");
    Navigator.maybePop(context);
  }

  void _onPayError(bool isErrorCatch) {
    if (_tryUseAvailable) {
      _tryUseAvailable = false;
      _displayPay();
    }
  }

  _displayPay() async {
    SheetCallback? result = await _payManager.showPTSheet(context, totalPrice);
    if (result == null || result.reason == SheetCloseReason.Active) {
      return;
    }
    pay(result.value?.key ?? '');
  }

  Map getPayParam();

  int get totalPrice;
}

class JukePayTarget {
  final int uid;
  final int giftId;
  final int giftNum;
  final String giftType;
  final int giftPrice;
  final String type;

  JukePayTarget(
      {required this.uid,
      required this.giftId,
      required this.giftNum,
      required this.giftType,
      required this.giftPrice,
      required this.type});

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'uid': uid,
      'giftId': giftId,
      'giftNum': giftNum,
      'giftType': giftType,
      'giftPrice': giftPrice,
      'type': type
    };
  }
}
