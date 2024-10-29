import 'dart:async';

import 'package:shared/shared.dart';
import 'package:shared/k.dart';
import 'package:flutter/material.dart';

/// 项目默认的弹窗
class ConfirmDialog extends StatelessWidget {
  final String? title;
  final String? content;
  final String? subContent;
  final WidgetBuilder? contentBuilder;
  final NegativeButton? negativeButton;
  final PositiveButton? positiveButton;
  final CountDownButton? countDownButton;
  final double? width;
  final Color? titleTextColor;
  final Color? contentTextColor;
  final Color? subContentTextColor;
  final Color? bgColor;

  const ConfirmDialog({
    super.key,
    this.title,
    this.content,
    this.subContent,
    this.contentBuilder,
    this.negativeButton = const NegativeButton(),
    this.positiveButton = const PositiveButton(),
    this.countDownButton,
    this.width,
    this.titleTextColor,
    this.contentTextColor,
    this.subContentTextColor,
    this.bgColor,
  });

  @override
  Widget build(BuildContext context) {
    return CustomAlertDialog(
      title: title,
      content: content,
      subContent: subContent,
      width: width,
      contentBuilder: contentBuilder,
      negativeButton: negativeButton,
      positiveButton: positiveButton,
      countDownButton: countDownButton,
      titleTextColor: titleTextColor,
      contentTextColor: contentTextColor,
      subContentTextColor: subContentTextColor,
      bgColor: bgColor,
    );
  }
}

class NegativeButton extends StatelessWidget {
  final String? text;
  final VoidCallback? onPressed;
  final double width;
  final double height;
  final EdgeInsetsDirectional? padding;
  final Color? bgColor;
  final Color? textColor;
  final FontWeight? fontWeight;
  final double? fontSize;

  const NegativeButton({
    super.key,
    this.text,
    this.onPressed,
    this.width = 105,
    this.height = 40,
    this.padding,
    this.bgColor,
    this.textColor,
    this.fontWeight,
    this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          if (onPressed == null) {
            Navigator.of(context).pop(false);
          } else {
            onPressed!();
          }
        },
        borderRadius: BorderRadius.circular(24),
        child: Ink(
          width: width,
          height: height,
          padding: padding ?? EdgeInsets.zero,
          decoration: BoxDecoration(
            color: bgColor ?? R.color.secondBgColor,
            borderRadius: BorderRadius.circular(24),
          ),
          child: Center(
            child: Text(
              text ?? K.cancel,
              style: TextStyle(
                color: textColor ?? R.color.mainTextColor,
                fontSize: fontSize ?? 14,
                fontWeight: fontWeight,
              ),
              textScaleFactor: 1,
            ),
          ),
        ),
      ),
    );
  }
}

class PositiveButton extends StatefulWidget {
  final String? text;
  final VoidCallback? onPressed;
  final bool useGradientBg;

  /// 支持外部传入按钮渐变色
  final List<Color>? gradientBg;
  final double width;
  final double height;
  final EdgeInsetsDirectional? padding;
  final bool needSweepAni;
  final Color? bgColor;
  final Color? textColor;
  final double textSize;
  final bool canDisable;
  final Widget? child;

  const PositiveButton({
    super.key,
    this.text,
    this.onPressed,
    this.useGradientBg = false,
    this.gradientBg,
    this.width = 105,
    this.height = 40,
    this.padding,
    this.needSweepAni = false,
    this.bgColor,
    this.textColor,
    this.textSize = 14,
    this.canDisable = false,
    this.child,
  });

  @override
  PositiveButtonState createState() {
    return PositiveButtonState();
  }
}

class PositiveButtonState extends State<PositiveButton>
    with TickerProviderStateMixin {
  AnimationController? _aniController;
  Animation<Offset>? _slideAni;

  @override
  void initState() {
    super.initState();

    if (widget.needSweepAni == true) {
      _aniController = AnimationController(
          duration: const Duration(milliseconds: 1500), vsync: this);
      _slideAni = Tween(
              begin: const Offset(0, 0),
              end: Offset((widget.width + 20) / 20, 0))
          .animate(_aniController!);
      _aniController!.repeat();
    }
  }

  @override
  void dispose() {
    _aniController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.needSweepAni == true) {
      return Stack(
        children: [
          _buildButton(),
          PositionedDirectional(
            start: -20,
            child: AnimatedBuilder(
              animation: _aniController!,
              child: Container(
                width: 20,
                height: widget.height,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: AlignmentDirectional.centerStart,
                    end: AlignmentDirectional.centerEnd,
                    colors: [
                      R.color.mainBgColor.withOpacity(0),
                      R.color.mainBgColor.withOpacity(0.35)
                    ],
                  ),
                ),
              ),
              builder: (BuildContext context, child) {
                return SlideTransition(
                  transformHitTests: false,
                  position: _slideAni!,
                  child: child,
                );
              },
            ),
          ),
        ],
      );
    }

    return _buildButton();
  }

  Widget _buildButton() {
    Color bgColor = widget.bgColor ?? R.color.mainBrandColor;
    if (widget.canDisable && widget.onPressed == null) {
      bgColor = R.color.thirdBgColor;
    }

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: widget.canDisable
            ? widget.onPressed
            : () {
                if (widget.onPressed == null) {
                  Navigator.of(context).pop(true);
                } else {
                  widget.onPressed!();
                }
              },
        borderRadius: BorderRadius.circular(24),
        child: Ink(
          width: widget.width,
          height: widget.height,
          padding: widget.padding ?? EdgeInsets.zero,
          decoration: BoxDecoration(
            color: bgColor,
            gradient: getGradient(),
            borderRadius: BorderRadius.circular(24),
          ),
          child: Center(
            child: widget.child ??
                Text(
                  widget.text ?? K.confirm,
                  style: TextStyle(
                    color: widget.textColor ?? Colors.black,
                    fontSize: widget.textSize,
                    fontWeight: FontWeight.bold,
                  ),
                ),
          ),
        ),
      ),
    );
  }

  LinearGradient? getGradient() {
    if (widget.useGradientBg) {
      return LinearGradient(
          colors: widget.gradientBg ?? R.color.mainBrandGradientColors);
    }
    return null;
  }
}

class CountDownButton extends StatefulWidget {
  final String? text;
  final TextStyle? textStyle;
  final VoidCallback? onPressed;
  final Color? backgroundColor;
  final bool useGradientBg;

  /// 支持外部传入按钮渐变色
  final List<Color>? gradientBg;
  final int countDownTime;

  /// count down之后，触发onPress
  final bool autoPress;

  const CountDownButton({
    super.key,
    this.text,
    this.textStyle,
    this.onPressed,
    this.backgroundColor,
    this.useGradientBg = false,
    this.gradientBg,
    this.countDownTime = 0,
    this.autoPress = false,
  });

  @override
  _CountDownButtonState createState() => _CountDownButtonState();
}

class _CountDownButtonState extends State<CountDownButton> {
  int _countDownTime = 0;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _countDownTime = widget.countDownTime;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      _countDownTime--;
      if (mounted) {
        setState(() {});
      }
      if (_countDownTime == 0) {
        _timer.cancel();
        if (widget.autoPress == true) _press();
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _press() {
    if (widget.onPressed == null) {
      Navigator.of(context).pop(true);
    } else {
      widget.onPressed!();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          _press();
        },
        borderRadius: BorderRadius.circular(24),
        child: Ink(
          width: 105,
          height: 40,
          decoration: BoxDecoration(
            color:
                (widget.useGradientBg != true && widget.backgroundColor != null)
                    ? widget.backgroundColor
                    : _countDownTime > 0
                        ? R.color.thirdBgColor
                        : R.color.mainBrandColor,
            gradient: (widget.backgroundColor != null || _countDownTime > 0)
                ? null
                : getGradient(),
            borderRadius: BorderRadius.circular(24),
          ),
          child: Center(
            child: Text(
              (widget.text ?? K.confirm) +
                  (_countDownTime > 0 ? ' ${_countDownTime}S' : ''),
              style: widget.textStyle ??
                  const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
        ),
      ),
    );
  }

  LinearGradient? getGradient() {
    if (widget.useGradientBg) {
      return LinearGradient(
          colors: widget.gradientBg ?? R.color.mainBrandGradientColors);
    }
    return null;
  }
}

class CustomAlertDialog extends StatelessWidget {
  final String? title;
  final String? content;
  final String? subContent;
  final WidgetBuilder? contentBuilder;
  final NegativeButton? negativeButton;
  final PositiveButton? positiveButton;
  final CountDownButton? countDownButton;
  final Widget? closeWidget;
  final double? width;
  final Color? titleTextColor;
  final Color? contentTextColor;
  final Color? subContentTextColor;
  final Color? bgColor;
  final double? height;

  const CustomAlertDialog({
    super.key,
    this.title,
    this.content,
    this.subContent,
    this.contentBuilder,
    this.negativeButton,
    this.positiveButton,
    this.countDownButton,
    this.closeWidget,
    this.width,
    this.height,
    this.titleTextColor,
    this.contentTextColor,
    this.subContentTextColor,
    this.bgColor,
  });

  Widget _buildTitle(BuildContext context) {
    return title != null
        ? Text(
            title!,
            style: TextStyle(
              color: titleTextColor ?? R.color.mainTextColor,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
            maxLines: 2,
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
          )
        : const SizedBox.shrink();
  }

  Widget _buildContent(BuildContext context) {
    bool showSupContent = false;
    showSupContent = subContent != null && subContent!.isNotEmpty;
    if (content != null) {
      return Container(
        margin: const EdgeInsets.only(top: 12),
        alignment: AlignmentDirectional.center,
        child: showSupContent
            ? Column(
                children: [
                  Text(
                    content!,
                    style: TextStyle(
                      color: contentTextColor ?? R.color.secondTextColor,
                      fontSize: 14,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 6.5,
                  ),
                  Text(
                    subContent ?? '',
                    style: TextStyle(
                      color: subContentTextColor ?? R.color.secondTextColor,
                      fontSize: 14,
                    ),
                    textAlign: TextAlign.center,
                  )
                ],
              )
            : Text(
                content ?? '',
                style: TextStyle(
                  color: contentTextColor ?? R.color.secondTextColor,
                  fontSize: 14,
                ),
                textAlign: TextAlign.center,
              ),
      );
    } else if (contentBuilder != null) {
      return contentBuilder!(context);
    } else {
      return const SizedBox.shrink();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        color: Colors.transparent,
        child: Stack(children: [
          Container(
            width: width ?? 265,
            constraints: BoxConstraints(
              maxHeight: height ?? 400,
            ),
            decoration: BoxDecoration(
              color: bgColor ?? R.color.mainBgColor,
              borderRadius: BorderRadius.circular(16),
            ),
            padding: const EdgeInsetsDirectional.only(
                start: 20, end: 20, top: 24, bottom: 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(bottom: 24),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      _buildTitle(context),
                      _buildContent(context),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    if (negativeButton != null) negativeButton!,
                    if (countDownButton != null) countDownButton!,
                    if (positiveButton != null) positiveButton!,
                  ],
                ),
              ],
            ),
          ),
          PositionedDirectional(
            top: 0,
            end: 0,
            child: closeWidget ?? const SizedBox.shrink(),
          ),
        ]),
      ),
    );
  }
}
