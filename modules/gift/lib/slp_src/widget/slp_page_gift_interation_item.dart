import 'package:shared/assets.dart';
import 'package:gift/k.dart';
import 'package:shared/shared.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:extended_text/extended_text.dart';
import '../../assets.dart';
import '../gift/slp_page_gift.dart';
import '../model/pb/slp_gift_extension.dart';
import 'slp_text_span.dart';

/// 互动礼物item
class SlpPageGiftInteractionItem extends StatefulWidget {
  final BbGiftPanelGift gift;
  final bool selected;
  final OnGiftTaped? onGiftTaped;
  final bool isInRoom;

  const SlpPageGiftInteractionItem({
    Key? key,
    required this.gift,
    this.selected = false,
    this.isInRoom = false,
    this.onGiftTaped,
  }) : super(key: key);

  @override
  _SlpPageGiftInteractionItemState createState() =>
      _SlpPageGiftInteractionItemState();
}

class _SlpPageGiftInteractionItemState extends State<SlpPageGiftInteractionItem>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  /// 是否是组合礼物
  bool get _isCombineGift => Util.parseBool(widget.gift.hasCombineGift());

  /// 是否是全麦：combine_type == 2 || gift_b_to == 2 成立的话，显示全麦，否则显示单点
  bool get _isAllMic =>
      _isCombineGift &&
      (Util.parseInt(widget.gift.combineGift.combineType) == 2 ||
          Util.parseInt(widget.gift.combineGift.giftBTo) == 2);

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 800));
    _scaleAnimation = Tween<double>(begin: 0, end: 1).animate(
        CurvedAnimation(parent: _controller, curve: Curves.elasticOut));
    _controller.value = 1;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _buildGiftItem(widget.gift);
  }

  _onGiftTaped(BbGiftPanelGift gift) {
    if (widget.onGiftTaped != null) {
      widget.onGiftTaped!(gift);
    }

    _controller.forward(from: 0);
  }

  Widget _buildGiftItem(BbGiftPanelGift gift) {
    return GestureDetector(
      onTap: () => _onGiftTaped(gift),
      behavior: HitTestBehavior.opaque,
      child: Container(
        width: 132,
        height: 200,
        alignment: Alignment.center,
        padding: const EdgeInsetsDirectional.only(top: 0.5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: widget.selected ? null : Colors.white.withOpacity(0.06),
          gradient: widget.selected
              ? const LinearGradient(
                  begin: AlignmentDirectional.topCenter,
                  end: AlignmentDirectional.bottomCenter,
                  colors: [Color(0xFF6968FF), Color(0xFF9274FF)],
                )
              : null,
        ),
        child: Stack(
          clipBehavior: Clip.none,
          fit: StackFit.expand,
          children: [
            Opacity(
              opacity: gift.isLocked ? 0.6 : 1.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsetsDirectional.only(
                        start: 10, end: 10, top: 10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Text(
                            _isCombineGift
                                ? gift.combineGift.combineName
                                : gift.name,
                            style: TextStyle(
                              color: gift.isnaming > 0
                                  ? R.color.thirdBrightColor
                                  : Colors.white,
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        if (gift.showOrderSong)
                          InkWell(
                            onTap: () {
                              IRoomManager roomManager =
                                  ComponentManager.instance.getManager(
                                      ComponentManager.MANAGER_BASE_ROOM);
                              roomManager.openJukeMusicOrderV2Page(context);
                            },
                            child: Container(
                              width: 60,
                              height: 20,
                              decoration: ShapeDecoration(
                                shape: const StadiumBorder(),
                                gradient: LinearGradient(
                                  colors: R.color.mainBrandGradientColors,
                                ),
                              ),
                              alignment: AlignmentDirectional.center,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    K.gift_juke_music_order_btn,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 10,
                                    ),
                                  ),
                                  const SizedBox(width: 2),
                                  R.img(
                                    Assets.ic_arrow_right_webp,
                                    width: 6,
                                    height: 10,
                                    package: ComponentManager.MANAGER_GIFT,
                                  ),
                                ],
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.only(
                        start: 10, end: 10, top: 4),
                    child: ExtendedText.rich(
                      TextSpan(
                        text: _isCombineGift
                            ? gift.combineGift.combineDesc
                            : gift.description,
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.7),
                          fontSize: 10,
                        ),
                        children: [
                          if (_isCombineGift)
                            SlpTextSpan(
                              text: _isAllMic ? K.gift_all_mic : K.gift_one_mic,
                              textStyle: const TextStyle(
                                  color: Color(0xFFFEFEFE),
                                  fontSize: 8,
                                  fontWeight: FontWeight.w500,
                                  height: 1.1),
                              imageWidth: 24,
                              imageHeight: 12,
                              margin:
                                  const EdgeInsetsDirectional.only(start: 4),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(2.0),
                                gradient: const LinearGradient(colors: [
                                  Color(0xFFEC6080),
                                  Color(0xFFFE7A33)
                                ]),
                              ),
                            )
                        ],
                      ),
                      softWrap: true,
                      maxLines: 3,
                    ),
                  ),
                  const Spacer(),
                  Padding(
                    padding: EdgeInsetsDirectional.only(
                        bottom: _isCombineGift ? 20 : 14),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ScaleTransition(
                          scale: _scaleAnimation,
                          child: CachedNetworkImage(
                            placeholder: const CupertinoActivityIndicator(),
                            imageUrl: _isCombineGift
                                ? Util.giftImgUrl(gift.combineGift.giftA)
                                : gift.giftIcon,
                            width: _isCombineGift ? 48 : 72,
                            height: _isCombineGift ? 48 : 72,
                            fit: BoxFit.contain,
                          ),
                        ),
                        if (_isCombineGift)
                          ScaleTransition(
                            scale: _scaleAnimation,
                            child: CachedNetworkImage(
                              placeholder: const CupertinoActivityIndicator(),
                              imageUrl: Util.giftImgUrl(gift.combineGift.giftB),
                              width: 48,
                              height: 48,
                              fit: BoxFit.contain,
                            ),
                          ),
                      ],
                    ),
                  ),
                  _renderPrice(gift),
                  const SizedBox(height: 12),
                ],
              ),
            ),
            if (gift.isLocked)
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
          ],
        ),
      ),
    );
  }

  /// 价格
  Widget _renderPrice(BbGiftPanelGift gift) {
    String priceStr = MoneyConfig.moneyNum(Util.parseInt(
        _isCombineGift ? gift.combineGift.combineMoney : gift.price));
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(MoneyConfig.moneyIcon, width: 19, height: 16),
        const SizedBox(width: 2),
        Text(
          priceStr,
          style: TextStyle(
              color: widget.selected ? Colors.white : R.color.mainBrandColor,
              fontSize: 15,
              fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}
