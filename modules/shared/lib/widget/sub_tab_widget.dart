import 'package:flutter/material.dart';

import '../shared.dart';

class SubTabWidget extends StatefulWidget {
  final ValueChanged<int>? onTabSelected;
  final List<String> tabLabels;
  final Color? selectedColor;
  final Color? selectedTextColor;
  final Color? backgroundColor;
  final AssetImage? selectedImg;
  final double textSize;

  const SubTabWidget(
      {super.key,
      this.onTabSelected,
      required this.tabLabels,
      this.selectedColor,
      this.selectedTextColor,
      this.backgroundColor,
      this.textSize = 13,
      this.selectedImg});

  @override
  _SubTabWidgetState createState() => _SubTabWidgetState();
}

class _SubTabWidgetState extends State<SubTabWidget> {
  int _curSelection = 0;

  @override
  void initState() {
    super.initState();
  }

  void _onTabSelected(int index) {
    if (_curSelection == index) return;

    setState(() {
      _curSelection = index;
    });
    if (widget.onTabSelected != null) widget.onTabSelected!(index);
  }

  Widget buildSubTab(BuildContext context, String tabLabel, int index) {
    Color selectedBgColor = widget.selectedColor ?? Colors.white;
    Color bgColor = widget.backgroundColor ?? R.color.secondBgColor;
    Color selectedTextColor = widget.selectedTextColor ?? Colors.black;

    Decoration decoration = ShapeDecoration(
      color: _curSelection == index ? selectedBgColor : bgColor,
      shape: const StadiumBorder(),
    );
    if (widget.selectedImg != null && _curSelection == index) {
      decoration = BoxDecoration(
        image: DecorationImage(
          image: widget.selectedImg!,
          fit: BoxFit.contain,
        ),
      );
    }

    return Expanded(
      child: InkWell(
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        onTap: () => _onTabSelected(index),
        child: Container(
          height: 34,
          decoration: decoration,
          alignment: Alignment.center,
          child: Text(
            tabLabel,
            style: TextStyle(
              fontSize: widget.textSize,
              fontWeight: FontWeight.w600,
              color: _curSelection == index
                  ? selectedTextColor
                  : R.color.thirdTextColor,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Color bgColor = widget.backgroundColor ?? R.color.secondBgColor;
    return Container(
      height: 38.0,
      margin:
          const EdgeInsetsDirectional.only(start: 16.0, end: 16.0, top: 15.0),
      padding: const EdgeInsets.all(2),
      decoration: ShapeDecoration(
        color: bgColor,
        shape: const StadiumBorder(),
      ),
      child: Row(
        children: widget.tabLabels
            .map((_) => buildSubTab(context, _, widget.tabLabels.indexOf(_)))
            .toList(),
      ),
    );
  }
}
