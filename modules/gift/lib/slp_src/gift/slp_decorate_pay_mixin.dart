import 'package:shared/shared.dart';
import 'package:shared/k.dart' as BaseK;
import 'package:flutter/material.dart';
import 'package:gift/k.dart';
import 'package:chat_room/chat_room.dart';
import '../model/pb/slp_gift_extension.dart';
import 'slp_page_decorate.dart';

mixin SlpDecoratePayMixin on State<SlpPageDecorate> {
  BbGiftPanelDecorates? selectedItem; // 选择的装扮
  int selectNum = 1; // 选择的赠送个数
  int _giftPrice = 0; // 礼物单价
  int _totalPrice = 0; // 礼物总价

  bool isFriend = true; //亲密度是否大于5000
  bool _isRisk = false; //要打赏的用户是否存在风险
  bool _tryUseAvailable = false; // 尝试使用余额支付

  IPayManager? _payManager;

  bool userCoupon = false;

  /// 优惠金额
  int _ductionMoney = 0;

  /// 支付KEY，用于销毁PayManager使用
  String get buyKey => 'room-deco-present';

  /// 支付类型
  String get buyType => 'deco-present';

  /// 是否在房间
  bool get _isInRoom => isGiftSceneInRoom(widget.giftScene);

  /// 选中的uids
  List<int> _getSelectUid() =>
      widget.getSelectUids != null ? widget.getSelectUids!() : [];

  /// 选中的麦序
  List<int> _getSelectPosition() {
    List<RoomPosition> users = []; // 所有的麦上用户
    if (_isInRoom) {
      IGiftManager giftManager =
          ComponentManager.instance.getManager(ComponentManager.MANAGER_GIFT);
      users = giftManager.getGiftUsers(widget.room) as List<RoomPosition>;
    }

    List<int> positions = [];
    for (int i = 0; i < users.length; ++i) {
      RoomPosition p = users[i];
      if (_getSelectUid().contains(p.uid)) {
        positions.add(p.position);
      }
    }

    return positions;
  }

  /// 我的麦序
  int _getMyPosition() {
    int myPosition = -1;

    // _position
    widget.room?.positions.forEach((RoomPosition position) {
      int uid = position.uid;
      if (uid > 0 && uid == Session.uid) {
        myPosition = position.position;
      }
    });

    return myPosition;
  }

  /// 初始化
  initPay() {
    _payManager =
        ComponentManager.instance.getManager(ComponentManager.MANAGER_PAY);
    _queryRisk();
  }

  /// 销毁
  disposePay() {
    _payManager?.dispose(buyKey);
  }

  /// 查询用户风险信息
  _queryRisk() async {
    if (!isGiftSceneNeedShowCheat()) return;

    XhrResponse response = await Xhr.postJson(
        "${System.domain}friend/risk", {'uids': widget.id.toString()},
        throwOnError: false);
    if (response.error == null) {
      Map res = response.response as Map;
      if (res['success'] == true) {
        List<Map> results = List<Map>.from(res['data']);
        if (results.isNotEmpty) {
          isFriend = Util.parseInt(results[0]['friend']) > 0;
          _isRisk = Util.parseInt(results[0]['modify']) > 0;
          if (!mounted) {
            return;
          }
          setState(() {});
        }
      } else {
        Log.d(res['msg']);
      }
    } else {
      Log.d(response.error.toString());
    }
  }

  /// 是否显示防诈骗信息
  /// 大额订单防诈骗提醒
  /// [_checkCheat] 大额订单弹窗
  bool needShowCheat() {
    if (!isGiftSceneNeedShowCheat()) return false;

    if (selectedItem == null || selectedItem?.moneyType == 'coin') {
      return false;
    }

    if ((selectedItem?.price ?? 0) * selectNum >= 100) {
      return true;
    } else {
      return false;
    }
  }

  /// 防诈骗提醒
  Future<bool> _checkCheat(int uid) async {
    if (!needShowCheat() || _isRisk != true) return true;

    bool result = await showDialog(
        context: context,
        builder: (context) => ConfirmDialog(
              title: BaseK.K.base_warm_prompt,
              content: BaseK.K.gift_risk_dialog_content,
              positiveButton: PositiveButton(
                text: BaseK.K.gift_risk_dialog_button_sure,
              ),
              negativeButton: NegativeButton(
                text: BaseK.K.base_go_back,
              ),
            ));
    return result;
  }

  ///是否显示防诈骗信息，私聊页打赏或者非合作房一对一打赏时为true
  bool isGiftSceneNeedShowCheat() {
    return widget.giftScene == GiftScene.private ||
        (widget.giftScene == GiftScene.room_private &&
            widget.room?.config?.property != RoomProperty.Business);
  }

  bool showDiscount() {
    if (selectedItem == null) return false;

    int userNum = _isInRoom ? _getSelectUid().length : 1;
    if (userNum <= 0) {
      return false;
    }
    if (selectNum <= 0) {
      return false;
    }

    int reduceMoney = 0;
    // 折扣优惠价格
    if ((selectedItem?.ductionRate ?? 0) > 0 &&
        (selectedItem?.ductionRate ?? 0) < 100) {
      int userNum = _isInRoom ? _getSelectUid().length : 1;
      reduceMoney = (selectedItem?.price ?? 0) *
          selectNum *
          (100 - (selectedItem?.ductionRate ?? 0)) *
          userNum ~/
          100;
      if (selectedItem?.coupon != null &&
          (selectedItem?.coupon.ductionMoney ?? 0) > reduceMoney) {
        return false;
      }
      return true;
    }

    return false;
  }

  int totalNum() {
    int userNum = _isInRoom ? _getSelectUid().length : 1;

    return selectNum * userNum;
  }

  /// 赠送
  submit() async {
    if (selectedItem == null) return;

    userCoupon = false;

    int userNum = _isInRoom ? _getSelectUid().length : 1;
    if (userNum <= 0) {
      Fluttertoast.showToast(
          msg: K.please_selecet_a_target_at_least,
          gravity: ToastGravity.CENTER);
      return;
    }
    if (selectNum <= 0) {
      Fluttertoast.showToast(
          msg: K.please_select_a_gift_num, gravity: ToastGravity.CENTER);
      return;
    }

    // 一对一赠送 大额礼物需要防诈骗提醒
    if (widget.id > 0) {
      bool checkResult = await _checkCheat(
        widget.id,
      );
      if (!checkResult) return;
    }

    // 是否金币支付
    bool isCoinType = selectedItem?.moneyType == 'coin';

    // 金币、币都下发实际的为价格，币单位是分
    _giftPrice = (selectedItem?.price ?? 0).round();

    if (_giftPrice <= 0) return;

    _totalPrice = _giftPrice * selectNum * userNum;

    // 账号余额
    int realTotalMoney = widget.data?.extend.totalMoney ?? 0;

    // 折扣优惠价格
    if ((selectedItem?.ductionRate ?? 0) > 0 &&
        (selectedItem?.ductionRate ?? 0) < 100) {
      int userNum = _isInRoom ? _getSelectUid().length : 1;
      _ductionMoney = (selectedItem?.price ?? 0) *
          selectNum *
          (100 - (selectedItem?.ductionRate ?? 0)) *
          userNum ~/
          100;
    }

    if (selectedItem?.hasCoupon() != null &&
        (selectedItem?.coupon.ductionMoney ?? 0) > _ductionMoney) {
      userCoupon = true;
      _ductionMoney = selectedItem?.coupon.ductionMoney ?? 0;
    }

    if (isCoinType || selectedItem?.moneyType == 'bean') {
      _pay('available');
      return;
    } else if (realTotalMoney >= _totalPrice) {
      _tryUseAvailable = true;
      _pay('available');
    } else {
      _displayPay();
    }
  }

  _displayPay() async {
    SheetCallback? result = await _payManager!.showRechargeSheet(
        context, _totalPrice - _ductionMoney,
        onlyRecharge: true);
    if (result == null ||
        result.reason == SheetCloseReason.Active ||
        result.value?.key == IPayManager.pTRecharge) {
      return;
    }

    BbGiftPanelShopCoupon? couponInfo =
        (selectedItem?.hasCoupon() ?? false) ? selectedItem?.coupon : null;
    if (couponInfo != null &&
        couponInfo.onlyNewpay == 1 &&
        couponInfo.state == 0 &&
        result.value?.key == 'available') {
      Toast.showCenter(context, K.please_recharge_first);
      return;
    }

    _pay(result.value?.key);
  }

  _pay(String? type) {
    int finalNum = selectNum;
    if (_isInRoom) {
      _payManager!.pay(
        context,
        key: buyKey,
        type: type ?? '',
        args: {
          'money': _totalPrice,
          'type': buyType,
          'params': {
            'rid': widget.room?.rid,
            'uids': _getSelectUid().join(','),
            'positions': _getSelectPosition().join(','),
            'position': _getMyPosition(),
            'cid': selectedItem?.id ?? 0,
            'num': finalNum,
            'price': _giftPrice,
            'coupon_id': userCoupon ? (selectedItem?.coupon.id ?? 0) : 0,
            'duction_money': _ductionMoney,
            'version': 2,
            'money_type': selectedItem?.moneyType ?? '',
            'refer': '${widget.room?.refer}:room',
            if (Util.parseInt(widget.topicId) > 0)
              'topicid': '${widget.topicId}'
          }
        },
        onPayed: _onPayed,
        onError: _onPayError,
      );
    } else if (widget.giftScene == GiftScene.private) {
      _payManager!.pay(
        context,
        key: buyKey,
        type: 'available',
        args: {
          'money': _totalPrice,
          'type': buyType,
          'params': {
            'num': finalNum,
            'uids': widget.id,
            'money_type': selectedItem?.moneyType ?? '',
            'cid': selectedItem?.id ?? 0,
            'price': selectedItem?.price ?? 0,
            'coupon_id': userCoupon ? (selectedItem?.coupon.id ?? 0) : 0,
            'duction_money': _ductionMoney,
            'version': 2,
            if (Util.parseInt(widget.topicId) > 0)
              'topicid': '${widget.topicId}'
          }
        },
        onPayed: _onPayed,
        onError: _onPayError,
      );
    } else {
      Fluttertoast.showToast(
          msg: K.wrong_purchase_option, gravity: ToastGravity.CENTER);
      return;
    }
  }

  void _onPayed() {
    if (widget.fromChat == true) {
      Map orderSayHiUids = Im.orderSayHiUids;
      String targetId = widget.id.toString();
      if (orderSayHiUids.containsKey(targetId)) {
        orderSayHiUids.remove(targetId);
      }
    }

    _tryUseAvailable = false;
    Fluttertoast.showToast(
        msg: K.gift_send_decorate_success, gravity: ToastGravity.BOTTOM);
  }

  void _onPayError(bool isErrorCatch) {
    if (_tryUseAvailable) {
      _tryUseAvailable = false;
      _displayPay();
    }
  }
}
