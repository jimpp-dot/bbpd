import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:chat_room/assets.dart';
import 'package:chat_room/k.dart';
import 'package:chat_room/src/auction/auction_util.dart';
import 'package:chat_room/src/auction/widget/auction_relation_tag.dart';
import 'package:chat_room/src/protobuf/generated/auction.pb.dart';

/// 今日榜、总榜item
class RanKItem extends StatelessWidget {
  final RespAuctionRankItem item;
  final int index;

  final IPersonalDataManager _manager = ComponentManager.instance
      .getManager(ComponentManager.MANAGER_PERSONALDATA);

  RanKItem({Key? key, required this.item, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return index == 0 ? _buildFirst(context) : _buildOther(context);
  }

  Widget _buildFirst(BuildContext context) {
    Duration leftTime = DateTime.fromMillisecondsSinceEpoch(item.endLine * 1000)
        .difference(DateTime.now())
        .abs();
    return Container(
      width: Util.width,
      height: 161 / 375 * Util.width,
      padding: EdgeInsetsDirectional.only(start: 44.dp, end: 44.dp),
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(RoomAssets.chat_room$auction_rank_first_bg_webp),
          fit: BoxFit.fill,
          matchTextDirection: true,
        ),
      ),
      alignment: AlignmentDirectional.center,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildFirstUser(context, item.auctionUser),
          Expanded(
            child: Padding(
              padding: EdgeInsetsDirectional.only(top: 10.dp),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  AuctionRelationTag(
                    name: item.relation,
                    level: item.level.value,
                    width: 70.dp,
                    height: 20.dp,
                  ),
                  if (showRankScoreByKey(auctionWorldKey))
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.only(top: 6, bottom: 3),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            Util.numberToSizeString(item.score),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              height: 1,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.only(start: 8),
                            child: Text(
                              K.room_auction_value,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                height: 1,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  Text(
                    leftTime.inDays > 0
                        ? K.room_expire_after_some_days(
                            [leftTime.inDays.toString()])
                        : K.room_expire_after_some_hours(
                            [leftTime.inHours.toString()]),
                    style: const TextStyle(
                      color: Color(0xCCFFFFFF),
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          ),
          _buildFirstUser(context, item.defendUser),
        ],
      ),
    );
  }

  Widget _buildFirstUser(BuildContext context, AuctionRankUserProfile user) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            CommonAvatar(
              path: user.icon,
              size: 56.dp,
              shape: BoxShape.circle,
              onTap: () {
                _manager.openImageScreen(context, user.uid);
              },
            ),
            IgnorePointer(
              child: R.img(
                AuctionUtil.getRelationHeader(item.level.value),
                width: 72.dp,
                height: 72.dp,
                fit: BoxFit.contain,
              ),
            ),
          ],
        ),
        Container(
          constraints: BoxConstraints(maxWidth: 80.dp),
          child: Text(
            user.name,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w500,
              height: 1,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            UserSexAndAgeWidget(
              sex: user.sex,
              age: user.age,
            ),
            UserPopularity(
              popularityLevel: user.popularity,
              padding: const EdgeInsetsDirectional.only(start: 2),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildOther(BuildContext context) {
    Duration leftTime = DateTime.fromMillisecondsSinceEpoch(item.endLine * 1000)
        .difference(DateTime.now())
        .abs();
    String bg = RoomAssets.chat_room$auction_rank_normal_bg_webp;
    if (index == 1) {
      bg = RoomAssets.chat_room$auction_rank_second_bg_webp; // 第二名
    } else if (index == 2) {
      bg = RoomAssets.chat_room$auction_rank_third_bg_webp; // 第三名
    }
    return Container(
      width: Util.width,
      height: 79 / 375 * Util.width,
      padding: EdgeInsetsDirectional.only(
        start: index >= 3 ? 25.dp : 42.dp,
        end: 24.dp,
        top: 2.dp,
      ),
      alignment: AlignmentDirectional.center,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(bg),
          fit: BoxFit.fill,
          matchTextDirection: true,
        ),
      ),
      child: Row(
        children: [
          if (index >= 3)
            SizedBox(
              width: 20.dp,
              child: NumText(
                '${index + 1}',
                style: TextStyle(
                  color: const Color(0x66202020),
                  fontSize: index >= 99
                      ? 10
                      : index >= 9
                          ? 16
                          : 20,
                ),
              ),
            ),
          _buildCombineIcons(context),
          // 两人的名字
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Flexible(
                      child: Text(
                        item.auctionUser.name,
                        style: TextStyle(
                          color: index >= 3
                              ? const Color(0xFF202020)
                              : Colors.white,
                          height: 1,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.only(start: 4),
                      child: UserSexWidget(sex: item.auctionUser.sex, size: 14),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                Row(
                  children: [
                    Flexible(
                      child: Text(
                        item.defendUser.name,
                        style: TextStyle(
                          color: index >= 3
                              ? const Color(0xFF202020)
                              : Colors.white,
                          height: 1,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.only(start: 4),
                      child: UserSexWidget(sex: item.defendUser.sex, size: 14),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              if (showRankScoreByKey(auctionWorldKey)) ...[
                Text(
                  Util.numberToSizeString(item.score),
                  style: TextStyle(
                    color: index >= 3 ? const Color(0xFFFF5F7D) : Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 6),
              ],
              Text(
                leftTime.inDays > 0
                    ? K.room_few_day([leftTime.inDays.toString()])
                    : K.room_few_hours([leftTime.inHours.toString()]),
                style: TextStyle(
                  color: index >= 3
                      ? const Color(0x80313131)
                      : Colors.white.withOpacity(0.8),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCombineIcons(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: AlignmentDirectional.center,
      children: [
        PositionedDirectional(
          start: 0,
          child: _buildSingleIcon(context, item.auctionUser),
        ),
        Padding(
          padding: EdgeInsetsDirectional.only(start: 40.dp),
          child: _buildSingleIcon(context, item.defendUser),
        ),
        PositionedDirectional(
          bottom: 0,
          child: AuctionRelationTag(
            name: item.relation,
            level: item.level.value,
            width: 65,
            height: 18,
          ),
        ),
      ],
    );
  }

  Widget _buildSingleIcon(BuildContext context, AuctionRankUserProfile user) {
    return Container(
      width: 62.dp,
      height: 62.dp,
      foregroundDecoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AuctionUtil.getRelationHeader(item.level.value)),
          fit: BoxFit.contain,
        ),
      ),
      alignment: Alignment.center,
      child: CommonAvatar(
        path: user.icon,
        size: 48.dp,
        shape: BoxShape.circle,
        sex: user.sex,
        onTap: () {
          _manager.openImageScreen(context, user.uid);
        },
      ),
    );
  }
}
