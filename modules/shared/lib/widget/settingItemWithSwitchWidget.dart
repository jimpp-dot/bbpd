import 'package:shared/shared.dart';
import 'package:flutter/material.dart';

class SettingItemWithSwitchWidget extends StatefulWidget {
  final String title;
  final String? subTitle;
  final bool value;
  final ValueChanged<bool> onChanged;
  final EdgeInsetsGeometry? contentPadding;
  final Color? titleColor;

  const SettingItemWithSwitchWidget(
      {super.key,
      required this.title,
      this.subTitle,
      required this.value,
      required this.onChanged,
      this.contentPadding,
      this.titleColor});

  @override
  _SettingItemWithSwitchWidgetState createState() =>
      _SettingItemWithSwitchWidgetState();
}

class _SettingItemWithSwitchWidgetState
    extends State<SettingItemWithSwitchWidget> {
  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      contentPadding: widget.contentPadding,
      inactiveTrackColor: R.color.switchInActiveColor,
      activeColor: Colors.white,
      title: Text(
        widget.title,
        textScaleFactor: 1.0,
        style: TextStyle(
          fontSize: 16,
          color: widget.titleColor ?? R.color.mainTextColor,
        ),
      ),
      subtitle: widget.subTitle != null
          ? Text(
              widget.subTitle!,
              textScaleFactor: 1.0,
              style: TextStyle(fontSize: 12.0, color: R.color.thirdTextColor),
            )
          : null,
      value: widget.value,
      onChanged: widget.onChanged,
    );
  }
}
