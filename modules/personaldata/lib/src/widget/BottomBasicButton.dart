import 'package:shared/shared.dart';
import 'package:flutter/material.dart';

class BottomBasicButton extends StatefulWidget {
  String? icon;
  String? label;
  String? subLabel;
  VoidCallback? onClick;
  Color? shadowColor;
  Color? labelColor;
  Color? subLabelColor;
  Color? iconColor;
  Color? bgColor;
  Color? borderColor;
  double width;
  double height;
  double? borderWith;

  final List<Color>? gradientBgColors;

  BottomBasicButton({
    super.key,
    this.icon,
    this.label,
    this.subLabel,
    this.onClick,
    this.shadowColor,
    this.labelColor,
    this.subLabelColor,
    this.iconColor,
    this.bgColor,
    this.borderColor,
    this.borderWith,
    this.gradientBgColors,
    this.width = 144,
    this.height = 56,
  }) {
    shadowColor ??= const Color(0xFF202020).withOpacity(0.08);
  }

  @override
  _BottomBasicButtonState createState() => _BottomBasicButtonState();
}

class _BottomBasicButtonState extends State<BottomBasicButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      decoration: BoxDecoration(
        color: widget.gradientBgColors == null
            ? (widget.bgColor ?? const Color(0xFFFFFFFF))
            : null,
        borderRadius: BorderRadius.circular(30),
        border: widget.borderColor == null
            ? null
            : Border.all(
                color: widget.borderColor!, width: widget.borderWith ?? 3),
        gradient: widget.gradientBgColors != null
            ? LinearGradient(
                colors: widget.gradientBgColors!,
              )
            : null,
        boxShadow: [
          BoxShadow(
            color: widget.shadowColor ?? const Color(0xFFFFFFFF),
            blurRadius: 6,
            spreadRadius: 2.0,
            offset: const Offset(0, 2),
          )
        ],
      ),
      child: InkWell(
        onTap: () async {
          if (widget.onClick != null) {
            widget.onClick!();
          }
        },
        child: Ink(
          child: Container(
            alignment: Alignment.center,
            child: _buildContent(),
          ),
        ),
      ),
    );
  }

  Widget _buildContent() {
    if (widget.subLabel != null && widget.subLabel!.isNotEmpty) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              R.img(
                widget.icon,
                package: ComponentManager.MANAGER_PERSONALDATA,
                width: 24,
                height: 24,
                color: widget.iconColor,
              ),
              const SizedBox(width: 6),
              Text(
                widget.label ?? '',
                style: TextStyle(
                  fontSize: 15,
                  color: widget.labelColor ?? Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          Text(
            widget.subLabel ?? '',
            style: TextStyle(
              fontSize: 11,
              color:
                  widget.subLabelColor ?? (widget.labelColor ?? Colors.white),
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      );
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        R.img(
          widget.icon,
          package: ComponentManager.MANAGER_PERSONALDATA,
          width: 24,
          height: 24,
          color: widget.iconColor,
        ),
        const SizedBox(width: 6),
        Text(
          widget.label ?? '',
          style: TextStyle(
            fontSize: 15,
            color: widget.labelColor ?? Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
