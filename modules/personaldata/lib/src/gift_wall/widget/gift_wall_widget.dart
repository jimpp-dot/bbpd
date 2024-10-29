/*
 *
 *  Created by yao.qi on 2022/9/7 上午11:30
 *  Copyright (c) 2019 - 2022 . All rights reserved.
 *  Last modified 2022/9/7 上午11:28
 *
 */

import 'package:shared/shared.dart';
import 'package:pulse_log/pulse_log.dart';
import 'package:chat_room/chat_room.dart';
import 'package:flutter/material.dart';
import 'package:personaldata/k.dart';

import '../../theme/personaldata_themes.dart';
import '../page/gift_wall_intimacy_screen.dart';

class GiftWallWidget extends StatefulWidget {
  final List<HomeProfileGift>? gifts;
  final int uid;
  final HomeProfileUserGiftWall? giftWall;
  final VoidCallback? giftChange;

  const GiftWallWidget(
      {Key? key, this.gifts, this.uid = 0, this.giftWall, this.giftChange})
      : super(key: key);

  @override
  State<GiftWallWidget> createState() => _GiftWallWidgetState();
}

class _GiftWallWidgetState extends State<GiftWallWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsetsDirectional.only(start: 16, end: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Text(
                  K.gift_wall,
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: R.colors.mainTextColor),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          GiftWallBannerWidget(
            uid: widget.uid,
            giftWall: widget.giftWall,
            giftChange: widget.giftChange,
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}

class GiftWallBannerWidget extends StatefulWidget {
  final int uid;
  final HomeProfileUserGiftWall? giftWall;
  final VoidCallback? giftChange;
  final ChatRoomData? room;

  const GiftWallBannerWidget(
      {Key? key, this.giftWall, this.uid = 0, this.giftChange, this.room})
      : super(key: key);

  @override
  State<GiftWallBannerWidget> createState() => _GiftWallBannerWidgetState();
}

class _GiftWallBannerWidgetState extends State<GiftWallBannerWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // 跳转到礼物墙页面
        if (widget.room != null) {
          PulseLog.instance.event('click_event', properties: {
            'click_tag':
                'personal_gift_wall_${widget.uid}_roomId_${widget.room?.rid ?? 0}',
          });
          GiftWallIntimacyScreen.showBottomSheet(
              context, widget.uid, widget.room);
        } else {
          PulseLog.instance.event('click_event', properties: {
            'click_tag': 'personal_gift_wall_${widget.uid}',
          });
          GiftWallIntimacyScreen.show(context, widget.uid, widget.giftChange);
        }
      },
      child: _buildContent(),
    );
  }

  Widget _buildContent() {
    String name = widget.giftWall?.levelName ?? '';
    int total = widget.giftWall?.giftNum ?? 0;
    String icon = widget.giftWall?.levelIconBorder ?? '';
    int level = widget.giftWall?.level ?? 0;

    Log.d('icon: $icon, name: $name, total: $total, level: $level');
    return Rext.themeCardContainer(
      height: 70,
      darkBgColors: [const Color(0xFF27254A), const Color(0xFF272334)],
      padding: const EdgeInsetsDirectional.only(
          start: 6, end: 12, top: 6, bottom: 6),
      cornerRadius: 16,
      child: Row(
        children: [
          Stack(
            alignment: AlignmentDirectional.center,
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  color: const Color(0xFF1D60DD).withOpacity(0.1),
                ),
                child: Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    border: Border.all(
                        color: const Color(0xFF2ECEFE).withOpacity(0.16),
                        width: 0.5),
                  ),
                ),
              ),
              CachedNetworkImage(
                imageUrl: Util.parseIcon(icon),
                width: 64,
                height: 64,
              ),
            ],
          ),
          const SizedBox(
            width: 2,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Text(
                    name,
                    style: TextStyle(
                        fontSize: 11,
                        color: R.colors.mainTextColor,
                        fontWeight: FontWeight.w500),
                  ),
                  Container(
                    width: 2,
                    height: 2,
                    margin: const EdgeInsetsDirectional.only(start: 4, end: 4),
                    decoration: ShapeDecoration(
                        shape: const StadiumBorder(),
                        color: R.colors.mainTextColor),
                  ),
                  Text(
                    '$total',
                    style: TextStyle(
                        fontSize: 11,
                        color: R.colors.mainTextColor,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              const SizedBox(
                height: 6,
              ),
              _buildMedalRow(),
            ],
          ),
          const Spacer(),
          R.img(
            'ic_next.svg',
            width: 16,
            height: 16,
            color: R.colors.thirdTextColor,
            package: ComponentManager.MANAGER_PROFILE,
          ),
        ],
      ),
    );
  }

  Widget _buildMedalRow() {
    int goldNum = widget.giftWall?.goldNum ?? 0;
    int silverNum = widget.giftWall?.silverNum ?? 0;
    int bronzeNum = widget.giftWall?.copperNum ?? 0;
    return Row(
      children: [
        _buildMedalItem('mate/gift_wall/ic_medal_gold.webp',
            K.personal_gift_wall_medal_gold, goldNum, true),
        _buildMedalItem('mate/gift_wall/ic_medal_silver.webp',
            K.personal_gift_wall_medal_silver, silverNum, true),
        _buildMedalItem('mate/gift_wall/ic_medal_bronze.webp',
            K.personal_gift_wall_medal_bronze, bronzeNum, false),
      ],
    );
  }

  Widget _buildMedalItem(String path, String medal, int num, bool showSpace) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        R.img(path,
            width: 16,
            height: 16,
            package: ComponentManager.MANAGER_PERSONALDATA),
        const SizedBox(width: 2),
        Text(
          medal ?? '',
          style: TextStyle(
            fontSize: 13,
            color: PersonaldataR.colors.giftWallColor,
          ),
        ),
        Text(
          '$num',
          style: TextStyle(
              fontSize: 13,
              color: PersonaldataR.colors.giftWallColor,
              fontWeight: FontWeight.w500),
        ),
        if (showSpace) const SizedBox(width: 15),
      ],
    );
  }
}
