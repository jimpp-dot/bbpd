import 'package:shared/shared.dart';
import 'package:chat_room/chat_room.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:chat_room/src/base/widget/combo_gift_tip_dialog.dart';

import '../../../k.dart';

class ComboGiftButton extends StatefulWidget {
  final ChatRoomData room;

  const ComboGiftButton(this.room, {super.key});

  @override
  ComboGiftButtonState createState() {
    return ComboGiftButtonState();
  }
}

class ComboGiftButtonState extends State<ComboGiftButton> {
  bool isCombo = false;
  bool isClick = false;
  late String giftIcon;
  late GlobalKey<MultiframeImageState> _buttonAnimKey;
  late GlobalKey<MultiframeImageState> _clickAnimKey;
  late IPayManager _payManager;
  final List<int> _positions = []; // 被打赏人的麦序
  final List<int> _uids = []; // 被打赏人的uid
  int _position = -1; // 我的麦序

  bool _isPaying = false;

  @override
  void initState() {
    super.initState();
    giftIcon =
        '${System.imageDomain}static/$giftSubDir/${widget.room.comboGift!.id}.png';
    _buttonAnimKey = GlobalKey<MultiframeImageState>();
    _clickAnimKey = GlobalKey<MultiframeImageState>();
    _payManager =
        ComponentManager.instance.getManager(ComponentManager.MANAGER_PAY);
  }

  @override
  Widget build(BuildContext context) {
    if (!isCombo) {
      return Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(34),
            onTap: onTap,
            child: Container(
              width: 34,
              height: 34,
              alignment: AlignmentDirectional.center,
              decoration: BoxDecoration(
                  shape: BoxShape.circle, color: Colors.white.withOpacity(0.2)),
              child: Center(
                child: CachedNetworkImage(
                  placeholder: const CupertinoActivityIndicator(),
                  imageUrl: giftIcon,
                  width: 34,
                  height: 34,
                  fit: BoxFit.contain,
                  fadeInDuration: const Duration(microseconds: 0),
                  fadeOutDuration: const Duration(microseconds: 0),
                ),
              ),
            ),
          ));
    } else {
      return GestureDetector(
        onTap: onTap,
        child: SizedBox(
            width: 50,
            height: 50,
            child: Stack(
              children: <Widget>[
                MultiframeImage.network(
                  Util.getImgUrl('combo_gift_button.webp',
                      package: ComponentManager.MANAGER_BASE_ROOM),
                  'room',
                  key: _buttonAnimKey,
                  onComplete: _onButtonAniComplete,
                ),
                if (isClick)
                  MultiframeImage.network(
                    Util.getImgUrl('combo_gift_button_click.webp',
                        package: ComponentManager.MANAGER_BASE_ROOM),
                    'room',
                    key: _clickAnimKey,
                    onComplete: _onClickAniComplete,
                  ),
              ],
            )),
      );
    }
  }

  void onTap() async {
    if (_isPaying) {
      return;
    }

    if (isCombo && mounted) {
      if (isClick && _clickAnimKey.currentState != null) {
        _clickAnimKey.currentState?.resetToPlay();
      } else {
        setState(() {
          isClick = true;
        });
      }
    }

    if ((widget.room.isKtvRoom || widget.room.isKtvChorusRoom) &&
        Config.getInt(ComboGiftTipDialog.comboGiftKtvTip, 0) == 0 &&
        widget.room.comboGift != null) {
      // KTV提示
      bool? isPositive = await showDialog(
          context: context,
          builder: (BuildContext context) {
            return Center(
              child: ComboGiftTipDialog(
                widget.room.comboGift!.id,
                widget.room.comboGift!.price,
                ComboGiftTipType.Ktv,
                giftType: widget.room.comboGift!.giftType ?? '',
                giftName: widget.room.comboGift!.name,
              ),
            );
          });

      if (isPositive != true) {
        return;
      }
    } else if (widget.room.isLiveRoom &&
        Config.getInt(ComboGiftTipDialog.comboGiftTip, 0) == 0 &&
        widget.room.comboGift != null) {
      // 直播间提示
      bool? isPositive = await showDialog(
          context: context,
          builder: (BuildContext context) {
            return Center(
              child: ComboGiftTipDialog(
                widget.room.comboGift!.id,
                widget.room.comboGift!.price,
                ComboGiftTipType.Live,
                giftType: widget.room.comboGift!.giftType ?? '',
              ),
            );
          });

      if (isPositive != true) {
        return;
      }
    }

    _position = -1;
    for (var position in widget.room.positions) {
      int uid = position.uid;
      if (uid > 0 && uid == Session.uid) {
        _position = position.position;
      }
    }

    _uids.clear();
    _positions.clear();
    if (widget.room.isLiveRoom &&
        (widget.room.isEightPosition ||
            widget.room.positions.elementAt(0).uid ==
                widget.room.createor?.uid)) {
      // 直播房，鼓掌只能打赏给主播
      _uids.add(widget.room.createor!.uid);
      int creatorPosition = -1;
      if (widget.room.positions.elementAt(0).uid == widget.room.createor?.uid) {
        creatorPosition = 0;
      }
      _positions.add(creatorPosition);
    } else if ((widget.room.isKtvRoom || widget.room.isKtvChorusRoom)) {
      // KTV房，鼓掌礼物只能送给演唱者，且演唱者自己不能送给自己
      if ((widget.room.config?.ktvInfo?.currentSong?.uid ?? 0) <= 0) {
        Fluttertoast.showToast(
            msg: K.room_no_singer_to_reward, gravity: ToastGravity.CENTER);
        return;
      } else if ((widget.room.config?.ktvInfo?.currentSong?.uid ?? 0) ==
          Session.uid) {
        Fluttertoast.showToast(
            msg: K.room_cant_reward_to_self, gravity: ToastGravity.CENTER);
        return;
      }

      _uids.add(widget.room.config!.ktvInfo?.currentSong?.uid ?? 0);
      int singerPosition = -1;
      for (var position in widget.room.positions) {
        int uid = position.uid;
        if (uid > 0 && uid == widget.room.config!.ktvInfo?.currentSong?.uid) {
          singerPosition = position.position;
        }
      }
      _positions.add(singerPosition);
    }

    if (_uids.isEmpty) {
      Fluttertoast.showToast(
          msg: K.room_no_one_to_reward, gravity: ToastGravity.CENTER);
      return;
    }

    if (widget.room.comboGift?.giftType == 'normal') {
      _displayPay();
    } else {
      _pay('available');
    }
  }

  void _pay(String type) {
    _isPaying = true;
    _payManager.pay(context,
        key: 'gift',
        type: type,
        args: {
          'money': _price(),
          'type': 'package',
          'params': {
            'rid': widget.room.rid,
            'uids': _uids.join(','),
            'positions': _positions.join(','),
            'position': _position,
            'giftId': widget.room.comboGift?.id,
            'giftNum': 1,
            'price': _price(),
            'cid': 0,
            'ctype': '',
            'duction_money': 0,
            'version': 2,
            'num': 1,
            'gift_type': widget.room.comboGift?.giftType,
            'refer': '${widget.room.refer}:room'
          }
        },
        showLoading: (type != IPayManager.pTAvailable),
        onPayed: _onPayed,
        onError: _onPayError);
  }

  void _onPayed() {
    _isPaying = false;
    if (mounted) {
      if (isCombo && _buttonAnimKey.currentState != null) {
        _buttonAnimKey.currentState?.resetToPlay();
      } else {
        setState(() {
          isCombo = true;
        });
      }
    }

    final properties = <String, dynamic>{
      'scene': 'room',
      'rid': widget.room.rid,
      'gift_name': widget.room.comboGift?.name,
      'gift_id': widget.room.comboGift?.id,
      'gift_price': _price(),
      'gift_num': 1,
      'user_num': _uids.length,
      'total_price': _price(),
      'gift_type': widget.room.comboGift?.giftType,
      'chat_room_type': widget.room.config?.type,
      'chat_room_property': widget.room.config?.property.toString(),
      'chat_room_types': widget.room.config?.types.toString(),
      if (!Util.isNullOrEmpty(widget.room.config?.typeName))
        'type_label': widget.room.config?.typeName,
      if (!Util.isNullOrEmpty(widget.room.config?.originalRFT))
        'room_factory_type': widget.room.config?.originalRFT,
      if (!Util.isNullOrEmpty(widget.room.config?.settlementChannel))
        'settlement_channel': widget.room.config?.settlementChannel,
    };
    String? roomType = widget.room.config?.type;
    properties['time'] = DateTime.now().millisecondsSinceEpoch;
    properties['room_type'] = roomType;
    if (widget.room.config?.game == Games.Wolf) {
      IWereWolfManager wereWolfManager = ComponentManager.instance
          .getManager(ComponentManager.MANAGER_WERE_WOLF);
      properties['game_type'] = wereWolfManager.getGameType();
    }

    for (var element in _uids) {
      properties['to_uid'] = element;
      Tracker.instance.track(TrackEvent.send_gift, properties: properties);
    }

    Fluttertoast.showToast(msg: K.reward_suc, gravity: ToastGravity.BOTTOM);

    eventCenter.emit("Gift.SendSuccess");
  }

  void _onPayError(bool isErrorCatch) {
    _isPaying = false;
  }

  _displayPay() async {
    SheetCallback? result =
        await _payManager.showRechargeSheet(context, _price());
    if (result == null ||
        result.reason == SheetCloseReason.Active ||
        result.value?.key == IPayManager.pTRecharge) {
      return;
    }

    _pay(result.value!.key);
  }

  void _onButtonAniComplete() {
    if (mounted) {
      setState(() {
        isCombo = false;
      });
    }
  }

  void _onClickAniComplete() {
    if (mounted) {
      setState(() {
        isClick = false;
      });
    }
  }

  int _price() {
    if (widget.room.comboGift?.giftType == 'coin' ||
        widget.room.comboGift?.giftType == 'bean') {
      return widget.room.comboGift!.price.round();
    }
    return (widget.room.comboGift!.price * 100).round();
  }
}
