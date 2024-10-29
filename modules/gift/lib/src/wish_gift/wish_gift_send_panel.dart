import 'package:gift/k.dart';
import 'dart:ui';
import 'dart:math';

import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:gift/src/wish_gift/repo/wish_gift_repo.dart';
import 'package:chat_room/chat_room.dart';
import '../../assets.dart';
import '../widget/wish_edit_reward_words_widget.dart';
import '../widget/wish_invalid_countdown_widget.dart';
import '../widget/wish_reward_words_widget.dart';
import 'model/wish_gift_beans.dart';

class WishGiftSendPanel extends StatefulWidget {
  final ChatRoomData room;

  const WishGiftSendPanel({Key? key, required this.room}) : super(key: key);

  static Future show(BuildContext context, ChatRoomData room) {
    return displayModalBottomSheet(
        context: context,
        isBarrierDismissible: true,
        defineBarrierColor: Colors.transparent,
        maxHeightRatio: 0.5,
        builder: (BuildContext context) {
          return WishGiftSendPanel(
            room: room,
          );
        });
  }

  @override
  _WishGiftSendPanelState createState() => _WishGiftSendPanelState();
}

class _WishGiftSendPanelState extends BaseScreenState<WishGiftSendPanel> {
  double _progressWidth = 0.0;

  double _itemWidth = 0.0;

  WishGiftsData? _data;

  @override
  void initState() {
    super.initState();

    _itemWidth = (Util.width - 16 * 2 - 8 * 2) / 3;
    _progressWidth = _itemWidth - 24;

    _loadData();
  }

  void _loadData() async {
    WishGiftsResp resp = await WishGiftRepo.getWishGiftsData(widget.room.rid);
    if (resp.success == true) {
      _data = resp.data;
      if (_data == null || Util.isCollectionEmpty(_data?.gifts)) {
        setScreenEmpty(emptyMsgColor: Colors.white);
      } else {
        setScreenReady();
      }
    } else {
      setScreenError(errorMsg: resp.msg, errorMsgColor: Colors.white);
    }
  }

  @override
  void onTapErrorWidget() {
    super.onTapErrorWidget();
    _loadData();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: SingleChildScrollView(
        child: ClipRRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 16.0, sigmaY: 16.0),
            child: Container(
              padding:
                  EdgeInsetsDirectional.only(bottom: Util.iphoneXBottom + 12),
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Color(0xFF24184E), Color(0xFF120A28)],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter),
                  borderRadius: BorderRadiusDirectional.vertical(
                      top: Radius.circular(16))),
              child: Stack(
                children: [
                  R.img(Assets.gift_wish_box_bg_big_png,
                      width: Util.width,
                      height: Util.width * 0.46,
                      package: ComponentManager.MANAGER_GIFT),
                  Column(
                    children: [
                      const SizedBox(
                        height: 8,
                      ),
                      _buildTitleBar(),
                      WishInvalidCountdownWidget(
                          countdown: Util.parseInt(_data?.countdown)),
                      const SizedBox(height: 10),
                      Container(
                        height: 1,
                        color: Colors.white.withOpacity(0.1),
                      ),
                      WishRewardWorldsWidget(
                        rid: widget.room.rid,
                        topSenders: _data?.topSenders ?? [],
                        senderNum: _data?.senderNum ?? 0,
                      ),
                      WishEditRewardWordsWidget(
                        padding: const EdgeInsetsDirectional.only(
                            top: 12, bottom: 18, start: 16, end: 16),
                        rewardWords: _data?.rewardWords ?? '',
                      ),
                      Container(
                        constraints: const BoxConstraints(minHeight: 160),
                        child: buildStatusContent(),
                      ),
                      if (Util.validStr(_data?.achieveTips)) ...[
                        const SizedBox(height: 8),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Align(
                            alignment: AlignmentDirectional.center,
                            child: Text(
                              _data?.achieveTips ?? '',
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                  fontSize: 11, color: Color(0xFFFDA252)),
                            ),
                          ),
                        ),
                      ]
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTitleBar() {
    return SizedBox(
      height: 44,
      width: Util.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                K.gift_today_gift_wish,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),
              if (isScreenReady())
                Text('(${_data!.finishNum}/${_data!.gifts.length})',
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildGiftItem(WishGift wishGift) {
    double percent =
        wishGift.wishNum > 0 ? wishGift.incomeNum / wishGift.wishNum : 0;
    bool complete = percent >= 1;
    List<Color> bgColors = complete
        ? [const Color(0xFF241C40), const Color(0xFF1D1534)]
        : [const Color(0xFF391B63), const Color(0xFF281757)];

    return Stack(
      children: [
        Container(
          width: _itemWidth,
          padding: const EdgeInsetsDirectional.only(
              start: 12, end: 12, top: 8, bottom: 8),
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(12)),
              border:
                  Border.all(color: Colors.white.withOpacity(0.1), width: 0.5),
              gradient: LinearGradient(
                  colors: bgColors,
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter)),
          child: Column(
            children: [
              CachedNetworkImage(
                imageUrl:
                    Util.giftImgUrl(wishGift.giftId) + Util.getGiftUrlSuffix(),
                width: 72,
                height: 72,
                cachedWidth: 72.px,
                cachedHeight: 72.px,
              ),
              Text(
                wishGift.name ?? '',
                style: TextStyle(
                    fontSize: 13, color: Colors.white.withOpacity(0.6)),
              ),
              Text(
                '${wishGift.price}${MoneyConfig.moneyName}',
                style: TextStyle(
                    color: Colors.white.withOpacity(0.4), fontSize: 10),
              ),
              const SizedBox(
                height: 8,
              ),
              SizedBox(
                  height: 4,
                  child: Stack(
                    children: [
                      Container(
                        width: _progressWidth,
                        decoration: ShapeDecoration(
                            shape: const StadiumBorder(),
                            color: Colors.white.withOpacity(0.1)),
                      ),
                      Container(
                        width: _progressWidth * (min(1.0, percent)),
                        decoration: const ShapeDecoration(
                            shape: StadiumBorder(),
                            gradient: LinearGradient(colors: [
                              Color(0xFF9E6AFF),
                              Color(0xFFFF6AF7)
                            ])),
                      ),
                    ],
                  )),
              const SizedBox(
                height: 2,
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  NumText(
                    '${wishGift.incomeNum}',
                    style: const TextStyle(
                      fontSize: 13,
                      color: Color(0xFFC56AFF),
                      fontWeight: FontWeight.w800,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  NumText(
                    '/${wishGift.wishNum}',
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.white.withOpacity(0.6),
                      fontWeight: FontWeight.w800,
                      fontStyle: FontStyle.italic,
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 6,
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                  IGiftManager manager = ComponentManager.instance
                      .getManager(ComponentManager.MANAGER_GIFT);
                  manager.showRoomGiftPanel(context,
                      room: widget.room, defaultId: wishGift.giftId);
                },
                child: Container(
                  height: 28,
                  width: 66,
                  decoration: const ShapeDecoration(
                      shape: StadiumBorder(),
                      gradient: LinearGradient(
                          colors: [Color(0xFF6D5DFF), Color(0xFFC56AFF)])),
                  child: Center(
                    child: Text(
                      K.give_something,
                      style: const TextStyle(color: Colors.white, fontSize: 13),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        if (complete)
          PositionedDirectional(
              end: 0,
              top: 0,
              child: R.img(Assets.gift_complete_png,
                  width: 32,
                  height: 21,
                  package: ComponentManager.MANAGER_GIFT))
      ],
    );
  }

  @override
  PreferredSizeWidget? buildAppBar() {
    return null;
  }

  @override
  Widget buildContent() {
    List<Widget> children = [];

    for (int i = 0; i < _data!.gifts.length; i++) {
      children.add(_buildGiftItem(_data!.gifts[i]));
      if (i < _data!.gifts.length - 1) {
        children.add(const SizedBox(
          width: 8,
        ));
      }
    }

    return Padding(
      padding: const EdgeInsetsDirectional.only(start: 16, end: 16),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: children,
      ),
    );
  }
}
