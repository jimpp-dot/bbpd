import 'package:shared/shared.dart';
import 'package:chat_room/assets.dart';
import 'package:chat_room/src/vindicate/model/vindicate_data.dart';
import 'package:chat_room/src/vindicate/widgets/components/vindicate_card_box.dart';
import 'package:chat_room/src/vindicate/widgets/components/vindicate_gift.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// 带解锁动效和选中的礼物组件
class VindicateGiftAnimateBox extends StatefulWidget {
  /// 当前展示的礼物
  VindicateGiftData gift;

  /// 要展示的下一个礼物
  VindicateGiftData nextGift;

  Function(VindicateGiftData gift, BuildContext) onTap;

  bool isSelected;

  VindicateGiftAnimateBox({
    Key? key,
    required this.gift,
    required this.nextGift,
    this.isSelected = false,
    required this.onTap,
  }) : super(key: key);

  @override
  VindicateGiftAnimateBoxState createState() => VindicateGiftAnimateBoxState();
}

class VindicateGiftAnimateBoxState extends State<VindicateGiftAnimateBox>
    with TickerProviderStateMixin {
  final GlobalKey _giftIconKey = GlobalKey();

  /// 礼物交换动画
  late AnimationController _exchangeAnimationController;
  late Animation<double> _exchangeAnimation;

  /// 解锁动画
  late AnimationController _unlockAnimationController;
  late Animation<double> _unlockAnimation;

  void Function()? _onAnimationCompleted;

  bool showNextGift = false;

  @override
  void initState() {
    super.initState();

    _exchangeAnimationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));
    _exchangeAnimation = Tween<double>(begin: 1.0, end: 0.0)
        .chain(CurveTween(curve: Curves.easeInOut))
        .animate(_exchangeAnimationController);
    _exchangeAnimationController.addListener(_animationListener);
    _exchangeAnimationController
        .addStatusListener(_exchangeAnimationStatusListener);

    _unlockAnimationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));
    _unlockAnimation = Tween<double>(begin: 1.0, end: 0.0)
        .chain(CurveTween(curve: Curves.easeInOut))
        .animate(_unlockAnimationController);
    _unlockAnimationController.addListener(_animationListener);
    _unlockAnimationController
        .addStatusListener(_unlockAnimationStatusListener);
  }

  @override
  void didUpdateWidget(covariant VindicateGiftAnimateBox oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    super.dispose();

    _exchangeAnimationController.removeListener(_animationListener);
    _exchangeAnimationController
        .removeStatusListener(_exchangeAnimationStatusListener);
    _exchangeAnimationController.dispose();

    _unlockAnimationController.removeListener(_animationListener);
    _unlockAnimationController
        .removeStatusListener(_unlockAnimationStatusListener);
    _unlockAnimationController.dispose();
  }

  /// 获取礼物图标的key
  GlobalKey get getGiftIconKey => _giftIconKey;

  _animationListener() {
    setState(() {});
  }

  _exchangeAnimationStatusListener(AnimationStatus status) {
    if (status == AnimationStatus.completed) {
      showNextGift = true;
      _exchangeAnimationController.reverse();
    } else if (status == AnimationStatus.dismissed) {
      _exchangeAnimationController.reset();
      showNextGift = false;
      _onAnimationCompleted?.call();
    }
  }

  _unlockAnimationStatusListener(AnimationStatus status) {
    if (status == AnimationStatus.completed) {
      _onAnimationCompleted?.call();
      setState(() {});
    }
  }

  /// 礼物解锁动画
  startUnlockAnimation({Function()? onAnimationCompleted}) {
    _onAnimationCompleted = onAnimationCompleted;

    _unlockAnimationController.reset();
    _unlockAnimationController.forward();
  }

  /// 重置礼物的解锁动画(仅锁的消失动画)
  resetUnlockAnimation() {
    _unlockAnimationController.reset();
    setState(() {});
  }

  /// 礼物交换动画
  startExchangeAnimation({Function()? onAnimationCompleted}) {
    _onAnimationCompleted = onAnimationCompleted;

    showNextGift = false;
    _exchangeAnimationController.reset();
    _exchangeAnimationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return _body(context);
  }

  Widget _body(BuildContext context) {
    return GestureDetector(
      onTap: () => widget.onTap(widget.gift, context),
      child: FadeTransition(
        opacity: _exchangeAnimation,
        child: ScaleTransition(
          scale: _exchangeAnimation,
          child: Stack(
            alignment: AlignmentDirectional.topStart,
            children: [
              Container(
                padding: const EdgeInsetsDirectional.all(1.5),
                decoration: BoxDecoration(
                  borderRadius:
                      const BorderRadiusDirectional.all(Radius.circular(12.0)),
                  gradient: widget.isSelected
                      ? const LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color(0xFFF448B3),
                            Color(0xFFFA7EDA),
                            Color(0xFFF448B3),
                          ],
                        )
                      : null,
                ),
                child: VindicateCardBox.giftBox(
                  child:
                      _giftWidget(showNextGift ? widget.nextGift : widget.gift),
                ),
              ),
              if (widget.isSelected) _selectedWidget,
            ],
          ),
        ),
      ),
    );
  }

  Widget _giftWidget(VindicateGiftData giftData) {
    return Column(
      children: [
        Stack(
          alignment: AlignmentDirectional.center,
          children: [
            VindicateGift(
              url: giftData.url,
              iconGlobalKey: _giftIconKey,
              width: 64,
              height: 64,
              showBgMask: false,
              isLocked: !giftData.unlocked,
            ),
            if (!giftData.unlocked)
              PositionedDirectional(
                child: FadeTransition(
                  opacity: _unlockAnimation,
                  child: R.img(
                      RoomAssets
                          .chat_room$confession_confession_gift_lock_webp_webp,
                      width: 32,
                      height: 32),
                ),
              ),
          ],
        ),
        const SizedBox(
          height: 8.0,
        ),
        Wrap(
          direction: Axis.vertical,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            Text(
              giftData.name,
              textAlign: TextAlign.center,
              style: R.textStyle.medium14.copyWith(
                  fontSize: 13,
                  color: const Color(0xFF202020)
                      .withOpacity(giftData.unlocked ? 1.0 : 0.5)),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                R.img(
                  (giftData.unlocked
                      ? RoomAssets.chat_room$guessgame_guess_game_diamonds_webp
                      : RoomAssets
                          .chat_room$confession_guessgame_guess_game_unlocked_diamonds_webp),
                  width: 12,
                  height: 12,
                ),
                const SizedBox(
                  width: 2,
                ),
                Container(
                  margin: const EdgeInsetsDirectional.only(bottom: 1),
                  child: Text(
                    '${giftData.price}',
                    textAlign: TextAlign.center,
                    style: R.textStyle.medium12.copyWith(
                        fontSize: 11,
                        color: const Color(0xFF202020).withOpacity(0.5)),
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget get _selectedWidget {
    return Container(
      width: 24,
      height: 24,
      decoration: const BoxDecoration(
        borderRadius: BorderRadiusDirectional.only(
            topStart: Radius.circular(12.0), bottomEnd: Radius.circular(12.0)),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFFFA7EDA),
            Color(0xFFF448B3),
          ],
        ),
      ),
      alignment: AlignmentDirectional.center,
      child: R.img(
          RoomAssets.chat_room$vindicate_vindicate_checkbox_selected_webp,
          width: 24,
          height: 24),
    );
  }
}
