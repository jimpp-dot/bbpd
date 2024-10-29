import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gift/k.dart';
import 'package:shared/assets.dart';
import 'package:shared/k.dart' as BaseK;
import 'package:shared/shared.dart';

import '../../assets.dart';
import '../model/pb/slp_gift_extension.dart';

typedef OnGiftTaped = void Function(BbGiftPanelGift gift);

/// 礼物item
class SlpPageGiftItem extends StatefulWidget {
  final BbGiftPanelGift gift;
  final bool selected;
  final OnGiftTaped? onGiftTaped;
  final bool isInRoom;
  final bool isPrivilege;
  final String? selectImg;
  final Map<int, BbGiftPanelSpecialPlayItem>? specialPlayItemMap;
  final String exclusiveName; // xxx专属
  /// 甄选礼盒价格文案
  final String? randomBoxPriceStr;

  const SlpPageGiftItem({
    Key? key,
    required this.gift,
    this.selected = false,
    this.isInRoom = false,
    this.isPrivilege = false,
    this.onGiftTaped,
    this.selectImg,
    this.specialPlayItemMap,
    this.exclusiveName = '',
    this.randomBoxPriceStr,
  }) : super(key: key);

  @override
  _SlpPageGiftItemState createState() => _SlpPageGiftItemState();
}

class _SlpPageGiftItemState extends State<SlpPageGiftItem> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 800));
    _scaleAnimation = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(parent: _controller, curve: Curves.elasticOut));
    _controller.value = 1;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onGiftTaped(BbGiftPanelGift gift) {
    if (widget.onGiftTaped != null) {
      widget.onGiftTaped!(gift);
    }
    _controller.forward(from: 0);
  }

  @override
  Widget build(BuildContext context) {
    return _buildGiftItem(widget.gift);
  }

  Widget _buildGiftItem(BbGiftPanelGift gift) {
    String icon = (widget.specialPlayItemMap == null || widget.specialPlayItemMap![gift.id] == null)
        ? gift.giftIcon
        : gift.giftIconSpecialPlay(widget.specialPlayItemMap![gift.id]!);

    return GestureDetector(
      onTap: () => _onGiftTaped(gift),
      behavior: HitTestBehavior.opaque,
      child: Center(
        child: Stack(
          clipBehavior: Clip.none,
          fit: StackFit.expand,
          children: [
            Opacity(
              opacity: gift.isLocked ? 0.6 : 1.0,
              child: Stack(
                clipBehavior: Clip.none,
                fit: StackFit.expand,
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      ScaleTransition(
                        scale: _scaleAnimation,
                        child: CachedNetworkImage(
                          placeholder: const CupertinoActivityIndicator(),
                          imageUrl: icon + Util.getGiftUrlSuffix(),
                          width: 60,
                          height: 60,
                          cachedWidth: 60.px,
                          cachedHeight: 60.px,
                          fit: BoxFit.contain,
                        ),
                      ),
                      Text(
                        gift.name,
                        maxLines: 1,
                        style: TextStyle(
                          color: gift.isnaming > 0
                              ? R.color.thirdBrightColor
                              : (widget.isInRoom || darkMode ? Colors.white : R.color.mainTextColor),
                          fontSize: 12.0,
                        ),
                      ),
                      _renderPrice(gift, widget.selected),
                    ],
                  ),

                  /// 右上角：1.背包物品数量 2.DIY角标 3.贵族特权icon(仅特权面板) 4.觉醒icon(仅特权面板)
                  /// 优先级：优先展示DIY角标，非DIY礼物才展示特权Icon，3和4同级
                  _renderNumBadge(gift),
                  if (widget.gift.isDiyGift) _buildDiyTag(),
                  if (widget.isPrivilege && !widget.gift.isDiyGift) _buildPrivilegeAndAwakeIcon(gift),

                  ///左上角：1.礼物tag（如活动，上新） 2.觉醒icon(仅礼物面板)
                  ///优先级：2>1
                  if (gift.awakeInfo.icon.isEmpty) _renderGiftTags(gift),
                  if (!widget.isPrivilege && gift.awakeInfo.icon.isNotEmpty) _buildAwakeIcon(gift)
                ],
              ),
            ),
            _renderTopLeftLabel(gift),
            if (widget.selected)
              R.img(
                widget.selectImg ?? Assets.ic_gift_select_svg,
                package: ComponentManager.MANAGER_GIFT,
                fit: BoxFit.fill,
                color: const Color(0xFFD4FA00),
              ),
          ],
        ),
      ),
    );
  }

  /// 左上角图标
  Widget _renderTopLeftLabel(BbGiftPanelGift gift) {
    if (gift.isLocked) {
      return PositionedDirectional(
        start: 6,
        top: 6,
        child: R.img(
          BaseAssets.ic_lock_svg,
          width: 16,
          height: 16,
          package: ComponentManager.MANAGER_BASE_CORE,
          color: widget.isInRoom || darkMode ? null : R.color.mainTextColor.withOpacity(0.6),
        ),
      );
    }
    if (gift.gloryBanner.naming.isNotEmpty) {
      return PositionedDirectional(
        start: 6,
        top: 6,
        child: Container(
          height: 12,
          width: 48,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            gradient: const LinearGradient(colors: [Color(0xFFFF2E96), Color(0xFFFFA4EE)]),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 4),
          alignment: AlignmentDirectional.centerStart,
          child: MarqueeText(
            speed: 10,
            text: gift.gloryBanner.naming,
            style: const TextStyle(fontSize: 8, color: Colors.white, height: 1.1),
          ),
        ),
      );
    }
    if (widget.exclusiveName.isNotEmpty) {
      return PositionedDirectional(
        start: 14,
        top: 4,
        child: Container(
          width: 40,
          height: 12,
          decoration: const ShapeDecoration(
            gradient: LinearGradient(colors: [Color(0xFFC15DFF), Color(0xFF5A66FE)]),
            shape: StadiumBorder(),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 2),
          alignment: AlignmentDirectional.center,
          child: MarqueeText(
            speed: 10,
            text: widget.exclusiveName + BaseK.K.base_exclusive,
            style: const TextStyle(color: Colors.white, fontSize: 8),
          ),
        ),
      );
    }
    if (gift.corner.leftTop.isNotEmpty) {
      return PositionedDirectional(
        start: 8,
        top: 4,
        child: CachedNetworkImage(
          imageUrl: gift.corner.leftTop,
          height: 12,
          fit: BoxFit.fitHeight,
        ),
      );
    }
    return const SizedBox.shrink();
  }

  /// 礼物tab，已觉醒icon
  Widget _buildAwakeIcon(BbGiftPanelGift gift) {
    if (gift.awakeInfo.icon.isEmpty) {
      return const SizedBox.shrink();
    }
    return PositionedDirectional(
      start: 8,
      top: 4,
      child: CachedNetworkImage(
        imageUrl: gift.awakeInfo.icon,
        height: 12,
        fit: BoxFit.fitHeight,
      ),
    );
  }

  /// 特权tab，特权&已觉醒图标
  Widget _buildPrivilegeAndAwakeIcon(BbGiftPanelGift gift) {
    if (gift.privilegeIcon.isEmpty && gift.awakeInfo.icon.isEmpty) {
      return const SizedBox.shrink();
    }
    return PositionedDirectional(
      top: 2,
      end: 2,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (gift.privilegeIcon.isNotEmpty && (gift.isLocked || gift.privilege.grantStatusShow == 1))
            CachedNetworkImage(
              imageUrl: gift.privilegeIcon,
              height: 24,
              fit: BoxFit.cover,
            ),
          if (gift.awakeInfo.icon.isNotEmpty)
            CachedNetworkImage(
              imageUrl: gift.awakeInfo.icon,
              height: 24,
              fit: BoxFit.cover,
            ),
        ],
      ),
    );
  }

  /// 价格
  Widget _renderPrice(BbGiftPanelGift gift, bool selected) {
    /// 甄选礼盒展示服务端下发的价格文案
    if (Util.validStr(widget.randomBoxPriceStr)) {
      return Text(
        widget.randomBoxPriceStr!,
        style: TextStyle(
          color: widget.isInRoom || darkMode ? Colors.white60 : R.color.secondTextColor,
          fontSize: 10,
        ),
      );
    }

    String unit = '';

    int num = gift.cnum;
    int cid = gift.cid;
    String type = gift.ctype;

    if (selected && num > 0 && cid > 0 && ((type == 'gift' && gift.price > 0) || type == 'key' || type == 'coupon')) {
      String coin;
      String priceStr;
      if (type == 'gift' || type == 'key') {
        if (gift.giftType == 'coin') {
          unit = K.gift_coin_unit;
          coin = (max(0, min(1, 1 - num)) * gift.price).toStringAsFixed(0);
          priceStr = '${gift.price}';
        } else if (gift.giftType == 'bean') {
          unit = K.gift_gold_bean_unit;
          coin = (max(0, min(1, 1 - num)) * gift.price).toStringAsFixed(0);
          priceStr = '${gift.price}';
        } else {
          unit = MoneyConfig.moneyName;
          coin = MoneyConfig.moneyNum(Util.parseInt((max(0, min(1, 1 - num)) * gift.price)));
          priceStr = MoneyConfig.moneyNum(Util.parseInt((gift.price)));
        }
      } else {
        int money = gift.price - gift.ductionMoney;
        if (gift.giftType == 'coin') {
          unit = K.gift_coin_unit;
          coin = '$money';
          priceStr = '${gift.price}';
        } else if (gift.giftType == 'bean') {
          unit = K.gift_gold_bean_unit;
          coin = '$money';
          priceStr = '${gift.price}';
        } else {
          unit = MoneyConfig.moneyName;
          coin = MoneyConfig.moneyNum(money);
          priceStr = MoneyConfig.moneyNum(gift.price);
        }
      }
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsetsDirectional.only(start: 2.0),
            child: Text(
              "$coin$unit",
              style: TextStyle(
                color: widget.isInRoom || darkMode ? Colors.white60 : R.color.secondTextColor,
                fontSize: 10,
              ),
            ),
          ),
          Text(
            "$priceStr$unit",
            style: TextStyle(
              color: widget.isInRoom || darkMode ? Colors.white60 : R.color.secondTextColor,
              fontSize: 10,
              decoration: TextDecoration.lineThrough,
              decorationColor: widget.isInRoom || darkMode ? Colors.white60 : R.color.secondTextColor,
            ),
          )
        ],
      );
    }

    String priceStr;
    // 金币礼物单位为金
    if (gift.giftType == 'coin') {
      unit = K.gift_coin_unit;
      priceStr = '${gift.price}';
    } else if (gift.giftType == 'bean') {
      unit = K.gift_gold_bean_unit;
      priceStr = '${gift.price}';
    } else {
      unit = MoneyConfig.moneyName;
      priceStr = MoneyConfig.moneyNum(Util.parseInt(gift.price));
    }

    // 礼物面板玩法Tab，表白玩法不显示"0钻"  礼物猜猜乐也同理
    if (gift.category == 'ad' ||
        gift.category == 'ad_v2' ||
        gift.category == 'sweet_album' ||
        gift.category == 'guess_gift' ||
        gift.category == 'horn' ||
        gift.category == 'impress_tag' ||
        gift.category == 'graffiti') {
      unit = '';
      priceStr = '';
    }

    return Text(
      "$priceStr$unit",
      style: TextStyle(
        color: widget.isInRoom || darkMode ? Colors.white60 : R.color.secondTextColor,
        fontSize: 10,
      ),
    );
  }

  /// 右上角背包物品数量角标
  Widget _renderNumBadge(BbGiftPanelGift gift) {
    if (gift.isLocked) return const SizedBox.shrink();
    int cid = gift.cid;
    int num = gift.cnum;
    String type = gift.ctype;
    String numStr = num > 999 ? '999+' : num.toString();

    TextStyle textStyle = const TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.w600);
    if (cid > 0 && (type == 'gift' || type == 'key' || type == 'pub_drink') && num > 0) {
      // 数量
      return PositionedDirectional(
        end: 5,
        top: 5,
        child: Container(
          height: 16,
          width: 26,
          alignment: AlignmentDirectional.center,
          decoration: BoxDecoration(
            color: R.color.thirdBrightColor,
            borderRadius: BorderRadius.circular(8.5),
          ),
          child: Text(
            numStr,
            style: textStyle,
          ),
        ),
      );
    } else if (cid > 0 && type == 'coupon') {
      // 优惠券
      return PositionedDirectional(
        end: 5,
        top: 5,
        child: Coupon(
          color: R.color.thirdBrightColor,
          child: Container(
            width: 24,
            height: 12,
            alignment: Alignment.center,
            child: Text(
              numStr,
              style: const TextStyle(
                fontSize: 9.0,
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      );
    }
    return const SizedBox.shrink();
  }

  /// 左上角礼物标签（活动等）
  Widget _renderGiftTags(BbGiftPanelGift gift) {
    if (gift.tagList.isEmpty || gift.isLocked) {
      return const SizedBox.shrink();
    }
    // 礼物标签
    int maxNum = 2;
    if (widget.isPrivilege) {
      maxNum = 1;
    }

    List<Widget> icons = gift.tagList.take(min(maxNum, gift.tagList.length)).map((e) => _buildGiftTag(e)).toList();

    return PositionedDirectional(
      start: 8,
      top: 4,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: icons,
      ),
    );
  }

  Widget _buildGiftTag(BbGiftPanelTagList tag) {
    if (tag.icon.isEmpty) return const SizedBox.shrink();
    return Padding(
      padding: const EdgeInsetsDirectional.only(end: 2),
      child: CachedNetworkImage(
        imageUrl: tag.icon,
        height: 12,
        fit: BoxFit.fitHeight,
      ),
    );
  }

  Widget _buildDiyTag() {
    return PositionedDirectional(
      end: 5,
      top: 5,
      child: Container(
        height: 12,
        width: 24,
        alignment: AlignmentDirectional.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7),
          gradient: const LinearGradient(
            colors: [Color(0xFF6980FE), Color(0xFFCE41E6)],
            begin: AlignmentDirectional.centerStart,
            end: AlignmentDirectional.centerEnd,
          ),
        ),
        child: const Text(
          'DIY',
          style: TextStyle(fontSize: 8, fontWeight: FontWeight.w500, color: Colors.white),
        ),
      ),
    );
  }
}
