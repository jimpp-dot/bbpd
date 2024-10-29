import 'package:shared/shared.dart';
import 'package:chat_room/chat_room.dart';
import 'package:flutter/material.dart';

/// 暂不支持非💎礼物
class SingleGiftButton extends StatefulWidget {
  final ChatRoomData _room;
  final String _refer;
  final int _giftId;
  final String _giftName;
  final String _giftType;
  final int _price;
  final List<int> _positions;
  final int _position; // 我的麦序 // 被打赏人的麦序
  final List<int> _uids; // 被打赏人的uid
  final Widget _child;
  final Function(bool success)? _completion;

  const SingleGiftButton(
      this._room,
      this._refer,
      this._giftId,
      this._giftName,
      this._giftType,
      this._price,
      this._positions,
      this._position,
      this._uids,
      this._completion,
      this._child,
      {Key? key})
      : super(key: key);

  @override
  State<SingleGiftButton> createState() => _SingleGiftButtonState();
}

class _SingleGiftButtonState extends State<SingleGiftButton> {
  bool _isPaying = false;
  final IPayManager _payManager =
      ComponentManager.instance.getManager(ComponentManager.MANAGER_PAY);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        if (_isPaying) {
          return;
        }

        _displayPay(context);
      },
      child: widget._child,
    );
  }

  _displayPay(BuildContext context) async {
    SheetCallback? result =
        await _payManager.showRechargeSheet(context, widget._price);
    if (result == null ||
        result.reason == SheetCloseReason.Active ||
        result.value?.key == IPayManager.pTRecharge) {
      widget._completion?.call(false);
      return;
    }

    _pay(result.value?.key ?? '', context);
  }

  void _pay(String type, BuildContext context) {
    _isPaying = true;
    _payManager.pay(context,
        key: 'gift',
        type: type,
        args: {
          'money': widget._price,
          'type': 'package',
          'params': {
            'rid': widget._room.rid,
            'uids': widget._uids.join(','),
            'positions': widget._positions.join(','),
            'position': widget._position,
            'giftId': widget._giftId,
            'giftNum': 1,
            'price': widget._price,
            'cid': 0,
            'ctype': '',
            'duction_money': 0,
            'version': 2,
            'num': 1,
            'gift_type': widget._giftType,
            'refer': '${widget._room.refer}:room'
          }
        },
        showLoading: (type != IPayManager.pTAvailable),
        onPayed: _onPayed,
        onError: _onPayError);
  }

  void _onPayed() {
    _isPaying = false;

    Map<String, dynamic> properties = <String, dynamic>{
      'scene': 'room',
      'rid': widget._room.rid,
      'gift_name': widget._giftName,
      'gift_id': widget._giftId,
      'gift_price': widget._price,
      'gift_num': 1,
      'user_num': widget._uids.length,
      'total_price': widget._price,
      'gift_type': widget._giftType,
      'refer': widget._refer,
      'chat_room_type': widget._room.config?.type,
      'chat_room_property': widget._room.config?.property.toString(),
      'chat_room_types': widget._room.config?.types.toString(),
      if (!Util.isNullOrEmpty(widget._room.config?.typeName))
        'type_label': widget._room.config?.typeName,
      if (!Util.isNullOrEmpty(widget._room.config?.originalRFT))
        'room_factory_type': widget._room.config?.originalRFT,
      if (!Util.isNullOrEmpty(widget._room.config?.settlementChannel))
        'settlement_channel': widget._room.config?.settlementChannel,
    };
    String? roomType = widget._room.config?.type;
    properties['time'] = DateTime.now().millisecondsSinceEpoch;
    properties['room_type'] = roomType;
    if (widget._room.config?.game == Games.Wolf) {
      IWereWolfManager wereWolfManager = ComponentManager.instance
          .getManager(ComponentManager.MANAGER_WERE_WOLF);
      properties['game_type'] = wereWolfManager.getGameType();
    }

    for (var element in widget._uids) {
      properties['to_uid'] = element;
      Tracker.instance.track(TrackEvent.send_gift, properties: properties);
    }

    Fluttertoast.showToast(
        msg: R.string('reward_suc'), gravity: ToastGravity.BOTTOM);

    eventCenter.emit("Gift.SendSuccess");

    widget._completion?.call(true);
  }

  void _onPayError(bool isErrorCatch) {
    _isPaying = false;

    widget._completion?.call(false);
  }
}
