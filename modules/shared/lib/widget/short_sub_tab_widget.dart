import 'dart:math';

import 'package:shared/shared.dart';
import 'package:flutter/material.dart';

class ShortSubTabWidget extends StatefulWidget {
  final ValueChanged<int>? onTabSelected;
  final List<String> tabLabels;
  final double? fontSize;
  final double? width;
  final double? height;
  final Color? bgColor;
  final double borderWidth;
  final Color? borderColor;
  final Color? selectBgColor;
  final Color? selectTextColor;
  final Color? unSelectTextColor;
  final int? selectIndex;

  const ShortSubTabWidget(
      {super.key,
      this.onTabSelected,
      required this.tabLabels,
      this.fontSize,
      this.width,
      this.height,
      this.bgColor,
      this.borderWidth = 0.0,
      this.borderColor,
      this.selectBgColor,
      this.selectTextColor,
      this.unSelectTextColor,
      this.selectIndex});

  @override
  _ShortSubTabWidgetState createState() => _ShortSubTabWidgetState();
}

class _ShortSubTabWidgetState extends State<ShortSubTabWidget> {
  int _curSelection = 0;

  @override
  void initState() {
    super.initState();

    _curSelection = widget.selectIndex ?? 0;
  }

  void _onTabSelected(int index) {
    if (_curSelection == index) return;

    setState(() {
      _curSelection = index;
    });
    if (widget.onTabSelected != null) widget.onTabSelected!(index);
  }

  Widget buildCustomSubTab(BuildContext context, String tabLabel, int index) {
    return Expanded(
      child: InkWell(
        onTap: () => _onTabSelected(index),
        child: Container(
          height: (widget.height ?? 38) - (widget.borderWidth > 0 ? 0 : 4),
          decoration: ShapeDecoration(
            color: _curSelection == index
                ? (widget.selectBgColor ?? Colors.white)
                : Colors.transparent,
            shape: const StadiumBorder(),
          ),
          alignment: Alignment.center,
          child: Text(
            tabLabel,
            style: TextStyle(
              fontSize: widget.fontSize ?? 13,
              fontWeight: FontWeight.w600,
              color: _curSelection == index
                  ? (widget.selectTextColor ?? Colors.black)
                  : (widget.unSelectTextColor ?? R.color.thirdTextColor),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double edgeMargin = 16.0;
    if (widget.width != null && widget.width! > 0) {
      edgeMargin = max((Util.width - widget.width!) / 2, edgeMargin);
    }

    return Container(
      height: widget.height ?? 38.0,
      margin: EdgeInsetsDirectional.only(
          start: edgeMargin, end: edgeMargin, bottom: 0.0, top: 5.0),
      padding: EdgeInsets.all(widget.borderWidth > 0 ? 0 : 2),
      decoration: ShapeDecoration(
        color: widget.bgColor ?? R.color.secondBgColor,
        shape: StadiumBorder(
          side: BorderSide(
              width: widget.borderWidth,
              color: widget.borderColor ?? Colors.white.withOpacity(0.2)),
        ),
      ),
      child: Row(
        children: widget.tabLabels
            .map((_) =>
                buildCustomSubTab(context, _, widget.tabLabels.indexOf(_)))
            .toList(),
      ),
    );
  }
}
