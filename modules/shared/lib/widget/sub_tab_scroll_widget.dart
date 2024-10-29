import 'dart:math';
import 'package:shared/src/util.dart';
import 'package:shared/src/theme/themes.dart';
import 'package:flutter/material.dart';
import 'red_dot.dart';

class SubTabScrollWidget extends StatefulWidget {
  final TabController? controller;
  final List<String> tabLabels;
  final List<int>? redDotIndex;
  final Color? selectColor;
  final Color? unSelectColor;
  final double? horizonMargin;
  final Color? allBgColor;
  final Color? selectedBgColor;

  final bool? isUseDeflautColor;

  const SubTabScrollWidget({
    required this.controller,
    required this.tabLabels,
    this.redDotIndex,
    this.selectColor,
    this.unSelectColor,
    this.allBgColor,
    this.selectedBgColor,
    this.isUseDeflautColor = false,
    this.horizonMargin,
    super.key,
  });

  @override
  SubTabScrollState createState() {
    return SubTabScrollState();
  }
}

class SubTabScrollState extends State<SubTabScrollWidget>
    with TickerProviderStateMixin {
  late Color selectColor;
  late Color unSelectColor;
  late double horizonMargin;

  int _curIndex = 0;
  int _tabLength = 1;
  double _tabWidth = 0;

  @override
  void initState() {
    super.initState();

    selectColor = widget.selectColor ?? R.color.mainTextColor;
    unSelectColor = widget.unSelectColor ?? R.color.thirdTextColor;
    horizonMargin = widget.horizonMargin ?? 20;
    _tabLength = widget.tabLabels.isNotEmpty ? widget.tabLabels.length : 1;
    _tabWidth = (Util.width - 2 * horizonMargin - 2 * 2) / _tabLength;
    _curIndex = widget.controller?.index ?? 0;

    widget.controller?.addListener(_onTabChanged);
    widget.controller?.animation
        ?.addListener(_handleTabControllerAnimationTick);
  }

  @override
  void didUpdateWidget(SubTabScrollWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    _tabLength = widget.tabLabels.isNotEmpty ? widget.tabLabels.length : 1;
    _tabWidth = (Util.width - 2 * horizonMargin - 2 * 2) / _tabLength;
  }

  @override
  void dispose() {
    widget.controller?.removeListener(_onTabChanged);
    widget.controller?.animation
        ?.removeListener(_handleTabControllerAnimationTick);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 38.0,
      margin: EdgeInsetsDirectional.only(
          start: horizonMargin, end: horizonMargin, bottom: 0.0, top: 4.0),
      padding: const EdgeInsets.all(2),
      decoration: ShapeDecoration(
        color: widget.allBgColor ?? R.color.secondBgColor,
        shape: const StadiumBorder(),
      ),
      child: Stack(
        children: [
          PositionedDirectional(
            start: _getIndicatorMarginStart(),
            child: Container(
              height: 34,
              width: _tabWidth,
              decoration: ShapeDecoration(
                color: widget.selectedBgColor ?? R.color.mainBgColor,
                shape: const StadiumBorder(),
              ),
            ),
          ),
          Row(
            children: widget.tabLabels
                .map(
                    (_) => buildSubTab(context, _, widget.tabLabels.indexOf(_)))
                .toList(),
          ),
        ],
      ),
    );
  }

  Widget buildSubTab(BuildContext context, String tabLabel, int index) {
    return Expanded(
      child: InkWell(
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        onTap: () => _onTabSelected(index),
        child: Container(
          height: 34,
          alignment: Alignment.center,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                tabLabel,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: _getColorByIndex(index),
                ),
              ),
              if (widget.redDotIndex != null &&
                  widget.redDotIndex!.length > index &&
                  widget.redDotIndex![index] > 0)
                RedDot(
                  num: widget.redDotIndex![index],
                  width: 17,
                  height: 17,
                  showBorder: false,
                ),
            ],
          ),
        ),
      ),
    );
  }

  void _onTabSelected(int index) {
    widget.controller?.animateTo(index);
  }

  Color _getColorByIndex(int index) {
    Color color = unSelectColor;
    int curIndex = _curIndex;
    double offset = widget.controller?.offset ?? 0;
    int nextIndex = _getNextIndex(offset, curIndex);

    if (widget.isUseDeflautColor == true) {
      if (index == curIndex) {
        color = selectColor;
      } else if (index == nextIndex) {
        color = unSelectColor;
      }
      return color;
    } else {
      if (index == curIndex) {
        color = Color.lerp(selectColor, unSelectColor, offset.abs()) ?? color;
      } else if (index == nextIndex) {
        color = Color.lerp(unSelectColor, selectColor, offset.abs()) ?? color;
      }
    }

    if (index != curIndex && index != nextIndex) {
      return color;
    }
    if (widget.isUseDeflautColor == true) {
      if (index == curIndex) {
        color = selectColor;
      } else if (index == nextIndex) {
        color = unSelectColor;
      }
    } else {
      if (index == curIndex) {
        color = Color.lerp(selectColor, unSelectColor, offset.abs()) ?? color;
      } else if (index == nextIndex) {
        color = Color.lerp(unSelectColor, selectColor, offset.abs()) ?? color;
      }
    }
    return color;
  }

  int _getNextIndex(double offset, int curIndex) {
    int nextIndex;
    if (offset >= 0) {
      nextIndex = min(curIndex + 1, widget.tabLabels.length);
    } else {
      nextIndex = max(0, curIndex - 1);
    }
    return nextIndex;
  }

  double _getIndicatorMarginStart() {
    double marginStart;
    double max = _tabWidth;

    int curIndex = _curIndex;
    double offset = widget.controller?.offset ?? 0;

    if (0 == curIndex) {
      marginStart = _offSetStart(0.0, max, offset.abs());
    } else {
      marginStart = _offSetStart(curIndex * max, max, offset);
    }
    return marginStart;
  }

  double _offSetStart(double begin, double amplitude, double percent) {
    return begin + amplitude * percent;
  }

  void _onTabChanged() {
    _curIndex = widget.controller?.index ?? 0;
    if (mounted) {
      setState(() {});
    }
  }

  void _handleTabControllerAnimationTick() {
    if (mounted) {
      setState(() {});
    }
  }
}
