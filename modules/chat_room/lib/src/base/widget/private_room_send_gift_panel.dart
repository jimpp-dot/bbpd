import 'package:shared/shared.dart';
import 'package:chat_room/k.dart';
import 'package:chat_room/src/protobuf/generated/nest.pb.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../chatRoomData.dart';
import '../../chatRoomUtil.dart';

class PrivateRoomSendGiftPanel extends StatefulWidget {
  final int uid;
  final String name;
  final String icon;
  final int giftId;
  final int giftNum;
  final String giftName;
  final String giftIcon;
  final int giftPrice;
  final NestGiftCoupon? coupon;

  const PrivateRoomSendGiftPanel({
    super.key,
    required this.uid,
    required this.name,
    required this.icon,
    required this.giftId,
    required this.giftNum,
    required this.giftName,
    required this.giftIcon,
    required this.giftPrice,
    this.coupon,
  });

  @override
  PrivateRoomSendGiftState createState() {
    return PrivateRoomSendGiftState();
  }

  static Future<bool?> show({
    required BuildContext context,
    required int uid,
    required String name,
    required String icon,
    required int giftId,
    required int giftNum,
    required String giftName,
    required String giftIcon,
    required int giftPrice,
    NestGiftCoupon? coupon,
  }) {
    return displayModalBottomSheet(
      context: context,
      maxHeightRatio: 0.5,
      defineBarrierColor: Colors.transparent,
      builder: (context) {
        return PrivateRoomSendGiftPanel(
          uid: uid,
          name: name,
          icon: icon,
          giftId: giftId,
          giftNum: giftNum,
          giftName: giftName,
          giftIcon: giftIcon,
          giftPrice: giftPrice,
          coupon: coupon,
        );
      },
    );
  }
}

class PrivateRoomSendGiftState extends State<PrivateRoomSendGiftPanel> {
  BalanceInfo? _balanceInfo;
  late IPayManager _payManager;

  @override
  void initState() {
    super.initState();
    _payManager =
        ComponentManager.instance.getManager(ComponentManager.MANAGER_PAY);
    load();
  }

  void load() async {
    _balanceInfo = await BalanceInfo.loadBalanceInfo();
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        /// do nothing
      },
      child: Container(
        width: Util.width,
        height: 398,
        decoration: const BoxDecoration(
          borderRadius: BorderRadiusDirectional.only(
            topStart: Radius.circular(16),
            topEnd: Radius.circular(16),
          ),
          color: Color(0xFF171621),
        ),
        child: Column(
          children: [
            const SizedBox(height: 12),
            Row(
              children: [
                const SizedBox(width: 16),
                CommonAvatar(
                  path: Util.getUserIconUrl(widget.icon),
                  size: 28,
                  shape: BoxShape.circle,
                ),
                const SizedBox(width: 6),
                Expanded(
                  child: Text(
                    widget.name,
                    style: const TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(width: 16),
              ],
            ),
            Container(
              margin: EdgeInsetsDirectional.only(
                  top: 12,
                  bottom: 46.0 + (Util.iphoneXBottom > 0 ? 0 : 17),
                  start: 16,
                  end: 16),
              height: 1,
              color: Colors.white10,
            ),
            SizedBox(
                width: Util.width,
                height: 100,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: const Color(0x14F6F7F9),
                        border:
                            Border.all(color: Colors.white.withOpacity(0.06)),
                      ),
                      alignment: AlignmentDirectional.center,
                      child: CachedNetworkImage(
                        placeholder: const CupertinoActivityIndicator(),
                        imageUrl: getGiftUrl(),
                        width: 66,
                        height: 66,
                        fit: BoxFit.contain,
                      ),
                    ),
                    if (widget.coupon != null &&
                        (widget.coupon?.discount ?? 0) > 0)
                      PositionedDirectional(
                        top: 0,
                        start: Util.width / 2 + 24,
                        child: Container(
                          width: 36,
                          height: 20,
                          alignment: Alignment.center,
                          decoration: const ShapeDecoration(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadiusDirectional.only(
                                topStart: Radius.circular(13),
                                topEnd: Radius.circular(4),
                                bottomStart: Radius.circular(4),
                                bottomEnd: Radius.circular(13),
                              ),
                            ),
                            gradient: LinearGradient(
                                colors: [Color(0xFFFF516E), Color(0xFFFF6FC9)]),
                          ),
                          child: Text(
                            K.fairy_ship_discount([
                              (100 - widget.coupon!.discount) % 10 == 0
                                  ? ((100 - widget.coupon!.discount) / 10)
                                      .floor()
                                      .toString()
                                  : (100 - widget.coupon!.discount).toString()
                            ]),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 11,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      )
                  ],
                )),
            const SizedBox(
              height: 20,
            ),
            Text(
              widget.giftName,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              '${widget.giftPrice}${MoneyConfig.moneyName4}',
              style: const TextStyle(
                fontSize: 13,
                color: Colors.white70,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            if (widget.coupon != null &&
                (widget.coupon?.discount ?? 0) > 0) ...[
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    K.fairy_ship_sum,
                    style: TextStyle(
                        color: Colors.white.withOpacity(0.7), fontSize: 13),
                  ),
                  Text(
                    K.room_how_many_diamonds([
                      (widget.giftPrice *
                              widget.giftNum *
                              ((100 - widget.coupon!.discount) / 100))
                          .floor()
                          .toString()
                    ]),
                    style: const TextStyle(color: Colors.white, fontSize: 13),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(width: 4),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        gradient: LinearGradient(colors: [
                          const Color(0xFFEC6080).withOpacity(0.5),
                          const Color(0xFFFE7A33).withOpacity(0.5)
                        ])),
                    child: Text(
                      widget.coupon!.cname,
                      style: const TextStyle(color: Colors.white, fontSize: 11),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Text(
                    K.room_how_many_diamonds(
                        [(widget.giftPrice * widget.giftNum).toString()]),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                      decoration: TextDecoration.lineThrough,
                      decorationColor: Colors.white,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              )
            ],
            const Spacer(),
            _buildHandleBar(),
            SizedBox(height: Util.iphoneXBottom > 0 ? Util.iphoneXBottom : 20),
          ],
        ),
      ),
    );
  }

  /// 操作条
  Widget _buildHandleBar() {
    return Container(
      padding: const EdgeInsetsDirectional.only(start: 16, end: 16),
      height: 52,
      alignment: Alignment.center,
      child: Row(
        children: [
          Image.asset(MoneyConfig.moneyIcon, width: 24, height: 24),
          const SizedBox(width: 2),
          Container(
            constraints: const BoxConstraints(maxWidth: 168),
            child: FittedBox(
              fit: BoxFit.contain,
              child: NumText(
                MoneyConfig.moneyNum(_balanceInfo?.available ?? 0,
                    fractionDigits: 2),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () async {
              ISettingManager? manager = ComponentManager.instance
                  .getManager(ComponentManager.MANAGER_SETTINGS);
              bool? suc =
                  await manager?.openRechargeScreen(context, refer: 'gift');
              if (suc == true) {
                load();
              }
            },
            child: Padding(
              padding: const EdgeInsetsDirectional.only(start: 4, end: 4),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    K.room_recharge,
                    style: TextStyle(
                      color: R.color.mainBrandColor,
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Icon(
                    Icons.navigate_next,
                    color: R.color.mainBrandColor,
                    size: 18,
                  ),
                ],
              ),
            ),
          ),
          const Spacer(),
          Container(
            width: 60,
            height: 30,
            decoration: BoxDecoration(
              border: Border.all(color: R.color.mainBrandColor, width: 1),
              borderRadius: const BorderRadiusDirectional.only(
                topStart: Radius.circular(16),
                bottomStart: Radius.circular(16),
              ),
            ),
            alignment: Alignment.center,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsetsDirectional.only(end: 4),
                  child: NumText(
                    "x${widget.giftNum}",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              _submit();
            },
            child: Container(
              width: 60,
              height: 30,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                gradient:
                    LinearGradient(colors: R.color.mainBrandGradientColors),
                borderRadius: const BorderRadiusDirectional.only(
                  topEnd: Radius.circular(16),
                  bottomEnd: Radius.circular(16),
                ),
              ),
              child: Text(
                K.room_send_gift,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
        ],
      ),
    );
  }

  String getGiftUrl() {
    return Util.validStr(widget.giftIcon)
        ? Util.parseIcon(widget.giftIcon)
        : Util.giftImgUrl(widget.giftId);
  }

  int get totalMoney => widget.giftNum * widget.giftPrice;

  bool _isPaying = false;

  void _submit() async {
    if (_isPaying) {
      return;
    }
    _displayPay();
  }

  void _pay(String type) {
    _isPaying = true;
    ChatRoomData? room = ChatRoomData.getInstance();

    _payManager.pay(context,
        key: 'gift',
        type: type,
        args: {
          'money': totalMoney,
          'type': 'package',
          'params': {
            'rid': room?.rid,
            'uids': '${widget.uid}',
            'positions':
                '${ChatRoomUtil.getPositionByUid(widget.uid)?.position ?? ''}',
            'position': '${ChatRoomUtil.getPositionByServer()?.position ?? ''}',
            'giftId': widget.giftId,
            'giftNum': widget.giftNum,
            'price': widget.giftPrice,
            'cid': Util.parseInt(widget.coupon?.ucid),
            'ctype': '',
            'duction_money': 0,
            'version': 2,
            'num': widget.giftNum,
            'gift_type': 'normal',
            'refer': '${room?.refer}:room',
            'nest': '1',
          }
        },
        showLoading: (type != IPayManager.pTAvailable),
        onPayed: _onPayed,
        onError: _onPayError);
  }

  void _onPayError(bool isErrorCatch) {
    _isPaying = false;
  }

  _displayPay() async {
    SheetCallback? result = await _payManager.showRechargeSheet(
        context,
        (widget.giftPrice *
                widget.giftNum *
                ((100 - (widget.coupon?.discount ?? 0)) / 100))
            .floor());
    if (result == null ||
        result.reason == SheetCloseReason.Active ||
        result.value?.key == IPayManager.pTRecharge) {
      return;
    }

    _pay(result.value!.key);
  }

  void _onPayed() {
    _isPaying = false;
    ChatRoomData? room = ChatRoomData.getInstance();
    final properties = <String, dynamic>{
      'scene': 'room',
      'rid': room?.rid,
      'gift_name': widget.giftName,
      'gift_id': widget.giftId,
      'gift_price': widget.giftPrice,
      'gift_num': widget.giftNum,
      'user_num': 1,
      'total_price': widget.giftPrice * widget.giftNum,
      'gift_type': 'normal',
      'chat_room_type': room?.config?.type,
      'chat_room_property': room?.config?.property.toString(),
      'chat_room_types': room?.config?.types.toString(),
      if (!Util.isNullOrEmpty(room?.config?.typeName))
        'type_label': room?.config?.typeName,
      if (!Util.isNullOrEmpty(room?.config?.originalRFT))
        'room_factory_type': room?.config?.originalRFT,
      if (!Util.isNullOrEmpty(room?.config?.settlementChannel))
        'settlement_channel': room?.config?.settlementChannel,
    };
    String? roomType = room?.config?.type;
    properties['time'] = DateTime.now().millisecondsSinceEpoch;
    properties['room_type'] = roomType;

    properties['to_uid'] = widget.uid;
    Tracker.instance.track(TrackEvent.send_gift, properties: properties);

    Fluttertoast.showToast(msg: K.reward_suc, gravity: ToastGravity.BOTTOM);

    eventCenter.emit("Gift.SendSuccess");

    if (ModalRoute.of(context)?.isCurrent ?? false) {
      Navigator.of(context).pop(true);
    }
  }
}
