import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:personaldata/assets.dart';
import 'package:personaldata/k.dart';

/// 快捷礼物
class RoomUserProfileQuickGiftWidget extends StatelessWidget {
  final int uid;
  final List<giftInfo> gifts;

  const RoomUserProfileQuickGiftWidget(
      {super.key, required this.uid, required this.gifts});

  IRoomManager get _roomManager {
    return ComponentManager.instance
        .getManager(ComponentManager.MANAGER_BASE_ROOM);
  }

  int get _userPosition {
    return _roomManager.getPositionByUid(uid) ?? -1;
  }

  @override
  Widget build(BuildContext context) {
    return _buildQuickGift();
  }

  ///快捷送礼
  Widget _buildQuickGift() {
    return Container(
      height: 195,
      margin: const EdgeInsetsDirectional.only(
          start: 16, end: 16, top: 10, bottom: 10),
      decoration: BoxDecoration(
          image: DecorationImage(
        image: AssetImage(R.imagePath('personaldata_room_card_gift_bg.webp',
            package: ComponentManager.MANAGER_PERSONALDATA)),
        fit: BoxFit.fill,
      )),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Text(K.personaldata_room_user_quick_gift_title,
                style: const TextStyle(
                    fontSize: 13,
                    color: Color(0xFF8F51FF),
                    fontWeight: FontWeight.w500)),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10, left: 12, right: 12),
            child: SizedBox(
              width: Util.width - 48,
              height: 142,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.zero,
                itemCount: gifts.length,
                itemBuilder: (context, index) {
                  giftInfo gift = gifts[index];
                  return _buildInteractGiftItem(context, gift);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInteractGiftItem(BuildContext context, giftInfo gift) {
    String giftImg = gift.icon.isNotEmpty
        ? Util.parseIcon(gift.icon)
        : Util.giftImgUrl(gift.id);
    // 是否是组合礼物，组合礼物需要单独处理
    bool isCombineGift = Util.parseBool(gift.hasCombineGift());
    double itemWidth = (Util.width - 68) / 3;
    double giftWidth = (itemWidth - 20) / 2;
    return SizedBox(
      width: itemWidth + 10,
      height: 142,
      child: Row(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                gradient: const LinearGradient(
                  colors: [
                    Color(0xFF66A9FF),
                    Color(0xFFBE67FF),
                    Color(0xFFFF836A)
                  ],
                  begin: AlignmentDirectional.topStart,
                  end: AlignmentDirectional.bottomEnd,
                ),
              ),
              child: Padding(
                padding: const EdgeInsetsDirectional.only(
                    start: 6, end: 6, top: 10, bottom: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            isCombineGift
                                ? gift.combineGift.combineName
                                : gift.name,
                            style: const TextStyle(
                                fontSize: 12,
                                color: Colors.white,
                                fontWeight: FontWeight.w500),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        if (isCombineGift)
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(2.0),
                              gradient: const LinearGradient(colors: [
                                Color(0xFFEC6080),
                                Color(0xFFFE7A33)
                              ]),
                            ),
                            width: 24,
                            height: 12,
                            alignment: AlignmentDirectional.center,
                            child: Text(
                              gift.combineGift.combineType == 2
                                  ? R.string('gift_all_mic')
                                  : R.string('gift_one_mic'),
                              style: const TextStyle(
                                color: Color(0xFFFEFEFE),
                                fontSize: 8,
                                fontWeight: FontWeight.w500,
                                height: 1.1,
                              ),
                            ),
                          ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      isCombineGift ? gift.combineGift.combineDesc : gift.desc,
                      style: const TextStyle(
                          fontSize: 8,
                          color: Colors.white,
                          overflow: TextOverflow.ellipsis),
                      maxLines: 2,
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CachedNetworkImage(
                            imageUrl: isCombineGift
                                ? Util.giftImgUrl(gift.combineGift.giftA)
                                : giftImg,
                            width: isCombineGift ? giftWidth : 60,
                            height: isCombineGift ? giftWidth : 60,
                            fit: BoxFit.fill,
                          ),
                          if (isCombineGift)
                            CachedNetworkImage(
                              imageUrl: Util.giftImgUrl(gift.combineGift.giftB),
                              width: giftWidth,
                              height: giftWidth,
                              fit: BoxFit.fill,
                            ),
                        ],
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          R.img(Assets.personaldata$credit_score_diamond_webp,
                              package: ComponentManager.MANAGER_PERSONALDATA,
                              height: 10,
                              fit: BoxFit.fitHeight),
                          Text(
                              isCombineGift
                                  ? gift.combineGift.combineMoney.toString()
                                  : gift.price.toString(),
                              style: const TextStyle(
                                  fontSize: 10, color: Colors.white))
                        ],
                      ),
                    ),
                    Container(
                      height: 28,
                      alignment: Alignment.center,
                      child: isCombineGift
                          ? GestureDetector(
                              onTap: () {
                                final IGiftManager giftManager =
                                    ComponentManager.instance.getManager(
                                        ComponentManager.MANAGER_GIFT);
                                giftManager.openCombineGiftDialog(
                                    context: context,
                                    combineId: gift.combineGift.combineId,
                                    combineName: gift.combineGift.combineName,
                                    combineType: gift.combineGift.combineType);
                              },
                              child: Container(
                                width: 56,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(14),
                                    border: Border.all(
                                        width: .5, color: Colors.white),
                                    gradient: const LinearGradient(
                                        colors: [
                                          Color(0xFFFFBD4E),
                                          Color(0xFFFFE363)
                                        ],
                                        begin: AlignmentDirectional.centerEnd,
                                        end: AlignmentDirectional.centerStart)),
                                child: Text(K.personal_gift_wall_send,
                                    style: const TextStyle(
                                        fontSize: 13,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500)),
                              ),
                            )
                          : _roomManager.singleGiftButton(
                              'room_user',
                              gift.id,
                              gift.name,
                              gift.type,
                              gift.price,
                              [_userPosition],
                              -1,
                              [uid],
                              (bool success) {
                                Tracker.instance.track(TrackEvent.click,
                                    properties: {
                                      'click_page': 'personal_card_inter_gift'
                                    });
                              },
                              Container(
                                width: 56,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(14),
                                  border: Border.all(
                                      width: .5, color: Colors.white),
                                  gradient: const LinearGradient(
                                    colors: [
                                      Color(0xFFFFBD4E),
                                      Color(0xFFFFE363)
                                    ],
                                    begin: AlignmentDirectional.centerEnd,
                                    end: AlignmentDirectional.centerStart,
                                  ),
                                ),
                                child: Text(
                                  K.personal_gift_wall_send,
                                  style: const TextStyle(
                                    fontSize: 13,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(width: 10)
        ],
      ),
    );
  }
}
