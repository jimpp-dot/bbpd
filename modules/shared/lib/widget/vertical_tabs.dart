import 'package:flutter/material.dart';

import '../shared.dart';

enum IndicatorSide { start, end }

/// A vertical tab widget for flutter
class VerticalTabs extends StatefulWidget {
  final int initialIndex;
  final double tabsWidth;
  final double tabsHeight;
  final double indicatorWidth;
  final IndicatorSide? indicatorSide;
  final List<String> tabs;
  final List<Widget> contents;
  final TextDirection direction;
  final Color indicatorColor;
  final BorderRadiusGeometry? indicatorBorderRadius;
  final bool disabledChangePageFromContentView;
  final Axis contentScrollAxis;
  final Color selectedTabBackgroundColor;
  final Color tabItemBackgroundColor;
  final TextStyle selectedTabTextStyle;
  final TextStyle tabTextStyle;
  final Duration changePageDuration;
  final Curve changePageCurve;
  final Color tabsShadowColor;
  final double tabsElevation;
  final Function(int tabIndex)? onSelect;
  final Function(int tabIndex)? onTabTap;
  final Color? backgroundColor;
  final Color? tabBackgroundColor;
  final BorderRadiusGeometry? selectItemBorderRadius;
  final BorderRadiusGeometry? tabBorderRadius;

  const VerticalTabs({
    super.key,
    required this.tabs,
    required this.contents,
    this.tabsWidth = 200,
    this.tabsHeight = 48,
    this.indicatorWidth = 4,
    this.indicatorSide,
    this.initialIndex = 0,
    this.direction = TextDirection.ltr,
    this.indicatorColor = Colors.green,
    this.indicatorBorderRadius,
    this.disabledChangePageFromContentView = false,
    this.contentScrollAxis = Axis.vertical,
    this.selectedTabBackgroundColor = const Color(0x1100ff00),
    this.tabItemBackgroundColor = const Color(0xfff8f8f8),
    this.selectedTabTextStyle = const TextStyle(color: Colors.black),
    this.tabTextStyle = const TextStyle(color: Colors.black38),
    this.changePageCurve = Curves.easeInOut,
    this.changePageDuration = const Duration(milliseconds: 300),
    this.tabsShadowColor = Colors.black54,
    this.tabsElevation = 2.0,
    this.onSelect,
    this.onTabTap,
    this.backgroundColor,
    this.tabBackgroundColor,
    this.selectItemBorderRadius,
    this.tabBorderRadius,
  }) : assert(tabs.length == contents.length);

  @override
  _VerticalTabsState createState() => _VerticalTabsState();
}

class _VerticalTabsState extends State<VerticalTabs>
    with TickerProviderStateMixin {
  late int _selectedIndex;
  bool? _changePageByTapView;

  PageController pageController = PageController();

  List<AnimationController> animationControllers = [];

  ScrollPhysics pageScrollPhysics = const NeverScrollableScrollPhysics();

  @override
  void initState() {
    _selectedIndex = widget.initialIndex;
    for (int i = 0; i < widget.tabs.length; i++) {
      animationControllers.add(AnimationController(
        duration: const Duration(milliseconds: 400),
        vsync: this,
      ));
    }
    _selectTab(widget.initialIndex);

    if (widget.disabledChangePageFromContentView == true)
      pageScrollPhysics = const NeverScrollableScrollPhysics();

    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      pageController.jumpToPage(widget.initialIndex);
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: widget.direction,
      child: Container(
        color: widget.backgroundColor ?? Theme.of(context).canvasColor,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  _buildVerticalTabs(),
                  Expanded(
                    child: _buildPageViews(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// 竖向tab
  Widget _buildVerticalTabs() {
    return Container(
      padding: EdgeInsets.only(bottom: Util.iphoneXBottom),
      decoration: BoxDecoration(
        color: widget.tabBackgroundColor ?? Theme.of(context).canvasColor,
        borderRadius: widget.tabBorderRadius,
      ),
      width: widget.tabsWidth,
      child: ListView.builder(
        itemCount: widget.tabs.length,
        itemBuilder: (context, index) {
          AlignmentDirectional alignment = AlignmentDirectional.centerStart;
          if (widget.direction == TextDirection.rtl) {
            alignment = AlignmentDirectional.centerEnd;
          }

          Widget child = Container(
            width: widget.tabsWidth,
            height: widget.tabsHeight,
            alignment: Alignment.center,
            padding: const EdgeInsets.only(left: 6, right: 6),
            child: Text(
              widget.tabs[index],
              softWrap: true,
              style: _selectedIndex == index
                  ? widget.selectedTabTextStyle
                  : widget.tabTextStyle,
            ),
          );

          Color itemBGColor = widget.tabItemBackgroundColor;
          if (_selectedIndex == index)
            itemBGColor = widget.selectedTabBackgroundColor;

          return Stack(
            alignment: AlignmentDirectional.centerStart,
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  if (widget.onTabTap != null) {
                    widget.onTabTap!(index);
                  }
                  _changePageByTapView = true;
                  setState(() {
                    _selectTab(index);
                  });

                  pageController.animateToPage(index,
                      duration: widget.changePageDuration,
                      curve: widget.changePageCurve);
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: itemBGColor,
                    borderRadius: widget.selectItemBorderRadius,
                  ),
                  alignment: alignment,
                  child: child,
                ),
              ),
              if (_selectedIndex == index)
                PositionedDirectional(
                  width: widget.indicatorWidth,
                  start: 0,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: widget.indicatorBorderRadius ??
                          BorderRadius.circular(2),
                      color: widget.indicatorColor,
                    ),
                    width: 4,
                    height: 14,
                  ),
                ),
            ],
          );
        },
      ),
    );
  }

  /// pageViews
  Widget _buildPageViews() {
    return PageView.builder(
      scrollDirection: widget.contentScrollAxis,
      physics: pageScrollPhysics,
      onPageChanged: (index) {
        if (_changePageByTapView == false || _changePageByTapView == null) {
          _selectTab(index);
        }
        if (_selectedIndex == index) {
          _changePageByTapView = null;
        }
        setState(() {});
      },
      controller: pageController,

      // the number of pages
      itemCount: widget.contents.length,

      // building pages
      itemBuilder: (BuildContext context, int index) {
        return widget.contents[index];
      },
    );
  }

  void _selectTab(index) {
    _selectedIndex = index;
//    for (AnimationController animationController in animationControllers) {
//      animationController.reset();
//    }
//    animationControllers[index].forward();

    if (widget.onSelect != null) {
      widget.onSelect!(_selectedIndex);
    }
  }
}

class VerticalTabItem {
  final int index;
  final String text;
  final TextStyle selectedTabTextStyle;
  final TextStyle tabTextStyle;
  final double width;
  final double height;

  VerticalTabItem({
    required this.index,
    required this.text,
    required this.selectedTabTextStyle,
    required this.tabTextStyle,
    required this.width,
    required this.height,
  });
}
