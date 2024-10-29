import 'package:shared/shared.dart';
import 'package:shared/component/messageCountBadge.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart' hide Selector;

typedef OnBottomTabClicked = void Function(int index);

class BaseBottomBarItem {
  int? index;
  String unselectedImgPath;
  String selectedImgPath;
  String animPath;
  double? width;
  double? height;
  bool isMessage;
  bool isProfile;

  BaseBottomBarItem({
    required this.unselectedImgPath,
    required this.selectedImgPath,
    required this.animPath,
    this.width,
    this.height,
    this.isMessage = false,
    this.isProfile = false,
  });
}

class BaseBottomBar extends StatefulWidget {
  final List<BaseBottomBarItem> items;
  final int currentIndex;
  final Color? backgroundColor;
  final OnBottomTabClicked? onBottomTabClicked;
  final double height;

  const BaseBottomBar(
      {super.key,
      required this.items,
      required this.currentIndex,
      this.backgroundColor,
      this.onBottomTabClicked,
      this.height = 50.0});

  @override
  _BaseBottomBarState createState() => _BaseBottomBarState();
}

class _BaseBottomBarState extends State<BaseBottomBar> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: widget.height,
        decoration: BoxDecoration(
          color: widget.backgroundColor ?? R.color.mainBgColor,
          border: Border(
              top: BorderSide(
            color: R.color.dividerColor,
            width: 0.5,
          )),
        ),
        child: Row(
          children: _buildItems(widget.items),
        ),
      ),
    );
  }

  List<Widget> _buildItems(List<BaseBottomBarItem> items) {
    List<Widget> tabItems = [];
    for (int i = 0; i < items.length; i++) {
      Widget tabItem = _BaseBottomBarItemWidget(
        i,
        items[i],
        _onTabClicked,
        selected: i == widget.currentIndex,
      );
      tabItems.add(tabItem);
    }
    return tabItems;
  }

  _onTabClicked(int index) {
    if (widget.onBottomTabClicked != null) {
      widget.onBottomTabClicked!(index);
    }
  }
}

class _BaseBottomBarItemWidget extends StatefulWidget {
  final BaseBottomBarItem item;
  final OnBottomTabClicked? onBottomTabClicked;
  final bool selected;
  final int index;

  const _BaseBottomBarItemWidget(this.index, this.item, this.onBottomTabClicked,
      {this.selected = false});

  @override
  _BaseBottomBarItemWidgetState createState() =>
      _BaseBottomBarItemWidgetState();
}

class _BaseBottomBarItemWidgetState extends State<_BaseBottomBarItemWidget> {
  GlobalKey _animKey = GlobalKey();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: _onTap,
        child: _buildBody(),
      ),
    );
  }

  Widget _buildBody() {
    return SizedBox(
      height: double.infinity,
      child: Stack(
        clipBehavior: Clip.none,
        children: <Widget>[
          _buildUnselected(),
          _buildSelected(),
          if (widget.item.isMessage) _buildMessageBadge(),
          if (widget.item.isProfile) _buildProfileBadge(),
        ],
      ),
    );
  }

  Align _buildMessageBadge() {
    return Align(
      alignment: Alignment.center,
      child: SizedBox(
        width: widget.item.width,
        height: widget.item.height,
        child: const Stack(clipBehavior: Clip.none, children: <Widget>[
          PositionedDirectional(end: -9, top: 0, child: MessageCountBadge()),
        ]),
      ),
    );
  }

  Widget _buildProfileBadge() {
    return Consumer<ProfilePayload>(builder: (_, bean, __) {
      bool show = bean.showProfileTabRedPoint;
      if (show != true) {
        return const SizedBox.shrink();
      }
      return Align(
        alignment: Alignment.center,
        child: SizedBox(
          width: widget.item.width,
          height: widget.item.height,
          child: Stack(clipBehavior: Clip.none, children: <Widget>[
            PositionedDirectional(
              end: -8,
              top: 0,
              child: Container(
                width: 10,
                height: 10,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: R.color.thirdBrightColor,
                ),
              ),
            ),
          ]),
        ),
      );
    });
  }

  Align _buildSelected() {
    return Align(
      alignment: Alignment.center,
      child: Visibility(
        visible: widget.selected,
        child: SizedBox(
          width: widget.item.width,
          height: widget.item.height,
          child: MultiframeImage.asset(
            widget.item.animPath,
            key: _animKey,
            onComplete: _onComplete,
          ),
        ),
      ),
    );
  }

  Align _buildUnselected() {
    return Align(
      alignment: Alignment.center,
      child: Visibility(
          visible: !widget.selected,
          child: R.img(
            widget.item.unselectedImgPath,
            fit: BoxFit.fill,
            width: widget.item.width,
            height: widget.item.height,
          )),
    );
  }

  void _onTap() {
    if (widget.onBottomTabClicked != null) {
      widget.onBottomTabClicked!(widget.index);
    }

    _animKey = GlobalKey();
    _refresh();
  }

  _onComplete() {}

  _refresh() {
    if (mounted) {
      setState(() {});
    }
  }
}
