import 'package:flutter/material.dart';
import 'package:provider/provider.dart' hide Selector;
import 'package:shared/component/messageCountBadge.dart';
import 'package:shared/shared.dart';

typedef OnBottomTabClicked = void Function(int index);

class LyBottomBarItem {
  int index;
  bool isMessage;
  bool isProfile;
  final bool isMoment;
  String unselectedImgPath;
  String unselectedDarkImgPath;
  String selectedImgPath;
  String selectedDarkImgPath;
  String label;
  String secondLabel;
  String animPath;
  String animDarkPath;
  String secondAnimPath;
  double width;
  double height;
  final bool hasRefreshImg;
  final bool isPublishDynamic;
  final bool isServerImg;

  LyBottomBarItem({
    this.index = 0,
    this.unselectedImgPath = '',
    this.unselectedDarkImgPath = '',
    this.selectedImgPath = '',
    this.selectedDarkImgPath = '',
    this.label = '',
    this.secondLabel = '',
    this.animPath = '',
    this.animDarkPath = '',
    this.secondAnimPath = '',
    this.width = 0,
    this.height = 0,
    this.isMessage = false,
    this.isProfile = false,
    this.isMoment = false,
    this.hasRefreshImg = false,
    this.isPublishDynamic = false,
    this.isServerImg = false,
  });
}

class LyBottomBar extends StatefulWidget {
  final List<LyBottomBarItem> items;
  final int currentIndex;
  final OnBottomTabClicked? onBottomTabClicked;
  final double height;
  final ActBarData? activityBar;

  const LyBottomBar({
    Key? key,
    required this.items,
    required this.currentIndex,
    this.onBottomTabClicked,
    this.height = 54,
    this.activityBar,
  }) : super(key: key);

  @override
  State createState() => _LyBottomBarState();
}

class _LyBottomBarState extends State<LyBottomBar> {
  @override
  Widget build(BuildContext context) {
    double bottomPadding = Util.screenPadding.bottom;
    if (bottomPadding == 0) {
      bottomPadding = 10;
    }

    return Container(
      padding: EdgeInsets.only(bottom: bottomPadding),
      width: Util.width,
      height: widget.height + bottomPadding,
      decoration: BoxDecoration(color: R.colors.bottomBarColor, borderRadius: BorderRadius.circular(18)),
      child: Stack(
        children: [
          if (darkMode)
            R.img(
              'tab_top_line_dark.webp',
              fit: BoxFit.fill,
              width: Util.width,
            ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: _buildItems(widget.items),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildItems(List<LyBottomBarItem> items) {
    List<Widget> tabItems = [];
    for (int i = 0; i < items.length; i++) {
      Widget tabItem = _LyBottomBarItemWidget(
        i,
        items[i],
        _onTabClicked,
        selected: i == widget.currentIndex,
        activityBar: widget.activityBar != null ? widget.activityBar!.subBars[i] : null,
      );
      tabItems.add(tabItem);
    }
    if (widget.activityBar != null && widget.activityBar!.middleBar.icon.isNotEmpty) {
      tabItems.insert(items.length ~/ 2, const Spacer());
    }
    return tabItems;
  }

  _onTabClicked(int index) {
    if (widget.onBottomTabClicked != null) {
      widget.onBottomTabClicked!(index);
    }
  }
}

class _LyBottomBarItemWidget extends StatefulWidget {
  final LyBottomBarItem item;
  final OnBottomTabClicked onBottomTabClicked;
  final bool selected;
  final int index;
  final ActSubBarsData? activityBar;

  const _LyBottomBarItemWidget(this.index, this.item, this.onBottomTabClicked, {this.selected = false, this.activityBar});

  @override
  _LyBottomBarItemWidgetState createState() => _LyBottomBarItemWidgetState();
}

class _LyBottomBarItemWidgetState extends State<_LyBottomBarItemWidget> {
  GlobalKey _animKey = GlobalKey();
  bool _showRefresh = false;
  bool _isCurrentHomeTab = true;

  @override
  void initState() {
    super.initState();
    eventCenter.addListener('homescreen.scroll.showRefresh', _onShowRefreshChanged);
    eventCenter.addListener('HomeTab.Changed', _onHomeTabChanged);
  }

  @override
  void dispose() {
    eventCenter.removeListener('homescreen.scroll.showRefresh', _onShowRefreshChanged);
    eventCenter.removeListener('HomeTab.Changed', _onHomeTabChanged);
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant _LyBottomBarItemWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if ((oldWidget.item.isServerImg != widget.item.isServerImg || (oldWidget.activityBar != widget.activityBar)) && widget.selected) {
      _animKey = GlobalKey();
    }
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
          if (_getLabel().isNotEmpty) _buildLabel(),
          if (widget.item.isMessage) _buildMessageBadge(),
          if (widget.item.isProfile) _buildProfileBadge(),
          if (widget.item.isMoment) _buildMomentTabBadge(),
          if (widget.item.isPublishDynamic) _buildPublishDynamicWidget(),
        ],
      ),
    );
  }

  Align _buildPublishDynamicWidget() {
    return Align(
      alignment: AlignmentDirectional.topCenter,
      child: SizedBox(
        width: 58,
        height: 58,
        child: Stack(
          clipBehavior: Clip.none,
          children: <Widget>[
            PositionedDirectional(
                top: -6,
                child: Container(
                  width: 58,
                  height: 58,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(29.0),
                  ),
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: R.color.mainBrandColor,
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    child: R.img(
                      'tab_publish_dynamic.webp',
                      fit: BoxFit.fill,
                      width: 22,
                      height: 22,
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }

  Align _buildMessageBadge() {
    return Align(
      alignment: AlignmentDirectional.topCenter,
      child: SizedBox(
        width: widget.item.width,
        height: widget.item.height,
        child: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          children: [
            PositionedDirectional(start: widget.item.width / 2 + 10, top: 2, child: const MessageCountBadge()),
          ],
        ),
      ),
    );
  }

  Widget _buildSelected() {
    if (widget.activityBar != null) {
      double size = 56;
      return PositionedDirectional(
        bottom: 10,
        start: 0,
        end: 0,
        child: Visibility(
          visible: widget.selected,
          child: UnconstrainedBox(
            child: MultiframeImage.network(
              Util.getRemoteImgUrl(widget.activityBar!.clickedIcon),
              'home_tab',
              key: _animKey,
              fit: BoxFit.fill,
              width: size,
              height: size,
            ),
          ),
        ),
      );
    }
    if (widget.item.isServerImg) {
      return Align(
        alignment: (_getLabel().isNotEmpty) ? AlignmentDirectional.topCenter : AlignmentDirectional.center,
        child: Visibility(
          visible: widget.selected,
          child: Container(
              width: widget.item.width,
              height: widget.item.height,
              margin: EdgeInsetsDirectional.only(top: (_getLabel().isNotEmpty) ? 2.0 : 0),
              child: MultiframeImage.network(
                Util.getRemoteImgUrl(widget.item.animPath),
                'home_tab',
                key: _animKey,
                fit: BoxFit.fill,
                width: widget.item.width,
                height: widget.item.height,
              )),
        ),
      );
    } else {
      return PositionedDirectional(
        bottom: 10,
        start: 0,
        end: 0,
        child: Visibility(
          visible: widget.selected,
          child: SizedBox(
              width: widget.item.width,
              height: widget.item.height,
              child: R.img(
                darkMode ? widget.item.selectedDarkImgPath : widget.item.selectedImgPath,
                fit: BoxFit.fitHeight,
                width: widget.item.width,
                height: widget.item.height,
              )

              // MultiframeImage.asset(
              //   _getAnimPath(),
              //   key: _animKey,
              //   fit: BoxFit.fitHeight,
              //   onComplete: _onComplete,
              // ),
              ),
        ),
      );
    }
  }

  String _getAnimPath() {
    if (widget.item.hasRefreshImg && _showRefresh && _isCurrentHomeTab) {
      return widget.item.secondAnimPath;
    }
    return darkMode ? widget.item.animDarkPath : widget.item.animPath;
  }

  Widget _buildUnselected() {
    if (widget.activityBar != null) {
      double size = 43;
      return PositionedDirectional(
        bottom: 10,
        start: 0,
        end: 0,
        child: Visibility(
            visible: !widget.selected,
            child: UnconstrainedBox(
              child: CachedNetworkImage(
                imageUrl: Util.getRemoteImgUrl(widget.activityBar!.unclickedIcon),
                fit: BoxFit.fill,
                width: size,
                height: size,
              ),
            )),
      );
    }
    if (widget.item.isServerImg) {
      return Align(
        alignment: (_getLabel().isNotEmpty) ? AlignmentDirectional.topCenter : AlignmentDirectional.center,
        child: Visibility(
          visible: !widget.selected,
          child: Padding(
              padding: EdgeInsetsDirectional.only(top: (_getLabel().isNotEmpty) ? 3 : 0),
              child: CachedNetworkImage(
                imageUrl: Util.getRemoteImgUrl(widget.item.unselectedImgPath),
                fit: BoxFit.fill,
                width: widget.item.width,
                height: widget.item.height,
              )),
        ),
      );
    } else {
      return PositionedDirectional(
        bottom: 10,
        start: 0,
        end: 0,
        child: Visibility(
            visible: !widget.selected,
            child: SizedBox(
              width: widget.item.width,
              height: widget.item.height,
              child: R.img(
                darkMode ? widget.item.unselectedDarkImgPath : widget.item.unselectedImgPath,
                fit: BoxFit.fitHeight,
                width: widget.item.width,
                height: widget.item.height,
              ),
            )),
      );
    }
  }

  void _onTap() {
    widget.onBottomTabClicked(widget.index);

    _animKey = GlobalKey();
    _refresh();
  }

  _onComplete() {}

  _refresh() {
    if (mounted) {
      setState(() {});
    }
  }

  Widget _buildLabel() {
    Color color;
    // Log.d('widget.activityBar:' + '${widget.activityBar != null}');
    if (widget.activityBar != null) {
      color = widget.selected
          ? (Util.parseColor(darkMode ? widget.activityBar!.darkColor : widget.activityBar!.lightColor) ?? Colors.transparent)
          : R.colors.thirdTextColor;
    } else {
      // Log.d('darkMode:' + '${darkMode}');
      color = widget.selected ? (darkMode ? R.color.mainBrandColor : R.color.mainTextColor) : R.colors.thirdTextColor;
    }
    return PositionedDirectional(
      top: 0,
      start: 0,
      end: 0,
      child: Container(
        alignment: AlignmentDirectional.topCenter,
        margin: EdgeInsetsDirectional.only(top: widget.item.isServerImg ? 32 : 42.0),
        child: Text(
          _getLabel(),
          style: TextStyle(fontSize: 10, color: color, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }

  String _getLabel() {
    if (widget.item.index == 0 && _showRefresh && _isCurrentHomeTab) {
      return widget.item.secondLabel;
    }
    return widget.item.label;
  }

  _onShowRefreshChanged(String type, dynamic data) {
    if (!widget.item.hasRefreshImg) return;
    bool showRefresh = data as bool;
    if (showRefresh != _showRefresh) {
      _showRefresh = showRefresh;
      _animKey = GlobalKey();
      _refresh();
    }
  }

  _onHomeTabChanged(String type, dynamic data) {
    int currentHomeTabIndex = data as int;
    bool isCurrentHomeTab = currentHomeTabIndex == 0;
    if (isCurrentHomeTab != _isCurrentHomeTab) {
      _isCurrentHomeTab = isCurrentHomeTab;
      _refresh();
    }
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
              start: widget.item.width / 2 + 10,
              top: (_getLabel().isNotEmpty) ? 2 : 0,
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

  Widget _buildMomentTabBadge() {
    return Consumer<ProfilePayload>(builder: (_, bean, __) {
      bool show = bean.showDynamicRedPoint;
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
              start: widget.item.width / 2 + 10,
              top: (_getLabel().isNotEmpty) ? 2 : 0,
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
}
