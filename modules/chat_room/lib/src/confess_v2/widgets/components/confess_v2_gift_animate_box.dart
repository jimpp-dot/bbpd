import 'package:shared/shared.dart';
import 'package:chat_room/assets.dart';
import 'package:chat_room/src/confess_v2/confess_v2_util.dart';
import 'package:chat_room/src/confess_v2/pb/generated/confess_v2.pb.dart';
import 'package:flutter/material.dart';

/// 带解锁动效和选中的礼物组件
class ConfessV2GiftAnimateBox extends StatefulWidget {
  /// 当前展示的礼物
  final ConfessStage gift;

  /// 按解锁顺序的上一个礼物（如果当前是显示第1个，这个值也是第1个）
  final ConfessStage prevGift;

  final Function(ConfessStage gift, BuildContext) onTap;

  final bool isSelected;

  const ConfessV2GiftAnimateBox({
    super.key,
    required this.gift,
    required this.prevGift,
    this.isSelected = false,
    required this.onTap,
  });

  @override
  ConfessV2GiftAnimateBoxState createState() => ConfessV2GiftAnimateBoxState();
}

class ConfessV2GiftAnimateBoxState extends State<ConfessV2GiftAnimateBox>
    with TickerProviderStateMixin {
  final GlobalKey _giftIconKey = GlobalKey();

  /// 获取礼物图标的key
  GlobalKey get getGiftIconKey => _giftIconKey;

  @override
  Widget build(BuildContext context) {
    double width = 80.dp;
    double height = 104.dp;
    String bg;
    if (widget.isSelected) {
      bg = RoomAssets.chat_room$confess_v2_bg_gift_select_webp;
    } else if (widget.gift.unlocked) {
      bg = RoomAssets.chat_room$confess_v2_bg_gift_nor_webp;
    } else {
      bg = RoomAssets.chat_room$confess_v2_bg_gift_lock_webp;
    }
    return GestureDetector(
      onTap: () => widget.onTap(widget.gift, context),
      child: SizedBox(
        width: width,
        height: height,
        child: Stack(
          children: [
            R.img(bg, width: width, height: height),
            widget.gift.unlocked ? _buildContent(width) : _buildLock(width),
          ],
        ),
      ),
    );
  }

  Widget _buildContent(double width) {
    return Column(
      children: [
        SizedBox(height: 12.dp),
        CachedNetworkImage(
          key: _giftIconKey,
          imageUrl: ConfessV2Util.giftUrl(widget.gift.giftId),
          width: 44.dp,
          height: 44.dp,
          fit: BoxFit.cover,
        ),
        SizedBox(width: width, height: 4.dp),
        Text(widget.gift.name,
            style: TextStyle(
                fontSize: 12.dp,
                color: Colors.white,
                fontWeight: FontWeight.w600)),
        SizedBox(height: 2.dp),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            R.img(
              RoomAssets.chat_room$confess_v2_ic_diamond_webp,
              width: 12.dp,
              height: 12.dp,
            ),
            SizedBox(width: 2.dp),
            NumText('${widget.gift.price}',
                style: TextStyle(
                    fontSize: 10.dp,
                    color: Colors.white,
                    fontWeight: FontWeight.w500)),
          ],
        ),
      ],
    );
  }

  Widget _buildLock(double width) {
    String probabilityTxt = widget.gift.probabilityTxt;
    bool showProbability =
        Util.validStr(probabilityTxt) && widget.prevGift.unlocked;
    return Column(
      children: [
        SizedBox(height: showProbability ? 6.dp : 13.dp),
        R.img(
          RoomAssets.chat_room$confess_v2_ic_lock_webp,
          width: 44.dp,
          height: 44.dp,
        ),
        if (!showProbability) SizedBox(width: width, height: 4.dp),
        Text(widget.gift.name,
            style: TextStyle(
                fontSize: 12.dp,
                color: Colors.white,
                fontWeight: FontWeight.w600)),
        if (showProbability)
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.dp),
            child: Text(probabilityTxt,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 10.dp, color: Colors.white)),
          ),
      ],
    );
  }
}
