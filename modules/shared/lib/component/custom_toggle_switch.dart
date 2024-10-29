import 'package:flutter/material.dart';

class CustomToggleSwitch extends StatelessWidget {
  final bool value;
  final double width;
  final double height;
  final double cornerRadius;
  final EdgeInsets padding;
  final Widget leftActiveWidget;
  final Widget rightActiveWidget;
  final Widget leftInactiveWidget;
  final Widget rightInactiveWidget;
  final Color bgColor;
  final Function(bool) didSwitch;

  const CustomToggleSwitch(
      {super.key,
      required this.value,
      required this.width,
      required this.height,
      required this.cornerRadius,
      required this.leftActiveWidget,
      required this.rightActiveWidget,
      required this.leftInactiveWidget,
      required this.rightInactiveWidget,
      required this.bgColor,
      required this.didSwitch,
      this.padding = const EdgeInsets.all(0)});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        didSwitch(!value);
      },
      child: Container(
        width: width,
        height: height,
        padding: padding,
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(cornerRadius),
        ),
        child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Expanded(
            child: value ? leftActiveWidget : leftInactiveWidget,
          ),
          Expanded(
            child: value ? rightInactiveWidget : rightActiveWidget,
          )
        ]),
      ),
    );
  }
}
