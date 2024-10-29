import 'package:shared/shared.dart';
import 'package:flutter/material.dart';

typedef OnButtonClick = void Function(dynamic extra);

class BaseButton extends StatefulWidget {
  ///按钮上显示的文字
  final String label;

  ///按钮是否可选择，默认不可选择，始终高亮显示
  final bool selectable;

  ///按钮可选择时是否处于选中状态，选中则高亮显示
  final bool highlighted;

  ///按钮点击事件的处理函数
  final OnButtonClick? onClick;

  ///按钮的显示高度
  final double height;

  ///按钮最小显示宽度
  final double minWidth;

  ///按钮上文字的大小
  final double fontSize;

  ///按钮四个角的显示弧度
  final double radius;

  ///按钮的附加信息，点击事件时回传作为参数
  final dynamic extra;

  const BaseButton(
    this.label,
    this.onClick, {
    super.key,
    this.height = 46,
    this.selectable = false,
    this.highlighted = true,
    this.minWidth = 32,
    this.fontSize = 14,
    this.radius = 23,
    this.extra,
  });

  @override
  _BaseButtonState createState() => _BaseButtonState();
}

class _BaseButtonState extends State<BaseButton> {
  late bool highlighted;

  @override
  initState() {
    super.initState();
    highlighted = widget.highlighted;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        minWidth: widget.minWidth,
      ),
      height: widget.height,
      decoration: BoxDecoration(
        color: _getBackgroundColor(),
        borderRadius: BorderRadius.all(Radius.circular(widget.radius)),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(widget.radius)),
        child: ButtonTheme(
          minWidth: widget.minWidth,
          child: TextButton(
            child: Text(
              widget.label,
              style: _getTextStyle(),
            ),
            onPressed: () {
              if (widget.selectable) {
                highlighted = !highlighted;
                _refresh();
              }

              if (widget.onClick != null) {
                widget.onClick!(widget.extra);
              }
            },
          ),
        ),
      ),
    );
  }

  Color _getBackgroundColor() {
    if (widget.onClick == null) {
      return R.color.thirdBgColor;
    }
    return highlighted ? R.color.mainBrandColor : R.color.secondBgColor;
  }

  TextStyle _getTextStyle() {
    TextStyle defaultStyle;
    if (highlighted) {
      defaultStyle =
          R.textStyle.defaultButtonText.copyWith(color: Colors.white);
    } else {
      defaultStyle =
          R.textStyle.defaultButtonText.copyWith(color: R.color.mainTextColor);
    }

    if (widget.onClick == null) {
      defaultStyle = R.textStyle.defaultButtonText
          .copyWith(color: R.color.secondTextColor);
    }

    return defaultStyle.merge(TextStyle(
      fontSize: widget.fontSize,
    ));
  }

  _refresh() {
    if (mounted) {
      setState(() {});
    }
  }
}

class RadiusInkButton extends StatelessWidget {
  final double width;
  final double height;
  final bool enable;
  final double? borderRadius;
  final BoxDecoration? decoration;
  final Widget child;
  final VoidCallback onTap;

  const RadiusInkButton(
      {super.key,
      required this.width,
      required this.height,
      this.enable = true,
      this.borderRadius,
      this.decoration,
      required this.onTap,
      required this.child});

  double get radius {
    return borderRadius ?? height / 2.0;
  }

  @override
  build(BuildContext context) {
    return Opacity(
      opacity: enable ? 1.0 : 0.5,
      child: IgnorePointer(
        ignoring: !enable,
        child: Material(
          color: Colors.transparent,
          child: Ink(
            width: width,
            height: height,
            decoration: decoration == null
                ? BoxDecoration(borderRadius: BorderRadius.circular(radius))
                : decoration?.copyWith(
                    borderRadius: BorderRadius.circular(radius)),
            child: InkWell(
              borderRadius: BorderRadius.circular(radius),
              onTap: onTap,
              child: Center(child: child),
            ),
          ),
        ),
      ),
    );
  }
}
