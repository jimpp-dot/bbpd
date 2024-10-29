import 'package:shared/shared.dart';
import 'package:chat_room/k.dart';
import 'package:chat_room/src/vindicate/model/vindicate_data.dart';
import 'package:chat_room/src/vindicate/widgets/components/vindicate_gift.dart';
import 'package:easy_rich_text/easy_rich_text.dart';
import 'package:flutter/material.dart';

double _defaultDialogWidth = 312.0;

/// 表白活动弹出框
/// [gift] 为当前要展示的礼物
/// [previousGift] 为未解锁弹窗在title上要展示的礼物名称
/// [giftUnlocked] 1、如果礼物未解锁，触发了解锁事件 2、收到礼物解锁的消息
class VindicateDialog extends StatelessWidget {
  final bool giftUnlocked;

  /// 上一阶段礼物
  final VindicateGiftData? previousGift;

  /// 当前礼物
  final VindicateGiftData gift;

  final VoidCallback? onSendBtnTap;

  const VindicateDialog(
      {Key? key,
      required this.gift,
      this.previousGift,
      this.giftUnlocked = false,
      this.onSendBtnTap})
      : super(key: key);

  /// 展示弹窗
  ///
  /// [offset] 弹窗需要显示位置的偏移量，因为VindicateDialog是使用Column全屏铺满,
  /// 且Column的mainAxisAlignment: MainAxisAlignment.start，所以弹窗的显示方
  /// 式是从屏幕剧中位置显示到目标Offset的位置，所以只需要给弹窗设置一个相对于屏幕中心
  /// 点的偏移量即可。 如果想给弹窗设置成向下方弹出，则需要给VindicateDialog里的
  /// Column的mainAxisAlignment设置为MainAxisAlignment.end
  static Future<T?> show<T>(
    BuildContext context, {
    required VindicateGiftData gift,
    VindicateGiftData? previousGift,
    required bool giftUnlocked,
    VoidCallback? onSendBtnTap,
  }) {
    var offset = Offset((Util.width - _defaultDialogWidth) / 2,
        Util.height / 2.0 - (giftUnlocked ? 276 : 340) / 2.0 - 56);

    return Navigator.push<T>(
        context,
        _VindicateDialogRute<T>(
          child: VindicateDialog(
            gift: gift,
            previousGift: previousGift,
            giftUnlocked: giftUnlocked,
            onSendBtnTap: onSendBtnTap,
          ),
          childOffset: offset,
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          width: _defaultDialogWidth,
          height: giftUnlocked ? 276 : 340,
          alignment: AlignmentDirectional.topCenter,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadiusDirectional.all(Radius.circular(16.0)),
          ),
          child: Stack(
            clipBehavior: Clip.none,
            alignment: AlignmentDirectional.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  _titleWidget,
                  Container(
                    margin:
                        const EdgeInsetsDirectional.only(top: 24, bottom: 16),
                    width: 96,
                    height: 96,
                  ),
                  Text(
                    gift.name,
                    style: R.textStyle.regular16
                        .copyWith(color: const Color(0x99202020)),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  if (!giftUnlocked) _sendBtn(context),
                ],
              ),
              PositionedDirectional(
                top: 50,
                child: VindicateGift(
                  url: gift.url,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget get _titleWidget {
    final giftName =
        giftUnlocked ? gift.name : (previousGift?.name ?? gift.name);

    final highlightText = '「$giftName」';
    final allText = gift.unlocked
        ? K.room_vindicate_gift_unlock_dialog_title([highlightText])
        : K.room_vindicate_gift_locked_dialog_title([highlightText]);

    final textPattern = EasyRichTextPattern(
      targetString: highlightText,
      style: R.textStyle.medium18.copyWith(color: const Color(0xFFF448B3)),
    );

    return Container(
      margin: const EdgeInsetsDirectional.only(start: 33, end: 33, top: 32),
      child: EasyRichText(
        allText,
        textAlign: TextAlign.center,
        defaultStyle: R.textStyle.medium18.copyWith(
            fontWeight: FontWeight.bold, color: const Color(0xFF202020)),
        patternList: [
          textPattern,
        ],
      ),
    );
  }

  Widget _sendBtn(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: const BorderRadius.all(Radius.circular(26)),
        onTap: () {
          Navigator.of(context).pop();
          onSendBtnTap?.call();
        },
        child: Ink(
          width: 216,
          height: 48,
          decoration: const BoxDecoration(
            borderRadius: BorderRadiusDirectional.all(Radius.circular(26)),
            gradient: LinearGradient(
              begin: AlignmentDirectional.topCenter,
              end: AlignmentDirectional.bottomCenter,
              colors: [
                Color(0xFFFFC2E7),
                Color(0xFFFF58B4),
              ],
            ),
          ),
          child: InkWell(
            borderRadius: const BorderRadius.all(Radius.circular(26)),
            onTap: () {
              Navigator.of(context).pop();
              onSendBtnTap?.call();
            },
            child: Container(
              alignment: AlignmentDirectional.center,
              child: Text(
                K.room_send,
                style: R.textStyle.medium16
                    .copyWith(color: const Color(0xFFFFFFFF)),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

///
class _VindicateDialogRute<T> extends PopupRoute<T> {
  final Widget child;

  final Offset childOffset;

  _VindicateDialogRute({required this.child, this.childOffset = Offset.zero});

  @override
  // TODO: implement barrierColor
  Color? get barrierColor => Colors.black.withOpacity(0.5);

  @override
  // TODO: implement barrierDismissible
  bool get barrierDismissible => true;

  @override
  // TODO: implement barrierLabel
  String? get barrierLabel => null;

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return CustomSingleChildLayout(
      delegate: _CustomVindicateDialogLayoutDelegate(childOffset: childOffset),
      child: FadeTransition(
        opacity: Tween<double>(begin: 0.0, end: 1.0)
            .chain(CurveTween(curve: Curves.easeInOut))
            .animate(animation),
        child: ScaleTransition(
          scale: TweenSequence<double>(
            [
              TweenSequenceItem<double>(
                  tween: Tween(begin: 0.0, end: 1.1)
                      .chain(CurveTween(curve: Curves.easeInOut)),
                  weight: 60),
              TweenSequenceItem<double>(
                  tween: Tween(begin: 1.1, end: 1.0)
                      .chain(CurveTween(curve: Curves.easeInOut)),
                  weight: 40),
            ],
          ).animate(animation),
          child: child,
        ),
      ),
    );
  }

  @override
  // TODO: implement transitionDuration
  Duration get transitionDuration => const Duration(milliseconds: 300);
}

class _CustomVindicateDialogLayoutDelegate extends SingleChildLayoutDelegate {
  final Offset childOffset;

  _CustomVindicateDialogLayoutDelegate({this.childOffset = Offset.zero});

  @override
  bool shouldRelayout(covariant SingleChildLayoutDelegate oldDelegate) => true;

  @override

  /// 可获取父容器约束条件,并返回新的约束条件
  BoxConstraints getConstraintsForChild(BoxConstraints constraints) {
    Log.d('getConstraintsForChild constraints = $constraints');
    return BoxConstraints.loose(getSize(constraints));
  }

  @override

  /// 获取父容器的约束条件,即Layout的约束
  Size getSize(BoxConstraints constraints) {
    Log.d('getSize constraints = $constraints');
    return super.getSize(constraints);
  }

  @override
  Offset getPositionForChild(Size size, Size childSize) {
    return childOffset;

    // Offset showOffset = Offset(position.left, position.top - 10 - (232 * animation.value));

    Offset showOffset = Offset((size.width - 312) / 2, -32);

    Log.d('showOffset = $showOffset , size = $size , childSize = $size ');

    return showOffset;
  }
}
