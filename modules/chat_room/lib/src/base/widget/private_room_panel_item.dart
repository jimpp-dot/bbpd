import 'package:chat_room/k.dart';
import 'package:shared/shared.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../protobuf/generated/nest.pb.dart';
import 'private_room_send_gift_panel.dart';

class PrivateRoomPanelItem extends StatelessWidget {
  final NestGsListItem data;
  final NestGiftCoupon? coupon;
  final double ratio;
  final isGiftSetting;
  final VoidCallback? refresh;
  final int? rid;

  const PrivateRoomPanelItem(
      {super.key,
      required this.data,
      this.coupon,
      required this.ratio,
      this.isGiftSetting = false,
      this.refresh,
      this.rid});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ratio * 109,
      height: ratio * (isGiftSetting ? 186 : 170),
      decoration: BoxDecoration(
        borderRadius: BorderRadiusDirectional.circular(12),
        color: Colors.white,
      ),
      padding: EdgeInsetsDirectional.only(
          start: ratio * 8, end: ratio * 8, top: ratio * 8),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Container(
                width: ratio * 20,
                height: ratio * 20,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: const Color(0xFFF6F7F9), width: 1),
                ),
                child: CommonAvatar(
                  path: Util.getUserIconUrl(data.gs.icon),
                  size: ratio * 18,
                  shape: BoxShape.circle,
                ),
              ),
              SizedBox(
                width: ratio * 5,
              ),
              Expanded(
                child: Text(
                  data.gs.name,
                  style: TextStyle(
                    fontSize: ratio * 11,
                    color: const Color(0xFF313131),
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          Container(
            margin:
                EdgeInsetsDirectional.only(top: ratio * 4, bottom: ratio * 8),
            color: const Color(0x19313131),
            height: 0.5,
          ),
          SizedBox(
            width: ratio * 60,
            height: ratio * 60,
            child: Stack(
              children: [
                Container(
                  width: ratio * 57,
                  height: ratio * 57,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0x0F313131),
                  ),
                  alignment: AlignmentDirectional.center,
                  child: CachedNetworkImage(
                    placeholder: const CupertinoActivityIndicator(),
                    imageUrl: getGiftUrl(),
                    width: ratio * 42,
                    height: ratio * 42,
                    fit: BoxFit.contain,
                  ),
                ),
                PositionedDirectional(
                  end: 0,
                  bottom: 0,
                  child: Container(
                    width: ratio * ((data.gift.giftNum) >= 10 ? 24 : 20),
                    height: ratio * ((data.gift.giftNum) >= 10 ? 24 : 20),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                      border: Border.all(
                          color: const Color(0x19313131), width: 0.5),
                    ),
                    alignment: AlignmentDirectional.center,
                    child: NumText(
                      'x${data.gift.giftNum}',
                      style: TextStyle(
                        fontSize: ratio * 11,
                        height: 1.0,
                        color: const Color(0x99313131),
                      ),
                      maxLines: 1,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: ratio * 4,
          ),
          Text(
            data.gift.giftName,
            style: TextStyle(
              fontSize: ratio * 12,
              fontWeight: FontWeight.w500,
              color: const Color(0xFF313131),
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          if (isGiftSetting) ...[
            SizedBox(
              height: ratio * 2,
            ),
            Text(
              '${data.gift.price}${MoneyConfig.moneyName4}',
              style: TextStyle(
                fontSize: ratio * 10,
                color: const Color(0x80313131),
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
          SizedBox(
            height: ratio * 8,
          ),
          GestureDetector(
            onTap: () async {
              onTap(context);
            },
            child: Container(
              width: ratio * 63,
              height: ratio * 32,
              decoration: BoxDecoration(
                borderRadius: BorderRadiusDirectional.circular(ratio * 16),
                gradient: LinearGradient(
                  begin: AlignmentDirectional.centerStart,
                  end: AlignmentDirectional.centerEnd,
                  colors: R.color.mainBrandGradientColors,
                ),
              ),
              alignment: AlignmentDirectional.center,
              child: Text(
                isGiftSetting == true
                    ? K.room_charge_gift
                    : K.room_profile_send_gift,
                style: const TextStyle(
                  fontSize: 13,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  onTap(BuildContext context) async {
    if (isGiftSetting == true) {
      /// 礼物替换
      IGiftManager manager =
          ComponentManager.instance.getManager(ComponentManager.MANAGER_GIFT);
      bool? change = await manager.openPrivateRoomGiftSelectPanel(
          context: context,
          giftId: data.gift.giftId,
          giftNum: data.gift.giftNum,
          uid: data.gs.uid,
          rid: rid ?? 0);
      if (change == true && refresh != null) {
        refresh!();
      }
    } else {
      /// 赠送礼物
      bool? suc = await PrivateRoomSendGiftPanel.show(
          context: context,
          uid: data.gs.uid,
          name: data.gs.name,
          icon: data.gs.icon,
          giftId: data.gift.giftId,
          giftNum: data.gift.giftNum,
          giftName: data.gift.giftName,
          giftIcon: data.gift.giftUrl,
          giftPrice: data.gift.price,
          coupon: coupon);

      if (suc == true && refresh != null) {
        refresh!();
      }
    }
  }

  String getGiftUrl() {
    return Util.validStr(data.gift.giftUrl)
        ? Util.parseIcon(data.gift.giftUrl)
        : Util.giftImgUrl(data.gift.giftId);
  }
}
