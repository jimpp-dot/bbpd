import 'dart:async';

import 'package:shared/shared.dart';
import 'package:shared/k.dart';
import 'package:flutter/material.dart';

Future<T?> displayModalBottomSheet<T>({
  required BuildContext context,
  required WidgetBuilder builder,
  bool isBarrierDismissible = true,
  double? maxHeightRatio,
  bool fullscreenDialog = false,
  bool disableTapDismissible = true,
  bool removeTop = false,
  ThemeData? theme,
  Color? backgroundColor,
  RouteSettings? settings,
  Color defineBarrierColor = Colors.black54,
  bool supportSoftKeyBoard = false,
}) {
  // if not assign removeTop,full screen not removeTop
  if (removeTop == null && fullscreenDialog == true) {
    removeTop = false;
  } else {
    removeTop = true;
  }
  return Navigator.push(
    context,
    ModalBottomSheetRoute<T>(
      backgroundColor: backgroundColor,
      builder: builder,
      theme: theme ??
          ThemeData(
            textTheme: TextTheme(
              bodyMedium: TextStyle(fontFamily: Util.fontFamily),
              labelLarge: TextStyle(fontFamily: Util.fontFamily),
              titleMedium: TextStyle(fontFamily: Util.fontFamily),
            ),
            canvasColor: Colors.transparent,
            platform:
                Util.isAndroid ? TargetPlatform.android : TargetPlatform.iOS,
          ),
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      isBarrierDismissible: isBarrierDismissible,
      maxHeightRatio: maxHeightRatio,
      fullscreenDialog: fullscreenDialog,
      removeTop: removeTop,
      settings: settings,
      disableTapDismissible: disableTapDismissible,
      defineBarrierColor: defineBarrierColor,
      supportSoftKeyBoard: supportSoftKeyBoard,
    ),
  );
}

class SheetItem {
  final String label;
  final String key;
  final Color? color;
  final dynamic extra;
  final String? subLabel;

  const SheetItem(this.label, this.key,
      [this.extra, this.color, this.subLabel]);
}

enum SheetCloseReason {
  Active,
  Result,
}

class SheetCallback {
  final SheetCloseReason reason;
  final int index;
  final SheetItem? value;
  final dynamic extra;

  SheetCallback(this.reason, [this.index = -1, this.value, this.extra]);
}

typedef RadioBottomSheetRender = Widget Function(
    BuildContext context, SheetItem? item, int index,
    {VoidCallback callback});

class RadioBottomSheet extends StatefulWidget {
  final List<SheetItem>? data;
  String? title;
  final bool enabledAutoClick;
  final RadioBottomSheetRender? render;
  String? submitLabel;
  final VoidCallback? submit;
  final bool showCancel;
  final bool showTitle;
  final bool suppDarkTheme;
  final bool showSubTitle;
  String? subTitle;
  RadioBottomSheet({
    Key? key,
    this.title,
    this.subTitle,
    this.submitLabel,
    this.submit,
    this.data,
    this.render,
    this.enabledAutoClick = true,
    this.showCancel = true,
    this.showTitle = true,
    this.suppDarkTheme = false,
    this.showSubTitle = false,
  }) : super(key: key) {
    title ??= K.base_operate_options;
    submitLabel ??= K.cancel;
  }

  @override
  State<RadioBottomSheet> createState() {
    return _State();
  }
}

class _State extends State<RadioBottomSheet> {
  final double _height = 56.0;

  Widget _renderItem(BuildContext context, SheetItem? item, int index) {
    if (widget.render == null) {
      Widget label = Text(
        item?.label ?? '',
        maxLines: 1,
        style: TextStyle(
            color: item?.color ??
                (widget.suppDarkTheme == true
                    ? R.colors.mainTextColor
                    : R.color.mainTextColor),
            fontSize: 17.0),
      );
      return Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(
                  color: widget.suppDarkTheme
                      ? R.colors.dividerColor
                      : R.color.dividerColor,
                  width: 0.0)),
        ),
        child: Util.validStr(item?.subLabel)
            ? Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  label,
                  Text(
                    item?.subLabel ?? '',
                    maxLines: 1,
                    style: TextStyle(
                        color: widget.suppDarkTheme
                            ? R.colors.thirdTextColor
                            : R.color.thirdTextColor,
                        fontSize: 12),
                  )
                ],
              )
            : label,
      );
    } else {
      return widget.render!(context, item, index, callback: _onCallback);
    }
  }

  _onCallback() {
    setState(() {});
  }

  Widget _renderBody() {
    return ListView.builder(
        itemExtent: _height,
        itemCount: widget.data?.length ?? 0,
        physics: const AlwaysScrollableScrollPhysics(),
        padding: const EdgeInsets.all(0.0),
        itemBuilder: (BuildContext context, int index) {
          SheetItem? item = widget.data?.elementAt(index);
          if (widget.enabledAutoClick) {
            return InkWell(
              onTap: () => Navigator.of(context)
                  .pop(SheetCallback(SheetCloseReason.Result, index, item)),
              child: _renderItem(context, item, index),
            );
          } else {
            return _renderItem(context, item, index);
          }
        });
  }

  @override
  void initState() {
    super.initState();
    eventCenter.addListener(EventConstant.UpdateBottomSheet, _onEventUpdate);
  }

  @override
  void dispose() {
    super.dispose();
    eventCenter.removeListener(EventConstant.UpdateBottomSheet, _onEventUpdate);
  }

  @override
  Widget build(BuildContext context) {
    bool mulTitle = widget.title?.contains('\n') ?? false;

    double contentHeight = (widget.data?.length ?? 0) * _height;
    double cancelHeight = widget.showCancel ? (_height + 8) : 0;
    double titleHeight = widget.showTitle ? (mulTitle ? 60 : 40) : 0;
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: contentHeight + cancelHeight + titleHeight,
        margin: EdgeInsets.only(
            left: 8.0,
            right: 8.0,
            top: 12.0,
            bottom: 12 + (Util.isIphoneX ? 28.0 : 0.0)),
        child: Column(
          children: <Widget>[
            Expanded(
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(16.0)),
                child: Column(
                  children: <Widget>[
                    if (widget.showTitle)
                      Container(
                        height: titleHeight,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          // color: widget.suppDarkTheme ? R.colors.mainBgColor : R.color.mainBgColor,
                          border: Border(
                              bottom: BorderSide(
                                  color: widget.suppDarkTheme
                                      ? R.colors.dividerColor
                                      : R.color.dividerColor,
                                  width: 0.0)),
                        ),
                        child: widget.showSubTitle
                            ? Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    widget.title ?? '',
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      color: Color(0xFF000000),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Text(
                                    widget.subTitle ?? '',
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      color: Color(0x4D000000),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              )
                            : Text(
                                widget.title ?? '',
                                textAlign: TextAlign.center,
                                maxLines: mulTitle ? 2 : 1,
                                style: TextStyle(
                                  color: widget.suppDarkTheme
                                      ? R.colors.thirdTextColor
                                      : R.color.thirdTextColor,
                                  fontSize: 13.0,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                      ),
                    Expanded(
                      child: Container(
                        // color: widget.suppDarkTheme ? R.colors.mainBgColor : R.color.mainBgColor,
                        child: _renderBody(),
                      ),
                    )
                  ],
                ),
              ),
            ),
            if (widget.showCancel)
              Container(
                margin: const EdgeInsets.only(top: 8.0),
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(16.0)),
                  child: InkWell(
                    onTap: widget.submit ??
                        () => Navigator.of(context)
                            .pop(SheetCallback(SheetCloseReason.Active)),
                    child: Container(
                      height: _height,
                      // color: widget.suppDarkTheme ? R.colors.mainBgColor : R.color.mainBgColor,
                      alignment: Alignment.center,
                      child: Text(
                        widget.submitLabel ?? '',
                        maxLines: 1,
                        style: TextStyle(
                          color: widget.showSubTitle
                              ? const Color(0xFF000000)
                              : widget.suppDarkTheme
                                  ? R.colors.mainTextColor
                                  : R.color.mainTextColor,
                          fontSize: widget.showSubTitle ? 19 : 17.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  _onEventUpdate(String type, dynamic data) {
    if (type == EventConstant.UpdateBottomSheet) {
      refresh();
    }
  }
}

class _ModalBottomSheetLayout extends SingleChildLayoutDelegate {
  double? maxHeightRatio;
  bool fullscreenDialog;
  bool supportSoftKeyBoard;
  double bottomInsets;

  _ModalBottomSheetLayout(
    this.context,
    this.progress, {
    this.maxHeightRatio,
    this.fullscreenDialog = false,
    this.supportSoftKeyBoard = false,
    this.bottomInsets = 0,
  });

  final double progress;
  final BuildContext context;

  @override
  BoxConstraints getConstraintsForChild(BoxConstraints constraints) {
    return BoxConstraints(
      minWidth: constraints.maxWidth,
      maxWidth: constraints.maxWidth,
      minHeight: 0.0,
      maxHeight: getMaxHeight(constraints),
    );
  }

  double getMaxHeight(BoxConstraints constraints) {
    double result = maxHeightRatio == null
        ? constraints.maxHeight * 9.0 / 16.0
        : constraints.maxHeight * maxHeightRatio!;
    if (supportSoftKeyBoard) {
      result = result + MediaQuery.of(context).viewInsets.bottom;
    }
    if (fullscreenDialog) {
      result = Util.height;
    }
    return result;
  }

  @override
  Offset getPositionForChild(Size size, Size childSize) {
    return Offset(0.0, size.height - childSize.height * progress);
  }

  @override
  bool shouldRelayout(_ModalBottomSheetLayout oldDelegate) {
    return (progress != oldDelegate.progress) ||
        (supportSoftKeyBoard && oldDelegate.bottomInsets != bottomInsets);
  }
}

class _ModalBottomSheet<T> extends StatefulWidget {
  const _ModalBottomSheet(
      {Key? key,
      required this.route,
      this.maxHeightRatio,
      this.fullscreenDialog = false,
      this.backgroundColor,
      this.disableTapDismissible = false,
      this.supportSoftKeyBoard = false})
      : super(key: key);

  final ModalBottomSheetRoute<T>? route;
  final double? maxHeightRatio;
  final bool fullscreenDialog;
  final bool supportSoftKeyBoard;
  final bool disableTapDismissible;
  final Color? backgroundColor;

  @override
  _ModalBottomSheetState<T> createState() => _ModalBottomSheetState<T>();
}

class _ModalBottomSheetState<T> extends State<_ModalBottomSheet<T>> {
  @override
  Widget build(BuildContext context) {
    Log.d('widget.backgroundColor:${widget.backgroundColor == null}');
    return GestureDetector(
        onTap: () {
          if (widget.fullscreenDialog == true ||
              widget.disableTapDismissible == true) {
            return;
          }
          Navigator.pop(context);
        },
        child: AnimatedBuilder(
          animation: widget.route!.animation!,
          builder: (BuildContext context, Widget? child) {
            return ClipRect(
                child: CustomSingleChildLayout(
                    delegate: _ModalBottomSheetLayout(
                      context,
                      widget.route!.animation!.value,
                      maxHeightRatio: widget.maxHeightRatio,
                      fullscreenDialog: widget.fullscreenDialog,
                      supportSoftKeyBoard: widget.supportSoftKeyBoard,
                      bottomInsets: MediaQuery.of(context).viewInsets.bottom,
                    ),
                    child: child));
          }, //const Color(0xFF262629),
          child: BottomSheet(
              backgroundColor:
                  widget.backgroundColor ?? const Color(0xFF262629),
              enableDrag: widget.route!.isBarrierDismissible,
              animationController: widget.route!._animationController,
              onClosing: () => Navigator.pop(context),
              builder: widget.route!.builder!),
        ));
  }
}

class ModalBottomSheetRoute<T> extends PopupRoute<T> {
  ModalBottomSheetRoute({
    this.builder,
    this.theme,
    this.barrierLabel,
    this.isBarrierDismissible = true,
    this.maxHeightRatio,
    this.fullscreenDialog = false,
    this.removeTop = true,
    this.backgroundColor,
    this.disableTapDismissible = false,
    this.defineBarrierColor = Colors.black54,
    RouteSettings? settings,
    this.supportSoftKeyBoard = false,
  }) : super(settings: settings);

  final WidgetBuilder? builder;
  final ThemeData? theme;
  final double? maxHeightRatio;
  final Color? backgroundColor;
  final bool fullscreenDialog;
  final bool removeTop;
  final bool isBarrierDismissible;
  final Color defineBarrierColor;
  final bool supportSoftKeyBoard;
  final bool disableTapDismissible;

  @override
  bool get barrierDismissible {
    return isBarrierDismissible;
  }

  @override
  Duration get transitionDuration => const Duration(milliseconds: 250);

  @override
  final String? barrierLabel;

  @override
  Color get barrierColor => defineBarrierColor;

  AnimationController? _animationController;

  @override
  AnimationController createAnimationController() {
    assert(_animationController == null);
    _animationController =
        BottomSheet.createAnimationController(navigator!.overlay!);
    return _animationController!;
  }

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    // By definition, the bottom sheet is aligned to the bottom of the page
    // and isn't exposed to the top padding of the MediaQuery.
    Widget bottomSheet = MediaQuery.removePadding(
      context: context,
      removeTop: removeTop ? true : false,
      child: _ModalBottomSheet<T>(
        route: this,
        backgroundColor: backgroundColor,
        maxHeightRatio: maxHeightRatio,
        fullscreenDialog: fullscreenDialog,
        disableTapDismissible: disableTapDismissible,
        supportSoftKeyBoard: supportSoftKeyBoard,
      ),
    );
    if (theme != null) bottomSheet = Theme(data: theme!, child: bottomSheet);
    return bottomSheet;
  }
}
