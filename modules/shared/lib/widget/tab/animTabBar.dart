import 'dart:math';
import 'dart:ui';

import 'package:shared/dart_extensions/widget/common_extension.dart';
import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import '../../assets.dart';

/// 每个Tab项对应的数据
class _TabItem {
  GlobalKey globalKey;
  String title;
  int index;
  double selectWidth = 0;
  double unSelectWidth = 0;

  _TabItem({required this.globalKey, required this.title, required this.index});
}

typedef OnTap = void Function(int index);

class AnimTabBar extends StatefulWidget {
  final List<String> titles;
  final double selectedFontSize;
  final double unselectedFontSize;
  final Color? selectedFontColor;
  final Color? unselectedFontColor;
  final FontWeight selectedFontWeight;
  final FontWeight unselectedFontWeight;
  final Color? indicatorColor;
  final ExtendedTabController? controller;
  final double height;
  final double marginStart;
  final double marginEnd;
  final double marginBottom;
  final double spacing;
  final double indicatorHeight;
  final double indicatorBottom;
  final List<int> redDotIndex;
  final OnTap? onTap;
  final bool showIndicator;
  final bool showTextIndicator;
  final AlignmentGeometry alignment;
  final bool isScrollable; //是否滚动
  final double notSelectedRedDotTop;
  final double notSelectedRedDotEnd;
  final int prefixIndex; // 首页热门TAB，在未选中时需要加一个🔥的前缀
  final String? prefixStr;

  ///TabBar的最大宽度，子tab默认居左显示，[maxWidthForCenter]>0时居中显示子tab
  final double? maxWidthForCenter;

  const AnimTabBar({
    super.key,
    required this.titles,
    this.controller,
    this.marginStart = 0,
    this.marginEnd = 0,
    this.marginBottom = 0,
    this.spacing = 8.0,
    this.selectedFontSize = 18.0,
    this.unselectedFontSize = 16.0,
    this.selectedFontColor,
    this.unselectedFontColor,
    this.selectedFontWeight = FontWeight.w700,
    this.unselectedFontWeight = FontWeight.w500,
    this.indicatorColor,
    this.height = 44.0,
    this.redDotIndex = const [],
    this.onTap,
    this.maxWidthForCenter,
    this.indicatorHeight = 72 / 3,
    this.indicatorBottom = 0,
    this.showIndicator = true,
    this.showTextIndicator = false,
    this.alignment = AlignmentDirectional.center,
    this.isScrollable = true,
    this.notSelectedRedDotTop = 7.0,
    this.notSelectedRedDotEnd = 5.0,
    this.prefixIndex = -1,
    this.prefixStr,
  });

  Color get iColor => indicatorColor ?? R.color.mainBrandColor.withOpacity(0.6);

  Color get sFontColor => selectedFontColor ?? R.color.mainTextColor;

  Color get uFontColor =>
      unselectedFontColor ?? R.color.mainTextColor.withOpacity(0.6);

  @override
  _AnimTabBarState createState() => _AnimTabBarState();
}

class _AnimTabBarState extends State<AnimTabBar> with TickerProviderStateMixin {
  ScrollController? _scrollController;
  double _scrollOffset = 0.0;

  double _position = 0.0;
  final List<_TabItem> _tabItems = [];
  GlobalKey? _indicatorKey;
  double? _indicatorStart;
  final double _indicatorWidth = 150 / 3;

  final GlobalKey _scrollViewKey = GlobalKey();

  int _curIndex = 0;

  AnimationController? _animationController;
  late Animation<double> _fontSizeAnimation;
  late Animation<Color?> _colorAnimation;
  late Animation<FontWeight> _fontWeightAnimation;
  bool _isAnimating = false;
  final int _animDuration = 200;

  @override
  void initState() {
    super.initState();

    _init();
  }

  void _init() {
    _curIndex = widget.controller?.index ?? 0;

    _indicatorKey = GlobalKey();

    _tabItems.clear();
    for (int i = 0; i < widget.titles.length; i++) {
      _TabItem tabItem = _TabItem(
          globalKey: GlobalKey(),
          title: ((needPrefix &&
                      i == widget.prefixIndex &&
                      _curIndex != widget.prefixIndex)
                  ? widget.prefixStr!
                  : '') +
              widget.titles[i],
          index: i);
      InlineSpan span = TextSpan(
          text: tabItem.title,
          style: TextStyle(
            fontSize: widget.selectedFontSize,
            fontWeight: widget.selectedFontWeight,
          ));
      final tp = TextPainter(
          text: span, maxLines: 1, textDirection: TextDirection.ltr);
      tp.layout();
      tabItem.selectWidth = tp.width;

      InlineSpan span1 = TextSpan(
          text: tabItem.title,
          style: TextStyle(
            fontSize: widget.unselectedFontSize,
            fontWeight: widget.unselectedFontWeight,
          ));
      final tp1 = TextPainter(
          text: span1, maxLines: 1, textDirection: TextDirection.ltr);
      tp1.layout();
      tabItem.unSelectWidth = tp1.width;
      _tabItems.add(tabItem);
    }

    _scrollController?.dispose();
    _scrollController = ScrollController(keepScrollOffset: true);
    _scrollController!.addListener(_onScroll);

    widget.controller?.removeListener(_onTabChanged);
    widget.controller?.removeScrollListener(_onPositionChanged);

    widget.controller?.addListener(_onTabChanged);
    widget.controller?.addScrollListener(_onPositionChanged);

    _animationController?.dispose();
    _animationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: _animDuration));
    _fontSizeAnimation = Tween<double>(
            begin: widget.unselectedFontSize, end: widget.selectedFontSize)
        .animate(_animationController!)
      ..addListener(() {
        _refresh();
      });
    _colorAnimation =
        ColorTween(begin: widget.uFontColor, end: widget.sFontColor)
            .animate(_animationController!);
    _fontWeightAnimation = FontWeightTween(
            begin: widget.unselectedFontWeight, end: widget.selectedFontWeight)
        .animate(_animationController!);
    _animationController!.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _isAnimating = false;
      }
    });

    // 初始化也一下TAB滑动的位置，兼容默认TAB不在当前屏幕的问题
    WidgetsBinding.instance.addPostFrameCallback((_) => _onPositionChanged(0));
  }

  @override
  void didUpdateWidget(AnimTabBar oldWidget) {
    super.didUpdateWidget(oldWidget);
    bool same = true;
    if (widget.titles.length == oldWidget.titles.length) {
      for (int i = 0; i < widget.titles.length; i++) {
        if (widget.titles[i] != oldWidget.titles[i]) {
          same = false;
          break;
        }
      }
      if (oldWidget.controller != widget.controller ||
          oldWidget.sFontColor != widget.sFontColor ||
          oldWidget.uFontColor != widget.uFontColor) {
        same = false;
      }
    } else {
      same = false;
    }

    if (!same) {
      _init();
    }
  }

  @override
  void dispose() {
    _scrollController?.dispose();
    _animationController?.dispose();
    super.dispose();
  }

  double get startMargin {
    if ((widget.maxWidthForCenter ?? 0) > 0) {
      double totalWidth = 0;
      for (var _ in _tabItems) {
        totalWidth += _.unSelectWidth + widget.spacing + widget.spacing;
      }
      return max((widget.maxWidthForCenter! - totalWidth) / 2, 0);
    } else {
      return widget.marginStart;
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_indicatorStart == null) {
      Future.delayed(Duration.zero, () {
        _changeIndicatorPosition(recreateKey: false);
      });
    }
    return SizedBox(
      height: widget.height,
      child: Stack(
        children: [
          if (widget.showIndicator && _indicatorStart != null)
            _buildIndicator(),
          _buildTitlesBar(),
        ],
      ),
    );
  }

  PositionedDirectional _buildTitlesBar() {
    return PositionedDirectional(
      start: 0,
      end: 0,
      top: 0,
      bottom: widget.marginBottom,
      child: widget.isScrollable
          ? ScrollConfiguration(
              behavior: MyBehavior(),
              child: SingleChildScrollView(
                key: _scrollViewKey,
                controller: _scrollController,
                scrollDirection: Axis.horizontal,
                child: Container(
                  margin: EdgeInsetsDirectional.only(
                      start: startMargin, end: widget.marginEnd),
                  child: Row(
                    children: _buildTabs(),
                  ),
                ),
              ),
            )
          : Container(
              margin: EdgeInsetsDirectional.only(
                  start: startMargin, end: widget.marginEnd),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: _buildTabs(),
              ),
            ),
    );
  }

  PositionedDirectional _buildIndicator() {
    return PositionedDirectional(
      start: _indicatorStart! - _scrollOffset + startMargin,
      bottom: widget.indicatorBottom,
      child: IgnorePointer(
        child: Opacity(
          opacity: _getIndicatorOpacity(),
          child: SizedBox(
            width: _indicatorWidth,
            height: widget.indicatorHeight,
            child: MultiframeImage.asset(
              R.imagePath('tab_indicator.webp',
                  package: ComponentManager.MANAGER_BASE_CORE),
              key: _indicatorKey,
              color: widget.iColor,
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> _buildTabs() {
    List<Widget> tabItems = [];
    for (int i = 0; i < _tabItems.length; i++) {
      Widget tab = _buildTab(_tabItems[i], i);
      tabItems.add(tab);
    }
    return tabItems;
  }

  Widget _buildTab(_TabItem tabItem, int index) {
    double? fs = _getFontSizeByIndex(index);
    FontWeight? fw = _getFontWeightByIndex(index);

    InlineSpan span = TextSpan(
        text: tabItem.title,
        style: TextStyle(
          textBaseline: TextBaseline.ideographic,
          color: _getColorByIndex(index),
          fontSize: fs,
          fontWeight: fw,
        ));
    final tp =
        TextPainter(text: span, maxLines: 1, textDirection: TextDirection.ltr);
    tp.layout();

    return GestureDetector(
      onTap: () {
        _onTapTitle(index);
      },
      child: Container(
          key: tabItem.globalKey,
          width: tp.width,
          height: widget.height,
          alignment: widget.alignment,
          margin: EdgeInsetsDirectional.only(
              start: widget.spacing, end: widget.spacing, top: 0, bottom: 0),
          child: LayoutBuilder(
            builder: (context, _) {
              return Stack(
                clipBehavior: Clip.none,
                children: [
                  Align(
                    alignment: widget.alignment,
                    child: SizedBox(
                        width: tp.width,
                        child: FittedBox(
                          fit: BoxFit.fitWidth,
                          child: Column(
                            children: [
                              Text(
                                tabItem.title,
                                style: TextStyle(
                                  color: _getColorByIndex(index),
                                  fontSize: widget.selectedFontSize,
                                  fontWeight: _getFontWeightByIndex(index),
                                  textBaseline: TextBaseline.ideographic,
                                ),
                              ),
                              if (widget.showTextIndicator &&
                                  index == _curIndex)
                                R.img(BaseAssets.home_top_tab_selected,
                                    package: BaseAssets.package,
                                    width: 66 / 3,
                                    height: 11 / 2),
                            ],
                          ),
                        )),
                  ),
                  if (_withRedDot(index))
                    PositionedDirectional(
                      top: index != _curIndex ? widget.notSelectedRedDotTop : 3,
                      end:
                          index != _curIndex ? widget.notSelectedRedDotEnd : -6,
                      child: _buildRedDot(),
                    ),
                ],
              );
            },
          )),
    );
  }

  Widget _buildRedDot() {
    return Container(
      width: 8,
      height: 8,
      decoration: BoxDecoration(
          shape: BoxShape.circle, color: R.color.thirdBrightColor),
    );
  }

  bool get needPrefix =>
      widget.prefixIndex >= 0 &&
      widget.prefixStr != null &&
      widget.prefixStr!.isNotEmpty;

  /// TabBarView的页面切换完成时的回调，负责改变当前tab索引以及刷新indicator位置
  /// 此回调为被动响应TabBarView内容区的滚动
  void _onTabChanged() {
    if (needPrefix &&
        (widget.controller?.previousIndex == widget.prefixIndex ||
            widget.controller?.index == widget.prefixIndex)) {
      _init();
    }
    _curIndex = widget.controller?.index ?? 0;
    if (!widget.isScrollable) {
      _onPositionChanged(widget.controller?.scrollPosition ?? 0);
    }
    _changeIndicatorPosition(recreateKey: true);
  }

  _refresh() {
    if (mounted) {
      setState(() {});
    }
  }

  double _getIndicatorStart() {
    if (!widget.isScrollable) {
      RenderBox renderBox = _tabItems[_curIndex]
          .globalKey
          .currentContext
          ?.findRenderObject() as RenderBox;
      double offsetX = renderBox.localToGlobal(Offset.zero).dx;
      double sizeW = renderBox.size.width;
      if (_curIndex == 0) {
        offsetX = widget.marginStart; //控件初始化时offsetX取不准
      }
      return offsetX +
          (sizeW - _indicatorWidth) / 2.0 -
          widget.marginStart +
          _scrollOffset;
    }
    int i = 0;
    double start = 0;
    while (i < _curIndex) {
      start += _tabItems[i].unSelectWidth + 2 * widget.spacing;
      i++;
    }
    double curItemWidth = _tabItems[i].selectWidth;
    start += (curItemWidth - _indicatorWidth) / 2 + widget.spacing;
    return start;
  }

  void _changeIndicatorPosition({bool recreateKey = true}) {
    if (recreateKey) {
      _indicatorKey = GlobalKey();
    }
    _indicatorStart = _getIndicatorStart();
    _refresh();
  }

  bool get _isBuilding =>
      SchedulerBinding.instance.schedulerPhase ==
      SchedulerPhase.persistentCallbacks;

  /// TabBarView滚动时的回调，负责把当前Tab居中
  void _onPositionChanged(double position) {
    if (_isBuilding) return; // 构建中不能获取控件的尺寸，所以需要返回
    double offset = widget.controller?.offset ?? 0;
    double position = (widget.controller?.index ?? 0) + offset;
    if (!widget.isScrollable) {
      double offset = widget.controller?.offset ?? 0;
      _scrollOffset = offset;
      _refresh();
      return;
    }
    if ((_position - position).abs() < 0.00000001) return;

    if (!_scrollController!.hasClients) return;

    _position = position;
    //根据position更新scroll位置
    double destScrollOffset = 0.0;
    for (int i = 0; i < _position.floor(); i++) {
      destScrollOffset +=
          (_tabItems[i].globalKey.currentContext?.size?.width ?? 0);
    }
    double currentItemWidth =
        _tabItems[_position.floor()].globalKey.currentContext?.size?.width ?? 0;
    destScrollOffset += currentItemWidth * (position - position.floor());
    double listWidth = _scrollViewKey.currentContext?.size?.width ?? 0;
    destScrollOffset -= (listWidth - currentItemWidth) / 2;
    if (destScrollOffset < 0) destScrollOffset = 0;
    if (destScrollOffset > _scrollController!.position.maxScrollExtent) {
      destScrollOffset = _scrollController!.position.maxScrollExtent;
    }
    _scrollController!.animateTo(
      destScrollOffset,
      duration: Duration(milliseconds: _animDuration),
      curve: Curves.easeOutSine,
    );

    _refresh();
  }

  /// TabBar本身滚动时的回调，负责更新滚动偏移量以及触发界面刷新
  void _onScroll() {
    if (widget.isScrollable) {
      ScrollPosition scrollPosition = _scrollController!.position;
      double offset = scrollPosition.pixels;
      _scrollOffset = offset;
    }
    _refresh();
  }

  double? _getFontSizeByIndex(int index) {
    double? fontSize = widget.unselectedFontSize;

    if (_isAnimating) {
      if (index == _curIndex) {
        return _fontSizeAnimation.value;
      } else {
        return fontSize;
      }
    }

    int curIndex = _curIndex;
    double offset = widget.controller?.offset ?? 0;
    int nextIndex = _getNextIndex(offset, curIndex);
    if (index != curIndex && index != nextIndex) {
      return fontSize;
    }

    if (index == curIndex) {
      fontSize = lerpDouble(
          widget.selectedFontSize, widget.unselectedFontSize, offset.abs());
    } else if (index == nextIndex) {
      fontSize = lerpDouble(
          widget.unselectedFontSize, widget.selectedFontSize, offset.abs());
    }
    return fontSize;
  }

  int _getNextIndex(double offset, int curIndex) {
    int nextIndex;
    if (offset >= 0) {
      nextIndex = min(curIndex + 1, _tabItems.length);
    } else {
      nextIndex = max(0, curIndex - 1);
    }
    return nextIndex;
  }

  Color? _getColorByIndex(int index) {
    Color? color = widget.uFontColor;

    if (_isAnimating) {
      if (index == _curIndex) {
        return _colorAnimation.value;
      } else {
        return color;
      }
    }

    int curIndex = _curIndex;
    double offset = widget.controller?.offset ?? 0;
    int nextIndex = _getNextIndex(offset, curIndex);
    if (index != curIndex && index != nextIndex) {
      return color;
    }

    if (index == curIndex) {
      // color = Color.lerp(widget.sFontColor, widget.uFontColor, offset.abs());
      color = widget.sFontColor;
    } else if (index == nextIndex) {
      // color = Color.lerp(widget.uFontColor, widget.sFontColor, offset.abs());
      color = widget.uFontColor;
    }

    return color;
  }

  FontWeight? _getFontWeightByIndex(int index) {
    FontWeight? weight = widget.unselectedFontWeight;

    if (_isAnimating) {
      if (index == _curIndex) {
        return _fontWeightAnimation.value;
      } else {
        return weight;
      }
    }

    int curIndex = _curIndex;
    double offset = widget.controller?.offset ?? 0;
    int nextIndex = _getNextIndex(offset, curIndex);
    if (index != curIndex && index != nextIndex) {
      return weight;
    }

    if (index == curIndex) {
      weight = FontWeight.lerp(
          widget.selectedFontWeight, widget.unselectedFontWeight, offset.abs());
    } else if (index == nextIndex) {
      weight = FontWeight.lerp(
          widget.unselectedFontWeight, widget.selectedFontWeight, offset.abs());
    }
    return weight;
  }

  /// 此回调为主动响应用户在TabBar上的点击事件
  void _onTapTitle(int index) {
    if (widget.onTap != null) {
      widget.onTap!(index);
    }
    if (_curIndex == index) return;
    _curIndex = index;
    _startSelectionChangeAnimation();
    widget.controller?.index = _curIndex;
  }

  void _startSelectionChangeAnimation() {
    if (_isAnimating) return;

    _animationController?.reset();
    _animationController?.forward();
    _isAnimating = true;

    Future.delayed(Duration(milliseconds: _animDuration), () {
      _isAnimating = false;
      _refresh();
    });
  }

  double _getIndicatorOpacity() {
    double offset = widget.controller?.offset ?? 0;
    if (offset > 1 || offset < -1) {
      offset = 0;
    }
    double opacity = 1 - offset.abs();
    return opacity;
  }

  bool _withRedDot(int index) {
    return widget.redDotIndex.contains(index) &&
        widget.controller?.offset.abs() == 0.0;
  }
}

/// for remove GlowingOverscrollIndicator 去掉滑动到头时的边缘发光效果
class MyBehavior extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
      BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}

class FontWeightTween extends Tween<FontWeight> {
  FontWeightTween({super.begin, super.end});

  @override
  FontWeight lerp(double t) => FontWeight.lerp(begin, end, t)!;
}
