import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:chat_room/assets.dart';
import 'package:chat_room/src/auction/widget/auction_relation_tag.dart';
import 'package:chat_room/src/protobuf/generated/auction.pb.dart';

/// 名人堂item
class FameHallItem extends StatelessWidget {
  final RespAuctionRankItem item;

  FameHallItem({Key? key, required this.item}) : super(key: key);

  final IPersonalDataManager _manager = ComponentManager.instance
      .getManager(ComponentManager.MANAGER_PERSONALDATA);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        double width = constraints.maxWidth;
        double height = 116 / 172 * width;
        const double padding = 4;
        double w = (width - padding * 3) / 2;

        return Stack(
          children: [
            Container(
              width: width,
              height: height,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
              ),
              padding: const EdgeInsets.all(padding),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: CommonAvatar(
                          path: item.auctionUser.icon,
                          size: w,
                          borderRadius: const BorderRadiusDirectional.only(
                            topStart: Radius.circular(12),
                            topEnd: Radius.circular(3),
                            bottomStart: Radius.circular(12),
                            bottomEnd: Radius.circular(3),
                          ),
                          onTap: () {
                            _manager.openImageScreen(
                                context, item.auctionUser.uid);
                          },
                        ),
                      ),
                      const SizedBox(width: 4),
                      Expanded(
                        child: CommonAvatar(
                          path: item.defendUser.icon,
                          size: w,
                          borderRadius: const BorderRadiusDirectional.only(
                            topStart: Radius.circular(3),
                            topEnd: Radius.circular(12),
                            bottomStart: Radius.circular(3),
                            bottomEnd: Radius.circular(12),
                          ),
                          onTap: () {
                            _manager.openImageScreen(
                                context, item.defendUser.uid);
                          },
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.only(start: 14, end: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AuctionRelationTag(
                          name: item.relation,
                          level: item.level.value,
                        ),
                        if (showRankScoreByKey(auctionWorldKey))
                          Text(
                            Util.numberToSizeString(item.score),
                            style: const TextStyle(
                              color: Color(0xFFFF5F7D),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: 67.dp,
              height: 25.dp,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    const Color(0xFFFF67A8),
                    const Color(0xFFFFAB8F).withOpacity(0.8),
                  ],
                ),
                borderRadius: const BorderRadiusDirectional.only(
                  topStart: Radius.circular(12),
                  bottomEnd: Radius.circular(3),
                ),
              ),
              alignment: Alignment.center,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  R.img(
                    RoomAssets.chat_room$auction_ic_calendar_svg,
                    width: 9.dp,
                    height: 9.dp,
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.only(start: 4),
                    child: Text(
                      Utility.formatDateMonthDay(item.dateLine),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
