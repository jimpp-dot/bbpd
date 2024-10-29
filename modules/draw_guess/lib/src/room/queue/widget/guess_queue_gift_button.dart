import 'package:shared/shared.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:chat_room/chat_room.dart';
import 'package:chat_room/k.dart' as RoomK;
import 'package:shared/k.dart' as BaseK;

class GuessQueueGiftButton extends StatefulWidget {
  final Gift gift;
  final ChatRoomData room;
  final int toUid;
  final bool isFirst;

  const GuessQueueGiftButton({
    super.key,
    required this.gift,
    required this.room,
    required this.toUid,
    this.isFirst = true,
  });

  @override
  GuessQueueGiftButtonState createState() => GuessQueueGiftButtonState();
}

class GuessQueueGiftButtonState extends State<GuessQueueGiftButton>
    with TickerProviderStateMixin {
  String? giftIcon;
  late final IPayManager _payManager;
  final List<int> _positions = []; // 被打赏人的麦序
  final List<int> _uids = []; // 被打赏人的uid
  int _position = -1; // 我的麦序
  RoomPosition? roomPosition;

  bool _tryUseAvailable = false; // 尝试使用余额支付
  late AnimationController _animationController;
  bool _isClicking = false;
  bool _isPaying = false;

  @override
  void initState() {
    super.initState();
    giftIcon = '${System.imageDomain}static/$giftSubDir/${widget.gift.id}.png';
    _payManager =
        ComponentManager.instance.getManager(ComponentManager.MANAGER_PAY);

    _animationController = AnimationController(
        lowerBound: 0.6,
        upperBound: 1,
        duration: const Duration(milliseconds: 150),
        value: 1,
        vsync: this)
      ..addStatusListener((status) {
        if (status == AnimationStatus.dismissed) {
          _animationController.forward();
        } else if (status == AnimationStatus.completed) {
          _isClicking = false;
        }
      });

    _uids.add(widget.toUid);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String unit;
    String displayPrice;

    // 金币礼物单位为金
    if (widget.gift.giftType == 'coin') {
      unit = BaseK.K.defend_gold;
      displayPrice = '${widget.gift.price.toInt()}';
    } else if (widget.gift.giftType == 'bean') {
      unit = BaseK.K.base_money_gold_bean;
      displayPrice = '${widget.gift.price.toInt()}';
    } else {
      unit = MoneyConfig.moneyName;
      displayPrice =
          MoneyConfig.moneyNum(Util.parseInt(widget.gift.price * 100));
    }

    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: 40,
        height: 45,
        child: Stack(
          alignment: AlignmentDirectional.topCenter,
          children: [
            ScaleTransition(
              scale: _animationController,
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: const Color(0xFF646464),
                  shape: BoxShape.circle,
                  border: Border.all(color: const Color(0xFF343434), width: 2),
                ),
                alignment: AlignmentDirectional.center,
                child: CachedNetworkImage(
                  placeholder: const CupertinoActivityIndicator(),
                  imageUrl: giftIcon,
                  width: 36,
                  height: 36,
                  fit: BoxFit.contain,
                  fadeInDuration: const Duration(microseconds: 0),
                  fadeOutDuration: const Duration(microseconds: 0),
                ),
              ),
            ),
            PositionedDirectional(
              top: 28,
              child: Container(
                height: 17,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.all(Radius.circular(8.5)),
                  border: Border.all(color: Colors.black, width: 2),
                ),
                alignment: AlignmentDirectional.centerStart,
                padding: const EdgeInsetsDirectional.only(start: 3, end: 3),
                child: Text(
                  '$displayPrice$unit',
                  style: TextStyle(
                    fontSize: 9,
                    fontWeight: FontWeight.w800,
                    fontFamily: Util.numFontFamily,
                    fontStyle: FontStyle.italic,
                    color: const Color(0xFF313131),
                    height: 1.1,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void onTap() async {
    if (_isClicking || _isPaying) return;
    _isClicking = true;
    _animationController.reverse(from: 1);
    _position = -1;
    for (var position in widget.room.positions) {
      int uid = position.uid;
      if (uid > 0 && uid == Session.uid) {
        _position = position.position;
      }
    }

    _positions.clear();
    for (var position in widget.room.positions) {
      int uid = position.uid;
      if (uid > 0 && uid == widget.toUid) {
        _positions.add(position.position);
      }
    }

    if (_uids.isEmpty) {
      Fluttertoast.showToast(
          msg: RoomK.K.room_no_one_to_reward, gravity: ToastGravity.CENTER);
      return;
    }

    if (widget.gift.giftType == 'normal') {
      /// 余额不足只有普通礼物走直充，金豆和金币暂时不支持直充
      _tryUseAvailable = true;
    }

    _pay('available');
  }

  void _pay(String? type) {
    int giftPrice = _price();
    _isPaying = true;
    _payManager.pay(context,
        key: 'gift',
        type: type ?? '',
        args: {
          'money': giftPrice,
          'type': 'package',
          'params': {
            'rid': widget.room.rid,
            'uids': _uids.join(','),
            'positions': _positions.join(','),
            'position': _position,
            'giftId': widget.gift.id,
            'giftNum': 1,
            'price': giftPrice,
            'cid': 0,
            'ctype': '',
            'duction_money': 0,
            'version': 2,
            'num': 1,
            'gift_type': widget.gift.giftType,
            'refer': '${widget.room.refer}:room'
          }
        },
        showLoading: (type != IPayManager.pTAvailable),
        onPayed: _onPayed,
        onError: _onPayError);
    if (widget.isFirst == true) {
      Tracker.instance.track(TrackEvent.draw_gift1,
          properties: {'uid': Session.uid, 'rid': widget.room.rid});
    } else {
      Tracker.instance.track(TrackEvent.draw_gift2,
          properties: {'uid': Session.uid, 'rid': widget.room.rid});
    }
  }

  void _onPayed() {
    _isPaying = false;
    int giftPrice = _price();
    Map<String, dynamic> properties = {
      'scene': 'room',
      'rid': widget.room.rid,
      'gift_name': widget.gift.name,
      'gift_id': widget.gift.id,
      'gift_price': giftPrice,
      'gift_num': 1,
      'user_num': _uids.length,
      'total_price': giftPrice,
      'gift_type': widget.gift.giftType,
      'chat_room_type': widget.room.config?.type,
      'chat_room_property': widget.room.config?.property.toString(),
      'chat_room_types': widget.room.config?.types.toString(),
    };
    String? roomType = widget.room.config?.type;
    properties['time'] = DateTime.now().millisecondsSinceEpoch;
    properties['room_type'] = roomType;

    for (var element in _uids) {
      properties['to_uid'] = element;
      Tracker.instance.track(TrackEvent.send_gift, properties: properties);
    }

    _tryUseAvailable = false;
    Fluttertoast.showToast(
        msg: R.string('reward_suc'), gravity: ToastGravity.BOTTOM);

    eventCenter.emit("Gift.SendSuccess");
  }

  void _onPayError(bool isErrorCatch) {
    _isPaying = false;
    if (_tryUseAvailable) {
      _tryUseAvailable = false;
      _displayPay();
    }
  }

  int _price() {
    if (widget.gift.giftType == 'coin' || widget.gift.giftType == 'bean')
      return widget.gift.price.round();
    return (widget.gift.price * 100).round();
  }

  _displayPay() async {
    SheetCallback? result =
        await _payManager.showRechargeSheet(context, _price());
    if (result == null ||
        result.reason == SheetCloseReason.Active ||
        result.value?.key == IPayManager.pTRecharge) {
      return;
    }
    _pay(result.value?.key);
  }
}
