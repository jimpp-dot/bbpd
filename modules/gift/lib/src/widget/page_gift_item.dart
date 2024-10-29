import 'dart:math';

import 'package:shared/assets.dart';
import 'package:shared/shared.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gift/k.dart';

import '../../assets.dart';

typedef OnGiftTaped = void Function(Gift gift);

/// 礼物item
class PageGiftItem extends StatefulWidget {
  final Gift? gift;
  final bool selected;
  final OnGiftTaped? onGiftTaped;
  final bool isInRoom;
  final bool isPrivilege;
  final bool isBox;
  final bool isPubDrink;
  final String? selectImg;

  const PageGiftItem({
    Key? key,
    this.gift,
    this.selected = false,
    this.isInRoom = false,
    this.isPrivilege = false,
    this.isBox = false,
    this.isPubDrink = false,
    this.onGiftTaped,
    this.selectImg,
  }) : super(key: key);

  @override
  _PageGiftItemState createState() => _PageGiftItemState();
}

class _PageGiftItemState extends State<PageGiftItem>
    with SingleTickerProviderStateMixin {
  AnimationController? _controller;
  Animation? _scaleAnimation;

  double _scale = 1.0;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 800))
      ..addListener(() {
        if (mounted) setState(() {});
      });
    _scaleAnimation = Tween<double>(begin: 0, end: 1).animate(
        CurvedAnimation(parent: _controller!, curve: Curves.elasticOut));
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _buildGiftItem(widget.gift);
  }

  _onGiftTaped(Gift gift) {
    if (widget.onGiftTaped != null) {
      widget.onGiftTaped!(gift);
    }

    _controller!.forward(from: 0);
    if (mounted) setState(() {});
  }

  Widget _buildGiftItem(Gift? gift) {
    if (_controller?.isAnimating ?? false) {
      _scale = _scaleAnimation?.value ?? 1.0;
    } else {
      _scale = 1;
    }

    return GestureDetector(
      onTap: () {
        if (gift != null) _onGiftTaped(gift);
      },
      child: Container(
        alignment: Alignment.center,
        child: Stack(
          clipBehavior: Clip.none,
          fit: StackFit.expand,
          children: [
            Opacity(
              opacity: gift?.isLocked ?? false ? 0.6 : 1.0,
              child: Stack(
                clipBehavior: Clip.none,
                fit: StackFit.expand,
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Transform.scale(
                        scale: _scale,
                        child: CachedNetworkImage(
                          placeholder: const CupertinoActivityIndicator(),
                          imageUrl: gift?.giftIcon ?? '',
                          width: 60,
                          height: 60,
                          fit: BoxFit.contain,
                        ),
                      ),
                      Text(
                        gift?.name ?? ' ',
                        style: TextStyle(
                          color: (gift?.isnaming ?? 0) > 0
                              ? R.color.thirdBrightColor
                              : (widget.isInRoom
                                  ? Colors.white
                                  : R.color.mainTextColor),
                          fontSize: 12.0,
                        ),
                        maxLines: 1,
                      ),
                      _renderPrice(gift, widget.selected),
                    ],
                  ),
                  _renderNumBadge(gift),
                  if (widget.gift?.isDiyGift ?? false) _buildDiyTag(),

                  /// 优先展示DIY角标，非DIY礼物才展示特权Icon
                  if (widget.isPrivilege && !(widget.gift?.isDiyGift ?? false))
                    _buildPrivilegeIcon(gift),
                  if (widget.gift?.showRichManTag ?? false) _buildRichManTag(),
                ],
              ),
            ),
            if (gift?.isLocked ?? false)
              PositionedDirectional(
                start: 6,
                top: 6,
                child: R.img(
                  BaseAssets.ic_lock_svg,
                  width: 16,
                  height: 16,
                  package: ComponentManager.MANAGER_BASE_CORE,
                  color: widget.isInRoom
                      ? null
                      : R.color.mainTextColor.withOpacity(0.6),
                ),
              ),
            if (widget.selected)
              R.img(widget.selectImg ?? Assets.ic_gift_select_svg,
                  package: ComponentManager.MANAGER_GIFT, fit: BoxFit.fill),
          ],
        ),
      ),
    );
  }

  Widget _buildPrivilegeIcon(Gift? gift) {
    if (gift?.privilegeIcon == null ||
        gift?.privilegeIcon.isEmpty == true ||
        gift?.isLocked == false) {
      return Container();
    }
    return PositionedDirectional(
      top: 2,
      end: 2,
      child: CachedNetworkImage(
        imageUrl: gift?.privilegeIcon ?? '',
        height: 24,
        fit: BoxFit.fitHeight,
      ),
    );
  }

  /// 价格
  Widget _renderPrice(Gift? gift, bool selected) {
    // 盒子不展示金额
    if (widget.isBox) {
      return const Text('', style: TextStyle(fontSize: 10));
    }

    if (true == widget.isPubDrink && !Util.isStringEmpty(gift?.periodDesc)) {
      return Text(
        gift?.periodDesc ?? '',
        style: TextStyle(
          color: widget.isInRoom ? Colors.white60 : R.color.secondTextColor,
          fontSize: 10,
        ),
      );
    }

    String unit;

    int num = gift?.cnum ?? 0;
    int cid = gift?.cid ?? 0;
    String type = gift?.ctype ?? '';
    double price = gift?.price ?? 0;

    if (selected &&
        num > 0 &&
        cid > 0 &&
        (type == 'gift' || type == 'key' || type == 'coupon')) {
      String coin;
      String priceStr;
      if (type == 'gift' || type == 'key') {
        if (gift?.giftType == 'coin') {
          unit = K.gift_coin_unit;
          coin = (max(0, min(1, 1 - num)) * price).toStringAsFixed(0);
          priceStr = Util.removeDecimalZeroFormat(gift?.price ?? 0);
        } else if (gift?.giftType == 'bean') {
          unit = K.gift_gold_bean_unit;
          coin = (max(0, min(1, 1 - num)) * price).toStringAsFixed(0);
          priceStr = Util.removeDecimalZeroFormat(gift?.price ?? 0);
        } else {
          unit = MoneyConfig.moneyName;
          coin = MoneyConfig.moneyNum(
              Util.parseInt((max(0, min(1, 1 - num)) * price) * 100));
          priceStr =
              MoneyConfig.moneyNum(Util.parseInt(((gift?.price ?? 0) * 100)));
        }
      } else {
        double money =
            ((price * 100).round() - Util.parseInt(gift?.ductionMoney)) / 100;
        if (gift?.giftType == 'coin') {
          unit = K.gift_coin_unit;
          coin = Util.removeDecimalZeroFormat(money);
          priceStr = Util.removeDecimalZeroFormat(gift?.price);
        } else if (gift?.giftType == 'bean') {
          unit = K.gift_gold_bean_unit;
          coin = Util.removeDecimalZeroFormat(money);
          priceStr = Util.removeDecimalZeroFormat(gift?.price);
        } else {
          unit = MoneyConfig.moneyName;
          coin = MoneyConfig.moneyNum(Util.parseInt(money * 100));
          priceStr =
              MoneyConfig.moneyNum(Util.parseInt(((gift?.price ?? 0) * 100)));
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
                color:
                    widget.isInRoom ? Colors.white60 : R.color.secondTextColor,
                fontSize: 10,
              ),
            ),
          ),
          Text(
            "$priceStr$unit",
            style: TextStyle(
              color: widget.isInRoom ? Colors.white60 : R.color.secondTextColor,
              fontSize: 10,
              decoration: TextDecoration.lineThrough,
              decorationColor:
                  widget.isInRoom ? Colors.white60 : R.color.secondTextColor,
            ),
          )
        ],
      );
    }

    String priceStr;
    // 金币礼物单位为金
    if (gift?.giftType == 'coin') {
      unit = K.gift_coin_unit;
      priceStr = Util.removeDecimalZeroFormat(gift?.price);
    } else if (gift?.giftType == 'bean') {
      unit = K.gift_gold_bean_unit;
      priceStr = Util.removeDecimalZeroFormat(gift?.price);
    } else {
      unit = MoneyConfig.moneyName;
      priceStr = MoneyConfig.moneyNum(Util.parseInt((gift?.price ?? 0) * 100));
    }

    return Text(
      "$priceStr$unit",
      style: TextStyle(
        color: widget.isInRoom ? Colors.white60 : R.color.secondTextColor,
        fontSize: 10,
      ),
    );
  }

  /// 右上角背包物品数量角标
  Widget _renderNumBadge(Gift? gift) {
    if (gift?.isLocked ?? false) return const SizedBox.shrink();
    int cid = gift?.cid ?? 0;
    int num = gift?.cnum ?? 0;
    String type = gift?.ctype ?? '';
    String numStr = num > 999 ? '999+' : num.toString();

    TextStyle textStyle = const TextStyle(
        color: Colors.white, fontSize: 11, fontWeight: FontWeight.w600);
    if (cid > 0 &&
        (type == 'gift' || type == 'key' || type == 'pub_drink') &&
        num > 0) {
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
    } else if (gift?.tagList != null && gift?.tagList?.isNotEmpty == true) {
      // 礼物标签
      int maxNum = 2;
      if (widget.isPrivilege) {
        maxNum = 1;
      }

      List<Widget>? icons = [];
      if (gift?.tagList?.isNotEmpty == true) {
        icons = gift!.tagList!
            .take(min(maxNum, gift.tagList!.length))
            .map((e) => _buildGiftTag(e))
            .toList();
      }
      return PositionedDirectional(
        start: 8,
        top: 4,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: icons,
        ),
      );
    }
    return const SizedBox.shrink();
  }

  Widget _buildGiftTag(GiftTag? tag) {
    if (tag == null) return Container();
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
          style: TextStyle(
            fontSize: 8,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  /// 大R 限定
  Widget _buildRichManTag() {
    return PositionedDirectional(
      start: 4,
      top: 4,
      child: _buildShimmer(
        Container(
          width: 36,
          height: 12,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Color(0xFFFF8000), Color(0xFFFFC659)],
            ),
            borderRadius: BorderRadius.circular(3),
          ),
          alignment: AlignmentDirectional.center,
          child: MarqueeText(
            text: K.gift_richman_limit([(widget.gift?.richManName ?? '')]),
            speed: 10,
            style: const TextStyle(
                color: Colors.white,
                fontSize: 8,
                fontWeight: FontWeight.w500,
                height: 1.2),
          ),
        ),
      ),
    );
  }

  Widget _buildShimmer(Widget child) {
    return RepaintBoundary(
      child: Shimmer(
        period: const Duration(milliseconds: 1500),
        repeatPeriod: const Duration(milliseconds: 3000),
        gradient: LinearGradient(
          begin: const Alignment(-1.0, 0.0),
          end: const Alignment(1.0, 0.0),
          colors: [
            Colors.transparent,
            Colors.white.withOpacity(0.3),
            Colors.white.withOpacity(0.7),
            Colors.white.withOpacity(0.3),
            Colors.transparent,
          ],
          stops: const [0.0, 0.45, 0.5, 0.5, 1.0],
        ),
        child: child,
      ),
    );
  }
}
