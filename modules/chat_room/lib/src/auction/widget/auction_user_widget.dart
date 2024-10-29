import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:chat_room/assets.dart';
import 'package:chat_room/k.dart';
import 'package:chat_room/chat_room.dart';
import 'package:chat_room/src/protobuf/generated/auction.pb.dart';

/// 拍卖人
class AuctionUserWidget extends StatelessWidget {
  final ChatRoomData room;
  final AuctionConfigMessage auctionData;

  const AuctionUserWidget(
      {Key? key, required this.room, required this.auctionData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = Util.width;
    // 拍卖位背景图的宽高
    double bgWidth = 135 / 375 * width;
    double bgHeight = 100 / 135 * bgWidth;

    AuctionStatus status = auctionData.status;
    RoomPosition pos1 = room.positions[room.auctionPosition]; // 拍卖位
    bool offline = pos1.uid == 0 &&
        (status == AuctionStatus.AUCTION || status == AuctionStatus.UPGRADE);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          alignment: AlignmentDirectional.center,
          children: [
            R.img(
              RoomAssets.chat_room$auction_blue_bg_webp,
              width: bgWidth,
              height: bgHeight,
              fit: BoxFit.fill,
              matchTextDirection: true,
            ),
            PositionedDirectional(
              start: 22.dp,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (status == AuctionStatus.UPGRADE)
                    Text(
                      Util.numberToSizeString(
                          auctionData.auctionUser.wishReceived),
                      style: const TextStyle(
                          fontSize: 16, color: Color(0xFFB5F9FF)),
                    ),
                  Stack(
                    alignment: Alignment.center,
                    clipBehavior: Clip.none,
                    children: [
                      GradientBorder(
                        borderGradient: const LinearGradient(
                            colors: [Color(0xFFF83600), Color(0xFFF9D423)]),
                        borderRadius: 26.dp,
                        borderWidth: 2.dp,
                        child: Padding(
                          padding: EdgeInsets.all(1.dp),
                          child: UserIcon(
                            room: room,
                            position: pos1,
                            size: 50.dp,
                            showOffline: offline,
                          ),
                        ),
                      ),
                      // 拍卖人离线
                      if (offline)
                        Container(
                          width: 52.dp,
                          height: 52.dp,
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.5),
                            shape: BoxShape.circle,
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            K.room_auction_offline,
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      PositionedDirectional(
                        bottom: 0,
                        child: Container(
                          width: 36.dp,
                          height: 14.dp,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7.dp),
                            gradient: const LinearGradient(
                              colors: [
                                Color(0xFFF84D00),
                                Color(0xFFFFB948),
                              ],
                            ),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            K.room_auction_user,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 9,
                              height: 1,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 2),
                    constraints: const BoxConstraints(
                      maxWidth: 60,
                    ),
                    child: Text(
                      Util.isStringEmpty(pos1.name)
                          ? K.room_wait_for_seated
                          : (pos1.name),
                      style: const TextStyle(
                        color: Color(0xFFFEFEFE),
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        if (status == AuctionStatus.UPGRADE &&
            Session.uid != auctionData.auctionUser.uid)
          (Session.uid == auctionData.defendUser.uid) // // 竞拍双方 仅看到对方 送欧气
              ? Padding(
                  padding: const EdgeInsetsDirectional.only(top: 3, start: 11),
                  child: GestureDetector(
                    onTap: () {
                      // 打赏给拍卖人
                      int uid = pos1.uid;
                      if (uid == 0) {
                        // 离线
                        uid = auctionData.auctionUser.uid;
                      }
                      Tracker.instance
                          .track(TrackEvent.auction_lucky_click, properties: {
                        'uid': Session.uid,
                        'to_uid': uid,
                        'relation_id': auctionData.commodity.cid,
                        'relation_name': auctionData.commodity.commodity,
                      });
                      IGiftManager giftManager = ComponentManager.instance
                          .getManager(ComponentManager.MANAGER_GIFT);
                      giftManager.showRoomAuctionBlessGiftPanel(
                        context,
                        rid: room.realRid,
                        uid: uid,
                        name: auctionData.auctionUser.name,
                        icon: auctionData.auctionUser.icon,
                      );
                    },
                    child: Container(
                      width: 90,
                      height: 28,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(RoomAssets
                              .chat_room$auction_auction_defend_bless_btn_webp),
                          fit: BoxFit.contain,
                        ),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        K.room_send_bless,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                )
              : Padding(
                  padding: const EdgeInsetsDirectional.only(top: 3, start: 11),
                  child: GestureDetector(
                    onTap: () {
                      // 打赏给拍卖人
                      int uid = pos1.uid;
                      if (uid == 0) {
                        // 离线
                        uid = auctionData.auctionUser.uid;
                      }
                      IGiftManager giftManager = ComponentManager.instance
                          .getManager(ComponentManager.MANAGER_GIFT);
                      giftManager.showRoomGiftPanel(context,
                          room: room, uid: uid);
                    },
                    child: Container(
                      width: 90,
                      height: 28,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                              RoomAssets.chat_room$auction_big_btn_webp),
                          fit: BoxFit.contain,
                        ),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        K.room_send_wishes,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                )
        else
          const SizedBox(height: 31),
      ],
    );
  }
}
