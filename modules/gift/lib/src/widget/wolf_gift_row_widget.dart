import 'dart:math';

import 'package:shared/shared.dart';
import 'package:chat_room/chat_room.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gift/k.dart';
import 'package:gift/src/model.dart';

/// 狼人信息提示区域 打赏
///
class WolfGiftRowWidget extends StatefulWidget {
  final int uid;
  final ChatRoomData room;

  const WolfGiftRowWidget(this.uid, this.room, {Key? key}) : super(key: key);

  @override
  State<WolfGiftRowWidget> createState() => _WolfGiftRowWidgetState();
}

class _WolfGiftRowWidgetState extends State<WolfGiftRowWidget> {
  final Map<int, String> _titles = {
    1: R.array('gift_title_array')[0],
    2: R.array('gift_title_array')[1],
    3: R.array('gift_title_array')[2],
    4: R.array('gift_title_array')[3],
    5: R.array('gift_title_array')[4],
  };
  final IPayManager _payManager =
      ComponentManager.instance.getManager(ComponentManager.MANAGER_PAY);
  List<Gift> _gifts = [];

  int _cid = 0; // 背包礼物id
  String _ctype = ''; // // 背包礼物类型
  int _ductionMoney = 0; // 优惠金额
  int _onlyNewPay = 0; // 是否限制为仅新支付账户可用
  int _state = 0; // 券状态，只有账户充值后，才能使用优惠券，避免小号刷券
  int _totalNum = 0;
  int _giftPrice = 0; // 礼物单价
  int _totalPrice = 0; // 礼物总价
  String _giftType = ''; // 礼物类型：normal、coin（金币礼物,只能用金币赠送）
  final int _xxxStar = 0; //是否xxx类型礼物
  int _giftId = 0;
  final int _giftNum = 1; // 打赏礼物数量

  final List<int> _positions = []; // 被打赏人的麦序
  final List<int> _uids = []; // 被打赏人的uid
  int _position = -1; // 我的麦序
  Model? _data;

  @override
  void initState() {
    super.initState();
    _load();
  }

  @override
  void dispose() {
    _payManager.dispose('gift');
    super.dispose();
  }

  _load() async {
    XhrResponse response =
        await Xhr.getJson('${System.domain}option/quickGift');
    if (!mounted) return;
    if (response.error == null) {
      Map? res = response.response as Map?;
      if (res == null) return;
      _data = Model.fromJson(GiftScene.room_private, res);
      _gifts = _data?.gifts ?? [];
      setState(() {});
    }
  }

  _initUsers() {
    _uids.clear();
    _uids.add(widget.uid);
    for (var position in widget.room.positions) {
      int uid = position.uid;
      if (uid > 0 && uid == Session.uid) {
        _position = position.position;
      }
      if (uid > 0 && uid == widget.uid) {
        _positions.add(position.position);
      }
    }
  }

  _submit(Gift gift) async {
    _initUsers();
    _giftType = gift.giftType ?? '';
    _giftId = gift.id;

    if (gift.giftType == 'coin') {
      _giftPrice = gift.price.round();
    } else {
      _giftPrice = (gift.price * 100).round();
    }

    if (_giftPrice <= 0) return;

    _ctype = gift.ctype ?? '';
    _cid = gift.cid;
    int cnum = gift.cnum; // 如果背包有该礼物，则返回礼物数量
    // 重置
    _ductionMoney = 0;
    _onlyNewPay = 0;
    _state = 0;

    if (_cid > 0 &&
        (((_ctype == 'gift' || _ctype == 'key') && cnum >= _giftNum) ||
            (_ctype == 'coupon' && cnum >= 1))) {
      _ductionMoney = gift.ductionMoney;
      _onlyNewPay = gift.onlyNewPay;
      _state = gift.state;
    } else {
      _cid = 0;
      _ctype = '';
    }

    _totalPrice = _giftPrice * _giftNum;

    _totalNum =
        _cid > 0 && ((_ctype == 'key') && cnum >= _giftNum) ? 0 : _giftNum;

    int realTotalMoney = _data!.totalMoney;

    if (gift.giftType == 'coin') {
      // 金币礼物，客户端不做金币和背包是否有足够的判断，错误提示由后台返回
      _pay('available');
    } else if (_cid > 0 && _ctype == 'coupon') {
      if (Util.isAndroid) {
        if (_onlyNewPay <= 0 &&
            _data!.totalMoney + _ductionMoney >= _totalPrice) {
          _pay('available');
          return;
        } else {
          _displayDiscount();
        }
      } else {
        if (_onlyNewPay <= 0 &&
            _data!.totalMoney + _ductionMoney >= _totalPrice) {
          _pay('available');
        } else {
          _displayPay();
        }
      }
    } else if (realTotalMoney >= _totalPrice ||
        (_cid > 0 && _ctype == 'gift') ||
        _totalNum == 0) {
      _pay('available');
    } else {
      _displayPay();
    }
  }

  _pay(String? type) {
    _payManager.pay(
      context,
      key: 'gift',
      type: type ?? '',
      refer: 'gift',
      args: {
        'money': _totalPrice,
        'type': 'package',
        'params': {
          'rid': widget.room.rid,
          'uids': _uids.join(','),
          'positions': _positions.join(','),
          'position': _position,
          'giftId': _giftId,
          'giftNum': _giftNum,
          'price': _giftPrice,
          'cid': _cid,
          'ctype': _ctype,
          'duction_money': _ductionMoney,
          'version': 2,
          'num': _totalNum,
          'gift_type': _giftType,
          'star': _xxxStar,
        }
      },
      onPayed: _onPayed,
      onError: _onPayError,
    );
  }

  _displayDiscount() async {
    SheetCallback? result = await _payManager.showRechargeSheet(
        context, (_totalPrice) - (_ductionMoney),
        onlyRecharge: true);
    if (result == null ||
        result.reason == SheetCloseReason.Active ||
        result.value?.key == IPayManager.pTRecharge) {
      return;
    }

    if (result.value?.key == null) return;

    if (result.value?.key == IPayManager.pTRecharge) {
      // 充值成功刷新余额
      return;
    }

    _pay(result.value?.key);
  }

  _displayPay() async {
    SheetCallback? result = await _payManager.showRechargeSheet(
        context, (_totalPrice) - (_ductionMoney),
        onlyRecharge: true);
    if (result == null ||
        result.reason == SheetCloseReason.Active ||
        result.value?.key == IPayManager.pTRecharge) {
      return;
    }

    if (_onlyNewPay == 1 && _state == 0 && result.value?.key == 'available') {
      Toast.showCenter(context, R.string('please_recharge_first'));
      return;
    }

    _payManager.pay(
      context,
      key: 'gift',
      type: 'available',
      refer: 'gift',
      args: {
        'money': _totalPrice,
        'type': 'package',
        'params': {
          'rid': widget.room.rid,
          'uids': widget.uid,
          'positions': _positions.join(','),
          'position': _position,
          'giftId': _giftId,
          'giftNum': 1,
          'price': _giftPrice,
          'cid': _cid,
          'ctype': _ctype,
          'duction_money': _ductionMoney,
          'version': 2,
          'num': _totalNum,
          'gift_type': _giftType,
        }
      },
      onPayed: _onPayed,
      onError: _onPayError,
    );
  }

  void _onPayed() {
    Fluttertoast.showToast(msg: K.reward_suc, gravity: ToastGravity.BOTTOM);
    _load();
  }

  void _onPayError(bool isErrorCatch) {}

  @override
  Widget build(BuildContext context) {
    if (_gifts.isEmpty) return const SizedBox.shrink();

    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(4.0)),
        color: const Color(0xFF3C3659).withOpacity(0.75),
      ),
      margin: const EdgeInsetsDirectional.only(top: 8),
      padding: const EdgeInsetsDirectional.only(
          start: 12, end: 12, top: 8, bottom: 2),
      child: Column(
        children: [
          Row(
            children: [
              Text(K.click_following_gift_send,
                  style: const TextStyle(color: Colors.white, fontSize: 12)),
              Text(K.speaking_player,
                  style:
                      const TextStyle(color: Color(0xFFF8B32D), fontSize: 12)),
            ],
          ),
          const SizedBox(height: 3),
          _buildGiftRow()
        ],
      ),
    );
  }

  Widget _buildGiftRow() {
    return SizedBox(
      height: 68,
      child: ListView.separated(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: _gifts.length,
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(width: 12);
        },
        itemBuilder: (BuildContext context, int index) {
          Gift gift = _gifts[index];
          int giftId = gift.id;
          String icon = '${System.imageDomain}static/$giftSubDir/$giftId.png';
          return InkWell(
            onTap: () => _submit(gift),
            child: Container(
              alignment: Alignment.center,
              child: Stack(
                clipBehavior: Clip.none,
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      CachedNetworkImage(
                        placeholder: const CupertinoActivityIndicator(),
                        imageUrl: icon,
                        width: 36,
                        height: 36,
                        fit: BoxFit.contain,
                        fadeInDuration: const Duration(microseconds: 0),
                        fadeOutDuration: const Duration(microseconds: 0),
                      ),
                      const SizedBox(
                        height: 3,
                      ),
                      Text(
                        gift.name ?? ' ',
                        style:
                            const TextStyle(color: Colors.white, fontSize: 8),
                        maxLines: 1,
                      ),
                      const SizedBox(height: 3),
                      _renderPrice(gift),
                    ],
                  ),
                  _renderNumBadge(gift),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _renderPrice(Gift gift) {
    String unit;
    int num = gift.cnum;
    int cid = gift.cid;
    String type = gift.ctype ?? '';
    double price = gift.price;

    if (num > 0 &&
        cid > 0 &&
        (type == 'gift' || type == 'key' || type == 'coupon')) {
      String coin;
      String priceStr;
      if (type == 'gift' || type == 'key') {
        if (gift.giftType == 'coin') {
          unit = K.gift_coin_unit;
          coin = (max(0, min(1, 1 - num)) * price).toStringAsFixed(0);
          priceStr = Util.removeDecimalZeroFormat(gift.price);
        } else {
          unit = MoneyConfig.moneyName;
          coin = MoneyConfig.moneyNum(
              Util.parseInt((max(0, min(1, 1 - num)) * price) * 100));
          priceStr = MoneyConfig.moneyNum(Util.parseInt(gift.price * 100));
        }
      } else {
        double money =
            ((price * 100).round() - Util.parseInt(gift.ductionMoney)) / 100;
        if (gift.giftType == 'coin') {
          unit = K.gift_coin_unit;
          coin = Util.removeDecimalZeroFormat(money);
          priceStr = Util.removeDecimalZeroFormat(gift.price);
        } else {
          unit = MoneyConfig.moneyName;
          coin = MoneyConfig.moneyNum(Util.parseInt(money * 100));
          priceStr = MoneyConfig.moneyNum(Util.parseInt(gift.price * 100));
        }
      }
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsetsDirectional.only(end: 2.0),
            child: Text(
              "$coin$unit",
              style: TextStyle(
                color: Colors.white.withOpacity(0.6),
                fontSize: 8,
              ),
            ),
          ),
          Text(
            "$priceStr$unit",
            style: TextStyle(
              color: Colors.white.withOpacity(0.6),
              fontSize: 8,
              decoration: TextDecoration.lineThrough,
              decorationColor: R.color.secondTextColor,
            ),
          )
        ],
      );
    }

    String priceStr;
    if (gift.giftType == 'coin') {
      unit = K.gift_coin_unit;
      priceStr = Util.removeDecimalZeroFormat(gift.price);
    } else if (gift.giftType == 'bean') {
      unit = K.gift_gold_bean_unit;
      priceStr = Util.removeDecimalZeroFormat(gift.price);
    } else {
      unit = MoneyConfig.moneyName;
      priceStr = MoneyConfig.moneyNum(Util.parseInt((gift.price * 100)));
    }
    return Text(
      "$priceStr$unit",
      style: const TextStyle(color: Colors.white60, fontSize: 8),
    );
  }

  /// 右上角背包物品数量角标
  Widget _renderNumBadge(Gift gift) {
    int cid = gift.cid;
    int num = gift.cnum;
    int title = gift.title;
    String type = gift.ctype ?? '';
    String numStr = num > 999 ? '999+' : num.toString();

    TextStyle textStyle = const TextStyle(
      color: Color(0xFFFEFEFE),
      fontSize: 9,
      fontWeight: FontWeight.w500,
    );
    Widget? view;
    if (cid > 0 && (type == 'gift' || type == 'key')) {
      // 数量
      view = Container(
        height: 12,
        padding: const EdgeInsets.only(left: 4, right: 4),
        decoration: BoxDecoration(
          color: R.color.thirdBrightColor,
          borderRadius: BorderRadius.circular(7),
        ),
        child: Center(
          child: Text(
            numStr,
            style: textStyle,
          ),
        ),
      );
    } else if (cid > 0 && type == 'coupon') {
      // 优惠券
      view = Coupon(
        color: R.color.thirdBrightColor,
        child: Container(
          width: 24,
          height: 12,
          alignment: Alignment.center,
          child: Text(
            numStr,
            style: textStyle,
          ),
        ),
      );
    } else if (gift.tagUrl != null && gift.tagUrl!.isNotEmpty) {
      // 礼物标签
      view = CachedNetworkImage(
        imageUrl: System.imageDomain + gift.tagUrl!,
        fit: BoxFit.contain,
        height: 12,
      );
    } else if (title > 0) {
      // 爵位
      view = Container(
        height: 12,
        padding: const EdgeInsets.only(left: 4, right: 4),
        decoration: BoxDecoration(
          color: R.color.thirdBrightColor,
          borderRadius: BorderRadius.circular(7),
        ),
        child: Center(
          child: Text(
            _titles[title] ?? '',
            style: textStyle,
          ),
        ),
      );
    }

    if (view != null) {
      double scale = 0.7;
      return PositionedDirectional(
        end: 0,
        top: 5,
        child: Transform(
          transform: Matrix4.identity()
            ..translate(2.5)
            ..scale(scale, scale, 1.0),
          alignment: Alignment.center,
          child: view,
        ),
      );
    }
    return const SizedBox.shrink();
  }
}
