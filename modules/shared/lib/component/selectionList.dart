import 'dart:async';

import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class SelectionData {
  SelectionData(this.index, this.label, this.iconPath,
      {this.selected = false}) {
    globalKey = GlobalKey();
  }

  String label;
  String iconPath;
  late GlobalKey globalKey;
  int index;
  bool selected;
}

typedef OnSelectionChanged = void Function(int index);

class SelectionList extends StatefulWidget {
  final List<SelectionData> dataItems;
  final OnSelectionChanged? _onSelectionChanged;
  final double paddingLeft;
  final double paddingRight;
  final double gap;
  final bool bgUseGradient;
  final int initIndex;
  final OnTapCallback? onTap;

  const SelectionList(this.dataItems, this._onSelectionChanged,
      {this.paddingLeft = 18,
      this.paddingRight = 18,
      this.gap = 12,
      this.bgUseGradient = false,
      this.initIndex = 0,
      this.onTap,
      super.key});

  @override
  SelectionListState createState() => SelectionListState();
}

class SelectionListState extends State<SelectionList> {
  late ScrollController _controller;
  int _selectedIndex = 0;
  ScrollDirection? _scrollDirection;
  bool _scrolling = false;

  @override
  void initState() {
    super.initState();
    _controller = ScrollController(keepScrollOffset: true);
    _controller.addListener(_onScroll);

    if (widget.initIndex != 0) {
      WidgetsBinding.instance.addPostFrameCallback((Duration timeStamp) {
        smoothTo(widget.initIndex, true);
      });
    }
  }

  @override
  void dispose() {
    _controller.removeListener(_onScroll);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: NotificationListener<ScrollNotification>(
        onNotification: (ScrollNotification notification) {
          if (notification is UserScrollNotification) {
            UserScrollNotification user = notification;
            Log.d(
                '_SelectionListState.build ScrollDirection = ${user.direction}');
            if (user.direction == ScrollDirection.idle &&
                _scrollDirection != user.direction) {
//              _refresh();
              _notifySelectionChanged();
            }
            _scrollDirection = user.direction;
          }
          return false;
        },
        child: SingleChildScrollView(
          padding: EdgeInsets.only(
              left: widget.paddingLeft - widget.gap / 2,
              right: widget.paddingRight - widget.gap / 2),
          scrollDirection: Axis.horizontal,
          controller: _controller,
          physics: const ClampingScrollPhysics(),
          child: Row(
            children: [
              for (SelectionData item in widget.dataItems)
                SelectionItem(
                  item.index,
                  _onTap,
                  item.label,
                  item.iconPath,
                  key: item.globalKey,
                  selected: item.index == _selectedIndex,
                  gap: widget.gap,
                  bgUseGradient: widget.bgUseGradient,
                ),
            ],
          ),
        ),
      ),
    );
  }

  void _onScroll() {
    if (_scrolling) {
      return;
    }

    ScrollPosition scrollPosition = _controller.position;
    double offset = scrollPosition.pixels;

    int currentIndex = _getCurrentIndex(offset);
    Log.d(
        '_SelectionListState._onScroll offset=$offset, currentIndex=$currentIndex');

    int newCurrentIndex = currentIndex + 1;
    if (newCurrentIndex > widget.dataItems.length - 1) {
      newCurrentIndex = widget.dataItems.length - 1;
    } else if (newCurrentIndex < 0) {
      newCurrentIndex = 0;
    }

    _changeSelectedItem(newCurrentIndex);
  }

  int _getCurrentIndex(double offset) {
    int currentIndex = 0;
    double totalWidth = 0;
    for (SelectionData item in widget.dataItems) {
      Size size = item.globalKey.currentContext!.size!;
      double width = size.width;
      Log.d(
          '_SelectionListState._getCurrentIndex currentIndex=$currentIndex, width=$width');
      totalWidth += width /* + widget.gap*/;
      if (totalWidth < offset) {
        currentIndex++;
      } else {
        break;
      }
    }

    return currentIndex;
  }

  Timer? _cancelableTimer;

  void _onTap(int index) {
    _markScrolling();

    _changeSelectedItem(index, center: true);
    _notifySelectionChanged();

    if (widget.onTap != null) {
      widget.onTap!(index);
    }
  }

  void _markScrolling() {
    _scrolling = true;
    _cancelableTimer?.cancel();
    _cancelableTimer = Timer(const Duration(milliseconds: 500), () {
      _scrolling = false;
      _refresh();
    });
  }

  _notifySelectionChanged() {
    if (widget._onSelectionChanged != null) {
      widget._onSelectionChanged!(_selectedIndex);
    }
  }

  /// 定位到某一个Tab，[fromOuter] 标识是否来自外部调用，以便在对外的回调时可区分
  void smoothTo(int index, bool fromOuter) {
    if (index < 0 || index >= widget.dataItems.length) return;
    _markScrolling();

    _changeSelectedItem(index, center: true);
    _notifySelectionChanged();
  }

  void _changeSelectedItem(int index, {bool center = false}) {
    if (_selectedIndex == index) {
      return;
    }
    Log.d('_SelectionListState._changeSelectedItem index = $index');
    _selectedIndex = index;
    _refresh();

    if (center) {
      _centerSelectedItem(index);
    }

//    _refresh();
  }

  void _refresh() {
    if (!mounted) return;
    setState(() {});
  }

  void _centerSelectedItem(int index) {
    Log.d('_SelectionListState._centerSelectedItem index = $index');
//    int currentIndex = 0;
//    double totalWidth = 0;
    double listWidth = context.size!.width;

    double offset = _getOffsetByIndex(index);
    double itemWidth =
        widget.dataItems[index].globalKey.currentContext!.size!.width;

//    ScrollPosition scrollPosition = _controller.position;
//    double listOffset = scrollPosition.pixels;

    double destOffset = offset - (listWidth / 2 - itemWidth / 2);
    double maxOffset = /*_getMaxOffset()*/ _controller.position.maxScrollExtent;
    if (destOffset > maxOffset) {
      destOffset = maxOffset;
    } else if (destOffset < 0) {
      destOffset = 0;
    }

    Log.d('_SelectionListState._centerSelectedItem destOffset = $destOffset');
    _controller.animateTo(destOffset,
        duration: const Duration(milliseconds: 200), curve: Curves.easeOut);
//    _controller.jumpTo(destOffset);
  }

  double _getOffsetByIndex(int index) {
    int currentIndex = 0;
    double offset = 0;
    for (SelectionData item in widget.dataItems) {
      if (currentIndex == index) {
        break;
      }
      Size size = item.globalKey.currentContext!.size!;
      double width = size.width;
      offset += width;
      currentIndex++;
    }

    return offset + widget.paddingLeft;
  }
}

typedef OnTapCallback = void Function(int index);

class SelectionItem extends StatefulWidget {
  final int index;
  final OnTapCallback _onTapCallback;
  final String label;
  final bool selected;
  final String iconUrl;
  final double gap;
  final bool bgUseGradient;

  const SelectionItem(this.index, this._onTapCallback, this.label, this.iconUrl,
      {super.key,
      this.selected = false,
      required this.gap,
      this.bgUseGradient = false});

  @override
  State<StatefulWidget> createState() {
    return _SelectionItemState();
  }
}

class _SelectionItemState extends State<SelectionItem> {
  @override
  Widget build(BuildContext context) {
    Log.d('SelectionItem.build index = ${widget.index}');
    return GestureDetector(
      onTap: () {
        widget._onTapCallback(widget.index);
      },
      child: Container(
          margin: EdgeInsets.only(left: widget.gap / 2, right: widget.gap / 2),
          height: (widget.selected ? 46 : 36),
//        width: (widget.selected ? 120 : 100) + gap,
          decoration: BoxDecoration(
            color: widget.bgUseGradient
                ? null
                : !widget.selected
                    ? R.color.mainBrandColor.withOpacity(0.8)
                    : R.color.mainBrandColor,
            gradient: widget.bgUseGradient
                ? LinearGradient(
                    colors: R.color.mainBrandGradientColors,
                    begin: AlignmentDirectional.centerStart,
                    end: AlignmentDirectional.centerEnd,
                  )
                : null,
            borderRadius: const BorderRadius.all(Radius.circular(8)),
          ),
//        padding: EdgeInsets.only(left: 10, right: 10, top: widget.selected ? 10 : 3, bottom: widget.selected ? 10 : 3),
//        margin: EdgeInsets.only(left: widget.selected ? 0 : 8, right: widget.selected ? 0 : 8, top: widget.selected ? 0 : 9, bottom: widget.selected ? 0 : 9),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding:
                    EdgeInsets.only(left: 10, right: widget.selected ? 6 : 6),
                child: CachedNetworkImage(
                    imageUrl: widget.iconUrl,
                    width: widget.selected ? 30 : 24,
                    height: widget.selected ? 30 : 24,
                    fit: BoxFit.fill),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.only(end: 10),
                child: Text(
                  widget.label,
                  style: TextStyle(
                    fontSize: widget.selected ? 16 : 14,
                    fontWeight:
                        widget.selected ? FontWeight.w500 : FontWeight.w400,
                    color: widget.selected
                        ? Colors.white
                        : Colors.white.withOpacity(0.8),
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.fade,
                ),
              ),
            ],
          )),
    );
  }
}
