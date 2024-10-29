import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:chat_room/k.dart';

/// 贵族特权房弹框页面

class RoomNobilityPrivilegeDialog extends StatefulWidget {
  /// 房间ID
  final int rid;

  /// 用户ID
  final int uid;

  /// 礼物ID
  final int giftId;

  /// 礼物名称
  final String giftName;

  /// 礼物价格
  final int money;

  /// 礼物个数
  final int? giftNum;

  /// title,支持服务端下发
  final String? title;

  /// subTitle,支持服务端下发
  final String? subTitle;

  const RoomNobilityPrivilegeDialog(
    this.rid,
    this.uid,
    this.giftId,
    this.giftName,
    this.money, {
    Key? key,
    this.giftNum,
    this.title,
    this.subTitle,
  }) : super(key: key);

  @override
  State<RoomNobilityPrivilegeDialog> createState() =>
      _RoomNobilityPrivilegeDialogState();
}

class _RoomNobilityPrivilegeDialogState
    extends State<RoomNobilityPrivilegeDialog> {
  final IPayManager _payManager =
      ComponentManager.instance.getManager(ComponentManager.MANAGER_PAY);

  @override
  Widget build(BuildContext context) {
    int giftNum = Util.parseInt(widget.giftNum) > 0 ? widget.giftNum! : 1;

    return Container(
      width: Util.width - 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 24),
          Text(
            Util.validStr(widget.title)
                ? widget.title!
                : K.room_nobility_privilege_alert_title,
            style: TextStyle(
                color: R.color.unionRankText1,
                fontSize: 18,
                fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Text(
              Util.validStr(widget.subTitle)
                  ? widget.subTitle!
                  : K.room_nobility_privilege_alert_desc,
              style: TextStyle(
                  color: R.color.unionRankText1.withOpacity(0.6), fontSize: 16),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 12),
          Container(
            width: 114,
            height: 114,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: const Color(0x0F1D60DD),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 10.0),
                CachedNetworkImage(
                  imageUrl: Util.giftImgUrl(widget.giftId),
                  width: 48.0,
                  height: 48.0,
                ),
                const SizedBox(height: 4.0),
                Text(
                  widget.giftName,
                  style: TextStyle(color: R.color.unionRankText1, fontSize: 12),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4.0),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      MoneyConfig.moneyNum(widget.money),
                      style: TextStyle(
                          color: R.color.unionRankText1.withOpacity(0.4),
                          fontSize: 12),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(width: 2.0),
                    Image.asset(MoneyConfig.moneyIcon, width: 12, height: 12),
                    Text(
                      ' x$giftNum',
                      style: TextStyle(
                          color: R.color.unionRankText1.withOpacity(0.4),
                          fontSize: 12),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                )
              ],
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pop(false);
                },
                child: Container(
                  width: 130,
                  height: 48,
                  alignment: AlignmentDirectional.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(28),
                    color: const Color(0xFFF5F5F5),
                  ),
                  child: Text(
                    K.cancel,
                    style: TextStyle(
                        color: R.color.unionRankText1.withOpacity(0.7),
                        fontSize: 15,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              GestureDetector(
                onTap: () {
                  _payManager.pay(
                    context,
                    key: 'package',
                    type: 'available',
                    args: {
                      'money': widget.money * giftNum,
                      'type': 'package',
                      'params': {
                        'room_ticket': 1,
                        'price': widget.money,
                        'rid': widget.rid,
                        'uids': [widget.uid].join(','),
                        'giftId': widget.giftId,
                        'giftNum': giftNum,
                        'version': 2,
                        'gift_type': 'normal',
                      }
                    },
                    onPayed: _onPayed,
                    onError: _onPayError,
                  );
                },
                child: Container(
                  width: 130,
                  height: 48,
                  alignment: AlignmentDirectional.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(28),
                    gradient: LinearGradient(
                      colors: R.color.mainBrandGradientColors,
                    ),
                  ),
                  child: Text(
                    '${K.sure}${K.room_send_gift}',
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  void _onPayed() {
    Navigator.of(context).pop(true);
  }

  void _onPayError(bool isErrorCatch) {}
}
