import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:rank/assets.dart';
import 'package:rank/src/model/entity/gift_rank_beans.dart';
import 'package:rank/src/model/pb/generated/awake_rank.pb.dart';

class GiftRankAwakeWidget extends StatelessWidget {
  final GiftRankType rankType;
  final List<AwakeTimeRankRsp_Data_Item> ranks;
  final PageRefer refer;
  const GiftRankAwakeWidget(
      {super.key,
      required this.rankType,
      required this.ranks,
      required this.refer});

  @override
  Widget build(BuildContext context) {
    if (ranks.isEmpty) {
      return const SizedBox.shrink();
    }
    return Container(
      padding: const EdgeInsetsDirectional.only(top: 8, bottom: 1),
      color: const Color(0xffD670FF),
      alignment: Alignment.center,
      child: Stack(
        children: [
          R.img(Assets.rank$gift_awake_bg_webp,
              width: Util.width - 32.dp, fit: BoxFit.fitWidth),
          Positioned.fill(
            child: Padding(
              padding:
                  const EdgeInsetsDirectional.only(start: 8, end: 8, top: 18),
              child: Row(
                children: [
                  buildItemWidget(context, 0, ranks[0]),
                  const SizedBox(
                    width: 8,
                  ),
                  ranks.length > 1
                      ? buildItemWidget(context, 1, ranks[1])
                      : SizedBox(
                          width: (Util.width - 64.dp) / 3,
                        ),
                  const SizedBox(
                    width: 8,
                  ),
                  ranks.length > 2
                      ? buildItemWidget(context, 2, ranks[2])
                      : SizedBox(
                          width: (Util.width - 64.dp) / 3,
                        ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildItemWidget(
      BuildContext context, int index, AwakeTimeRankRsp_Data_Item rankItem) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        SizedBox(
          width: (Util.width - 64.dp) / 3,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              GestureDetector(
                onTap: () {
                  IPersonalDataManager personalDataManager = ComponentManager
                      .instance
                      .getManager(ComponentManager.MANAGER_PERSONALDATA);
                  personalDataManager.openImageScreen(context, rankItem.uid,
                      refer: refer);
                },
                child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: const Color(0xffFEF4C1),
                    ),
                    alignment: Alignment.center,
                    child: CommonAvatar(
                      path: rankItem.icon,
                      size: 38,
                      shape: BoxShape.circle,
                    )),
              ),
              const SizedBox(
                width: 2,
              ),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      rankItem.name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.w500),
                    ),
                    GiftKingOrStarWithGiftNameTag(
                      width: 66,
                      height: 28,
                      fontSize: 10,
                      name: rankItem.giftName,
                      icon: rankItem.background,
                      color: Util.validStr(rankItem.background)
                          ? Colors.white
                          : R.color.mainTextColor.withOpacity(0.4),
                      alignment: Util.validStr(rankItem.background)
                          ? AlignmentDirectional.center
                          : AlignmentDirectional.centerStart,
                      awakeGift: true,
                      iconFit: BoxFit.contain,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        PositionedDirectional(
          start: -6,
          top: -6,
          child: R.img(
              index == 0
                  ? Assets.rank$gift_awake_first_webp
                  : (index == 1
                      ? Assets.rank$gift_awake_second_webp
                      : Assets.rank$gift_awake_third_webp),
              width: 28.dp,
              height: 28),
        ),
      ],
    );
  }
}
