import 'package:chat_room/k.dart';
import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:chat_room/assets.dart';
import 'package:chat_room/chat_room.dart';
import 'package:chat_room/src/protobuf/generated/auction.pb.dart';

/// 竞拍人
class BidderWidget extends StatelessWidget {
  final ChatRoomData room;
  final AuctionConfigMessage auctionData;

  const BidderWidget({Key? key, required this.room, required this.auctionData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = Util.width;
    // 拍卖位背景图的宽高
    double bgWidth = 135 / 375 * width;
    double bgHeight = 100 / 135 * bgWidth;

    AuctionStatus? status = auctionData.status;
    AuctionUser? top1;
    if (status == AuctionStatus.AUCTION) {
      top1 = auctionData.rank.isNotEmpty ? auctionData.rank.first : null;
    } else if (status == AuctionStatus.UPGRADE) {
      top1 = auctionData.defendUser;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Stack(
          clipBehavior: Clip.none,
          alignment: AlignmentDirectional.center,
          children: [
            R.img(
              RoomAssets.chat_room$auction_red_bg_webp,
              width: bgWidth,
              height: bgHeight,
              fit: BoxFit.fill,
              matchTextDirection: true,
            ),
            PositionedDirectional(
              end: 22.dp,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (status == AuctionStatus.UPGRADE && top1 != null)
                    Text(
                      Util.numberToSizeString(top1.wishReceived),
                      style: const TextStyle(
                          fontSize: 16, color: Color(0xFFFFEBEF)),
                    ),
                  Stack(
                    alignment: Alignment.center,
                    clipBehavior: Clip.none,
                    children: [
                      if (top1 != null)
                        GradientBorder(
                          borderGradient: const LinearGradient(
                              colors: [Color(0xFFFF29DE), Color(0xFFA722FF)]),
                          borderRadius: 26.dp,
                          borderWidth: 2.dp,
                          child: Padding(
                            padding: EdgeInsets.all(2.dp),
                            child: CommonAvatar(
                              path: top1.icon,
                              shape: BoxShape.circle,
                              size: 49.dp,
                            ),
                          ),
                        )
                      else
                        ClipOval(
                          child: R.img(
                            RoomAssets.chat_room$auction_ic_empty_seat_svg,
                            width: 52.dp,
                            height: 52.dp,
                            fit: BoxFit.contain,
                          ),
                        ),
                      if (status == AuctionStatus.UPGRADE && top1 != null)
                        PositionedDirectional(
                          bottom: 0,
                          child: Container(
                            width: 36.dp,
                            height: 14.dp,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7.dp),
                              gradient: const LinearGradient(
                                colors: [
                                  Color(0xFFFF29DE),
                                  Color(0xFFA722FF),
                                ],
                                begin: AlignmentDirectional.topCenter,
                                end: AlignmentDirectional.bottomCenter,
                              ),
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              K.room_bid_winner,
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
                      top1?.name ?? K.room_wait_for_seated,
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
            if (status == AuctionStatus.AUCTION && top1 != null) ...[
              // 最高出价
              PositionedDirectional(
                top: -4.dp,
                end: 17.dp,
                child: R.img(
                  RoomAssets.chat_room$auction_ic_highest_price_webp,
                  width: 60.dp,
                  height: 17.dp,
                  fit: BoxFit.contain,
                ),
              ),
              // 出价祝福值
              PositionedDirectional(
                start: 15.dp,
                child: Text(
                  Util.numberToSizeString(top1.wishSent),
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              // 底部前三名
              PositionedDirectional(
                bottom: -20.dp,
                end: 8.dp,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildTop3Bidder(
                        auctionData.rank.isNotEmpty
                            ? auctionData.rank[0]
                            : null,
                        1),
                    const SizedBox(width: 2),
                    _buildTop3Bidder(
                        auctionData.rank.length >= 2
                            ? auctionData.rank[1]
                            : null,
                        2),
                    const SizedBox(width: 2),
                    _buildTop3Bidder(
                        auctionData.rank.length >= 3
                            ? auctionData.rank[2]
                            : null,
                        3),
                  ],
                ),
              ),
            ],
          ],
        ),
        if (status == AuctionStatus.UPGRADE &&
            Session.uid != auctionData.defendUser.uid)
          (Session.uid == auctionData.auctionUser.uid) // 竞拍双方 仅看到对方 送欧气
              ? Padding(
                  padding: const EdgeInsetsDirectional.only(top: 3, end: 11),
                  child: GestureDetector(
                    onTap: () {
                      Tracker.instance
                          .track(TrackEvent.auction_lucky_click, properties: {
                        'uid': Session.uid,
                        'to_uid': auctionData.defendUser.uid,
                        'relation_id': auctionData.commodity.cid,
                        'relation_name': auctionData.commodity.commodity,
                      });
                      IGiftManager giftManager = ComponentManager.instance
                          .getManager(ComponentManager.MANAGER_GIFT);
                      giftManager.showRoomAuctionBlessGiftPanel(
                        context,
                        rid: room.realRid,
                        uid: auctionData.defendUser.uid,
                        name: auctionData.defendUser.name,
                        icon: auctionData.defendUser.icon,
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
                  padding: const EdgeInsetsDirectional.only(top: 3, end: 11),
                  child: GestureDetector(
                    onTap: () {
                      IGiftManager giftManager = ComponentManager.instance
                          .getManager(ComponentManager.MANAGER_GIFT);
                      giftManager.showRoomGiftPanel(context,
                          room: room, uid: top1?.uid ?? 0);
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

  /// 前三竞拍者
  Widget _buildTop3Bidder(AuctionUser? bidder, int index) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Stack(
          alignment: AlignmentDirectional.center,
          children: [
            if (bidder == null)
              R.img(
                RoomAssets.chat_room$auction_ic_empty_seat_svg,
                width: 24,
                height: 24,
              )
            else
              CommonAvatar(
                path: bidder.icon,
                size: 24,
                shape: BoxShape.circle,
              ),
            R.img(
              RoomAssets.chat_room$auction_ic_topx_crown_webp(index),
              width: 30,
              height: 30,
              fit: BoxFit.contain,
            ),
          ],
        ),
        Text(
          bidder == null ? '' : Util.numberToSizeString(bidder.wishSent),
          style: const TextStyle(
            fontSize: 8,
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
